import math;
import time;

def isPrime(num):
    if num < 2 or (num % 2 == 0 and num != 2):
        return False
    else:
        return all(num % i for i in range(3, int(math.sqrt(num))+1))

def getLargestPrimeFactor(num):
    if num < 2:
            return
    primeFactors = [-1]

    # remove all 2s from factorization
    while (num % 2 == 0):
        primeFactors.append(2)
        num = num / 2

    # all odd numbers
    for div in range(3, int(num/2) + 1, 2):
        if num == 1:
            break
        while num % div == 0:
            primeFactors.append(div)
            num = num / div
    if isPrime(num):
        primeFactors.append(num)
    return max(primeFactors)

def main():
    test = 600851475143
    print("What is the largest prime factor of 600851475143? {}".format(getLargestPrimeFactor(test)))

startTime = time.time()
main()
print("Execution took {:.4f} seconds".format(time.time() - startTime))
