 sudo chsh -s /bin/bash livy
 sudo ldconfig /usr/local/lib64
 aws s3 cp s3://standard-bootstrap-script/rl.pem .
 sudo chmod 400 rl.pem
 yarn node -list 2>/dev/null \
     | sed -n "s/^\(ip[^:]*\):.*/\1/p" \
     | xargs -t -I{} \
     ssh -i rl.pem -o StrictHostKeyChecking=no hadoop@{} \
     "sudo ldconfig /usr/local/lib64"
 sudo rm rl.pem