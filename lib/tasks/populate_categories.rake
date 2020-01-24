# frozen_string_literal: true

namespace :db do
  desc 'Erase and fill database categories'
  task populate_categories: :environment do
    require 'populator'

    [Category ].each(&:delete_all)

    Category.populate 15 do |category|
      category.name = Populator.words(1..2).titleize
      category.picurl = ['photo_not_available.png']
    end

  end
end
