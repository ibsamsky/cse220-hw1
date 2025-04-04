#ifndef __HW1_H
#define __HW1_H

#include <stdbool.h>
#include <stdint.h>

// FIXME: debug, remove for grading
#define HW1_DEBUG
// #define HW1_COLOR

#define F_MOVE_OK 0x1UL
#define F_MOVE_QUIT 0x2UL
#define F_MOVE_DUPLICATE 0x4UL
#define F_MOVE_KEYERR 0x8UL
#define F_MOVE_OCCUPIED 0x10UL
#define F_WIN 0x20UL

#define STR(x) #x
#define ESTR(x) STR(x)

#define print_arr(FMT, ARR, LEN)                                               \
  for (int __i = 0; __i < LEN; __i++) {                                        \
    printf(FMT, ARR[__i]);                                                     \
  }

#define print_repeat(STR, LEN)                                                 \
  for (int __i = 0; __i < LEN; __i++) {                                        \
    printf(STR);                                                               \
  }

#define unpack(v, u, l) uint_fast8_t __v = (v);\
int u = (__v>>4), l = (__v&7)

#define FACTORIAL ((const unsigned int[]){1,1,2,6,24,120,720,5040,40320})

#ifdef HW1_DEBUG
#define debug_assert(...) assert(__VA_ARGS__)
#define LOG_LEVEL 0
#else
#define LOG_LEVEL 4
#define debug_assert(...)
#endif

#define LL_STR ((const char *[]){"DEBUG", "INFO", "WARN", "ERROR"})

#ifdef HW1_COLOR
#define s_RESET "\x1b[0m"
#define s_GRAY "\x1b[90m"
#define LL_COLOR ((const char *[]){"\x1b[36m", "\x1b[32m", "\x1b[33m", "\x1b[31m"})
#else
#define s_RESET ""
#define s_GRAY ""
#define LL_COLOR ((const char *[]){"", "", "", ""})
#endif // HW1_COLOR

#define LL_DEBUG 0
#define LL_INFO 1
#define LL_WARN 2
#define LL_ERROR 3

#define _LOG(FILE, LL, fmt, ...)                                               \
  do {                                                                         \
    if (LOG_LEVEL <= LL) {                                                     \
      fprintf(FILE, "[ %s%-5s" s_RESET " ] " s_GRAY "%s:%d:" s_RESET " ",      \
              LL_COLOR[LL], LL_STR[LL], __FILE__, __LINE__);                   \
      fprintf(FILE, fmt, ##__VA_ARGS__);                                       \
      fprintf(FILE, "\n");                                                     \
      fflush(FILE);                                                            \
    }                                                                          \
  } while (0)

#define l_debug(fmt, ...) _LOG(stderr, LL_DEBUG, fmt, ##__VA_ARGS__)
#define l_info(fmt, ...) _LOG(stderr, LL_INFO, fmt, ##__VA_ARGS__)
#define edbg(fmt, x) l_debug(ESTR(x) "=" fmt, x)

#define ERROR(...) do { fprintf(stderr, "[          ] [ ERR  ] "); fprintf(stderr, __VA_ARGS__); fprintf(stderr, "\n"); fflush(stderr); } while (0)
#define INFO(...) do { fprintf(stderr, "[          ] [ INFO ] "); fprintf(stderr, __VA_ARGS__); fprintf(stderr, "\n"); fflush(stderr); } while (0)

#define MAX_LENGTH 8
#define MAX_SEQUENCE_CAP 40320

// Required:
int initialize_board(const char *initial_state, const char *keys, int size);
int solve(const char *initial_state, const char *keys, int size);

// p1
void print_board();
unsigned long get_move();
unsigned long try_move(char choice, int row, int col);
unsigned long check_dupes_col(int col);
unsigned long check_dupes_row(int row);
uint_fast8_t nvisible(int n, char seq[]);
unsigned long check_row(int row);
unsigned long check_col(int col);

bool strnmatch(int n, const char *str, bool (*const pred)(char));
bool read_int_range(int *out, int low, int high);
bool parse_int_range(int *dst, const char *src, int low, int high);
bool valid_state(char test);
bool valid_key(char test);

// p2
typedef struct board_constraints {
  uint_fast8_t bv[MAX_LENGTH][MAX_LENGTH];
  uint_fast8_t pv[MAX_LENGTH];
} constraints;

bool row_filled(int row);
bool col_filled(int col);
bool solver_win();
uint_fast8_t piece_to_bit(char piece);
char bit_to_piece(uint_fast8_t bit);
bool single(uint_fast8_t val);
unsigned int popcnt(uint_fast8_t x);
unsigned int nbsf(unsigned int n, uint_fast8_t x);
uint_fast8_t edge_constraint(int row, int col);
uint_fast8_t unique_bits(int n, uint_fast8_t seq[]);
void place_singles();
void pp_constraints();
void edge_clue_initialization();
bool apply_constraint_propagation(int row, int col, char piece);
void apply_process_of_elimination(int row, int col);

// p3
size_t generate_valid_sequences( int index, bool is_row);
void swap(char *x, char *y);
void permutations(char (*dst)[MAX_LENGTH], int n, char v[], int k);
size_t generate_valid_sequences(int index, bool is_row);
size_t generate_filtered_sequences(size_t n_valid, int index, bool is_row);
bool sequence_filtration(int index, bool is_row);
bool apply_sequence_filtration();

// void generate_valid_sequences(int valid_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH], bool is_horizontal, int index);

// void generate_valid_sequences_helper(int valid_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH], bool is_horizontal, int index, int sequence[MAX_LENGTH], int starts_at);

// void generate_filtered_sequences(int filtered_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH], bool is_horizontal, int index);

// bool sequence_filtration(bool is_horizontal, int index);

// bool apply_sequence_filtration(void);


// Testing functions

// void print_possible_pieces_state(void);
// void print_possible_pieces_at_cell(int row, int column);

#endif // HW1_H