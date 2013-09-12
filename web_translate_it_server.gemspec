# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "web_translate_it_server" 
  s.version     = "0.0.5"
  s.summary     = "Synchonization server for WebTranslateIt.com."
  s.description = "A manual synchronization interface for WebTranslateIt.com."
  s.email       = "edouard@atelierconvivialite.com"
  s.homepage    = "https://webtranslateit.com"
  s.authors     = "Edouard Briere"
 
  s.files       = Dir["history.md", "license", "readme.md", "lib/**/*", "bin/**/*"]
    
  s.add_dependency "web_translate_it", ">= 1.9"
  s.add_dependency "trollop", ">= 1.16.2"
  s.add_dependency "sinatra", ">= 1.3.1"
  
  s.has_rdoc         = true
  s.rdoc_options     = ["--main", "readme.md"]
  s.extra_rdoc_files = ["history.md", "readme.md"]
  
  s.license = 'MIT'

  s.require_path       = 'lib'
  s.bindir             = 'bin'
  s.executables        = 'wti-server'
  s.default_executable = 'wti-server'
end
