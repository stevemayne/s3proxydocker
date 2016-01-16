s3proxydocker
=============

Dockerfile to create a local filesystem s3proxy environment using on Andrew Gaul's fantastic 
s3proxy project, which can be used to emulate an s3 storage-system environment for testing purposes.

Usage
=====

The default running mode allows anonymous access:
<pre><code>docker run -d -P stevemayne/s3proxy</code></pre>

If AWS-like authentication is required, specify an ACCESS_KEY and a SECRET_KEY:
<pre><code>docker run -d -P -e "ACCESS_KEY=access" -e "SECRET_KEY=secret" stevemayne/s3proxy</code></pre>
