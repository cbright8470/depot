class Product < ActiveRecord::Base
  
  def self.find_products_for_sale
    find(:all, :order => "title" )
  end

  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :cost_must_be_at_least_one_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
    :with=> %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG ' +
    'or PNG image.'
  validates_length_of  :title, :minimum => 10  


protected
  def cost_must_be_at_least_one_cent
    errors.add(:price, 'must be at least one cent') if price.nil? ||
      price < 0.01
  end    
end
