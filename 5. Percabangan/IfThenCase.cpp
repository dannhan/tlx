#include <iostream>

int main()
{
  int N;
  std::cin >> N;
  if (N < 10)
    std::cout << "satuan";
  else if (N < 100)
    std::cout << "puluhan";
  else if (N < 1000)
    std::cout << "ratusan";
  else if (N < 10000)
    std::cout << "ribuan";
  else if (N < 100000)
    std::cout << "puluhribuan";

  return 0;
}