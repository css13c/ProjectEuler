"""
  Solution to Project Euler problem 23:
  > A perfect number is a number for which the sum of its proper divisors
  > is exactly equal to the number. For example, the sum of the proper divisors
  > of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
  >
  > A number n is called deficient if the sum of its proper divisors is less than n
  > and it is called abundant if this sum exceeds n.
  >
  > As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
  > number that can be written as the sum of two abundant numbers is 24. By
  > mathematical analysis, it can be shown that all integers greater than 28123 can
  > be written as the sum of two abundant numbers. However, this upper limit cannot
  > be reduced any further by analysis even though it is known that the greatest
  > number that cannot be expressed as the sum of two abundant numbers is less than this limit.
  >
  > Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
"""

from typing import List, Iterable, Set

def proper_divisors(n: int) -> [int]:
    """
    Gets the divisors of n except for 1
    """

    if n == 1:
        return []

    x = 2
    divisors = [1]
    while x * x <= n and n > 1:
        if n % x == 0:
            divisors += [x, n // x]

        x += 1

    s = sorted(divisors)
    return s

def sum_of_factors(n: int, prime_list: List[int]) -> int:
    sum_f = 1
    p = prime_list[0]
    i, j = 0
    while p * p <= n and n > 1 and i < len(prime_list):
        p = prime_list[i]
        i += 1
        if n % p == 0:
            j = p * p
            n = n / p
            while n % p == 0:
                j *= p
                n /= p

            sum_f *= ((j - 1) / (p - 1))

    if n > 1:
        sum_f *= n + 1

    return sum_f - number

def is_abundant(n: int, print_div: bool = False) -> bool:
    """
    Checks if the sum of the proper divisors of n are greater than n
    """

    divisors = proper_divisors(n)
    if print_div:
        print(f"Divisors of {n}: {divisors}")

    divisor_sum = sum(divisors) if divisors else 0
    return divisor_sum > n

def all_sums(l: List[int], max_val: int == None) -> Set[int]:
    sums = set()
    for x in filter(lambda a: a < max_val, l):
        i = 0
        while i < len(l) and (max_val == None or x + l[i] <= max_val):
            sums.add(x + l[i])
            i += 1

    return sums


def solution(n: int = 28123) -> int:
    """
    Gets the set of numbers that aren't the sum of two abundant numbers
    from 1 to n
    """

    nums = range(1, n+1)
    abundant = list(filter(is_abundant, nums))
    print(f"Abundant numbers from 1 to {n}: {sorted(abundant)}")
    sum_of_2_abundants = set(all_sums(abundant, n))
    print(f"Sums of abundant: {sorted(sum_of_2_abundants)}")
    fit = set(nums) - sum_of_2_abundants
    #print(f"Numbers that aren't the sum of two abundant numbers: {fit}")
    return fit

if __name__ == "__main__":
    print(f"Problem 23 solution: {sum(solution())}")

### Tests
def test_proper_divisors_of_220():
    assert proper_divisors(220) == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]

def test_proper_divisors_of_284():
    assert proper_divisors(284) == [1, 2, 4, 71, 142]

def test_solution_for_23():
    assert sum(solution(23)) == sum(range(1, 24))

def test_solution_for_50():
    expected = set(range(1, 51)) - {24, 30, 32, 36, 40, 42, 48, 38, 42, 48, 44, 50}
    assert sum(solution(50)) == sum(expected)