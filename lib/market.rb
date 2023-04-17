require 'date'

class Market
  attr_reader :name,
              :vendors,
              :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime("%d/%m/%Y")
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

  def overstocked_items
    o_items = []
    total_inventory.each do |item, info|
      o_items << item if info[:quantity] > 50 && info[:vendors].count > 1
    end
    o_items
  end
  # An array of Item objects that are overstocked. 
  # An item is overstocked if it is sold by more than 1 vendor 
  # AND the total quantity is greater than 50.

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end
	# An array of the names of all items the Vendors have in stock, 
  # sorted alphabetically. This list should not include any duplicate items.
end