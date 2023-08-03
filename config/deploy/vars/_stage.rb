set :stage, :staging
set :branch, :staging

set :server_port, 80
set :server_port_ssl, 443

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

set :deploy_to, "/home/#{fetch(:deploy_user)}/#{fetch(:full_app_name)}"

set :rails_env, :stage

set :puma_user, fetch(:deploy_user)
set :puma_rackup, -> { File.join(current_path, 'config.ru')}
set :puma_state, "#{shared_path}/tmp/states/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.#{fetch(:full_app_name)}.sock"
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.#{fetch(:full_app_name)}.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, :staging
set :puma_threads, [4, 8]
set :puma_workers, 8
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, true
set :puma_plugins, [:tmp_restart]

set :nginx_disable_http, false
set :allow_asset, true
set :nginx_use_ssl, false