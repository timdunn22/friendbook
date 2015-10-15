class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :likes
  has_one :profile
  def visible_posts
    posts = []
    posts << Post.where(user_id: self.id)
    friendships.each do |friend|
      posts << Post.where(user_id:friend.friend_id)
    end
    posts.flatten!.uniq!
    posts
  end
  def friends
    frends = []
    friendships.each do |friend|
      frends << User.find(friend.friend_id)
    end
    frends.flatten!
    frends.uniq!
    frends
  end
  def profile
    Profile.find_by(user_id:self.id)
  end
end
