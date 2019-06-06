#!/bin/bash

# run the simple PHP CLI process to act as a simple web interface
while sleep 3; do
    echo "Starting the API FOO server..."
    php -S 0.0.0.0:80 /apifoo.php
done


