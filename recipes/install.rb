package 'vim'
package 'gcc'

node.set['chruby']['rubies'] = {
  "1.9.3-p392" => false,
  "2.2.2" => true
}

include_recipe 'chruby::system'
