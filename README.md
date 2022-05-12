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
2. Login into Sonarqube ([SonarQube homepage: http://localhost:9000/](http://localhost:9000/))

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

## Stage 4
1. Add vulnerable code to the aplication
2. Open `app.py` in any code editor and paste the below code into the file.
```
def configure_app(app):
    app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://user:@domain.com" # Noncompliant
```
3. Re-run the pipeline
```
./pipeline.sh
```
4. View that the pipeline fails
<img width="918" alt="Screenshot 2022-05-12 at 17 23 25" src="https://user-images.githubusercontent.com/16526578/168122939-2499911e-cd30-4e28-8c41-2c4ba5797642.png">
