def consolidate_cart(cart)
  # code here
  cart_consolidated = {}

  cart.each do |element|
    if cart_consolidated[element.keys[0]]
      cart_consolidated[element.keys[0]][:count] += 1
    else
      cart_consolidated[element.keys[0]] = {
          price: element.values[0][:price],
          clearance: element.values[0][:clearance],
          count: 1
        }
    end
  end
    cart_consolidated
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_name = "#{coupon[:item]} W/COUPON"
        if cart[new_name]
          cart[new_name][:count] += coupon[:num]
        else
          cart[new_name] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.keys.each do |item|
    if item[:clearance]
      item[:price] = (item[:price] * 0.8).round
    else
      #nothing
    end
  end
end

def checkout(cart, coupons)
  # code here
end
