class Synonym < ApplicationRecord
  belongs_to :word, inverse_of: :synonym
end
