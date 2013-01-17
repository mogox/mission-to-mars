require 'ruby-debug'
require 'looksee'
require 'fuubar'

require File.expand_path('../../app/plateau', __FILE__)
require File.expand_path('../../app/rover', __FILE__)
require File.expand_path('../../app/squad_console', __FILE__)


RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end