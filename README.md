# NaCL

## Overview

This Swift Package is a wrapper of NaCl library[1] written in C. 
It exposes a function that extracts a public key from a private key using ed25519.
The C files implementing the ed25519 are based on work of Brian Warner[2][3].
We removed files that were not needed and we created a method to calculate a public key from a private key by using the existing c functions.

## Extension

Function `modified_crypto_sign_publickey` is using existing `ge25519_scalarmult_base` to calculate pk from sk.
It is neither using `crypto_hash_sha512` nor tweak bits as the original `crypto_sign_publickey` function.


## Documentation and white papers:

[1] [NaCl: Networking and Cryptography library](http://nacl.cr.yp.to/internals.html)

[2] [Brian Warner Blog](https://blog.mozilla.org/warner/2011/11/29/ed25519-keys)

[3] [ed25519-supercop-ref](https://github.com/warner/python-ed25519/tree/master/src/ed25519-supercop-ref)

[4] [D. J. Bernstein, N. Duif, T. Lange, P. Schwabe, and B-Y. Yang, High-speed high-security signatures. Department of Computer, Science University of Illinois, Chicago](https://ed25519.cr.yp.to/ed25519-20110926.pdf)  

[5] [S. Josefsson, I. Liusvaara, 2017, Edwards-Curve Digital Signature Algorithm (EdDSA), ](https://tools.ietf.org/html/rfc8032)
