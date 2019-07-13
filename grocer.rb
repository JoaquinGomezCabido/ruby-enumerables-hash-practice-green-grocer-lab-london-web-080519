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
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  cart_consolidated = consolidate_cart(cart)
  discounted_cart = apply_coupons(cart_consolidated, coupons)
  cleared_cart = apply_clearance(discounted_cart)

  check = cleared_cart.reduce do |total, element|
    total += element[1][:price]
  end

  if check > 100
    check = (check * 0.9).round(2)
  end
  check
end
