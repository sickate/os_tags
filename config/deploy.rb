# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'os_tags'
set :repo_url, 'git@github.com:sickate/os_tags.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/os_tags'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


# puma settings
#set :puma_rackup, -> { File.join(current_path, 'config.ru') }
#set :puma_state, "#{shared_path}/tmp/pids/puma.state"
#set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
#set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
#set :puma_conf, "#{shared_path}/puma.rb"

#set :puma_role, :app
#set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
#set :puma_threads, [0, 16]
#set :puma_workers, 0
#set :puma_worker_timeout, nil
#set :puma_init_active_record, true  # Change to true if using ActiveRecord
#set :puma_preload_app, true
#set :puma_prune_bundler, false

#set :puma_access_log, "#{release_path}/log/puma.error.log"
#set :puma_error_log,  "#{release_path}/log/puma.access.log"

set :rvm_type, :user

namespace :deploy do

  # puma 
  #desc 'Initial Deploy'
  #task :initial do
    #on roles(:app) do
      #before 'deploy:restart', 'puma:start'
      #invoke 'deploy'
    #end
  #end

  #desc 'Restart application'
  #task :restart do
    #on roles(:app), in: :sequence, wait: 5 do
      #invoke 'puma:restart'
    #end
  #end

  #before :starting,     :check_revision
  #after  :finishing,    :compile_assets
  #after  :finishing,    :cleanup
  #after  :finishing,    :restart


  # passenger

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  # both passenger and puma
  after :publishing, :restart

  desc 'reset database, will drop all table and recreate them'
  task :reset_db do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && bundle exec rake db:reset RAILS_ENV=#{fetch(:rails_env)}"
    end
  end

  desc 'seeding'
  task :seed do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}"
    end
  end

end
