set :application, "udp-tee"

# RVM bootstrap
#$:.unshift(File.expand_path("./lib", ENV['rvm_path']))  # Add RVM's lib directory to the load path
require 'rvm/capistrano'            # Load RVM's capistrano plugin
set :rvm_ruby_string, '1.9.2-p290'  # environment to run the app in.
#set :rvm_type, :user

# bundler bootstrap
require 'bundler/capistrano'
set :bundle_dir, ""
set :bundle_flags, ""

# repo details
set :scm, :git
set :repository, "gitorious@gitorious.intern.artcom.de:zrh/udp-tee.git"
set :branch, "deployment"
set :keep_releases, 3

# set testing and production stages
set :stages, %w(testing production)
require 'capistrano/ext/multistage'     # gem install capistrano-ext

# server details
#default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
#set :deploy_to, "/home/webs/#{application}"
set :deploy_via, :copy
set :copy_strategy, :export
set :use_sudo, false
set :rails_env, "production"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do 
  end

  task :stop do
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    #run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end

  task :env do
    run 'echo cap environment on remote server'
    run 'echo $(env)'
  end

  #task :precompile_assets do
  # run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  #end
end

#after 'deploy:update_code', 'deploy:precompile_assets'
after 'deploy:update_code', 'deploy:symlink_shared'
after "deploy:symlink_shared", "deploy:migrate"
