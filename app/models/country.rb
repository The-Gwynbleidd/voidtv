class Country < ActiveRecord::Base

  # Validations #
  validates :name, presence: true

  # File uploads #
  has_attached_file :flag, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  # Friendly Links #
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

end
