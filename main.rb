
require('sinatra')
require('liquid')
require('groupdocs')

require('./example1.rb')
require('./example2.rb')
require('./example3.rb')

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

# Example 2
get '/example2' do
  example2()
end

# Example 3 GET
get '/example3' do
  example3(true)
end

# Example 3 POST
post '/example3' do
  example3(false)
end
