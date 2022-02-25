class StatusReport < ApplicationRecord
  # validates :case_id, allow_blank: true
  validates :description, presence: true
  validates :details, presence: true
  # validates :image_url, allow_blank: true
  validates :missing_person_id, presence: true

  validates_associated :missing_person
  belongs_to :missing_person
end
