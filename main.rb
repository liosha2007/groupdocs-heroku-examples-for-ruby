
require('sinatra')
require('liquid')
require('groupdocs')
require('./example1.rb')

use Rack::Static, :urls => ["/static"]

# Home page
get '/' do
  template = File.open('templates/index.html', 'r'){ |file| file.read  }
  Liquid::Template.parse(template).render
end

# Example 1
get '/example1' do
  example1()
end
