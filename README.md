# Docker Spark

## Usage

```bash
# master
docker run -d -ti -p 6066:6066 -p 7077:7077 -p 8080:8080 --name spark-master esnunes/spark:1.6.2 master.sh

# slave
docker run -d -ti --link spark-master:spark-master esnunes/spark:1.6.2 slave.sh
```
