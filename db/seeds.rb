# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
csv_text = File.read(Rails.root.join('lib', 'seeds', 'data.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
Sku.delete_all
csv.each do |row|
  s = Sku.new
  s.sku_label = row['sku_label']
  s.jit_cogs = row['jit_cogs']
  s.domestic_stocking_cogs = row['domestic_stocking_cogs']
  s.best_stocking_cogs = row['best_stocking_cogs']
  s.genuineeqprice = row['genuineeqprice']
  s.reporting_make = row['reporting_make']
  s.brand_name = row['brand_name']
  s.category_name = row['category_name']
  s.sub_category_name = row['sub_category_name']
  s.functional_name = row['functional_name']
  s.save
  puts "#{s.reporting_make} - #{s.functional_name} added"
end

puts "There are now #{Sku.count} total entries in the db"
