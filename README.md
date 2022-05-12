# somethingrandom

## Stage 1

This will clone the code within this repo to your local machine
```
git clone https://github.com/knadt/somethingrandom.git
cd somethingrandom
```

## Stage 2
1. Run docker-compose to get SonarQube Communnity version installed and working
```
docker-compose up -d
```
2. Login into Sonarqube ([SonarQube homepage](http://localhost:9000/))

Credentials:
```
username = admin
password = admin
```

3. After logging, you will be prompted to change the default crednetials. Please set a password.
4. Create an API key.
You can generate new tokens at User > My Account > Security ([Account page](http://localhost:9000/account/security/))

The form at the bottom of the page allows you to generate new tokens. Once you click the Generate button, you will see the token value. Copy it immediately; once you dismiss the notification you will not be able to retrieve it.

5. Add the SonarQube TOKEN as an environmental variable
```
export SONAR_TOKEN=XXY
```
where XXY is the Token copied.

## Stage 3

1. give the pipeline bash screen executable permissions
```
chmod +x pipeline.sh
```
2. Run the pipeline
```
./pipeline.sh
```
3. View the console output and see the SonarQube project [here: http://localhost:9000/dashboard?id=buzz-project](http://localhost:9000/dashboard?id=buzz-project)
4. View the running application [here: http://0.0.0.0:5000/](http://0.0.0.0:5000/)
