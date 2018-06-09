class Article < ApplicationRecord
  has_one :org
  has_and_belongs_to_many :tasks
end
