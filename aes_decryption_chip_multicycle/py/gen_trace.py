from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend

import time
import random
import string

from gen_key_expand import key_expansion

# Random chars
CHARS = string.digits + 'abcdef'

def aes_encrypt(plaintext, key):
    # Convert plaintext and key from hex to bytes
    plaintext_bytes = bytes.fromhex(plaintext)
    key_bytes = bytes.fromhex(key)

    # Create a new AES cipher with ECB mode
    cipher = Cipher(algorithms.AES(key_bytes), modes.ECB(), backend=default_backend())

    # Encrypt the plaintext
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(plaintext_bytes) + encryptor.finalize()

    # Convert ciphertext to hex and return
    return ciphertext.hex()


# Random seed assignment
seed = time.time()

trace = open("../testbench/trace.tr", "w")


data_random = random.Random()
data_random.seed(seed)

for i in range(500):
    test_i = ''.join(data_random.choice(CHARS) for _ in range(32+64))

    encrypted_output = aes_encrypt(test_i[:32], test_i[32:])

    expanded_key = key_expansion(test_i[32:])

    test_o = encrypted_output + expanded_key

    test_bin = str(bin(int(test_o, 16))[2:])

    if len(test_bin) < 2048:
        test_bin = "0"*(2048-len(test_bin)) + test_bin
        
    trace.write("0001____" + test_bin + "\n")
    
    test_bin = str(bin(int(test_i[:32], 16))[2:])

    if len(test_bin) < 2048:
        test_bin = "0"*(2048-len(test_bin)) + test_bin
        
    trace.write("0010____" + test_bin + "\n")

trace.write("0100____" + "0"*2048 + "\n")