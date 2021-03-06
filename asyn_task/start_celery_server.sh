#!/bin/bash

process_expand=$(ps -ef | grep -e 'celeryd' -e "celery flower" | grep -v 'grep' | awk '{print $2}')
if [ "x$process_expand" != "x" ]; then
  echo $process_expand | xargs kill -9
  echo "celery task is stopped"
fi
cd /Users/lishiwei/Workspace/private_python
celery worker -A asyn_task.celery_main -l info --concurrency=4 &
#celery flower --broker=redis://127.0.0.1:6379/0
echo "celery start"
