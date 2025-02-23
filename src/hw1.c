#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "../include/hw1.h"

int top_key[MAX_LENGTH] = {0};
int bottom_key[MAX_LENGTH] = {0};
int left_key[MAX_LENGTH] = {0};
int right_key[MAX_LENGTH] = {0};

char board[MAX_LENGTH][MAX_LENGTH] = {0};

int length = 5;
unsigned int remaining = 0;

/* PART 1 */

uint_fast8_t itopos(const int n, const int cols) {
  debug_assert(n < cols * cols);

  //                         rrrrcccc
  // with 8x8: 0b00111111 -> 11111111 = 7,7
  // with 4x4: 0b00000101 -> 00010001 = 1,1
  return (n / cols) << 4 | (n % cols);
}

bool strnmatch(const int n, const char *str, bool (*const pred)(char)) {
  for (const char *p = str; (p - str) < n; p++) {
    if (!pred(*p))
      return false;
  }
  return true;
}

bool char_in_range(const char test, const char low, const char high) {
  return (test >= low && test <= high);
}

bool valid_state(char test) {
  return test == '-' || char_in_range(test, '1', '0' + length);
}

bool valid_key(char test) { return char_in_range(test, '0', '0' + length); }

void print_board() {
  printf("   ");
  print_arr(" %d", top_key, length);
  printf("\n   ");
  print_repeat(" v", length);

  for (int i = 0; i < length; i++) {
    printf("\n%d >", left_key[i]);
    print_arr(" %c", board[i], length);
    printf(" < %d", right_key[i]);
  }

  printf("\n   ");
  print_repeat(" ^", length);
  printf("\n   ");
  print_arr(" %d", bottom_key, length);
  printf("\n");
}

bool read_int_range(int *out, const int low, const int high) {
  char buf[9];
  int len = 0;
  if (1 > scanf(" %8s%n", buf, &len)) {
    return false;
  }

  return parse_int_range(out, buf, low, high);
}

bool parse_int_range(int *dst, const char *src, int low, int high) {
  char *end;
  long parsed = strtol(src, &end, 10);

  const bool range_err = errno == ERANGE;
  if (src == end || range_err) {
    return false; // conversion failed or overflow
  }
  if (parsed > __INT32_MAX__) {
    return false; // too big
  }
  int parsed_int = (int)parsed;

  if (parsed_int < low || parsed_int > high) {
    return false;
  }

  *dst = parsed_int;
  return true;
}

unsigned long get_move() {
  int row, col;
  char piece;
  char buf[9];

  do {
    printf("Choose a piece (1-%d) or q to quit: ", length);
    scanf(" %8s", buf);
    if (0 == strcmp("q", buf))
      return F_MOVE_QUIT;
  } while (false == strnmatch(1, buf, valid_state) &&
           0 < printf("Invalid choice. "));

  piece = buf[0];

  do
    printf("Choose a row (0-%d): ", length - 1);
  while (false == read_int_range(&row, 0, length - 1) &&
         0 < printf("Invalid choice. "));

  do
    printf("Choose a column (0-%d): ", length - 1);
  while (false == read_int_range(&col, 0, length - 1) &&
         0 < printf("Invalid choice. "));

  int status = try_move(piece, row, col);

  if ((status & F_MOVE_OCCUPIED) > 0) {
    printf("Invalid choice. That space is already occupied.\n");
    return status;
  }
  if ((status & F_MOVE_DUPLICATE) > 0) {
    printf("Invalid choice. There is already a building with that height in "
           "that row or column.\n");
    return status;
  }
  if ((status & F_MOVE_KEYERR) > 0) {
    printf("Invalid choice. You violate one of the key requirements.\n");
    return status;
  }

  return status;
}

unsigned long check_dupes_col(int col) {
  uint_fast8_t seen = 0;
  for (int i = 0; i < length; i++) {
    char piece = board[i][col];
    if (piece == '-')
      continue;
    uint_fast8_t piece_bit = (1 << (piece - '1'));
    if (seen == (seen | piece_bit))
      return F_MOVE_DUPLICATE;
    seen |= piece_bit;
    // edbg("%02Xx", seen);
  }
  return F_MOVE_OK;
}

unsigned long check_dupes_row(int row) {
  uint_fast8_t seen = 0;
  for (int i = 0; i < length; i++) {
    char piece = board[row][i];
    if (piece == '-')
      continue;
    uint_fast8_t piece_bit = (1 << (piece - '1'));
    if (seen == (seen | piece_bit))
      return F_MOVE_DUPLICATE;
    seen |= piece_bit;
    // edbg("%02X", seen);
  }
  return F_MOVE_OK;
}

