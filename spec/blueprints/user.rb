User.blueprint do
  email { "email#{sn}@example.com" }
  password { "pw#{sn}" }
  password_confirmation { object.password }
  time_zone { "London" }
  language { "en" }
end
