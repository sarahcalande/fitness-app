class Category < ApplicationRecord
  has_many :muscles
  has_many :exercises, through: :muscles
end
