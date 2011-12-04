require 'pathname'
require 'fileutils'

HOME = Pathname.new(ENV['HOME'])

task :default => :prepare
task :prepare => %w(rcfiles:symlink)

namespace :rcfiles do
  task :symlink do
    Pathname.glob('_*').map(&:expand_path).each do |file|
      begin
        src = file.relative_path_from HOME
        dest = HOME.join(file.basename.sub(/^_/, '.'))

        if File.directory? dest
          tmp_file = Pathname.new('tmp').realpath.join(dest.basename)

          puts "backup: #{dest} -> #{tmp_file}"
          FileUtils.mv dest, tmp_file
        end

        puts "symlink: #{file} -> #{dest}"
        FileUtils.ln_s src, dest, :force => true
      #rescue
      #  warn [$!.class, $!.message].join("\n")
      end
    end
  end
end
