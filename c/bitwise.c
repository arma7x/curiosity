#include <stdio.h>
#include <stdint.h>

int main()
{
  unsigned int a = 192;
  unsigned int b = 168;
  unsigned int c = 43;
  unsigned int d = 1;

  int total = (a << 0) + (b << 8) + (c << 16) + (d << 24);

  printf("total is %d\n", total);
  printf("a %d == %d\n", (unsigned) total << 24 >> 24, a);
  printf("b %d == %d\n", (unsigned) total << 16 >> 24, b);
  printf("c %d == %d\n", (unsigned) total << 8 >> 24, c);
  printf("d %d == %d\n", (unsigned) total >> 24, d);

  // 7654 3210
  // 0000 1010

  uint8_t store = 10;
  printf("\nStore is %d \n", store);

  // check
  uint8_t store_2 = store & (1 << 2); // 0000 0100
  printf("At \tstore[2] %d\n", store_2 > 0);

  // set
  store = store | (1 << 2); // 0000 0100
  printf("Set \tstore[2] %d\n", store); // 0000 1110

  // unset
  store = store & ~(1 << 2); // 0000 0100
  printf("Unset \tstore[2] %d \n", store); // 0000 1110

  // toggle
  store = store ^ (1 << 2); // 0000 0100
  printf("Toggle \tstore[2] %d\n", store); // 0000 1010

  // toggle
  store = store ^ (1 << 2); // 0000 0100
  printf("Toggle \tstore[2] %d\n", store); // 0000 1010

  return 0;
}
