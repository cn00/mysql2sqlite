#!/usr/bin/env bash

thisdir=$(cd `dirname $0`;pwd)

echo $thisdir
# exit 1

db=$1

rm "${db}.sqlite3"
mysqldump -hcn -udark -p654123 ${db} \
    | tee ${db}.my.sql | ${thisdir}/mysql2sqlite - \
    | tee ${db}.lite.sql | sqlite3 ${db}.sqlite3
