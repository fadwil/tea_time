# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Customers
customer1 = Customer.create!(
  first_name: 'Fil',
  last_name: 'Wady',
  email: 'fil@example.com',
  address: '123 Main St'
)

customer2 = Customer.create!(
  first_name: 'Jak',
  last_name: 'Lamb',
  email: 'jak@example.com',
  address: '456 Oak St'
)

# Teas
tea1 = Tea.create!(
  title: 'Green Tea',
  description: 'A soothing cup of green tea.',
  temperature: '80°C',
  brew_time: '3 minutes'
)

tea2 = Tea.create!(
  title: 'Black Tea',
  description: 'Bold and flavorful black tea.',
  temperature: '90°C',
  brew_time: '4 minutes'
)

# Subscriptions
Subscription.create!(
  title: 'Monthly Green Tea',
  price: 19.99,
  status: 'active',
  frequency: 'monthly',
  tea: tea1,
  customer: customer1
)

Subscription.create!(
  title: 'Weekly Black Tea',
  price: 14.99,
  status: 'cancelled',
  frequency: 'weekly',
  tea: tea2,
  customer: customer2
)