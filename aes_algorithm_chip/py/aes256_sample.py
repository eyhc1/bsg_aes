from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend

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

# Example inputs from section C.3
plaintext_example = "00112233445566778899aabbccddeeff"
key_example = "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f"

# Encrypt and display the output
encrypted_output = aes_encrypt(plaintext_example, key_example)
print("Encrypted Output:", encrypted_output)
