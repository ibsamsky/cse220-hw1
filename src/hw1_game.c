#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "hw1.h"

int main(int argc, char **argv) {
  assert(argc == 4); // we want a size, board state, and a list of keys
  int size = (int)strtoul(argv[1], NULL, 10);
  if (0 == initialize_board(argv[2], argv[3], size))
    return 0; // for codegrade :)

  edbg("%s", argv[1]);
  edbg("\"%s\"", argv[2]);
  edbg("\"%s\"", argv[3]);

  unsigned long status;

  do {

    print_board();
    status = get_move();

    edbg("%lx", status);

    if (status & F_MOVE_QUIT)
      return EXIT_SUCCESS;
  } while (!((status & F_WIN) > 0));

  // end game
  printf("Congratulations, you have filled the board!\n");
  print_board();

  return 0;
}