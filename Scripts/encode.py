x = input("Enter a string ")
out = bin(int.from_bytes(x.encode(), 'big'))
count = 1
out2 = ['0']
for i in range(2, len(out)):
    out2.append(out[i])

for i in range(len(out2)):
    if i % 8 == 0:
        print(" ", end='')

    print(out2[i], end='')
