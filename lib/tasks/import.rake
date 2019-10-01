require 'CSV'

namespace :import do
  desc "Import prospects from CSV file"

  task prospect: :environment do
    CSV.foreach('.../3000-prospects.csv', headers:true) do |row|
      Prospect.create(row.to_h)
  end

  desc "TODO"
  task create: :environment do
  end

  desc "TODO"
  task lib/tasks/import.rake: :environment do
  end

end
