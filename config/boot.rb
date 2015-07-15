require 'rubygems'
require 'bundler/setup'
require 'yajl/json_gem'
require 'dotenv'
require 'rom/csv'

Dotenv.load

Bundler.require :default, ENV['RACK_ENV']
