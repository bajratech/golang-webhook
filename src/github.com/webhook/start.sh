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
       "backend") /root/run-cluster/kubernetes/cluster/kubectl.sh create -f /root/pods/backend-pod.yml
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
       "pgpool") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-pgpool
          ;;
       "nginx") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc nginx-controller
          ;;
       "sitemonitor") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc unicorn-rc
          ;;
       "backend") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-backend
          ;;
       "scheduler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-scheduler
          ;;
       "notification") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-notification
          ;;
       "headcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-head-crawl
          ;;
       "monitorcrawler") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-full-crawl
          ;;
       "yslow") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-yslow
          ;;
       "linting") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-deface
          ;;
       "deface") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-linting
          ;;
       "kafka") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc site-monitor-kafka
          ;;
       "redis-server") /root/run-cluster/kubernetes/cluster/kubectl.sh delete rc redis-rc
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


