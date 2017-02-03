namespace :db do
    desc "Erase and fill database"
    task :populate => :environment do
        require 'populator'
        
        [Category, Product].each(&:delete_all)
        
         Category.populate 15 do |category|
         category.name = Populator.words(1..2).titleize
         
         Product.populate 1..15 do |product|
         product.title =  Populator.words(1..5).titleize
         product.template = Populator.sentences(2..10)
         product.price = [5.99,19,99, 29.99, 49.99]
         product.msrp =  [6.99,21,99, 39.99, 69.99]
         product.draft =  [true, false]
         product.active = [true, false]
         product.funded = [true, false]
         product.category_id = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
         product.qty = [5,10,15]
         product.startdate = ['2017-2-3' ]
         product.enddate = ['2017-3-30']
         product.picurl = ['photo_not_available.png']
    
      end  
    end
end
end