class MissingPerson < ApplicationRecord
  validates :name, presence: true, uniqueness: {
    message: 
      "Could not create a person, already exists."
  }
  # validates :age, allow_blank: true
  validates :sex, presence: true
  # validates :hair_color, allow_blank: true
  # validates :weight, allow_blank: true
  validates :race, presence: true
  has_many :status_reports, dependent: :destroy
end
