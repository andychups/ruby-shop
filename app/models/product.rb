class Product < ActiveRecord::Base
  validates :title, :desc, :image_url, :price, presence: true
  validates :title, uniqueness: true, length: 5..255
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|jpeg|png)\Z}i,
      message: 'Incorrect image path'
  }

  def self.latest
    Product.order(:updated_at).last
  end
end
