#include <iostream>

int main()
{
  int N;
  std::cin >> N;
  if (N % 2 == 0 && N > 0)
    std::cout << N;

  return 0;
}