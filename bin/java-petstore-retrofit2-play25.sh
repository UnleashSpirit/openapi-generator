#!/usr/bin/env bash

SCRIPT="$0"
echo "# START SCRIPT: $SCRIPT"

while [ -L "$SCRIPT" ] ; do
  ls=`ls -ld "$SCRIPT"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    SCRIPT="$link"
  else
    SCRIPT=`dirname "$SCRIPT"`/"$link"
  fi
done

if [ ! -d "${APP_DIR}" ]; then
  APP_DIR=`dirname "$SCRIPT"`/..
  APP_DIR=`cd "${APP_DIR}"; pwd`
fi

executable="./modules/openapi-generator-cli/target/openapi-generator-cli.jar"

if [ ! -f "$executable" ]
then
  mvn -B clean package
fi

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -Xmx1024M -DloggerPath=conf/log4j.properties"
ags="generate --artifact-id petstore-java-client-retrofit2-play25 -i modules/openapi-generator/src/test/resources/2_0/petstore-with-fake-endpoints-models-for-testing.yaml -g java -c bin/java-petstore-retrofit2-play25.json -o samples/client/petstore/java/retrofit2-play25 --additional-properties hideGenerationTimestamp=true $@"

echo "Removing files and folders under samples/client/petstore/java/retrofit2-play25/src/main"
rm -rf samples/client/petstore/java/retrofit2-play25/src/main
find samples/client/petstore/java/retrofit2-play25 -maxdepth 1 -type f ! -name "README.md" -exec rm {} +
java $JAVA_OPTS -jar $executable $ags
