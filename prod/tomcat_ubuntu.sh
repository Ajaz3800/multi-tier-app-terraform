#!/bin/bash

DB_USERNAME=$(aws ssm get-parameter \
  --name "/prod/db/username" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

DB_PASSWORD=$(aws ssm get-parameter \
  --name "/prod/db/password" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

export DB_USERNAME DB_PASSWORD

RABBITMQ_USERNAME=$(aws ssm get-parameter \
  --name "/prod/rabbitmq/username" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

RABBITMQ_PASSWORD=$(aws ssm get-parameter \
  --name "/prod/rabbitmq/password" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

export RABBITMQ_USERNAME RABBITMQ_PASSWORD 

ADMIN_USERNAME=$(aws ssm get-parameter \
  --name "/prod/admin/username" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

ADMIN_PASSWORD=$(aws ssm get-parameter \
  --name "/prod/admin/password" \
  --with-decryption \
  --query Parameter.Value \
  --output text)

export ADMIN_USERNAME ADMIN_PASSWORD    
