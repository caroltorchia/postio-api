# == Schema Information
#
# Table name: users
#
# *id*::              <tt>uuid, not null, primary key</tt>
# *email*::           <tt>string</tt>
# *name*::            <tt>string</tt>
# *password_digest*:: <tt>string</tt>
# *created_at*::      <tt>datetime, not null</tt>
# *updated_at*::      <tt>datetime, not null</tt>
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    name { Faker::Name.name }
  end
end
