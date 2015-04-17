require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(title, desc, image_url, price)
    Product.new(title: title, desc: desc, image_url: image_url, price: price)
  end

  def new_filled_product(title: 'Title', desc: 'Desc', image_url: 'image.png', price: 22)
    new_product(title, desc, image_url, price)
  end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:desc].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = new_filled_product()

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 22
    assert product.valid?, 'product is invalid'
  end

  test "image_url" do
    correct = %w{i.gif i.png i.jpg i.jpeg I.GIF I.PNG I.JPG I.JPEG i.JpEg http://www.yandex.ru/some/folder/i.png}
    incorrect = %w{i.bmp I.BMP i.bmp.gif.png2000 i.png.tmp}

    correct.each do |value|
      assert new_filled_product(image_url: value).valid?, "#{value} shouldn't be invalid"
    end

    incorrect.each do |value|
      assert new_filled_product(image_url: value).invalid?, "#{value} shouldn't be valid"
    end
  end

  test "product is not valid without unique title" do
    product = new_filled_product(title: products(:book).title)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
