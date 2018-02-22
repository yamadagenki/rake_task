namespace :exec do
  migrate_dir = 'db/migrate'
  desc 'Migrate database'
  task migrate: :environment do
    ActiveRecord::Migrator.migrate(migrate_dir, ENV['VERSION'] ? ENV['VERSION'].to_i : nil)
  end

  desc 'Rollback database'
  task rollback:  :environment do
    ActiveRecord::Migrator.rollback(migrate_dir, ENV['STEP'] ? ENV['STEP'].to_i : 1)
  end
end