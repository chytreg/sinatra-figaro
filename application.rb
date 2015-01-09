# -*- encoding : utf-8 -*-
require 'sinatra'
require './helpers/figaro'

class Application < Sinatra::Base
  configure do
    enable :logging, :show_exceptions, :dump_errors, :clean_trace, :static
  end

  helpers FigaroENV

  get '/' do
    # ENV is now in the request, so we need to refresh w/ Figaro
    figaro_load

    "Figaro say hello: #{Figaro.env.hello}, #{ENV['hello']}"
  end

end
