# Hinder

Throttles your macOS network traffic on all interfaces so that you can:

# Features

 * Throttle your bandwidth
 * Unthrottle your bandwidth

# Usage

## Throttle

```
sudo ./hinder.sh
```

Or if you are a standard user and need to su to another user:

```
su admin -c 'sudo ./hinder.sh'
```

## Unthrottle

```
sudo ./unhinder.sh
```

Or if you are a standard user and need to su to another user:

```
su admin -c 'sudo ./unhinder.sh'
```

# What does it accomplish

 * Test things at slower speeds
 * Avoid clobbering your coworkers who use remote machines

# How does it work

Uses pfctl and dnctl to create two dummynet queues and shapes outgoing traffic
to one speed and inbound traffic to another.

Read the scripts to see how they work.
