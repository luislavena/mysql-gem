require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'ext_helper'

# House-keeping
CLEAN.include '**/*.o', '**/*.so', '**/*.bundle', '**/*.a',
  '**/*.log', '{ext,lib}/*.{bundle,so,obj,pdb,lib,def,exp}',
  'ext/Makefile', 'ext/mysql.c'

spec = Gem::Specification.new do |s|
  s.name              = 'mysql'
  s.version           = '2.7.3'
  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = true
  s.rdoc_options      << '--exclude' << 'ext' << '--main' << 'README'
  s.extra_rdoc_files  = %w[ README docs/README.html COPYING ]
  s.summary           = 'A win32-native build of the MySQL API module for Ruby.'
  s.description       = s.summary
  s.author            = 'Kevin Williams'
  s.email             = 'kevin@bantamtech.com'
  s.homepage          = 'http://mysql-win.rubyforge.org'
  s.rubyforge_project = 'http://rubyforge.org/projects/mysql-win'
  s.require_path      = 'lib'
  s.extensions        = %w[ ext/extconf.rb ]
  s.files             = FileList[ 'ext/**/*.{rb,in}', 'Rakefile', *s.extra_rdoc_files ]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

# Use of ext_helper to properly setup compile tasks and native gem generation
setup_extension spec.name, spec

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

