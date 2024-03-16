import binascii
from pprint import pprint

x = input("Enter binary string ").split(" ")
out = []
for i in x:
    tmp = int(i, 2)
    out.append(tmp.to_bytes((tmp.bit_length() + 7) // 8, 'big').decode())

pprint(' '.join(word[0] for word in out))