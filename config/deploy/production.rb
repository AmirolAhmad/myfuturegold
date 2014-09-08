server '128.199.138.90', user: 'deploy', roles: %w{web app db job}
set :application, 'myfuture_production'
set :rails_env, 'production'