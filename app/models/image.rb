class Image < ApplicationRecord
  belongs_to :deceased_post, optional: true
  has_one :user, through: :deceased_post
  has_one_attached :file

  include Rails.application.routes.url_helpers
  def url
    url_for(self.file)
  end
end
