###How to Issue a New SSL Certificate

Example domain: `third-site.kitten.local`

### 1. Generate a private key

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out third-site.key
chmod 600 third-site.key
```

### 2. Generate a Certificate Signing Request (CSR)

```bash
openssl req -new -key third-site.key -out third-site.csr -subj "/C=PL/O=Kitten's Firm/CN=third-site.kitten.local"
```

### 3. Create the certificate extensions file 

`third-site-ext.cnf`

```text
basicConstraints = critical, CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = DNS:third-site.kitten.local
```

### 4. Sign the certificate using the Intermediate CA

```bash
openssl x509 -req -in third-site.csr -CA kitten-intermediate-ca.crt -CAkey kitten-intermediate-ca.key -CAcreateserial -out third-site.crt -days 365 -sha256 -extfile third-site-ext.cnf
```

### 5. Create the full certificate chain

```bash
cat third-site.crt kitten-intermediate-ca.crt > third-site-fullchain.pem
```

The full chain contains the server certificate followed by the Intermediate CA certificate.

### 6. Verify the certificate

```bash
openssl verify -CAfile kitten-root-ca.crt -untrusted kitten-intermediate-ca.crt third-site.crt
```

Expected output:

```text
third-site.crt: OK
```

### Important Notes

- Replace `third-site` with the required domain name when issuing another certificate.
