# Solution to Project Euler Problem 16:
# What is the sum of the digits of the number 2^1000?
def sum_of_digits(num: int):
    sum = 0
    for x in str(num):
        sum += int(x)
    
    return sum

if __name__ == "__main__":
    from math import pow
    print(f"Problem 16 solution: {sum_of_digits(int(pow(2, 1000)))}")

# Taken from given example in problem
def test_example():
    from math import pow
    assert sum_of_digits(int(pow(2, 15))) == 26
