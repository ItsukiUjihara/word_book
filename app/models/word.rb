class Word < ApplicationRecord
  belongs_to :user
  has_many :synonyms, inverse_of: :word, dependent: :destroy
  accepts_nested_attributes_for :synonyms, allow_destroy: true
  validates :title, presence: true
  validates :content, presence: true

end
