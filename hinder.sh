#!/bin/bash

dnctl -f flush

(cat /etc/pf.conf &&
  echo 'dummynet-anchor "throttle_bw"' &&
  echo 'anchor "throttle_bw"') | pfctl -q -f -

cat <<EOF | pfctl -q -a throttle_bw -f -
no dummynet quick on lo0 all
dummynet out inet proto tcp all pipe 1
dummynet out inet proto udp all pipe 1
dummynet out inet proto icmp all pipe 1
dummynet in inet proto icmp all pipe 2
dummynet in inet proto tcp all pipe 2
dummynet in inet proto udp all pipe 2
dummynet out inet6 proto tcp all pipe 1
dummynet out inet6 proto udp all pipe 1
dummynet out inet6 proto ipv6-icmp all pipe 1
dummynet in inet6 proto ipv6-icmp all pipe 2
dummynet in inet6 proto tcp all pipe 2
dummynet in inet6 proto udp all pipe 2
EOF

dnctl pipe 1 config bw 150Kbyte/s
dnctl pipe 2 config bw 512Kbyte/s

pfctl -E
