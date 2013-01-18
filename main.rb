
require('sinatra')
require('liquid')

use Rack::Static, :urls => ["/static"]

get '/' do
  template = File.open('templates/index.html', 'r'){ |file| file.read  }
  Liquid::Template.parse(template).render
end
