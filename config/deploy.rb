# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "image1234"
set :repo_url, "git@github.com:hm626/activestorage-upload-api.git"
set :deploy_to, "/home/image/src/image"

set :rbenv_type, :user
set :rbenv_ruby, File.read(".ruby-version").strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"

set :rbenv_map_bins, fetch(:rbenv_map_bins).to_a.concat(%w[rake gem bundle ruby rails puma pumactl sidekiq sidekiqctl])
set :init_system, :systemd
