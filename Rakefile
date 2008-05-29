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
  s.extra_rdoc_files  = %w[ README docs/README.html docs/COPYING ]
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