// ffffbbbb
// assumes no '-'
uint_fast8_t nvisible(int n, char seq[]) {
  char max_left = '0', max_right = '0';
  unsigned int v_left = 0, v_right = 0;

  for (int i = 0; i < n; i++) {
    char p_left = seq[i];
    char p_right = seq[n - i - 1];

    if (p_left > max_left) {
      v_left++;
      max_left = p_left;
    }
    if (p_right > max_right) {
      v_right++;
      max_right = p_right;
    }
  }

  return (v_left << 4) | v_right;
}

unsigned long check_row(int row) {
  if ((check_dupes_row(row) & F_MOVE_DUPLICATE) > 0)
    return F_MOVE_DUPLICATE;

  // skip key check if any '-' remain
  if (memchr(board[row], '-', length) != NULL)
    return F_MOVE_OK;

  unpack(nvisible(length, board[row]), v_left, v_right);
  if ((left_key[row] != 0 && v_left != left_key[row]) ||
      (right_key[row] != 0 && v_right != right_key[row])) {
    l_debug("key error r=%d: expected %d/%d, got %d/%d", row, left_key[row],
            right_key[row], v_left, v_right);
    return F_MOVE_KEYERR;
  }

  l_debug("key success r=%d", row);
  return F_MOVE_OK;
}

unsigned long check_col(int col) {
  if ((check_dupes_col(col) & F_MOVE_DUPLICATE) > 0)
    return F_MOVE_DUPLICATE;

  char colseq[length];
  for (int i = 0; i < length; i++) {
    colseq[i] = board[i][col];
  }

  // skip key check if any '-' remain
  if (memchr(colseq, '-', length) != NULL)
    return F_MOVE_OK;

  unpack(nvisible(length, colseq), v_top, v_bottom);
  if ((top_key[col] != 0 && v_top != top_key[col]) ||
      (bottom_key[col] != 0 && v_bottom != bottom_key[col])) {
    l_debug("key error c=%d: expected %d/%d, got %d/%d", col, top_key[col],
            bottom_key[col], v_top, v_bottom);
    return F_MOVE_KEYERR;
  }

  l_debug("key success c=%d", col);
  return F_MOVE_OK;
}

unsigned long try_move(char choice, int row, int col) {
  if (board[row][col] != '-')
    return F_MOVE_OCCUPIED;

  unsigned long stat = 0;
  // temporary set move
  board[row][col] = choice;

  stat |= check_row(row) | check_col(col);

  if ((stat & (F_MOVE_DUPLICATE | F_MOVE_KEYERR)) > 0) {
    // unset move if failed
    board[row][col] = '-';
  } else {
    // move ok, decrement remaining empty
    remaining--;
    if (remaining == 0)
      stat |= F_WIN;
  }

  return stat;
}

int initialize_board(const char *initial_state, const char *keys, int size) {
#define die() do { printf("Invalid initial board state.\n"); return 0; } while (0)

  edbg("%d", size);
  edbg("\"%s\"", initial_state);
  edbg("\"%s\"", keys);
  length = size;

  debug_assert(size <= MAX_LENGTH);
  debug_assert(0 < size);

  if (!strnmatch(size * size, initial_state, valid_state)) {
    l_debug("invalid state (must have >= %d chars): %s", size * size,
            initial_state);
    die();
  }
  for (int i = 0; i < size * size; i++) {
    char c = initial_state[i];
    // set remaining empty positions
    if (c == '-')
      remaining++;
    unpack(itopos(i, size), row, col);
    board[row][col] = c;
  }

  if (!strnmatch(size * 4, keys, valid_key)) {
    l_debug("invalid keys (must have >= %d chars): %s", size * 4, keys);
    die();
  }
  // convert keys to int[]
  int ikeys[size * 4];
  for (int i = 0; i < size * 4; i++) {
    char key = keys[i];
    ikeys[i] = key - '0';
  }

  for (int i = 0; i < size; i++) {
    top_key[i] = *(ikeys + i);
    bottom_key[i] = *(ikeys + i + size);
    left_key[i] = *(ikeys + i + (2 * size));
    right_key[i] = *(ikeys + i + (3 * size));
  }

  for (int i = 0; i < size; i++) {
    if (((check_row(i) | check_col(i)) & (F_MOVE_DUPLICATE | F_MOVE_KEYERR)) >
        0)
      die();
  }

  return 1;
#undef die
}

