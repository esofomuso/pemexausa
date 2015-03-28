Rails.cache.clear

{'regular' => 'Regular User', 'registered' => 'Registered User', 'paid' => 'Paid User', 'chapter_admin' => 'Chapter Admin', 'admin' => 'National Admin', 'super_admin' => 'Super Admin', 'developer' => 'Developer'}.each do |k, v|
	Role.where( name: k, description: v).first_or_create
end

{'Atlanta - No chapter' => 'Atlanta, GA', 'Birmingham' =>	'Birmingham, AL', 'Dallas' =>	'Dallas, TX', 'Houston' =>	'Houston, TX', 'Michigan' =>	'Detroit, MI', 'The Carolinas' =>	'Charlotte, NC', 'WMA' =>	'Washignton D.C.' }.each do |key, value|
	Chapter.where( name: key, description: key, headquarters: value).first_or_create
end

super_admin = User.where(
  password: 'Password01',
  #:password_confirmation => password,
  email: 'esonakia@yahoo.com',
  username: 'esonakia',
  first_name: 'Esona',
  last_name_now: 'Fomuso',
  last_name_pss: 'Fomuso',
  class_year: 1995,
  gender: 'female',
  profession: 'Software Engineer',
  role_id: Role.super_admin.id
).first_or_create

Country.create name: 'United States of America', code2: 'US', code3: 'USA'

Dir[Rails.root.join('db', 'seeds', '*', '*seeds.rb').to_s].sort.each do |file|
  load(file)
end


Address.create street1: '3082 Peachtree Rd', city: 'Atlanta', state_id: State.find_by_code('GA'), zip: 30002, user_id: super_admin.id, country_id: Country.first.id
