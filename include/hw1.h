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
unsigned long check_row(int row);
unsigned long check_col(int col);

bool strnmatch(int n, const char *str, bool (*const pred)(char));
bool read_int_range(int *out, int low, int high);
bool parse_int_range(int *dst, const char *src, int low, int high);
bool valid_state(char test);
bool valid_key(char test);


/* Hints from our solution (feel free to use or ignore):

Part 1

void print_board();
int get_move();
int check_dupes_col(int col);
int check_dupes_row(int row);
int check_row(int row);
int check_col(int col);
int try_move(char choice, int row, int col);

Part 2

void edge_clue_initialization(void);
void apply_edge_constraint_rule(void);
bool apply_constraint_propagation(int row, int column, int piece);
void apply_process_of_elimination(int row, int column, int piece);

Part 3

void generate_valid_sequences(int valid_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH],
bool is_horizontal, int index); void generate_valid_sequences_helper(int
valid_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH], bool is_horizontal, int index,
int sequence[MAX_LENGTH], int starts_at); void generate_filtered_sequences(int
filtered_sequences[MAX_SEQUENCE_CAP][MAX_LENGTH], bool is_horizontal, int
index); bool sequence_filtration(bool is_horizontal, int index); bool
apply_sequence_filtration(void);

Testing functions

void print_possible_pieces_state(void);
void print_possible_pieces_at_cell(int row, int column);
*/

#endif // HW1_H