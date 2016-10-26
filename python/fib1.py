def fib(n):
    if n < 2:
        return n
    a1 = a2 = a3 = 1
    while n > 2:
        n -= 1
        a3 = a1 + a2
        a1 = a2
        a2 = a3
    return a3
print fib(40)
