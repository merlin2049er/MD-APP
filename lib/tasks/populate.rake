# frozen_string_literal: true

namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'populator'

    [Category, Product, Cart, User].each(&:delete_all)
    [Photo].each(&:delete_all)
    [Activity].each(&:delete_all)
#    [Commontator_comment].each(&:delete_all)
#    [Commontator_subscription].each(&:delete_all)
#    [Commontator_thread].each(&:delete_all)
    [Contact].each(&:delete_all)
    [Impression].each(&:delete_all)
    [Invite].each(&:delete_all)
    [Notification].each(&:delete_all)
    [Request].each(&:delete_all)
    [Transaction].each(&:delete_all)
    [Vote].each(&:delete_all)

    Category.populate 15 do |category|
      category.name = Populator.words(1..2).titleize
      category.picurl = ['photo_not_available.png']

      Product.populate 1..15 do |product|
        product.title = Populator.words(1..5).titleize
        product.template = Populator.sentences(2..10)
        product.price = [5.99, 19, 99, 29.99, 49.99]
        product.msrp =  [6.99, 21, 99, 39.99, 69.99]
        product.draft =  [false]
        product.active = [true]
        product.funded = [false]
        product.category_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        product.qty = [5, 10, 15]
        product.startdate = ['2020-1-4']
        product.enddate = ['2020-2-4']
        product.picurl = ['/photo_not_available.png']
      end
    end
  end
end
