#!/bin/sh

echo "Script Started."

option="${1}"
value="${2}"

StartPod(){
    echo "Starting pod..."

    case ${value} in
       "pgpool") kubectl create -f /root/pods/pool-pod.yml
          ;;
       "nginx") kubectl create -f /root/pods/nginx-pod.yml
          ;;
       "sitemonitor") kubectl create -f /root/pods/unicorn-pod.yml
          ;;
       "backend") kubectl create -f /root/pods/backend-pod.yml
          ;;
       "scheduler") kubectl create -f /root/pods/scheduler-pod.yml
          ;;
       "notification") kubectl create -f /root/pods/narad-pod.yml
          ;;
       "headcrawler") kubectl create -f /root/pods/head-crawl-pod.yml
          ;;
       "monitorcrawler") kubectl create -f /root/pods/full-crawl-pod.yml
          ;;
       "yslow") kubectl create -f /root/pods/yslow-pod.yml
          ;;
       "linting") kubectl create -f /root/pods/lint-pod.yml
          ;;
       "deface") kubectl create -f /root/pods/deface-pod.yml
          ;;
       "kafka") kubectl create -f /root/pods/kafka-pod.yml
          ;;
       "redis-server") kubectl create -f /root/pods/redis-pod.yml
          ;;
       "angular") kubectl create -f /root/pods/angular-pod.yml
          ;;
       "pagerank") kubectl create -f /root/pods/pagerank-pod.yml
          ;;
       "rupaiya") kubectl create -f /root/pods/rupaiya-pod.yml
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
       "pgpool") kubectl delete rc site-monitor-pgpool
          ;;
       "nginx") kubectl delete rc nginx-controller
          ;;
       "sitemonitor") kubectl delete rc unicorn-rc
          ;;
       "backend") kubectl delete rc site-monitor-backend
          ;;
       "scheduler") kubectl delete rc site-monitor-scheduler
          ;;
       "notification") kubectl delete rc site-monitor-notification
          ;;
       "headcrawler") kubectl delete rc site-monitor-head-crawl
          ;;
       "monitorcrawler") kubectl delete rc site-monitor-full-crawl
          ;;
       "yslow") kubectl delete rc site-monitor-yslow
          ;;
       "linting") kubectl delete rc site-monitor-linting
          ;;
       "deface") kubectl delete rc site-monitor-deface
          ;;
       "kafka") kubectl delete rc site-monitor-kafka
          ;;
       "redis-server") kubectl delete rc redis-rc
          ;;
       "angular") kubectl delete rc site-granny-angular
          ;;
       "pagerank") kubectl delete rc site-granny-pagerank
          ;;
       "rupaiya") kubectl delete rc site-monitor-rupaiya
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 0 # Command to come out of the program with status 1
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

