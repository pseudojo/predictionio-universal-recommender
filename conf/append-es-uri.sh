#!/bin/bash

echo " - Change directory : ${UR_HOME}"
cd ${UR_HOME}

for f in examples/handmade-engine*.json; do
  echo " - Append Elasticsearch URI on engine file : [ ${UR_HOME}/${f} ]..."
  sed -i '18 i\    "es.nodes": "elasticsearch:9200",' $f ;
  sed -i '19 i\    "es.port": "9200",' $f ;
done

