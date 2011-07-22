require 'sinatra'
require 'haml'
require 'sass'

HTTP_CODES = [400, 401, 403, 404, 410, 500, 501, 503]

set :haml, :format => :html5

get '/' do
  @http_codes = HTTP_CODES
  haml :index
end

get '/:http_code' do
  @http_code = params[:http_code].to_i
  if HTTP_CODES.include? @http_code
    status @http_code
    haml :http_code
  else
    redirect '/'
  end
end

get '/assets/css/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

