class Post < ActiveRecord::Base
  validates :image, presence: true #each post must have an image
  validates :user_id, presence: true #each post must have an associated user
  validates :caption, presence: true, length: { minimum: 4, maximum: 300 }

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  has_many :comments, dependent: :destroy
end