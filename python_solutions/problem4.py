def find_max_fib(digits):
    import math
    factorStart = int(math.floor(math.pow(10, digits)) - 1)
    minFactor = 0
    maxVal = 0
    for x in range(factorStart, 1, -1):
        for y in range(factorStart, 1, -1):
            val = x*y
            if is_palindrome(val) and val > maxVal:
                print(f"New max palindrome: {val}")
                maxVal = val
                minFactor = min(x,y)
            elif y < minFactor or digit_count(y) < digits:
                break

        if x < minFactor or digit_count(x) < digits:
            break

    return maxVal

def digit_count(n: int):
    return len(str(n))

def is_palindrome(n: int):
    num = str(n)
    while len(num) > 2: 
        if num[0] != num[-1]:
            return False

        num = num[1:-1]

    if len(num) == 1:
        return True

    return num[0] == num[-1]

if __name__ == "__main__":
    print(f"Problem 4 solution: {find_max_fib(3)}")

### Tests
def test_max_palindrome_of_2_digit_numbers():
    assert find_max_fib(2) == 9009

def test_is_palindrome_single_digit():
    assert is_palindrome(9)

def test_is_palindrome_two_digits():
    assert is_palindrome(22)

def test_is_palindrome_three_digits():
    assert is_palindrome(323)

def test_is_palindrome_nine_digits():
    assert is_palindrome(123454321)

def test_is_palindrome_fail():
    assert not is_palindrome(53)
    assert not is_palindrome(123)