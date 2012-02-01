# Instruct the Capistrano to work with and respect rvm
set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.3-p0@rails320/bin:/usr/local/rvm/gems/ruby-1.9.3-p0@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p0/bin:/usr/local/rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.9.3-p0',
  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.3-p0@rails320',
  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.3-p0@rails320:/usr/local/rvm/gems/ruby-1.9.3-p0@global',
  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.3-p0@global'  
}

set :application, "rails320-demo"
# set :repository,  "git://github.com/RailsApps/rails3-devise-rspec-cucumber.git"
set :repository,  "git@github.com:eraserx99/rails3-devise-rspec-cucumber.git"
set :deploy_to, "/var/www/#{application}"
set :rails_env, "development"
set :user, "vagrant"
set :use_sudo, false

set :scm, :git 
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_command, "/usr/bin/git"
set :branch, "master"
# set :deploy_via, :remote_cache

role :web, "rails320"                          # Your HTTP server, Apache/etc
role :app, "rails320"                          # This may be the same as your `Web` server
role :db,  "rails320", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

