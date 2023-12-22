# frozen_string_literal: true

product_data = YAML.load_file(Rails.root.join('test', 'fixtures', 'products.yml'))

product_data.each do |_key, attributes|
  Product.create(attributes)
end
