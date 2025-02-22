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

int itopos(const int n, const int cols) {
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

unsigned long check_row(int row) {
  char max_left = '0', max_right = '0';
  int v_left = 0, v_right = 0;

  if ((check_dupes_row(row) & F_MOVE_DUPLICATE) > 0)
    return F_MOVE_DUPLICATE;

  if (left_key[row] == 0 || right_key[row] == 0)
    return F_MOVE_OK;

  for (int i = 0; i < length; i++) {
    char p_left = board[row][i];
    char p_right = board[row][length - i - 1];

    if (p_left == '-' || p_right == '-')
      return F_MOVE_OK;

    if (p_left > max_left) {
      v_left++;
      max_left = p_left;
    }
    if (p_right > max_right) {
      v_right++;
      max_right = p_right;
    }
  }
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
  char max_top = '0', max_bottom = '0';
  int v_top = 0, v_bottom = 0;

  if ((check_dupes_col(col) & F_MOVE_DUPLICATE) > 0)
    return F_MOVE_DUPLICATE;

  for (int i = 0; i < length; i++) {
    char p_top = board[i][col];
    char p_bottom = board[length - i - 1][col];

    if (p_top == '-' || p_bottom == '-')
      return F_MOVE_OK;

    if (p_top > max_top) {
      v_top++;
      max_top = p_top;
    }
    if (p_bottom > max_bottom) {
      v_bottom++;
      max_bottom = p_bottom;
    }
  }
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
    int pos = itopos(i, size);
    board[pos >> 4][pos & 7] = c;
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

constraints con = {.bv = {{0}}};

uint_fast8_t piece_to_bit(char piece) { return 1 << (piece - '1'); }

char bit_to_piece(uint_fast8_t bit) {
  assert(single(bit));
  return ffs(bit) + '0';
}

// h/t chess programming wiki
bool single(uint_fast8_t val) { return (val != 0 && (val & (val - 1)) == 0); }

void place_singles() {
  for (int i = 0; i < length * length; i++) {
    int pos = itopos(i, length);
    int row = pos >> 4, col = pos & 7;
    if (single(con.bv[row][col])) {
      char piece = bit_to_piece(con.bv[row][col]);
      l_debug("placing '%c' at %d:%d", piece, row, col);
      board[row][col] = piece;
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
    int pos = itopos(i, length);
    int row = pos >> 4, col = pos & 7;
    uint_fast8_t constr = edge_constraint(row, col);
    l_debug("constraining %d:%d to %02X (from %02X)", row, col,
            (unsigned int)constr, (unsigned int)con.bv[row][col]);
    con.bv[row][col] &= constr;
  }

  // lock in
  l_debug("placing edge constraints");
  place_singles();
}

void pp_constraints() {
#define each(a) a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]
#define eight(x) x x x x x x x x
  for (int r = 0; r < MAX_LENGTH; r++) {
    l_debug("con=" eight("%02X"), each((unsigned int)con.bv[r]));
  }
#undef each
#undef eight
}

int solve(const char *initial_state, const char *keys, int size) {
  if (0 == initialize_board(initial_state, keys, size))
    return 0;

  // init constraints
  for (int i = 0; i < size * size; i++) {
    char c = initial_state[i];
    int pos = itopos(i, size);
    con.bv[pos >> 4][pos & 7] = c == '-' ? bitmask(size) : piece_to_bit(c);
  }

  pp_constraints();

  edge_clue_initialization();

  pp_constraints();
  print_board();

  // p < size - key + p_idx + 2
  // for key=1 p_idx=0 -> p<size+1 ; p=size
  // for key=size p_idx=0 p<2 ; p=1

  return 1;
}