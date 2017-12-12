#!/bin/sh

echo "Script Started."

option="${1}"
value="${2}"

StartPod(){
    echo "Starting pod..."

    case ${value} in
       "pgpool") kubectl create -f /root/deployment/pods/pool-pod.yml
          ;;
       "nginx") kubectl create -f /root/deployment/pods/nginx-pod.yml
          ;;
       "sitemonitor") kubectl create -f /root/deployment/pods/unicorn-pod.yml
          ;;
       "backend") kubectl create -f /root/deployment/pods/bossman-pod.yml
          ;;
       "scheduler") kubectl create -f /root/deployment/pods/scheduler-pod.yml
          ;;
       "notification") kubectl create -f /root/deployment/pods/narad-pod.yml
          ;;
       "headcrawler") kubectl create -f /root/deployment/pods/head-crawl-pod.yml
          ;;
       "monitorcrawler") kubectl create -f /root/deployment/pods/full-crawl-pod.yml
          ;;
       "yslow") kubectl create -f /root/deployment/pods/yslow-pod.yml
          ;;
       "linting") kubectl create -f /root/deployment/pods/lint-pod.yml
          ;;
       "deface") kubectl create -f /root/deployment/pods/deface-pod.yml
          ;;
       "kafka") kubectl create -f /root/deployment/pods/kafka-pod.yml
          ;;
       "redis-server") kubectl create -f /root/deployment/pods/redis-pod.yml
          ;;
       "angular") kubectl create -f /root/deployment/pods/angular-pod.yml
          ;;
       "pagerank") kubectl create -f /root/deployment/pods/pagerank-pod.yml
          ;;
       "rupaiya") kubectl create -f /root/deployment/pods/rupaiya-pod.yml
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 0 # Command to come out of the program with status 1
          ;;
    esac

}

deletePod(){
    echo "Deleting pod..."

    case ${value} in
       "pgpool") kubectl delete rc site-granny-pgpool
          ;;
       "nginx") kubectl delete rc site-granny-nginx
          ;;
       "sitemonitor") kubectl delete rc site-granny-unicorn
          ;;
       "backend") kubectl delete rc site-granny-bossman
          ;;
       "scheduler") kubectl delete rc site-granny-scheduler
          ;;
       "notification") kubectl delete rc site-granny-narad
          ;;
       "headcrawler") kubectl delete rc site-granny-head-crawl
          ;;
       "monitorcrawler") kubectl delete rc site-granny-full-crawl
          ;;
       "yslow") kubectl delete rc site-granny-yslow
          ;;
       "linting") kubectl delete rc site-granny-lint
          ;;
       "deface") kubectl delete rc site-granny-deface
          ;;
       "kafka") kubectl delete rc site-granny-kafka
          ;;
       "redis-server") kubectl delete rc site-granny-redis
          ;;
       "angular") kubectl delete rc site-granny-angular
          ;;
       "pagerank") kubectl delete rc site-granny-pagerank
          ;;
       "rupaiya") kubectl delete rc site-granny-rupaiya
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
      exit 0 # Command to come out of the program with status 1
      ;;
esac


