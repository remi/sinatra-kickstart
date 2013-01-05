class App < Sinatra::Base
  # Middleware
  use Rack::CanonicalHost, ENV['CANONICAL_HOST']

  # Plugins
  register Sinatra::R18n

  # Configuration
  configure do
    set :haml, :format => :html5, :attr_wrapper => '"', :ugly => false
    set :root, proc { File.expand_path('./') }
    set :views, proc { File.join(root, 'app/views') }
    set :public_folder, proc { File.join(root, 'public') }
    set :default_locale, 'fr'
    enable :static
  end

  # Helpers
  helpers { include Sprockets::Helpers }
  helpers { include LocaleHelper }

  # Routes
  get("/") { haml :index }
end
