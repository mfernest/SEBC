#!/bin/sh
# Confirm the path values given below correspond to your installation

HADOOP_MR=/mnt/opt/cloudera/parcels/CDH-5.6.0-1.cdh5.6.0.p0.45/jars
HADOOP_PATH=/mnt/opt/cloudera/parcels/CDH/bin

# Mark start of the loop
echo Testing loop started on `date`

# Mapper containers
for i in 8 10
do
   # Reducer containers
   for j in 8 10
   do         
      # Container memory
      for k in 1024 1536
      do
         # Set mapper JVM heap
         MAP_MB=`echo "($k*0.8)/1" | bc`

         # Set reducer JVM heap
         RED_MB=`echo "($k*0.8)/1" | bc`
         
         echo "mapreduce.job.maps:" $i
         echo "mapreduce.job.reduces:" $j
         echo "mapreduce.map.memory.mb:" $k
         echo "mapreduce.map.java.opts.max.heap:" $MAP_MB
         echo "mapreduce.reduce.memory.mb:" $k
         echo "mapreduce.reduce.java.opts.max.heap:" $RED_MB
         
         time $HADOOP_PATH/hadoop jar $HADOOP_MR/hadoop-examples.jar teragen \
                     -Dmapreduce.job.maps=$i \
                     -Dmapreduce.map.memory.mb=$k \
                     -Dmapreduce.map.java.opts.max.heap=$MAP_MB \
                     100000000 /results/tg-10GB-${i}-${j}-${k} 1>tera_${i}_${j}_${k}.out 2>tera_${i}_${j}_${k}.err

         time $HADOOP_PATH/hadoop jar $HADOOP_MR/hadoop-examples.jar terasort \
                     -Dmapreduce.job.maps=$i \
                     -Dmapreduce.job.reduces=$j \
                     -Dmapreduce.map.memory.mb=$k \
                     -Dmapreduce.map.java.opts.max.heap=$MAP_MB \
                     -Dmapreduce.reduce.memory.mb=$k \
                     -Dmapreduce.reduce.java.opts.max.heap=$RED_MB \
                     /results/tg-10GB-${i}-${j}-${k} \
                    /results/ts-10GB-${i}-${j}-${k} \
                    1>>tera_${i}_${j}_${k}.out 2>>tera_${i}_${j}_${k}.err                         

          $HADOOP_PATH/hadoop fs -rmr -skipTrash /results/tg-10GB-${i}-${j}-${k}
          $HADOOP_PATH/hadoop fs -rmr -skipTrash /results/ts-10GB-${i}-${j}-${k}
      done
   done
done

echo Testing loop ended on `date`
