# use rake-compiler for building the extension
require 'rake/extensiontask'

MYSQL_VERSION = "5.0.83"
MYSQL_MIRROR  = ENV['MYSQL_MIRROR'] || "http://mysql.localhost.net.ar"

Rake::ExtensionTask.new('mysql_api', HOE.spec) do |ext|
end

# ensure things are compiled prior testing
task :test => [:compile]
