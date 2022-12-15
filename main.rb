require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

enable :sessions

require './models/games'
require './models/users'

require './controllers/games_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

require './helpers/sessions_helpers'






