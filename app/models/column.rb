class Column < ApplicationRecord
  belongs_to :list
  has_many :items, dependent: :destroy
end
