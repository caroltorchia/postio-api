# == Schema Information
#
# Table name: comments
#
# *id*::         <tt>uuid, not null, primary key</tt>
# *content*::    <tt>text</tt>
# *created_at*:: <tt>datetime, not null</tt>
# *updated_at*:: <tt>datetime, not null</tt>
# *post_id*::    <tt>uuid, not null</tt>
# *user_id*::    <tt>uuid, not null</tt>
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#--
# == Schema Information End
#++
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :content
end
