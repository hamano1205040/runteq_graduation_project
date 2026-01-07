class TrainingRecord < ApplicationRecord
  belongs_to :user

  validates :trained_on, presence: true
  validates :content, presence: true
end
