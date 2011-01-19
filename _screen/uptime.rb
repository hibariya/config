#!/usr/bin/env ruby

STDOUT.sync = true
uptime = `uptime`.scan(/(up\s[^\n]+)/).join(', ')
print "\005{=r kg}#{uptime}\005{= dd}"
#print "\005{=r kr}foo\005{=r kY}foo\005{=r ky}foo\005{=r kb}foo\005{=r kg}foo\005{= dd}"

