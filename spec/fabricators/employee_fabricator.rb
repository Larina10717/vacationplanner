Fabricator(:employee) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password "cicciobello1"
end
