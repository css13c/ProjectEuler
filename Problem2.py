import time;

def evenFibSum():
    total = 2
    x = 1
    y = 2
    limit = 4000000
    while (y <= limit):
        z = x + y
        if z % 2 == 0:
            total += z
        x = y
        y = z

    return total

def main():
    print("What is the sum of all even terms in the Fibbonacci sequence under 4 million? {}".format(evenFibSum()))

startTime = time.time()
main()
print("Execution took {:.4f} seconds".format(time.time() - startTime))
