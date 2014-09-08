server 'staging.myfuture.my', user: 'deploy', roles: %w{web app db job}
set :application, 'myfuture_staging'
set :rails_env, 'staging'