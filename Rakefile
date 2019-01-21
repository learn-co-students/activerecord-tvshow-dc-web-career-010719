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
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end
end
