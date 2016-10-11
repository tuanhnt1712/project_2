class Post < ActiveRecord::Base
  has_many :comments

  belongs_to :user

  mount_uploader :attachment, AttachmentUploader
  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
