class Comment < ActiveRecord::Base
  belongs_to :post
  def user
    User.find(self.user_id)
  end
end
