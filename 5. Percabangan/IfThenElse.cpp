#include <iostream>

int main()
{
  int N;
  std::cin >> N;
  if (N > 0)
    std::cout << "positif";
  else if (N < 0)
    std::cout << "negatif";
  else
    std::cout << "nol";

  return 0;
}