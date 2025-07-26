print 'Content-Type: text/plain'
print ''
print 'Hello World\n'

# Fibonacci Series
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        print a,
        a, b = b, a + b

print 'Fibonacci series up to 5 terms:'
fibonacci(5)

print '\n'