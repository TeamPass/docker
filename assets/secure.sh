#!/bin/bash

if [ -e ${DUMPFILE} ];
then
  openssl enc -aes-256-cbc -salt -pbkdf2 -in ${DUMPFILE} -out ${DUMPFILE}.enc -k ${ENCKEY}
  mv ${DUMPFILE}.enc ${DUMPFILE}
  chmod 600 ${DUMPFILE}
else
  echo "ERROR: Backup file ${DUMPFILE} does not exist!"
fi
