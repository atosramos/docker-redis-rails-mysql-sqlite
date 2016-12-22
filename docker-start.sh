#!/bin/bash
set -e
service mysql start
cd /app/job_board
bundle install 
rails s -b 0.0.0.0

exec "$@"

