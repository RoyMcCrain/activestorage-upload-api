server "104.154.45.239", user: "image", roles: %w[web app]
set :rails_env, :production
set :stage, :production
set :branch, :main
set :ssh_options, { password: ENV["DEPLOY_PASSWORD"] }