/* END PART 1 */

/* PART 2 */

constraints con = {.bv = {{0}}, .pv = {0}};

uint_fast8_t piece_to_bit(char piece) { return 1 << (piece - '1'); }

char bit_to_piece(uint_fast8_t bit) {
  assert(single(bit));
  return ffs(bit) + '0';
}

// h/t chess programming wiki
bool single(uint_fast8_t val) { return (val != 0 && (val & (val - 1)) == 0); }

// ditto
unsigned int popcnt(uint_fast8_t x) {
  int count = 0;
  while (x) {
    count++;
    x &= x - 1; // reset LS1B
  }
  return count;
}

unsigned int nbsf(unsigned int n, uint_fast8_t x) {
  for (unsigned int i = 0; x && (i < n); i++)
    x &= x - 1;
  return ffs(x) - 1;
}

void place_singles() {
  for (int i = 0; i < length * length; i++) {
    unpack(itopos(i, length), row, col);
    // just do it every time idc
    apply_process_of_elimination(row, col);
    if (single(con.bv[row][col]) && (con.pv[row] & (1 << col)) == 0) {
      char piece = bit_to_piece(con.bv[row][col]);
      l_debug("placing '%c' at %d:%d", piece, row, col);
      board[row][col] = piece;
      con.pv[row] |= 1 << col;
      bool ns = apply_constraint_propagation(row, col, piece);
      bool sfr = sequence_filtration(row, true);bool sfc=  sequence_filtration(col, false);

      if (!(ns || sfr || sfc))
        l_debug("constraints unchanged after heuristics");

      // do it again!
      place_singles();
    }
  }
}

static inline uint_fast8_t bitmask(uint_fast8_t nbits) {
  return ~(~0U << nbits);
}

uint_fast8_t edge_constraint(int row, int col) {
  int top_bound = length - top_key[col] + row + 2;
  int bottom_bound = length - bottom_key[col] + (length - row - 1) + 2;
  int left_bound = length - left_key[row] + col + 2;
  int right_bound = length - right_key[row] + (length - col - 1) + 2;

  uint_fast8_t min_bound = bitmask(top_bound - 1) & bitmask(bottom_bound - 1) &
                           bitmask(left_bound - 1) & bitmask(right_bound - 1);
  debug_assert(min_bound > 0);

  return min_bound;
}

void edge_clue_initialization() {
  // key=N special case
  for (int i = 0; i < length; i++) {
    if (top_key[i] == length) {
      for (int r = 0; r < length; r++) {
        con.bv[r][i] = piece_to_bit('1' + r);
      }
    }
    if (bottom_key[i] == length) {
      for (int r = 0; r < length; r++) {
        con.bv[r][i] = piece_to_bit('0' + length - r);
      }
    }
    if (left_key[i] == length) {
      for (int c = 0; c < length; c++) {
        con.bv[i][c] = piece_to_bit('1' + c);
      }
    }
    if (right_key[i] == length) {
      for (int c = 0; c < length; c++) {
        con.bv[i][c] = piece_to_bit('0' + length - c);
      }
    }
  }

  // key=1 special case
  for (int i = 0; i < length; i++) {
    if (top_key[i] == 1) {
      con.bv[0][i] = piece_to_bit('0' + length);
    }
    if (bottom_key[i] == 1) {
      con.bv[length - 1][i] = piece_to_bit('0' + length);
    }
    if (left_key[i] == 1) {
      con.bv[i][0] = piece_to_bit('0' + length);
    }
    if (right_key[i] == 1) {
      con.bv[i][length - 1] = piece_to_bit('0' + length);
    }
  }

  // all other
  for (int i = 0; i < length * length; i++) {
    unpack(itopos(i, length), row, col);
    uint_fast8_t constr = edge_constraint(row, col);
    l_debug("constraining %d:%d to %02X (from %02X)", row, col,
            (unsigned int)constr, (unsigned int)con.bv[row][col]);
    con.bv[row][col] &= constr;
  }

  // lock in
  l_debug("placing edge constraints");
  place_singles();
}

