
print 'Content-Type: text/plain'
print ''
print 'Hello World\n'

# Armstrong Numbers
def is_armstrong(n):
    num_str = str(n)
    power = len(num_str)
    total = sum(int(d)**power for d in num_str)
    return total == n

print 'Armstrong numbers from 1 to 500:'
for i in range(1, 501):
    if is_armstrong(i):
        print i,

print '\n'