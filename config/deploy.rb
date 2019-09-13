# config valid for current version and patch releases of Capistrano
lock "3.11.0"

set :log_level, :debug
set :application, "freemarket_sample_0609d"
set :repo_url, "git@github.com:Riku-O/freemarket_sample_0609d.git"

append :linked_files, 'config/credentials.yml.enc', 'config/master.key'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
    keys: ['/Users/tanakakenyou/.ssh/freemarket_sample_0609d04.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  RAILS_MASTER_KEY: ENV["RAILS_MASTER_KEY"],
  SECRET_KEY_BASE: ENV["SECRET_KEY_BASE"],
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task upload_file: [:set_rails_env] do
    on roles(:app) do |host|
      upload!('config/master.key', "#{shared_path}/config/master.key")
      upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
      execute 'echo "credentials.yml.enc upload!!"'
    end
  end
  task :restart do
    invoke 'unicorn:restart'
  end
end