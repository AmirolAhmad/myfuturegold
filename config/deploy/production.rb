set :stage, :production
server '128.199.138.90', user: 'deploy', roles: %w{web app db job}