bool apply_constraint_propagation(int row, int col, char piece) {
  uint_fast8_t mask = ~piece_to_bit(piece);
  bool new_single = false;

  for (int i = 0; i < length; i++) {
    bool col_single = single(con.bv[row][i]);
    bool row_single = single(con.bv[i][col]);
    con.bv[row][i] &= mask;
    con.bv[i][col] &= mask;

    if ((single(con.bv[row][i]) && !col_single) ||
        (single(con.bv[i][col]) && !row_single)) {
      new_single = true;
    }
  }
  // retain single constraint
  con.bv[row][col] = piece_to_bit(piece);
  if (new_single)
    l_debug("propagating '%c' at %d:%d yielded new singles", piece, row, col);
  return new_single;
}

void apply_process_of_elimination(int row, int col) {
  uint_fast8_t colseq[length];
  for (int i = 0; i < length; i++) {
    colseq[i] = con.bv[i][col];
  }

  uint_fast8_t row_uniq = unique_bits(length, con.bv[row]);
  uint_fast8_t col_uniq = unique_bits(length, colseq);

  if (row_uniq != 0xFFU) {
    for (int c = 0; c < length; c++) {
      if (single(con.bv[row][c] & row_uniq) && !single(con.bv[row][c])) {
        l_debug("constrained %d:%d to %02X by row elimination (from %02X)", row,
                c, (unsigned int)row_uniq, (unsigned int)con.bv[row][c]);
        con.bv[row][c] &= row_uniq;
        break;
      }
    }
  }
  if (col_uniq != 0xFFU) {
    for (int r = 0; r < length; r++) {
      if (single(con.bv[r][col] & col_uniq) && !single(con.bv[r][col])) {
        l_debug("constrained %d:%d to %02X by col elimination (from %02X)", r,
                col, (unsigned int)col_uniq, (unsigned int)con.bv[r][col]);
        con.bv[r][col] &= col_uniq;
        break;
      }
    }
  }
}

void pp_constraints() {
#define each(a) a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]
#define seven(x) x x x x x x x
  for (int r = 0; r < MAX_LENGTH; r++) {
    l_debug("con.bv=[" seven("%02X ") "%02X]", each((unsigned int)con.bv[r]));
  }
  l_debug("con.pv=[" seven("%02X ") "%02X]", each((unsigned int)con.pv));
#undef each
#undef seven
}

uint_fast8_t unique_bits(int n, uint_fast8_t seq[]) {
  uint_fast8_t count1 = 0, count2 = 0;

  for (int i = 0; i < n; i++) {
    count2 |= count1 & seq[i];
    count1 |= seq[i];
  }

  uint_fast8_t uniques = count1 & ~count2;
  return uniques;
}

bool row_filled(int row) { return (con.pv[row] == bitmask(length)); }
bool col_filled(int col) {
  bool filled = true;

  for (int i = 0; i < length; i++) {
    filled = filled && (((con.pv[i] >> col) & 1) == 1);
  }

  return filled;
}

bool solver_win() {
  uint_fast8_t placements = bitmask(length);
  for (int i = 0; i < length; i++) {
    placements &= con.pv[i];
  }

  return (placements == bitmask(length));
}

void swap(char *x, char *y) {
  char temp;
  temp = *x;
  *x = *y;
  *y = temp;
}

// evil :(
int sequence_pos = 0;
void permutations(char (*dst)[MAX_LENGTH], int n, char v[], int k) {
  if (k == 1) {
    memcpy(dst[sequence_pos], v, n * sizeof(char));
    sequence_pos++;
  } else {
    for (int i = 0; i < k; i++) {
      permutations(dst, n, v, k - 1);
      if (k % 2 == 1) {
        swap(&v[0], &v[k - 1]);
      } else {
        swap(&v[i], &v[k - 1]);
      }
    }
  }
}

char (*all_sequences)[MAX_LENGTH];
char (*valid_sequences)[MAX_LENGTH];
char (*filtered_sequences)[MAX_LENGTH];

// returns the number of sequences generated
size_t generate_valid_sequences(int index, bool is_row) {
  uint_fast8_t constr[MAX_LENGTH];

  if (is_row)
    memcpy(constr, con.bv[index], length * sizeof(uint_fast8_t));
  else // is col
    for (int i = 0; i < length; i++)
      constr[i] = con.bv[i][index];

  int valid_pos = 0;

  for (size_t i = 0; i < FACTORIAL[length]; i++) {
    bool matches = true;
    for (int j = 0; j < length; j++) {
      matches =
          matches && ((constr[j] & piece_to_bit(all_sequences[i][j])) > 0);
    }
    if (matches) {
      memcpy(valid_sequences[valid_pos], all_sequences[i],
             length * sizeof(char));
      valid_pos++;
    }
  }

  return valid_pos;
}

