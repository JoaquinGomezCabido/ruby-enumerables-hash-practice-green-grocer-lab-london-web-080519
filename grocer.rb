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
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
