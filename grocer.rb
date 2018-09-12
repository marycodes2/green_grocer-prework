cart_hash = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

coupon = [
    {:item => "AVOCADO", :num => 2, :cost => 5.00},
		{:item => "BEER", :num => 2, :cost => 20.00},
		{:item => "CHEESE", :num => 3, :cost => 15.00}
		]

def consolidate_cart(cart)
  count_dict = {}
  item_list = []
  new_cart_dict = {}
  cart.each do |item_hash|
    item_hash.each do |item, information_hash|
      item_list << item
        item_list.each do |item_in_list|
          count_dict[item_in_list] = item_list.count(item_in_list)
          new_cart_dict[item] = information_hash
        end
      count_dict.each do |grocery_item, count|
        if grocery_item == item
          new_cart_dict[item][:count] = count
        end
      end 
    end
  end
  new_cart_dict
end

def apply_coupons(cart, coupons)
  new_cart_dict = {}
  cart.each do |item, information_hash|
    coupons.each do |coupon|
      new_cart_dict[item] = information_hash
      if item == coupon[:item]
        new_item_name = "#{item} W/COUPON"
        number_of_items_leftover = cart[item][:count].to_i -     coupon[:num].to_i
        new_cart_dict[item][:price] = cart[item][:price]
        new_cart_dict[item][:clearance] = cart[item][:clearance]
        new_cart_dict[item][:count] = number_of_items_leftover
        new_cart_dict[new_item_name] = {}
        new_cart_dict[new_item_name][:price] = coupon[:cost]
        new_cart_dict[new_item_name][:clearance] = cart[item][:clearance]
        new_cart_dict[new_item_name][:count] = 1
      end 
    end
  end 
  new_cart_dict
end

puts apply_coupons(cart_hash, coupon)

def apply_clearance(cart)
  
end

def checkout(cart, coupons)
  # code here
end
