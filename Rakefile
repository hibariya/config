require 'pathname'
require 'fileutils'

HOME = Pathname.new ENV['HOME']

def warnp(*args)
  warn args.join("\n")
end

task :default => :prepare
task :prepare => %w(rcfiles:symlink)

namespace :rcfiles do
  task :symlink do
    Pathname.glob('_*').map(&:expand_path).each do |file|
      begin
        src = file.relative_path_from HOME
        dest = HOME.join file.basename.sub(/^_/, '.')
        FileUtils.ln_s src, dest, :force=>true
        puts "symlink: #{file} -> #{dest}"
      rescue
        warnp $!.class, $!.message
      end
    end
  end
end

