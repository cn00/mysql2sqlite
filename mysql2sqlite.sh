#!/usr/bin/env bash

thisdir=$(cd `dirname $0`;pwd)

echo $thisdir
# exit 1

db=$1
prefix="${db}-$(date "+%Y%m%d-%H%M%S")"
mysqldump -hcn -udark -p654123 ${db} \
    | tee ${prefix}.my.sql | ${thisdir}/mysql2sqlite - \
    | tee ${prefix}.lite.sql | sqlite3 "${prefix}.sqlite3"
