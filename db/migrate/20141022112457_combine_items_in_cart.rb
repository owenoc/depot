class CombineItemsInCart < ActiveRecord::Migration
  def up
	  Cart.all.each do |cart|
	  sums = cart.line_items.group(:product_id).sum(:quantity)
	  sums.each do |product_id, quantity|
		  if quantity > 1

		    # remove individual items
		    cart.line_items.where(product_id: product_id).delete_all

		    # replace with single item and record quantity
		    item = cart.line_items.build(product_id: product_id)
		    item.quantity = quantity
		    item.save!
	  	  end
	  end
	  end
  end
  def down
  LineItem.where("quantity>1").item do |item|

  # add individual items
	  item.quantity.each do 
	    LineItem.create(cart_id: item.cart_id,
	      product_id: product_id.times, quantity: 1)
	  end

	  # remove original item
	  item.destroy
	end      
  end
end
