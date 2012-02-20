#!/usr/bin/env ruby

root_path = "~/"
plugins = [ "https://github.com/tpope/vim-fugitive",
            "https://github.com/tpope/vim-endwise",
            "https://github.com/tpope/vim-rails",
            "https://github.com/tpope/vim-rake",
            "https://github.com/tomtom/tcomment_vim",
            "https://github.com/tpope/vim-eunuch",
            "https://github.com/nathanaelkane/vim-indent-guides",
            "https://github.com/Townk/vim-autoclose.git",
            "https://github.com/mileszs/ack.vim",
            "https://github.com/kien/ctrlp.vim/",
            "https://github.com/tpope/vim-surround",
            "https://github.com/tpope/vim-unimpaired",
            "https://github.com/tpope/vim-markdown",
            "https://github.com/vim-ruby/vim-ruby",
            "https://github.com/pangloss/vim-javascript",
            "https://github.com/tpope/vim-haml",
            "https://github.com/cakebaker/scss-syntax.vim",
            "https://github.com/kchmck/vim-coffee-script",
            "https://github.com/walm/jshint.vim",
            "https://github.com/altercation/vim-colors-solarized" ]

def install_plugins(root_path, plugins)
  Dir.chdir(File.expand_path("#{root_path}.vim/bundle/"))
  plugins.each do |repo|
    print "\n"
    system "git clone #{repo}"
  end
end

def do_install(root_path, plugins)
  Dir.chdir(File.expand_path(root_path))

  puts "creating directory structure"
  system "mkdir -p #{root_path}.vim/{_backup,_temp,_cache,autoload,bundle}"

  puts "installing pathogen"
  system "curl https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim > #{root_path}.vim/autoload/pathogen.vim"

  puts "installing plugins"
  install_plugins(root_path, plugins)
end

do_install(root_path, plugins) unless Dir.exists?(File.expand_path("#{root_path}.vim"))