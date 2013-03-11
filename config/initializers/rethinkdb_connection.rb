require 'nobrainer'

# Connection details for +NoBrainer+ to connect to a running RethinkDB instance.
# By default it connects to +localhost:28015+,
# but a different connection can be specified using +RDB_URL+ environment
# variable in the form: +rethinkdb://<host>:<port>/<db>+
NoBrainer.connect ENV['RDB_URL'] || 'rethinkdb://localhost:28015/blog'
