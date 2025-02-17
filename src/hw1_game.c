#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "hw1.h"

int main(int argc, char **argv) {
  assert(argc == 4); // we want a size, board state, and a list of keys
  int size = (int)strtoul(argv[1], NULL, 10);
  if (0 == initialize_board(argv[2], argv[3], size))
    return EXIT_FAILURE;

  edbg("%s", argv[1]);
  edbg("%s", argv[2]);
  edbg("%s", argv[3]);

  print_board();

  return 0;
}