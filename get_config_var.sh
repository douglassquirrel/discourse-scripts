set -e
set -x

CONFIG_FILE=~/discourse.cfg

awk -v target="$1" '{if ($1==target) print $2}' $CONFIG_FILE
