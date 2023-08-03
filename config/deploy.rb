# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "myarticles"
set :repo_url, 'git@github.com:asif-uia/myarticles.git'
set :deploy_user, :deployer


set :tmp_dir, "/home/#{fetch(:deploy_user)}/tmp"


# Default value for :pty is false
set :pty, true

set :rbenv_type, :system
set :rbenv_ruby, '2.7.0'
# set :rbenv_custom_path, "/home/#{fetch(:deploy_user)}/.rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_custom_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[bundle gem rails ruby rake]

# Default value for :linked_files is []
append :linked_files, "config/application.yml", "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set(
  :config_files,
  %w[
    nginx.conf
    puma.rb
    puma_init.sh
  ]
)

set(:executable_config_files, %w[puma_init.sh])

set(
  :symlinks,
  [
    {
      source: 'nginx.conf',
      link: '/etc/nginx/sites-enabled/{{full_app_name}}.conf'
    },
    {
      source: 'puma_init.sh',
      link: '/etc/init.d/puma_{{full_app_name}}'
    }
  ]
)

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  # 'deploy:setup_config'
  after :finishing, 'deploy:cleanup'
  before 'deploy:setup_config', 'nginx:remove_default_vhost'
  after 'deploy:setup_config', 'nginx:reload'

  after 'deploy:log_revision', 'remote:restart'

end