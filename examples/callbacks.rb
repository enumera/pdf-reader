#!/usr/bin/env ruby
# coding: utf-8

# List all callbacks generated by each page
#
# WARNING: this will generate a *lot* of output, so you probably want to pipe
#          it through less or to a text file.

require 'rubygems'
require 'pdf/reader'

receiver = PDF::Reader::RegisterReceiver.new
filename = File.expand_path(File.dirname(__FILE__)) + "/../spec/data/cairo-basic.pdf"

PDF::Reader.open(filename) do |reader|
  reader.pages.each do |page|
    page.walk(receiver)
    receiver.callbacks.each do |cb|
      puts cb
    end
  end
end
