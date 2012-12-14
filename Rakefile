require 'pathname'

home = Pathname.new(ENV['DEST'] || ENV['HOME']).expand_path
repo = Pathname.new(__FILE__).expand_path.dirname

Dir.chdir repo

task :screen do
  mkdir_p screen_dir = home.join('.screen')
  chmod   0700, screen_dir

  install Dir['_screen/*'], home.join('.screen/')
  install '_screenrc',      home.join('.screenrc')
end

task :ssh do
  mkdir_p ssh_dir = home.join('.ssh')
  chmod   0700, ssh_dir

  install Dir['_ssh/*'], home.join('.ssh/')
end

task :zsh do
  install '_zshrc', home.join('.zshrc')

  unless (zshenv = home.join('.zshenv')).file?
    install '_zshenv', zshenv
  end

  mkdir_p home.join('.zsh/')

  install Dir['_zsh/*'], home.join('.zsh/')

  Rake::Task[:omz].invoke unless home.join('.oh-my-zsh').directory?
end

task :omz do
  sh %(git clone git://github.com/robbyrussell/oh-my-zsh.git #{home}/.oh-my-zsh)
end

task :git do
  install '_gitconfig', home.join('.gitconfig')
  install '_gitignore', home.join('.gitignore')
end

task :vim do
  install '_vimrc',  home.join('.vimrc')
  install '_gvimrc', home.join('.gvimrc')

  Rake::Task[:vundle].invoke unless home.join('.vim/bundle').directory?
end

task :vundle do
  mkdir_p home.join('.vim')

  sh %(git clone git://github.com/gmarik/vundle.git #{home.join('.vim/bundle')})
  sh %(vim -c ':BundleInstall!' -c ':qa')
end

task :ruby do
  install '_irbrc', home.join('.irbrc')

  Rake::Task[:rbenv].invoke unless home.join('.rbenv').directory?
end

task :rbenv do
  sh %(git clone git://github.com/sstephenson/rbenv.git #{home}/.rbenv)

  mkdir_p home.join('.rbenv/plugins')

  ruby_build_dir = home.join('.rbenv/plugins/ruby-build')
  sh %(git clone git://github.com/sstephenson/ruby-build.git #{ruby_build_dir})
  sh %(cd #{ruby_build_dir}; PREFIX=#{home}/.rbenv #{ruby_build_dir}/install.sh)

  ruby_version = ENV['RUBY_VERSION'] || '1.9.3-p286'
  sh %(hash -r; ruby-build #{ruby_version} #{home.join('.rbenv/versions')}/#{ruby_version})
  sh %(rbenv global #{ruby_version})
end

task :cline do
  mkdir_p home.join('.cline')

  install '_cline/config',    home.join('.cline/')
  install '_cline/feeds.xml', home.join('.cline/')
end

task default: :install
task install: %w(screen ssh zsh git vim ruby cline)
