# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{106.187.42.176}
role :web, %w{106.187.42.176}
role :db,  %w{106.187.42.176}

set :use_sudo, true

# Ruby on Rails 'RAILS_ENV' parameter
set :rails_env, 'production'


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '106.187.42.176', user: 'sickcate', roles: %w{web app}, my_property: :my_value

namespace :deploy do

  desc 'Start application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      run "cd #{current_path} && bundle exec passenger start #{current_path} -e #{rails_env} -p 80 -d --log-file #{File.join(current_path,'log','passenger.log')} --pid-file #{File.join(current_path,'tmp','pids','passenger.pid')}"
    end
  end

end
# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
