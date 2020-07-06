#!/bin/bash

echo "Hello World" > /home/hello.txt
curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/my-metadata -H "Metadata-Flavor: Google" >> /home/hello.txt
