class Lookup

  def self.getrate(user)
     puts"=-=-=-=",user.inspect
     taxrate = Tax.find_by_prov_id(user.state)
     return taxrate.tax_rate
  end

end
