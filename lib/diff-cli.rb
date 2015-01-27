#!/usr/bin/env ruby

require 'ripl'
require 'progress_bar'
require 'rainbow'
require 'rainbow/ext/string'
require 'highline/import'
require 'terminal-table'

files_current = `find /`.split("\n")
puts "FILES: ".color(:green) + "#{files_current.size}".bright
proceed = ask("List all files [ynx]? "){|q| q.validate  = /\A[ynx]\Z/}
(puts files_current) if proceed=="y"
puts "Leave console running and then proceed to generate file system diff"
proceed = ask("Generate diff [ynx]? "){|q| q.validate  = /\A[ynx]\Z/}
begin
  file_next = `find /`.split("\n")
  diff = file_next - files_current
  puts diff
end if proceed=="y"