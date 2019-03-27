# frozen_string_literal: true

class Discount
  def self.calculate_percentage_discount(msrp, mdrp)
    ((msrp.to_f - mdrp.to_f) / msrp.to_f * 100).to_i
  end
end
