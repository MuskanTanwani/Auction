class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  private

  def self.maximum_bid(product_id)
    @maxbid = Bid.where(product_id: product_id).maximum(:current_bid)
    @maxbid = 0 unless @maxbid.present?
 
    return @maxbid
  end
end
