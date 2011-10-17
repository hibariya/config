#!/usr/bin/env ruby

STDOUT.sync = true
print `tail -3 /var/log/system.log`.strip.split(/\n/)[ARGV.first.to_i]
