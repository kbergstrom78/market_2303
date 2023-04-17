class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    sources = []
    @vendors.each do |vendor|
      sources << vendor if vendor.inventory[item] > 0
    end
    sources
  end

  def total_inventory
    market_total = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        sum_total = vendors_that_sell(item).sum do |sum_vendor|
          sum_vendor.inventory[item]
        end
        market_total[item] = {quantity: sum_total, vendors: vendors_that_sell(item)}
      end
    end
    market_total
  end
end