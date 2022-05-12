#! /bin/bash

###STAGE 1 - GIT CLONE###
echo "STAGE 1: GIT CLONE"
git clone https://github.com/knadt/somethingrandom.git /tmp/buzz

###STAGE 2 - BUILD###
echo "STAGE 2: BUILD"
pip3 install -r /tmp/buzz/requirements.txt

###STAGE 3 - TESTS###
echo "STAGE 3: TESTS"
python3 -m pytest -v /tmp/buzz/tests/test_generator.py > /tmp/buzz/test-artifact.txt 
cat -n /tmp/buzz/test-artifact.txt

###STAGE 4 - SECURITY###
echo "STAGE 4: Security"
if docker run --network=host \
    --rm \
    -e SONAR_HOST_URL="http://0.0.0.0:9000" \
    -e SONAR_LOGIN=${SONAR_TOKEN} \
    -v "/tmp/buzz/:/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.qualitygate.wait=true \
    -Dsonar.projectKey=buzz-project -Dsonar.sources=/usr/src -X ; then
    echo "STAGE 4 PASSED"
else
    echo "STAGE 4 FAILED"
    exit 1
fi
###STAGE 5 - DEPLOY###
echo "STAGE 5: Deploy"
docker build -t buzz .         
docker run -p 5000:5000 --rm -it buzz

