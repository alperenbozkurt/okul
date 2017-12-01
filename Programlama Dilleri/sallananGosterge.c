#include "stdio.h"
#include "stdlib.h"

int main() {
  int *x, *y;
  x = malloc(sizeof(int));

  *x = 10;
  y = x;

  printf("%p ", &y);
  printf("%d\n", *y);

  free(x);
  printf("%p ", &y);
  printf("%d\n", *y);

}
