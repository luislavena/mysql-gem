# use rake-compiler for building the extension
require 'rake/extensiontask'

MYSQL_VERSION = "5.1.46"
MYSQL_MIRROR  = ENV['MYSQL_MIRROR'] || "http://mysql.localhost.net.ar"

Rake::ExtensionTask.new('mysql_api', HOE.spec) do |ext|
  # reference where the vendored MySQL got extracted
  mysql_lib = File.expand_path(File.join(File.dirname(__FILE__), '..', 'vendor', "mysql-#{MYSQL_VERSION}-win32"))

  # define target for extension (supporting fat binaries)
  if RUBY_PLATFORM =~ /mswin|mingw/ then
    ruby_ver = RUBY_VERSION.match(/(\d+\.\d+)/)[1]
    ext.lib_dir = "lib/#{ruby_ver}"
  end

  # automatically add build options to avoid need of manual input
  if RUBY_PLATFORM =~ /mswin|mingw/ then
    ext.config_options << "--with-mysql-include=#{mysql_lib}/include"
    ext.config_options << "--with-mysql-lib=#{mysql_lib}/lib/opt"
  else
    ext.cross_compile = true
    ext.cross_platform = ['i386-mingw32', 'i386-mswin32']
    ext.cross_config_options << "--with-mysql-include=#{mysql_lib}/include"
    ext.cross_config_options << "--with-mysql-lib=#{mysql_lib}/lib/opt"
    ext.cross_compiling do |gemspec|
      gemspec.post_install_message = <<-POST_INSTALL_MESSAGE

======================================================================================================

  You've installed the binary version of #{gemspec.name}.
  It was built using MySQL version #{MYSQL_VERSION}.
  It's recommended to use the exact same version to avoid potential issues.

  At the time of building this gem, the necessary DLL files where available
  in the following download:

  http://dev.mysql.com/get/Downloads/MySQL-#{MYSQL_VERSION[0,3]}/mysql-noinstall-#{MYSQL_VERSION}-win32.zip/from/pick

  You can put the lib\\opt\\libmysql.dll available in this package in your Ruby bin
  directory, for example C:\\Ruby\\bin

======================================================================================================

      POST_INSTALL_MESSAGE
    end
  end
end

# ensure things are compiled prior testing
task :test => [:compile]
