# Log queries to STDOUT when app is running in development
if Sinatra::Application.development?
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Automatically load every file in APP_ROOT/app/models/*.rb
# ex. autoload "Person", 'app/models/person.rb'
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

# Parse DATABASE_URL env. varialbe for database connection information in Heroku
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{Sinatra::Application.environment}")

DB_NAME = db.path[1..-1]

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => DB_NAME,
  :encoding => 'utf8'
)
