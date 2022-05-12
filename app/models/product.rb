class Product < ApplicationRecord
  validates :name, presence :true

  def friendly_created_at
    created_at
  end

  def is_discounted?

  end 

  
end
