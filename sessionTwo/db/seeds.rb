# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

articles = Article.create([
{:title => "A Little Ugly Duck", :body => "content of article A Little Ugly Duck"},
{:title => "Avatar: The Legend of Aang", :body => "content of article Avatar: The Legend of Aang"},
{:title => "Beauty And The Beast", :body => "content of article Beauty And The Beast"},
{:title => "Si Pitung", :body => "content of article Si Pitung"},
{:title => "Pinochio", :body => "content of article Pinochio"}
	])

comments = Comment.create([
{:content => "Hmm.."},
{:content => "Not Bad"},
{:content => "Good"},
{:content => "Very Good"},
{:content => "Too Good To Be True"}
])

countries = Country.create([
{:code => "au", :name => "Australia"},
{:code => "id", :name => "Indonesia"},
{:code => "in", :name => "India"},
{:code => "my", :name => "Malaysia"},
{:code => "sg", :name => "Singapore"}
])

users = User.create([
{:first_name => "Ivan", 
	:last_name => "Andhika", 
	:email => "ivan.andhika@kiranatama.com", 
	:username => "ivan", 
	:address => "gg Sereh 21",
	:age => "22",
	:birthday => "1990-08-05",
},
{:first_name => "Rake", 
	:last_name => "Zeheart", 
	:email => "rake.zeheart@tror.org", 
	:username => "rake", 
	:address => "wgs 1",
	:age => "1",
	:birthday => "2011-09-23",
},
{:first_name => "Seed", 
	:last_name => "Bloomberg", 
	:email => "seed.bloomberg@tror.org", 
	:username => "seed", 
	:address => "wgs 2",
	:age => "1",
	:birthday => "2011-09-23",
},
{:first_name => "Migrate", 
	:last_name => "Toheaven", 
	:email => "migrate.toheave@tror.org", 
	:username => "migz", 
	:address => "wgs 3",
	:age => "1",
	:birthday => "2011-09-22",
},
{:first_name => "Gitz", 
	:last_name => "Hubz", 
	:email => "gitz.hubz@tror.org", 
	:username => "gitz", 
	:address => "wgs 4",
	:age => "1",
	:birthday => "2011-09-20",
}
])