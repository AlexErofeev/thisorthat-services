# thisorthat-services

Build docker container:
```
docker build -t thisorthat-test:latest .
```

Run container locally:
```
docker run -d -p 5000:5000  -e PORT=5000 thisorthat-test 
```
