# use rake-compiler for building the extension
require 'rake/extensiontask'

Rake::ExtensionTask.new('mysql_api', HOE.spec) do |ext|
end

# ensure things are compiled prior testing
task :test => [:compile]
