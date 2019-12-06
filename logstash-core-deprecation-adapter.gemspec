Gem::Specification.new do |s|

  s.name            = 'logstash-core-deprecation-adapter'
  s.version         = '0.1.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "Deprecation logger adapter gem"
  s.description     = "This gem is a Logstash gem required by Logstash plugins to use deprecation logging"
  s.authors         = ["Elastic"]
  s.email           = 'info@elastic.co'
  s.homepage        = "http://www.elastic.co/guide/en/logstash/current/index.html"
  #s.platform      = "java"
  s.require_paths = ["lib", "vendor/jar-dependencies"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*', '*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT', 'maxmind-db-NOTICE.txt', 'docs/**/*']

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "false" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  #s.add_development_dependency 'logstash-devutils'
end
