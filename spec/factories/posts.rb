# == Schema Information
#
# Table name: posts
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *content*::    <tt>text</tt>
# *title*::      <tt>string</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
# *user_id*::    <tt>uuid, not null</tt>
#
# Indexes
#
#  index_posts_on_title    (title)
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#--
# == Schema Information End
#++
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    user
  end
end
