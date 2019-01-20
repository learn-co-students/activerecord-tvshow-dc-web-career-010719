require_relative 'config/environment.rb'

task :environment do
  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'
end

namespace :db do


  desc "Migrate the db"
  task :migrate do

    include ActiveRecord::Tasks
    DatabaseTasks.db_dir = 'db'
    DatabaseTasks.migrations_paths = 'db/migrate'
    load 'active_record/railties/databases.rake'

    # connection_details = YAML::load(File.open('config/database.yml'))
    # ActiveRecord::Base.establish_connection(connection_details)
    # ActiveRecord::Migrator.migrations_path=("db/migrate/")
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end

  desc "start console"
  task :console do
    Pry.start
  end
end


# require 'active_record'
#
# task :environment do
#   ENV["ACTIVE_RECORD_ENV"] ||= "development"
#   require_relative './config/environment'
# end
#
# include ActiveRecord::Tasks
# DatabaseTasks.db_dir = 'db'
# DatabaseTasks.migrations_paths = 'db/migrate'
# seed_loader = Class.new do
#   def load_seed
#     load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
#   end
# end
# DatabaseTasks.seed_loader = seed_loader.new
# load 'active_record/railties/databases.rake'
#
# task :console => :environment do
#   Pry.start
# end
