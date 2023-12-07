#include <iostream>
#include <ostream>

int main()
{
  int N, M;
  std::cin >> N >> M;
  std::cout << "masing-masing " << (int)N / M << std::endl;
  std::cout << "bersisa " << N % M;
  return 0;
}
