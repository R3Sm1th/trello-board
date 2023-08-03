class List < ApplicationRecord
  belongs_to :company
  has_many :columns, dependent: :destroy
  has_many :items, through: :columns
end
