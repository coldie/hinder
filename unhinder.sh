#!/bin/bash

dnctl -f flush

(cat /etc/pf.conf) | pfctl -q -f -

