#!/bin/bash
yum install -y python-pip
pip install docker-compose
pip install -U setuptools
pip install backports.ssl_match_hostname --upgrade
pip install --upgrade pip
# yum upgrade python*
