require 'pathname'
require 'fileutils'

HOME = Pathname.new ENV['HOME']

def warnp(*args)
  warn args.join("\n")
end

task :default => :prepare
task :prepare => %w(rcfiles:symlink)
task :gems => %(packages:gems)

namespace :rcfiles do
  task :symlink do
    Pathname.glob('_*').map(&:expand_path).each do |file|
      begin
        src = file.relative_path_from HOME
        dest = HOME.join file.basename.sub(/^_/, '.')
        if File.directory? dest
          tmp_file = Pathname.new('tmp').join(dest.basename) 
          FileUtils.mv dest, tmp_file
          puts "backup: #{dest} -> #{tmp_file.realpath}"
        end
        FileUtils.ln_s src, dest, :force=>true
        puts "symlink: #{file} -> #{dest}"
      rescue
        warnp $!.class, $!.message
      end
    end
  end

end

namespace :packages do
  task :gems do
    %w(bundler rails rspec wirble rvm).each do |gem|
      begin
        puts "gem: #{gem}"
        sh "gem install #{gem}"
      rescue 
        warnp $!.class, $!.message
      end
    end
  end

end
