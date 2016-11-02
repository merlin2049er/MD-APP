namespace :db do
    desc "Erase and fill database"
    task :populate => :envirnonment do
        require 'populator'
        
        [Category, Product].each(&:delete_all)
        
         Category.populate 15 do |category|
         category.name = Populator.words(1..2).titleize
         
         Product.populate 1..15 do |product|
         product.title =  Populator.words(1..5).titleize
         product.template = Populator.sentences(2..10)
         product.price = [5.99,19,99, 29.99, 49.99]
         
    
      end  
    end
end
end