Rails.cache.clear

['Super Admin', 'Admin', 'Registered User', 'Paid User', 'Guest'].each do |r|
	Role.where( name: r, description: r).first_or_create
end

{'Atlanta - No chapter' => 'Atlanta, GA', 'Birmingham' =>	'Birmingham, AL', 'Dallas' =>	'Dallas, TX', 'Houston' =>	'Houston, TX', 'Michigan' =>	'Detroit, MI', 'The Carolinas' =>	'Charlotte, NC', 'WMA' =>	'Washignton D.C.' }.each do |key, value|
	Chapter.where( name: key, description: key, headquarters: value).first_or_create
end

email_address = 'esonakia@yahoo.com'
puts "User #{email_address}"
super_admin = User.where(
  :password => 'Password01',
  #:password_confirmation => password,
  :email => email_address,
  username: 'esonakia',
  first_name: 'Esona',
  last_name: 'Fomuso',
  class_year: 1995,
  gender: 'female',
  profession: 'Software Engineer',
  role_id: Role.super_admin.id
).first_or_create!

Country.create name: 'United States of America', code2: 'US', code3: 'USA'

Dir[Rails.root.join('db', 'seeds', '*', '*seeds.rb').to_s].sort.each do |file|
  load(file)
end


Address.create street1: '3082 Peachtree Rd', city_id: City.find_by_name('Atlanta').id, state_id: State.find_by_code('GA'), zip_id: Zip.find_by_code(30002), user_id: super_admin.id 
