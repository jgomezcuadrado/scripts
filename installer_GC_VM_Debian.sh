#Debian GNU/Linux 10 (buster)
cd /opt
sudo curl "https://dlcdn.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz" -o kafka.tgz 
sudo tar zxvf kafka.tgz
#------------ FLUME ---------
sudo curl "https://downloads.apache.org/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz" -o flume.tar.gz
sudo tar xzf flume.tar.gz
#-------------- NIFI ------------
sudo curl "https://archive.apache.org/dist/nifi/1.11.0/nifi-1.11.0-bin.tar.gz" -o nifi.tar.gz
sudo tar xzf nifi.tar.gz


#----- limpiar --------
sudo rm *gz
sudo mv apache-flume* flume
sudo mv kafka_* kafka
sudo mv nifi-* nifi


#--------------- JAVA y JUPYTERLAB-------------------------
cd 
sudo apt install default-jdk python3-pip python3-dev netcat -y
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade setuptools 
python3 -m pip install --upgrade wheel
python3 -m pip install --upgrade jupyterlab
export PATH="$HOME/.local/bin:$PATH"

jupyter lab --NotebookApp.token='' --no-browser --ip "*" --allow-root --NotebookApp.notebook_dir = '/'&
echo *** RECUERDA Abrir puertos 8888 (JUPYTERLAB) y 8080 (NIFI) ***
