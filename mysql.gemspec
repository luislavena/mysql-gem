--- !ruby/object:Gem::Specification 
name: mysql
version: !ruby/object:Gem::Version 
  version: 2.8.1.1
platform: ruby
authors: 
- TOMITA Masahiro
autorequire: 
bindir: bin
cert_chain: []

date: 2009-08-21 00:00:00 -03:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: rake-compiler
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ~>
      - !ruby/object:Gem::Version 
        version: "0.5"
    version: 
- !ruby/object:Gem::Dependency 
  name: hoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 2.3.3
    version: 
description: |-
  This is the MySQL API module for Ruby. It provides the same functions for Ruby
  programs that the MySQL C API provides for C programs.
  
  This is a conversion of tmtm's original extension into a proper RubyGems.
email: 
- tommy@tmtm.org
executables: []

extensions: 
- ext/mysql_api/extconf.rb
extra_rdoc_files: 
- History.txt
- Manifest.txt
- README.txt
files: 
- COPYING
- COPYING.ja
- History.txt
- Manifest.txt
- README.txt
- Rakefile
- ext/mysql_api/extconf.rb
- ext/mysql_api/mysql.c
- extra/README.html
- extra/README_ja.html
- extra/tommy.css
- lib/mysql.rb
- tasks/gem.rake
- tasks/native.rake
- tasks/vendor_mysql.rake
- test/test_mysql.rb
has_rdoc: true
homepage: http://mysql-win.rubyforge.org
licenses: []

post_install_message: 
rdoc_options: 
- --main
- README.txt
require_paths: 
- lib
- ext
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: 1.8.6
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: mysql-win
rubygems_version: 1.3.4
signing_key: 
specification_version: 3
summary: This is the MySQL API module for Ruby
test_files: 
- test/test_mysql.rb
