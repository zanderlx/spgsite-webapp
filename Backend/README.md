# spgsite-webapp backend

## Project virtual environment setup
```
$ python3 -m venv env
```

### Activate virtual environment
```
$ source env/bin/activate
```

### Install requirements
```
(env) $ pip install -r requirements.txt
```

### Set "debug = True" to reload local changes
```
(env) $ sudo vi app.py
app.run(debug=True)
```

### Run local instance of Flask app
```
(env) $ python app.py
```

### Deactivate virtual environment
```
(env) $ deactivate
```