#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hw1.h"

int top_key[MAX_LENGTH] = {0};
int bottom_key[MAX_LENGTH] = {0};
int left_key[MAX_LENGTH] = {0};
int right_key[MAX_LENGTH] = {0};

char board[MAX_LENGTH][MAX_LENGTH] = {0};

int length = 5;

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

bool valid_key(char test) {
  return char_in_range(test, '0', '0' + length);
}

bool row_dup(int row, char c) {
  for (int i = 0; i < length; i ++) {
    if (c == board[row][i]) return true;
  }
  return false;
}

bool col_dup(int col, char c) {
  for (int i = 0; i < length; i ++) {
    if (c == board[i][col]) return true;
  }
  return false;
}

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

int initialize_board(const char *initial_state, const char *keys, int size) {
#define die() do { printf("Invalid initial board state.\n"); return 0; } while (0)
  length = size;

  debug_assert(size <= MAX_LENGTH);
  debug_assert(0 < size);

  if (!strnmatch(size * size, initial_state, valid_state))
    die();
  for (int i = 0; i < size * size; i++) {
    int pos = itopos(i, size);
    board[pos >> 4][pos & 7] = *(initial_state + i);
  }

  if (!strnmatch(size * 4, keys, valid_key))
    die();
  // convert keys to int[]
  int ikeys[size * 4];
  for (int i = 0; i < size * 4; i++) {
    char key = keys[i];
    ikeys[i] = key - '0';
  }

  // memcpy seems super easy here
  for (int i = 0; i < size; i++) {
    top_key[i] = *(ikeys + i);
    bottom_key[i] = *(ikeys + i + size);
    left_key[i] = *(ikeys + i + (2 * size));
    right_key[i] = *(ikeys + i + (3 * size));
  }

  return 1;
#undef die
}

int solve(const char *initial_state, const char *keys, int size) {
  (void)initial_state;
  (void)keys;
  (void)size;

  return 1;
}