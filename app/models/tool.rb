class Tool < ActiveRecord::Base

  def formatted_price
    price / 100.to_f
  end
end
