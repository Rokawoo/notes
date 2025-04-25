   # Certificate Authorities (CAs)
   
   ## Trust Model
   - CAs form the foundation of TLS/SSL security
   - CAs form hierarchical trust chains of arbitrary length
     ```Haskell
     CA = Certificate Authority
     
           Root CA
          /   |   \\
       CA1   CA2   CA3
       /      |      \\
     CA1.1   CA2.1   CA3.1
       |       |       |
     Certs   Certs   Certs
     ```
   - Trusting one CA in chain enables trusting all certificates it validates
   
   ## Authentication Process
   - CAs verify and certify server identities
   - CA digitally signs certificates using its private key
   - Signatures can be verified with CA's public key
   - Digital signatures confirm certificate authenticity
   
   ## CA Hierarchy
   - Root CAs: Self-signed certificates at top of trust chain
   - Intermediate CAs: Certified by root CAs
   - End-entity certificates: Issued to servers/services
   
   ## Asymmetric Key Application
   ```haskell
   # CA:
   Signs certificate with private key
   
   # Client:
   Verifies certificate using CA's public key
   Trusts server if certificate valid and trusted
   ```
   
   ## Browser Integration
   - Browsers maintain list of trusted root CAs
   - Operating systems also maintain trusted CA stores
   - Valid certificate confirms:
     - Server identity
     - CA identity
     - Certificate validity period
     - Certificate hasn't been revoked