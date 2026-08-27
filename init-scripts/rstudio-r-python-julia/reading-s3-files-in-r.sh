#!/usr/bin/env bash
set -euo pipefail

library(aws.s3)
# Example usage:
# my_file <- s3read_using(FUN = read.csv, object = 'path/to/file.csv', bucket = 'my-bucket')
print('S3 libraries loaded successfully')
