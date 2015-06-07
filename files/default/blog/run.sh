#!/bin/bash

source /usr/local/share/chruby/chruby.sh

cd /apps

git clone https://github.com/austenito/austenito.com
cd austenito.com

export GEM_HOME=/gems/ruby/2.1.2
export PATH=$PATH:$GEM_HOME/bin
chruby 2.1.2
gem install --no-document jekyll
gem install duktape
jekyll build
