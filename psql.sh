#!/bin/bash

PORT="5432"
USER=`whoami`
DBNAME="%"
FILE=""

usage() {
    echo "Usage: $0 [-d <dbname> -U <user> -p <port>]"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

while getopts "d:f:p:uU:" OPT;
do case "${OPT}" in
      d) DBNAME=$OPTARG
     ;;
      f) FILE=$OPTARG
     ;;
      h) usage
      ;;
      p) PORT="-p $OPTARG"
     ;;
      U) USER="-U $OPTARG"
     ;;
      u) usage
     ;;
    [?]) usage
   esac;
done

if [ "$DBNAME" = "" ]
  then
    usage
    exit 1
fi

/usr/bin/psql -p $PORT -U $USER $DBNAME -c $FILE
