require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
  t.test_files = FileList['test/test_*.rb']
  t.test_files = FileList['spec/*_spec.rb']
  t.test_files = FileList['spec/spec_*.rb']
  t.libs << 'spec'
  t.libs << 'test'
end

gemspec = eval(File.read(Dir["*.gemspec"].first))

desc "Run tests"
task :default => :test

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

desc "Build the gem locally"
task :build => :gemspec do
  system "gem build #{gemspec.name}.gemspec"
end

desc "Install the gem locally"
task :install => :build do
  system "gem uninstall -a #{gemspec.name}"
  system "gem install #{gemspec.name}-#{gemspec.version}.gem"
end

desc "check syntax"
task :syntax do
  Dir["**/*.rb"].each do |file|
    print "#{file}: "
    system("ruby -c #{file}")
  end
end

desc "delete all temporary files"
task :clean

desc "delete all temporary files and build artifacts"
task :clobber => :clean do
  FileUtils.rm_rf Dir["#{gemspec.name}-*.gem"]
end
