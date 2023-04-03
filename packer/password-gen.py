import getpass
from passlib.hash import md5_crypt as md5
from passlib.hash import sha256_crypt as sha256
from passlib.hash import sha512_crypt as sha512

pw=getpass.getpass(prompt='Password: ', stream=None)
print(sha512.hash(pw, rounds=5000) 
if (pw==getpass.getpass("Confirm: ")) 
else exit())