class Word < ApplicationRecord
  validates :name, presence: true
  validates :definition, presence: true
end
