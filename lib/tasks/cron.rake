# lib/tasks/cron.rake

desc "Periodic tasks"
task :cron => :environment do
  Tools::AlertWorker.run
end
