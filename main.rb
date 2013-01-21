
require('sinatra')
require('liquid')
require('groupdocs')

require('./example1.rb')
require('./example2.rb')
require('./example3.rb')
require('./example4.rb')
require('./example5.rb')
require('./example7.rb')
require('./example8.rb')
require('./example9.rb')

use Rack::Static, :urls => ["/static"]

# Home page
get '/' do
  template = File.open('templates/index.html', 'r'){ |file| file.read  }
  Liquid::Template.parse(template).render
end
# -------------------
# Example 1
get '/example1' do
  example1()
end
# -------------------
# Example 2
get '/example2' do
  example2()
end
# -------------------
# Example 3 GET
get '/example3' do
  example3(true)
end

# Example 3 POST
post '/example3' do
  example3(false)
end
# -------------------
# Example 4 GET
get '/example4' do
  example4(true)
end

# Example 4 POST
post '/example4' do
  example4(false)
end
# -------------------
# Example 5 GET
get '/example5' do
  example5(true)
end

# Example 5 POST
post '/example5' do
  example5(false)
end
# -------------------
# Example 7 GET
get '/example7' do
  example7()
end
# -------------------
# Example 8 GET
get '/example8' do
  example8(true)
end

# Example 8 POST
post '/example8' do
  example8(false)
end
# -------------------
# Example 9 GET
get '/example9' do
  example9(true)
end

# Example 9 POST
post '/example9' do
  example9(false)
end
