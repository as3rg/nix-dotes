#!/bin/sh
free | awk '/^Mem:/{printf "%d\n", ($2 - $7) / $2 * 100}'
