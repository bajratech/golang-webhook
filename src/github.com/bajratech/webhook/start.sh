#!/bin/sh

echo "Script Started."

option="${1}"
value="${2}"

StartPod(){
    echo "Starting pod..."

    case ${value} in
       "pgpool") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/pool-pod.yml
          ;;
       "nginx") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/nginx-pod.yml
          ;;
       "sitemonitor") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/unicorn-pod.yml
          ;;
       "backend") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/bossman-pod.yml
          ;;
       "scheduler") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/scheduler-pod.yml
          ;;
       "notification") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/narad-pod.yml
          ;;
       "headcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/head-crawl-pod.yml
          ;;
       "monitorcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/full-crawl-pod.yml
          ;;
       "yslow") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/yslow-pod.yml
          ;;
       "linting") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/lint-pod.yml
          ;;
       "deface") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/deface-pod.yml
          ;;
       "kafka") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/kafka-pod.yml
          ;;
       "redis-server") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/redis-pod.yml
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 1 # Command to come out of the program with status 1
          ;;
    esac

}

deletePod(){
    echo "deleteping pod..."

    case ${value} in
       "pgpool") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-pgpool
          ;;
       "nginx") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-nginx
          ;;
       "sitemonitor") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-unicorn
          ;;
       "backend") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-bossman
          ;;
       "scheduler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-scheduler
          ;;
       "notification") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-narad
          ;;
       "headcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-head-crawl
          ;;
       "monitorcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-full-crawl
          ;;
       "yslow") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-yslow
          ;;
       "linting") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-lint
          ;;
       "deface") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-deface
          ;;
       "kafka") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-kafka
          ;;
       "redis-server") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-granny-redis
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 1 # Command to come out of the program with status 1
          ;;
    esac

    #Start Pod
    StartPod
}

case ${option} in
   -n) deletePod
      ;;
   *)
      echo "`basename ${0}`:usage: [-n name]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac


