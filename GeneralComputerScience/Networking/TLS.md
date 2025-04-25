# Transport Layer Security (TLS)

## Core Concepts

TLS is a cryptographic protocol that secures network communications by providing:
- **Authentication**: Verifies the identity of communicating parties
- **Privacy**: Encrypts data in transit
- **Integrity**: Ensures data hasn't been tampered with

TLS 1.3 (latest version) improves on its predecessor SSL and earlier TLS versions with enhanced security and performance.

## Protocol Architecture

### Handshake Process
1. **Client Hello**: Client sends supported cipher suites, protocol versions
2. **Server Hello**: Server selects cipher suite, sends certificate
3. **Key Exchange**: Both parties establish shared secrets
4. **Finished**: Verification that handshake completed successfully

After the handshake, all further communication is encrypted with the negotiated parameters.

### Handshake Messages in Wireshark

#### Client Hello
```Haskell
- Handshake Type
- Length
- Protocol Version (TLS 1.2/1.3)
- Cipher Suites
- TLS_RSA_WITH_AES_256_GCM_SHA384, ...
- We hope the server picks the top one
- Compression Methods
- Extensions
```

#### Server Hello
```Haskell
- Handshake Type
- Length
- Protocol Version (TLS 1.2/1.3)
- Selected Cipher Suite
- The server picks one of the cipher suites offered by the client
- E.g., TLS_RSA_WITH_AES_256_GCM_SHA384
- Selected Compression Method
- Extensions
```

## Cryptographic Foundations

### Key Types

#### Symmetric Encryption
- Uses the same key for encryption and decryption
- Example operation:
    ```Haskell
    (Master Secret)
    f(M,k) -> N
    f(N,k) -> M
    ```
- **Advantage**: Fast, efficient for large data
- **Disadvantage**: Requires secure key distribution

#### Asymmetric Encryption
- Uses key pairs: public key (encryption) and private key (decryption)
- Example operation:
    ```Haskell
    (Public-Private Key)
    f(M, priv) -> N
    f(N, priv) -> fail
    f(N, pub)  -> M

    f(O, pub)  -> P
    f(P, priv) -> O
    ```
- **Advantage**: Solves key distribution problem
- **Disadvantage**: Computationally expensive

### Example Usage of Keys

#### Symmetric Key Example
```Haskell
Server and Client Share Key:
Secret Key: ABCD

Client:
Generate M
Encrypt M with Secret Key
f(M, ABCD) -> N
Pass N to Server

Server:
f(N, ABCD) -> M
```

#### Asymmetric Key Example
```Haskell
Server:
Public: 1234
Private: <unknown>

Client:
Generate G
Encrypt G with Server.Public
f(G, pub) -> H
Pass H to Server

Server:
f(H, priv) -> G
```

### TLS Cipher Suites

A cipher suite is a combination of:
- Key exchange algorithm
- Authentication method
- Bulk encryption algorithm
- Message authentication code (MAC)

Example: `TLS_RSA_WITH_AES_256_GCM_SHA384`

| Component | Purpose | Examples |
|:----------|:--------|:---------|
| Key Exchange | Establishes shared secret | RSA, ECDHE |
| Authentication | Verifies identity | RSA, ECDSA |
| Bulk Encryption | Encrypts application data | AES, ChaCha20 |
| MAC Algorithm | Ensures message integrity | SHA256, SHA384 |

## TLS in Practice

### Wireshark Analysis

When analyzing TLS traffic in Wireshark:
- Handshake begins unencrypted (Client Hello visible)
- Both client and server start with unencrypted messages
- They exchange information that allows both sides to independently generate a **master secret**
- This master secret is calculated mathematically on both sides but **never transmitted over the wire**
- Full handshake visible but application data encrypted
- Can decode with private keys (in test environments only)

### Security Considerations

> Symmetric keys offer superior security because they're never transmitted publicly. In asymmetric systems, the public key creates an inherent vulnerability as with sufficient computational power, attackers could potentially derive the private key through mathematical analysis.

1. **Perfect Forward Secrecy**: Using ephemeral keys ensures past communications remain secure even if long-term keys are compromised
2. **Certificate Validation**: Critical for preventing man-in-the-middle attacks
3. **Cipher Selection**: Prioritize modern, secure cipher suites

## Related Protocols

- **HTTPS**: HTTP running over TLS (where S originally stood for SSL)
- **SSH**: Secure Shell - Similar security goals but different handshake process
- **DTLS**: Datagram TLS - Adapts TLS for UDP communications