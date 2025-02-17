#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hw1.h"

#define F_OK 1
#define F_QUIT 2
#define F_DUPLICATE 4

int row, col = -1;
char piece = 0;

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

int get_move(int size) {
  char buf[9];
  do {
    printf("Choose a piece (1-%d) or q to quit: ", size);
    scanf(" %8s", buf);
    if (0 == strcmp("q", buf))
      return F_QUIT;
  } while (false == strnmatch(1, buf, valid_state) &&
           0 < printf("Invalid choice. "));

  piece = buf[0];

  do
    printf("Choose a row (0-%d): ", size);
  while (false == read_int_range(&row, 0, size) &&
         0 < printf("Invalid choice. "));

  do
    printf("Choose a column (0-%d): ", size);
  while (false == read_int_range(&col, 0, size) &&
         0 < printf("Invalid choice. "));

  return F_OK;
}

int main(int argc, char **argv) {
  assert(argc == 4); // we want a size, board state, and a list of keys
  int size = (int)strtoul(argv[1], NULL, 10);
  if (0 == initialize_board(argv[2], argv[3], size))
    return EXIT_FAILURE;

  edbg("%s", argv[1]);
  edbg("\"%s\"", argv[2]);
  edbg("\"%s\"", argv[3]);
  do {

    print_board();
    int s = get_move(size);

    if (s & F_QUIT)
      return EXIT_SUCCESS;

    edbg("'%c'", piece);
    edbg("%d", row);
    edbg("%d", col);

    if (row_dup(row, piece) || col_dup(col, piece)) {
      printf("There is already a building with that height in that row or "
             "column.\n");
      continue;
    }
  } while (0);

  return 0;
}