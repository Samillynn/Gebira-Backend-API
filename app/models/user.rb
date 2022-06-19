class User < ApplicationRecord
  has_many :deceased_posts
  has_many :images, through: :deceased_posts
end
