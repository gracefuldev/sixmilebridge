# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Islander.find_or_create_by(email: "avdi@avdi.codes") do |avdi|
  avdi.timezone = "(GMT-05:00) Eastern Time (US & Canada)"
end

Islander.find_or_create_by(email: "jessitron@jessitron.com") do |jess|
  jess.timezone = "(GMT-06:00) Central Time (US & Canada)"
end

Islander.find_or_create_by(email: "contact@jessitron.com") do |tyler|
  tyler.timezone = "(GMT-06:00) Central Time (US & Canada)"
end

Islander.find_or_create_by(email: "eric@domainlanguage.com") do |eric|
  eric.timezone = "(GMT-05:00) Eastern Time (US & Canada)"
end