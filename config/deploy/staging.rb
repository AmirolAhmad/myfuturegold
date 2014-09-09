server 'staging.osemspace.com', user: 'deploy', roles: %w{web app db job}
set :application, 'myfuturegold_staging'
set :rails_env, 'staging'