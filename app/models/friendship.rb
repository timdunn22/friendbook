class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class: 'User', foreign_key: 'friend_id'
end
