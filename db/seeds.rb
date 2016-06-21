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

# create applicant
applicant1 = User.find_or_create_by(email: 'tim@aol.com')
applicant1.tap do |applicant|
  applicant.password = 'swordfish'
  applicant.first_name = 'Tim'
  applicant.last_name = 'Smith'
end
applicant1.save

puts '***** Users *****'
User.all.each do |user|
  puts "#{user.first_name} #{user.last_name}, #{user.email}"
end


# create Job Openings
JobOpening.find_or_create_by(name: "Master of the Universe", description: "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.")
JobOpening.find_or_create_by(name: "Quality Analyst", description: "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.")
JobOpening.find_or_create_by(name: "Code Monkey", description: "Capitalise on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.")

puts '***** Job Openings *****'
JobOpening.all.each do |job|
  puts "#{job.name}"
end
