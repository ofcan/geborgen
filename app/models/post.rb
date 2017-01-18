class Post < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true

  # Paperclip code
  has_attached_file :image,
                    styles: { medium: "300x300>",
                              thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, size: { in: 0..1.megabytes }
  
  # Scoping for posts
  default_scope -> { order(created_at: :desc) }
  
end
