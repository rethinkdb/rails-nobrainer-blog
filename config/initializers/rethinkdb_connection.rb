require 'nobrainer'

# Connection initialized for +NoBrainer+. By default
# it connects to +localhost:28015+, but the RethinkDB
# instance can be specified using +RDB_URL+ environment
# variable in the form: +rethinkdb://<host>:<port>/<db>+
NoBrainer.connect ENV['RDB_URL'] || 'rethinkdb://localhost:28015/blog'
