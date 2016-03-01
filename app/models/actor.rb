class Actor < ActiveRecord::Base

  # Validations #
  validates :fullname, presence: true
  validates :bio, presence: true
  validates :overview, presence: true

  # File uploads #
  has_attached_file :image, styles: { preview: "250x320!", medium: "300x350>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Friendly Links #
  extend FriendlyId
  friendly_id :fullname, use: :slugged

  def should_generate_new_friendly_id?
    fullname_changed?
  end

  # Associations #
  belongs_to :country

end
