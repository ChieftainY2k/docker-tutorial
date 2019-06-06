#!/bin/bash

# run the simple PHP CLI process to act as a simple web interface
while sleep 3; do
    echo "Starting the API BAR server..."
    php -S 0.0.0.0:80 /api/apibar.php
done


