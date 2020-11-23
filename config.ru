require 'bundler'
Bundler.require

#require './lib/controller'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController
