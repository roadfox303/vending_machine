class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @juice = [
      { name: "redbull", price: 200, stock: 5 },
      { name: "cola", price: 120, stock: 5 },
      { name: "water", price: 100, stock: 5 }
    ]
    @slot_money = 0
    @sale_amount = 0
    @price = 0
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

  def operation(drink)
    index = 0
    @juice.each do | array |
      if drink == array[:name]
        @price = array[:price]
        break
      end
      index += 1
    end
    if @juice[index][:stock] > 0 && @slot_money >= @price
      @juice[index][:stock] -= 1
      @sale_amount += @price
      @slot_money -= @price
      return
    else
      return false
    end
  end

  # ---管理用メソッド---
  def sale_amount
    return @sale_amount
  end

  def stock(item)
    if item == "all"
      @stock = []
      @juice.each do |array|
        @stock << [array[:name],array[:stock]]
      end
    else
      @juice.each do |array|
        if item == array[:name]
          @stock = array[:stock]
          break
        end
      end
    end
    return @stock
  end

  def store(item, add)
    index = 0
    @juice.each do |array|
      if item == array[:name]
        break
      end
      index += 1
    end
    @juice[index][:stock] += add.to_i
  end

  def append(name, price, stock)
    @juice << {name: name, price: price, stock: stock}
  end
end

# require '/Users/roadfox303/workspace/vm_refactor.rb'
# vm = VendingMachine.new
