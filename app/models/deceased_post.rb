class DeceasedPost < ApplicationRecord
  belongs_to :user
  has_many :images

  def posting_time
    self.created_at
  end
end
