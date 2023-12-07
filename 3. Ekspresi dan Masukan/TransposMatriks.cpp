#include <iostream>
#include <stdio.h>

int main()
{
  int a, b, c, d, e, f, g, h, i;
  std::cin >> a >> b >> c;
  std::cin >> d >> e >> f;
  std::cin >> g >> h >> i;
  printf("%d %d %d\n", a, d, g);
  printf("%d %d %d\n", b, e, h);
  printf("%d %d %d\n", c, f, i);
  return 0;
}