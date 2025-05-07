print 'Content-Type: text/plain'
print ''
print 'Hello World\n'

# Factorial
def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result

factorial_result = factorial(5)
print '\nFactorial of 5 is:', factorial_result

print ''