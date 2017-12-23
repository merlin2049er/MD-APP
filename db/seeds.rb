# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

if Rails.env.development?
  User.destroy_all
  Category.destroy_all
  Product.destroy_all
end

User.create!(
  email: 'admin@example.com',
  password: 'foobar1234',
  password_confirmation: 'foobar1234',
  admin: true,
  firstname: 'Admin',
  lastname: 'User',
  username: 'adminuser',
  confirmed_at: Time.now
)

User.create!(
  email: 'user@example.com',
  password: 'foobar1234',
  password_confirmation: 'foobar1234',
  firstname: 'Regular',
  lastname: 'User',
  username: 'regularuser',
  confirmed_at: Time.now
)

Category.create!(name: 'Airsoft')
Product.create!(
  title: 'Rifle',
  template: 'Airsoft Rifle Bio',
  price: 100.0,
  msrp: 200.0,
  startdate: Date.today,
  enddate: Date.today + 20.days,
  category: Category.find_by(name: 'Airsoft'),
  qty: 5,
  length: 8,
  width: 8,
  height: 8,
  weight: 10
)

Category.create!(name: 'Computers')
Product.create!(
  title: 'MacBook',
  template: 'MacBook Pro 15"',
  price: 1000.0,
  msrp: 1500.0,
  startdate: Date.today - 1.days,
  enddate: Date.today + 18.days,
  category: Category.find_by(name: 'Computers'),
  qty: 10,
  length: 20,
  width: 10,
  height: 5,
  weight: 10
)

Category.create!(name: 'Video Games')
Product.create!(
  title: 'Halo',
  template: 'Halo 5 for PS4',
  price: 25.0,
  msrp: 75.0,
  startdate: Date.today - 2.days,
  enddate: Date.today + 20.days,
  category: Category.find_by(name: 'Video Games'),
  qty: 10,
  length: 10,
  width: 8,
  height: 1,
  weight: 1
)