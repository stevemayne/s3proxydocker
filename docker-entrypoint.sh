#!/bin/bash
set -e

if [ "$1" = "s3proxy" ]; then
	if [ ! -f $S3PROXY_CONFIG ]; then
		cp /etc/s3proxy.conf.base $S3PROXY_CONFIG
		if [ ! -n "$SECRET_KEY" ]; then
			echo "s3proxy.authorization=none" >> $S3PROXY_CONFIG
		else
			echo "s3proxy.authorization=aws-v2" >> $S3PROXY_CONFIG
			echo "s3proxy.identity=$ACCESS_KEY" >> $S3PROXY_CONFIG
			echo "s3proxy.credential=$SECRET_KEY" >> $S3PROXY_CONFIG
		fi
		echo "jclouds.filesystem.basedir=$FILE_STORE" >> $S3PROXY_CONFIG
	fi
    s3proxy --properties $S3PROXY_CONFIG
else
	exec "$@"
fi
