class Image < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :is_mirror, presence: true
  validates :url, :presence => true, :if => :mirror?
  validates :file, :presence => true, :unless => :mirror?
  validate :content_is_present

  mount_uploader :file, ImageUploader

  def mirror?
    !!is_mirror
  end
end
