# Transport Layer Security (T.L.S.)

### Overview

1. TLS is a protocol that provides encryption and data integrity for communications between a:
    - Client
    - Server

2. HTTP(S) where S stans for Secure Socket Layer (S.S.L.):
    - SSL is a predecessor to TLS
    - Changed to  TLS in for better definition of what it does

3. Secure Shell (S.S.H.) is a protocol designed to acompllish the same idea as TLS but in a different way.
    - Handshake process differs

3. TLS encrypts packets before transmitting it to the wire.

4. Viewing WireShark you can view the encrypted handshake messages:
    - Handshake messages are not encrypted at first -> Client Hello is in plaintext
    - Both client and server start with unencrptyted messages
    - Exchange some pieces of information and through what they exchange they are both able to generate a **master secret**
    - Master secret involes both sides generating the same number (via math not magic) but never shares it over the wired


