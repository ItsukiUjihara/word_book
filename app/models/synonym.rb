class Synonym < ApplicationRecord
  belongs_to :word
  def synonym
    # synonym メソッドの実装
  end
end
