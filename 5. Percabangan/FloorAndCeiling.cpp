#include <iostream>

int main()
{
  float N;
  std::cin >> N;
  int roundedN = (int)N;

  if (roundedN == N)
    std::cout << N << " " << N;
  else if (N > 0)
    std::cout << roundedN << " " << roundedN + 1;
  else if (N < 0)
    std::cout << roundedN - 1 << " " << roundedN;

  return 0;
}