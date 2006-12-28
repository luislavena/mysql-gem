require 'rake'
require 'rubygems'
require 'rake/clean'
require 'fileutils'
#require 'date'
include FileUtils

CLEAN.include ["ext/*.{log,c,so,obj,pdb,lib,def,exp,manifest,orig}", "ext/Makefile", "*.gem"]

name="mysql"
version="2.7.3"

desc "Do everything, baby!"
task :default => [:package]

task :package => [:clean,:compile,:makegem]

desc "Compiles all extensions"
task :compile do
  cp 'ext/mysql.c.in', 'ext/mysql.c.in.orig'
  sh %{ patch -p0 ext/mysql.c.in < ext/mysql.c.in.patch }
  cd "ext" do
    sh %{ ruby extconf.rb --with-mysql-include=C:/Progra~1/MySQL/MySQLS~1.0/include --with-mysql-lib=C:/Progra~1/MySQL/MySQLS~1.0/lib/opt }
    sh %{ nmake }
	mv 'mysql.c.in.orig', 'mysql.c.in', :force => true
  end
end

desc "Build a binary gem for Win32"
task :makegem do
  spec = Gem::Specification.new do |s|
	s.name = %{#{name}}
	s.version = %{#{version}}
    s.author = "Kevin Williams"
    s.email = "kevin@bantamtech.com"
    s.homepage="http://mysql-win.rubyforge.org"
    s.summary = "A win32-native build of the MySQL API module for Ruby."
    s.description = s.summary
    s.rubyforge_project = s.name
    s.files += %w(docs ext/mysql.so ext/extconf.rb ext/mysql.c.in ext/mysql.c.in.patch ext/test.rb README Rakefile)
	s.rdoc_options << '--exclude' << 'ext' << '--main' << 'README'
	s.extra_rdoc_files = ["README", "docs/README.html"]
	s.has_rdoc = true
	s.require_path = 'ext'
	s.autorequire = 'mysql'
    s.required_ruby_version = '>= 1.8.2'
    s.platform = Gem::Platform::WIN32
  end

  Gem::manage_gems
  Gem::Builder.new(spec).build
end

