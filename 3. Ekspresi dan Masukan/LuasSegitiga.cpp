#include <iostream>
#include <iomanip>

int main()
{
  int A, T;
  std::cin >> A >> T;
  std::cout << std::fixed << std::setprecision(2) << ((float)A * T / 2);
  return 0;
}
