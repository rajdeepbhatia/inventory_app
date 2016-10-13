User.create(name: 'Admin', password: 'password', password_confirmation: 'password', email: 'admin@example.com')

%w(Laptops Mobiles Headphones).each do |category|
  Category.create(name: category)
end

%w(Apple Sennheiser Lenovo Samsung).each do |brand|
  Brand.create(name: brand)
end

Person.create(name: 'Rajdeep', mobile_no: '9876543210')
Person.create(name: 'Sukanta', mobile_no: '9876543211')
Person.create(name: 'Anup', mobile_no: '9876543212')
Person.create(name: 'Bachan', mobile_no: '9876543213')
Person.create(name: 'Shatabdi', mobile_no: '9876543214')
Person.create(name: 'Kiran', mobile_no: '9876543215')

Item.create(name: 'Macbook', brand_id: 1, category_id: 1, sku: 'U1234567890', serial: 'B1234567890', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Macbook Pro', brand_id: 2, category_id: 2, sku: 'U1234567891', serial: 'B1234567891', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Surface Pro', brand_id: 1, category_id: 1, sku: 'U1234567892', serial: 'B1234567892', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Macbook Air', brand_id: 2, category_id: 2, sku: 'U1234567893', serial: 'B1234567893', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Macbook Great', brand_id: 1, category_id: 1, sku: 'U1234567894', serial: 'B1234567894', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac', brand_id: 2, category_id: 2, sku: 'U1234567895', serial: 'B1234567895', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac India', brand_id: 1, category_id: 1, sku: 'U1234567896', serial: 'B1234567896', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac US', brand_id: 2, category_id: 2, sku: 'U1234567897', serial: 'B1234567897', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac Hello', brand_id: 2, category_id: 2, sku: 'U1234567898', serial: 'B1234567898', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac World', brand_id: 2, category_id: 1, sku: 'U1234567899', serial: 'B1234567899', user_id: 1, purchased_at: Date.today)
Item.create(name: 'Mac New', brand_id: 1, category_id: 2, sku: 'U1234567880', serial: 'B1234567880', user_id: 1, purchased_at: Date.today)