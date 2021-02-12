def findNthFib(n, seq):
    if n < len(seq) and seq[n]:
        return seq[n]

    nthVal = findNthFib(n - 2, seq) + findNthFib(n - 1, seq)
    seq.append(nthVal)
    return nthVal

def evenFibSum(maxVal):
    current = 2
    prev = 0
    sum = 0
    while current < maxVal:
        sum += current
        temp = (current * 4) + prev
        prev = current
        current = temp

    return sum

def main():
    print(f"Problem 2 solution: {evenFibSum(4000000)}")

if __name__ == "__main__":
    main()

### Tests
def test_maxValue100():
    assert evenFibSum(100) == 44