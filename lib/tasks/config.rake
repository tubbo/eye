desc "Configure application using the interactive menu"
task :config => :environment do
  Eye::ConfigMenu.start
end
