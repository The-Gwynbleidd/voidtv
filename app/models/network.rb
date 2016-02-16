class Network < ActiveRecord::Base

  # Validations #
  validates :name, presence: true
  validates :bio, presence: true

  # Uploads #
  has_attached_file :logo, styles: { small: "75x75>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  # Friendly Links #
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end


end
