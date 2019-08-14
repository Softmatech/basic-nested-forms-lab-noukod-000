class Recipe < ActiveRecord::Base
  has_many :ingredients
  # => accepts_nested_attributes_for  :ingredients
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i,  ingredients_attributes|
      self.ingredients_attributes.build(ingredients_attributes)
    end
  end
end
