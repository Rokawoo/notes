# Transport Layer Security (T.L.S.)

### Overview

1. TLS is a protocol that provides encryption and data integrity for communications between a:
    - Client
    - Server
    - TLS 1.3 is the latest version

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

5. Key Types
    - Symmetric Key: 
    ```
    (Master Secret)
    f(M,k) -> N
    f(N,k) -> M
    ```
    - Asymmetric Key:
    ```
    (Public-Private Key)
    f(M, priv) -> N
    f(N, priv) -> fail
    f(N, pub)  -> M

    f(O, pub)  -> P
    f(P, priv) -> O
    ```

6. Example Usage of Keys
    - Symmetric Key:
        - Server and Client Share Key:
        ```
        Secret Key: ABCD
        ```
        - Client
        ```
        Generate M
        Encrypt M with Secret Key
        f(M, ABCD) -> N
        Pass N to Server
        ```
        - Server
        ```
        f(N, ABCD) -> M
        ```
    - Asymmetric Key:
        - Server
        ```
        Public: 1234
        Private: <unknown>
        ```
        - Client
        ```
        Generate G
        Encrypt G with Server.Public
        f(G, pub) -> H
        Pass H to Server
        ```
        - Server
        ```
        f(H, priv) -> G
        ```

7. Symmetric keys offer superior security because they're never transmitted publicly. In asymmetric systems, the public key creates an inherent vulnerability as with sufficient computational power, attackers could potentially derive the private key through mathematical analysis.

8. In Wireshark you can view the message atributes
    - Client Hello
        - Handshake Type
        - Length
        - Protocol Version (TLS 1.2/1.3)
        - Cipher Suites
            - TLS_RSA_WITH_AES_256_GCM_SHA384, ...
            - We hope the server picks the top one
        - Compression Methods:
        - Extensions
    - Server Hello
        - Handshake Type
        - Length
        - Protocol Version (TLS 1.2/1.3)
        - Selected Cipher Suite
            - The server picks one of the cipher suites offered by the client
            - E.g., TLS_RSA_WITH_AES_256_GCM_SHA384
        - Selected Compression Method
        - Extensions

## This Ends the rough summeray for tls itself ----
