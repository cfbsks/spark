#!/bin/bash

# Download the file using wget
wget https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz

# Calculate the SHA-512 checksum of the downloaded file
checksum=$(sha512sum spark-3.3.1-bin-hadoop3.tgz | awk '{print $1}')

# Compare the calculated checksum with the expected checksum
if [ "$checksum" = "769db39a560a95fd88b58ed3e9e7d1e92fb68ee406689fb4d30c033cb5911e05c1942dcc70e5ec4585df84e80aabbc272b9386a208debda89522efff1335c8ff" ]; then
  echo "Checksum match. The file was downloaded successfully."
else
  echo "Checksum mismatch. The file may be corrupted."
fi

# Extract the downloaded file
tar -xzf spark-3.3.1-bin-hadoop3.tgz
rm spark-3.3.1-bin-hadoop3.tgz

# Move the extracted directory to /usr/local/ and rename it to spark
mv spark-3.3.1-bin-hadoop3 /usr/local/spark

# Add the path to the SPARK_HOME JAVA_HOME environment variable
echo 'export SPARK_HOME="/usr/local/spark"' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk"' >> ~/.bashrc
source ~/.bashrc
