#!/bin/bash

source /usr/local/share/chruby/chruby.sh

cd /apps

git clone https://github.com/austenito/austenito.com
cd austenito.com

export GEM_HOME=/gems/ruby/2.1.2
chruby 2.1.2
bundle install
RUBYOPT="-KU -E utf-8:utf-8" bundle exec rake generate
