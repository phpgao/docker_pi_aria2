if [ ! -d /mnt/media/download/complete ]; then  
    mkdir -p /mnt/media/download/complete;
fi

touch /mnt/media/aria2.session
chmod +x /done.sh
usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf -D
/usr/sbin/nginx
