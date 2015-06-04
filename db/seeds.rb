require 'ffaker'

Faker = FFaker

10.times do
  contact = Contact.create!(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
  rand(0..5).times do
    email = contact.emails.create!(address: Faker::Internet.email)
    email.create_location!(name: Faker::AddressCA.neighborhood, description:Faker::AddressCA.street_address)
  end
  rand(0..5).times do
    phone_number = contact.phone_numbers.create!(number: Faker::PhoneNumber.short_phone_number)
    phone_number.create_location!(name: Faker::AddressCA.neighborhood, description:Faker::AddressCA.street_address)
  end
end
