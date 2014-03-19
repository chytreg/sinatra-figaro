# -*- encoding : utf-8 -*-
require 'rubygems'
require 'bundler'

Bundler.require

class Application < Sinatra::Base
  configure do
    enable :logging, :show_exceptions, :dump_errors, :clean_trace, :static
  end

  get '/' do
    "Figaro say hello: #{Figaro.env.hello}, #{ENV['hello']}"
  end
end

module Figaro
  def path
    @path ||= File.join(Application.settings.root, "config", "application.yml")
  end

  def environment
    Application.settings.environment
  end
end

Figaro.env.each do |key, value|
  ENV[key] = value unless ENV.key?(key)
end
