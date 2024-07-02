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
class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :comments, through: :posts

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
end
