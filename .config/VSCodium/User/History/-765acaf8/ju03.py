course = '''
a
b
c
d
e
f
g
h
i
j
'''

course_b = "This is a wonderful idea!"
# Print char at position
print(course_b[-1])
# Print char in a range, excluding last
print(course_b[0:3])
print(course_b[3:])
print(course_b[:3])

print(len(course_b))
print(course_b.upper())
print(course_b.find('i'))
print(course_b.find('0'))
print(course_b.find('idea'))
print(course_b.replace("idea","invention"))
print('bad' in course_b)
print('wonderful' in course_b)
print(course_b.title())

first = "John"
last = "Smith"
message = f"{first} [{last}] is a coder"

print(message)



print(10/3) # division
print(10//3) # division -> output int
print(10%3) # modulo
print(10**2.1) # exponentiation

z = 10
z += 1 # -> z = z + 1

z = 4.5 + 10**-10

print(z)
print(round(z))

x = 0
def f(a,b):
    return 5*a**2 + a*b + 8*a

for i in range(0,100):
    b = i
    for j in range(0,100):
        a = j
        print(a)