class CreateAddManufacturerurlToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :manufacturerurl, :string
  end

end
