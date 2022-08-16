##
# Create a new User with each of the following names...
%w[ Mike Carol Greg Marcia Peter Jan Bobby Cindy ].each do |user_name|
  User.create!(name: user_name)
end

##
# Create a lot of recipes for each User
User.all.each do |user|
  15.times do
    user.recipes.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraphs(number: 30).join("\n"))
  end
end
