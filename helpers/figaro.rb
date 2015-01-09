# figaro.rb
require 'figaro'

module Figaro
  def dynamic_load(sinatra_settings)
  	@path = File.join(sinatra_settings.root,"config","application.yml")
  	Figaro.application.path = @path
  	Figaro.load
  end
end

# I don't know why I can't use Figaro, but it breaks if I put this into the existing module
module FigaroENV
  def figaro_load

  	# These values are available when called from a request header
  	Figaro.dynamic_load(settings)
  end
end
