## codercom/code-server

pip install with `--break-system-packages` flag

```
pip install --break-system-packages --user pip-hello-world
```

```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

```
pip install --break-system-packages --user --upgrade pip setuptools wheel
pip install --break-system-packages --user kotak-neo-api/
pip install --break-system-packages --user pyngrok nest_asyncio fastapi uvicorn loguru
```

```
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo apt-get install -y mongodb-org
rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```

```
sudo mkdir -p /data/db

sudo chmod 777 /data/db

mongod
```

```
mongosh kotak --eval "db.dropDatabase()"
```

### Install MongoDB GUI
```
npm install -g mongoku
```

### Run from your current terminal
```
mongoku start
```

```
sudo npm i -g mongo-gui
```

```
pip install pyngrok nest_asyncio fastapi uvicorn loguru
```

`
Error: Connection to remote host was lost.
Connection to remote host was lost.
Connection closed
Error: on_close() missing 1 required positional argument: 'message'
on_close() missing 1 required positional argument: 'message'
`
