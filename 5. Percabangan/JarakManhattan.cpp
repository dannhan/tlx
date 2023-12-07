#include <iostream>

int main()
{
  int x1, x2, y1, y2;
  std::cin >> x1 >> y1 >> x2 >> y2;
  int totalDistanceX = x1 - x2;
  int totalDistanceY = y1 - y2;

  if (totalDistanceX < 0)
    totalDistanceX *= -1;
  if (totalDistanceY < 0)
    totalDistanceY *= -1;

  std::cout << totalDistanceX + totalDistanceY;

  return 0;
}