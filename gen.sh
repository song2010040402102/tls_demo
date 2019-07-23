#!/bin/bash
#生成自己的CA秘钥及证书  
openssl genrsa -out ca.key 2048  
openssl req -x509 -new -nodes -key ca.key -subj "/CN=songxu" -days 5000 -out ca.crt
#生成服务端秘钥及用CA来签发其证书  
openssl genrsa -out server.key 2048  
openssl req -new -key server.key -subj "/CN=localhost" -out server.csr  
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 5000
#生成客户端秘钥及用CA来签发其证书  
openssl genrsa -out client.key 2048  
openssl req -new -key server.key -subj "/CN=localhost" -out client.csr  
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 5000