size_t generate_filtered_sequences(size_t n_valid, int index, bool is_row) {
  size_t filtered_pos = 0;

  for (size_t i = 0; i < n_valid; i++) {
    unpack(nvisible(length, valid_sequences[i]), v_fwd, v_bwd);
    bool valid_fwd = false, valid_bwd = false;

    if (is_row) {
      valid_fwd = left_key[index] == 0 || v_fwd == left_key[index];
      valid_bwd = right_key[index] == 0 || v_bwd == right_key[index];
    } else { // is col
      valid_fwd = top_key[index] == 0 || v_fwd == top_key[index];
      valid_bwd = bottom_key[index] == 0 || v_bwd == bottom_key[index];
    }

    if (valid_fwd && valid_bwd) {
      // l_debug("generated sequence (#%ld) with key %d/%d for %s %d",
      //         filtered_pos + 1, v_fwd, v_bwd, is_row ? "row" : "col", index);
      memcpy(filtered_sequences[filtered_pos], valid_sequences[i],
             length * sizeof(char));
      filtered_pos++;
    }
  }

  return filtered_pos;
}

bool sequence_filtration(int index, bool is_row) {
  size_t valid = generate_valid_sequences(index, is_row);
  size_t filtered = generate_filtered_sequences(valid, index, is_row);

  if ((valid + filtered) > 2) {
    if (valid != filtered) {
      l_debug("%-5ld valid    seq for %s %d", valid, is_row ? "row" : "col",
              index);
    }
    l_debug("%-5ld filtered seq for %s %d", filtered, is_row ? "row" : "col",
            index);
  }

  uint_fast8_t constr[length];
  memset(constr, 0, length * sizeof(uint_fast8_t));

  for (size_t i = 0; i < filtered; i++) {
    for (int j = 0; j < length; j++) {
      constr[j] |= piece_to_bit(filtered_sequences[i][j]);
    }
  }

  bool changed = false;
  if (is_row) {
    for (int i = 0; i < length; i++) {
      if ((con.bv[index][i] & constr[i]) != con.bv[index][i])
        changed = true;
      con.bv[index][i] &= constr[i];
    }
  } else {
    for (int i = 0; i < length; i++) {
      if ((con.bv[i][index] & constr[i]) != con.bv[i][index])
        changed = true;
      con.bv[i][index] &= constr[i];
    }
  }

  return changed;
}

bool apply_sequence_filtration() {
  bool changed = false;

  for (int i = 0; i < length; i++) {
    bool row_changed = !row_filled(i) && sequence_filtration(i, true);
    bool col_changed = !col_filled(i) && sequence_filtration(i, false);
    changed = changed || row_changed || col_changed;
  }
  return changed;
}

int solve(const char *initial_state, const char *keys, int size) {
  if (0 == initialize_board(initial_state, keys, size))
    return 0;

  // init constraints
  for (int i = 0; i < size * size; i++) {
    char c = initial_state[i];
    unpack(itopos(i, length), row, col);
    con.bv[row][col] = c == '-' ? bitmask(size) : piece_to_bit(c);
    con.pv[row] = 0; // unfortunate
  }

  // init sequences
  all_sequences = malloc(sizeof(*all_sequences) * FACTORIAL[size]);
  char range[length];
  for (int i = 1; i <= length; i++)
    range[i - 1] = '0' + i;

  sequence_pos = 0; // asan..
  permutations(all_sequences, length, range, length);
  l_debug("permutations done for n=%d", size);

  valid_sequences = malloc(sizeof(*valid_sequences) * FACTORIAL[size]);
  filtered_sequences = malloc(sizeof(*filtered_sequences) * FACTORIAL[size]);

  pp_constraints();

  edge_clue_initialization();

  pp_constraints();
  print_board();

  if (!solver_win()) {
    l_debug("board unsolved after recursion, bruteforcing");
  } else {
    l_debug("board solved by recursion");

    free(all_sequences);
    free(valid_sequences);
    free(filtered_sequences);

    return 1;
  }

  int iter = 0;
  while (!solver_win() && iter++ < 50) {
    apply_sequence_filtration();
    place_singles();
  }

  l_debug("board solved by bruteforce");

  pp_constraints();
  print_board();

  free(all_sequences);
  free(valid_sequences);
  free(filtered_sequences);
  return 1;
}