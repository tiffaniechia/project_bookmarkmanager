require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require 'dm-timestamps'


require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb

require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'controllers/users'
