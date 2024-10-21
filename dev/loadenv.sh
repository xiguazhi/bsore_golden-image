terraform init#!/bin/bash
cat $1 | while read line; do
  export $line
done