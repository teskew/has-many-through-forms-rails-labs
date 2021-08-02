class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :all_blank

  # def comments_attributes=(comment_attributes)
  #   comment_attributes.values.each do |comment_attribute|
  #     comment = Comment.find_or_create_by(comment_attribute)
  #     self.comment_attributes.build(comment: comment)
  #   end
  # end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category|
      if !category[:name].empty?
      # if category[:name].present?
        self.categories << Category.find_or_create_by(name: category[:name])
        # if !self.categories.include?(category)
          # self.category_attributes.build(category: category)
        # end
      end
    end
  end

end