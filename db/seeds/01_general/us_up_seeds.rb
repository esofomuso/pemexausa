f = File.join(Rails.root, 'db','seeds/01_general/us.rb')
puts "Loading from #{f}..."
cf push --exec("bundle exec rails r #{f} up")
