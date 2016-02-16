class Network < ActiveRecord::Base

  # Validations #
  validates :name, presence: true
  validates :bio, presence: true

  # Uploads #
  has_attached_file :logo, styles: { small: "75x75>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

end
