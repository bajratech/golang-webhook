# golang-webhook

To run webhook server:-
1. RUN 'git pull origin staging' for staging server.
2. Export GOPATH=/root/golang-webhook/
2. RUN 'go build' from 'golang-webhook/src/github.com/bajratech/webhook' path.
3. RUN 'go install' from 'golang-webhook/src/github.com/bajratech/webhook' path.
4. Replace 'bin/start.sh' file with 'golang-webhook/src/github.com/bajratech/webhook/start.sh'
5. Kill './webhook' server if it is running.
5. RUN './webhook >> log.txt &'
