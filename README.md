# Sparkoscope Docker

Sparkoscope Docker image. Starts a one-node hdfs cluster, starts Sparkoscope and gives bash shell to the user to
execute the spark examples.

Run it by giving:
```
docker run --rm -it -p 4040:4040 -p 8080:8080 -p 18080:18080 -p 8888:8888 yiannisgkoufas/sparkoscope
```
Then once on the bash shell give:
```
bin/run-example SparkPi 10000
```

Check [http://localhost:8080](http://localhost:8080) and [http://localhost:18080](http://localhost:18080) on your host for Spark Master and History Server respectively

Inspired by [gettyimages/docker-spark](https://github.com/gettyimages/docker-spark) and
[sequenceiq/hadoop-docker](https://github.com/sequenceiq/hadoop-docker)
