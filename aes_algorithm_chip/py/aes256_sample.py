from Crypto.Cipher import AES
from secrets import token_bytes

key = token_bytes(32)


def encrypt(msg):
    cipher = AES.new(key, AES.MODE_EAX)
    nonce = cipher.nonce
    ciphertext, tag = cipher.encrypt_and_digest(msg.encode('ascii'))
    return nonce, ciphertext, tag

def decrypt(nonce, ciphertext, tag):   
    cipher = AES.new(key, AES.MODE_EAX, nonce=nonce)
    plaintext = cipher.decrypt(ciphertext)
    try:
        cipher.verify(tag)
        return plaintext.decode('ascii')
    except ValueError:
        return False
    
nonce, ciphertext, tag = encrypt(input('Enter a message you want to encrypt: '))
plaintext = decrypt(nonce, ciphertext, tag)
print(f'Encrypted message: {ciphertext}')
if not plaintext:
    print('Message is corrupted')
else:
    print(f'Decrypted message: {plaintext}')

