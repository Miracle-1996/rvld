#/bin/bash
pid=$(ps -aux | grep "./ld" | sed -n '1p' | awk '{print $2}')
dlv attach ${pid} --headless --listen=:2345 --api-version=2 --log