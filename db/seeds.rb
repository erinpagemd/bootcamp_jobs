# create Admins
admin1 = Admin.find_or_create_by(email: 'bess@aol.com')
admin1.tap do |admin|
  admin.password = "swordfish"
  admin.type = "Admin"
  admin.first_name = "Bess"
  admin.last_name = "Cow"
end
admin1.save

puts '***** Admins *****'
Admin.all.each do |admin|
  puts "#{admin.first_name} #{admin.last_name}, #{admin.email}"
end
