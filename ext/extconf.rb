require 'mkmf'
	
dir_config('mysql')
have_header('mysql.h')
if not have_library('libmysql', 'mysql_query', 'mysql.h') then
	puts "Could not locate the 'mysql_query' function."
	exit 1
end

have_func('mysql_ssl_set')

newf = File::open('mysql.c', 'w')
IO::foreach('mysql.c.in') do |l|
	newf.puts l
end

create_makefile('mysql') 

