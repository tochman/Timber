class Album < ApplicationRecord
  belongs_to :family
  has_many :photos

  validates_presence_of :title
end
