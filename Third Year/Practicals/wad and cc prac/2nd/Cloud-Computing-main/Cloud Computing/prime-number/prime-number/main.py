#!/usr/bin/env python

print 'Content-Type: text/plain'
print ''
print 'Hello World\n'

# Prime Numbers
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

print 'Prime numbers from 1 to 5:'
for i in range(1, 6):
    if is_prime(i):
        print i,

print '\n'