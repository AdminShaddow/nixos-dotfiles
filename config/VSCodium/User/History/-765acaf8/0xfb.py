course = '''
a111
b111
c111
d111
e111
f111
g111
...
'''

course_b = "abcdefg"
# Print char at position
print(course_b[-1])
# Print char in a range, excluding last
print(course_b[0:3])
print(course_b[3:])
print(course_b[:3])

print(len(course_b))
print(course_b.upper())
print(course.find('g'))

first = "John"
last = "Smith"
message = f"{first} [{last}] is a coder"

print(message)