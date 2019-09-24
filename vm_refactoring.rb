class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @drink = {redbull:{ price: 200, stock: 5 },cola:{ price: 120, stock: 5 },water:{ price: 100, stock: 5 }}
    @slot_money = 0
    @sale_amount = 0
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    return money unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def operation(item)
    price = @drink[item.to_sym][:price]
    stock = @drink[item.to_sym][:stock]
    if stock > 0 && @slot_money >= price
      @drink[item.to_sym][:stock] -= 1
      @sale_amount += price
      @slot_money -= price
      return
    else
      return false
    end
  end

  def sale_amount
    return @sale_amount
  end

  # ---管理用メソッド---

  def stock(item="all")
    if item == "all"
      keyArray = []
      valueArray = []
      @drink.each do |array|
        keyArray << array[0]
        valueArray << array[1][:stock]
      end
        ary = [keyArray,valueArray].transpose
        stock = Hash[*ary.flatten]
    else
      stock = @drink[item.to_sym][:stock]
    end
    return stock
  end

  def store(item, add)
    @drink[item.to_sym][:stock] += add.to_i
  end

  def append(add_name, add_price, add_stock)
    add_juice = Hash[add_name.to_sym,{price: add_price, stock: add_stock}]
    @drink.merge!(add_juice)
  end
end

# load '/Users/roadfox303/workspace/vm_refactoring.rb'
# vm = VendingMachine.new
