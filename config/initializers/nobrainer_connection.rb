require 'nobrainer'

puts 'nobrainer: connecting to RethinkDB...'

NoBrainer.connect ENV['RDB_URL'] || 'rethinkdb://localhost:28015/blog'
puts 'nobrainer: connected'
