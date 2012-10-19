require 'pathname'

home = Pathname.new(ENV['HOME'])
repo = Pathname.new(__FILE__).expand_path.dirname

cd repo

task :screen do
  mkdir_p home.join('.screen')

  cp_r %w(_screen/defaults _screen/leaf _screen/stem1 _screen/stem2 _screen/stem3 _screen/stem4), home.join('.screen/')
  cp   '_screenrc', home.join('.screenrc')
end

task :ssh do
  ssh_dir = home.join('.ssh')
  mkdir_p ssh_dir
  chmod   0700, ssh_dir

  cp '_ssh/config', home.join('.ssh/')
end

task :zsh do
  cp '_zshrc', home.join('.zshrc')

  unless (zshenv = home.join('.zshenv')).file?
    cp '_zshenv', zshenv
  end

  mkdir_p home.join('.zsh/')

  unless home.join('.zsh/oh-my-zsh').exist?
    cp '_zsh/oh-my-zsh', home.join('.zsh/')
  end

  Rake::Task[:omz].invoke unless home.join('.oh-my-zsh').directory?
end

task :omz do
  sh %(git clone git://github.com/robbyrussell/oh-my-zsh.git #{home}/.oh-my-zsh)
end

task :vim do
  cp '_vimrc', home.join('.vimrc')

  unless home.join('.vim/bundle').directory?
    Rake::Task[:vundle].invoke
  end
end

task :vundle do
  mkdir_p home.join('.vim')

  sh %(git clone git://github.com/gmarik/vundle.git #{home.join('.vim/bundle')})
  sh %(vim -c ':BundleInstall!' -c ':qa')
end

task :ruby do
  cp '_irbrc', home.join('.irbrc')

  unless home.join('.rbenv').directory?
    Rake::Task[:rbenv].invoke
  end
end

task :rbenv do
  sh %(git clone git://github.com/sstephenson/rbenv.git #{home}/.rbenv)

  mkdir_p home.join('.rbenv/plugins')

  ruby_build_dir = home.join('.rbenv/plugins/ruby-build')
  sh %(git clone git://github.com/sstephenson/ruby-build.git #{ruby_build_dir})
  sh %(PREFIX=#{home}/.rbenv #{ruby_build_dir}/install.sh)

  ruby_version = ENV['RUBY_VERSION'] || '1.9.2-p286'

  sh %(reload; ruby-build #{ruby_version} #{home.join('.rbenv/versions')}/#{ruby_version})
end

task default: :install
task install: %w(screen ssh zsh vim ruby)
