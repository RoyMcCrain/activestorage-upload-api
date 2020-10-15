# ConoHaの外部IP
server "160.251.15.106", user: "image1234", roles: %w[web app]
set :rails_env, :production
set :stage, :production
set :branch, :main
set :ssh_options, { password: ENV["DEPLOY_PASSWORD"] }
