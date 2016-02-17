class Ganre < ActiveRecord::Base

  # Validations #
  validates :name, presence: true
  validates :description, presence: true

  # Friendly Links #
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
