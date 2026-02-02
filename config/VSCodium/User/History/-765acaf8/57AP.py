course_b = '''
a
b
c
d
e
f
g
h
i
'''
# Print char at position
print(course_b[-1])
# Print char in a range, excluding last
print(course_b[0:3])
print(course_b[3:])
print(course_b[:3])

print(len(course_b))
print(course_b.upper())
print(course_b.find('g'))

first = "John"
last = "Smith"
message = f"{first} [{last}] is a coder"

print(message)