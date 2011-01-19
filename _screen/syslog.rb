#!/usr/bin/env ruby

STDOUT.sync = true
print `tail -1 /var/log/system.log`.strip

