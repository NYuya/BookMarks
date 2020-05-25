class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookmarks
  has_many :bookmark_comments, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :customer

  has_many :follower, class_name: "Relationship", foreign_key: "customer_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy # フォロワー取得
  has_many :following_customer, through: :follower, source: :follow # 自分がフォローしている人
  has_many :follower_customer, through: :followed, source: :customer # 自分をフォローしている人

  has_many :customer_rooms
  has_many :chats
  has_many :rooms, through: :customer_rooms

  def follow(other_customer)
    unless self == other_customer
      self.relationships.find_or_create_by(follow_id: other_customer.id)
    end
  end

  def unfollow(other_customer)
    relationship = self.relationships.find_by(follow_id: other_customer.id)
    relationship.destroy if relationship
  end

  def following?(other_customer)
    self.followings.include?(other_customer)
  end

  attachment :customer_image, destroy: false


end
