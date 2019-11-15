class Lookup

  def self.getrate(user)
     puts"=-=-=-=",user.inspect
     taxrate = Tax.find_by_prov_id(user.state)

    if taxrate.nil?
        return tax_rate = 0.0
    else
     return taxrate.tax_rate
   end
   
  end

end
