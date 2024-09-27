#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

#UT2004 tar.gz Download
if [ -e "UT2004.tar.gz" ]; then
    echo 'File already exists' >&2
else
    curl -o "UT2004.tar.gz" "https://www.googleapis.com/drive/v3/files/1Mog4UUAsjOjSinH2XNZAK-jkLYdfY1Tr?alt=media&key=GOOGLEAPIKEYHERE"
    tar -xzvf UT2004.tar.gz
fi

# Update UT2004 Server Permissions
chmod +x start.sh
chmod +x System/ucc-bin

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

