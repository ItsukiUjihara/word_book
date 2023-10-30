class Word < ApplicationRecord
  belongs_to :user
  has_many :synonyms, dependent: :destroy
  accepts_nested_attributes_for :synonyms
  validates :title, presence: true
  validates :content, presence: true
end
