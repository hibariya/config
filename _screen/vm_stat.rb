#!/usr/bin/env ruby

STDOUT.sync = true
vm_stat = `vm_stat`.split(/\n/)[1...-1].map{|l| l.gsub(/(Pages\s?|")/i, '').split(/:/).map{|s| s.strip } }
results = Hash[vm_stat]
print "\005{=r kb}free: #{results['free']} active: #{results['active']} inactive: #{results['inactive']}\005{= dd}"

#print "\005{=r kg}#{uptime}\005{= dd}"
#print "\005{=r kr}foo\005{=r kY}foo\005{=r ky}foo\005{=r kb}foo\005{=r kg}foo\005{= dd}"


