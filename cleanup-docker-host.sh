#!/bin/sh

echo "- Run garbage collection for docker volume"
yes | docker volume prune

echo "- Run garbage collection for docker system(unused images, networks, etc.)"
yes | docker system prune

echo "Done."

