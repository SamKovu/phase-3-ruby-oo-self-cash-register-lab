require 'pry'

class CashRegister

    attr_reader  :discount
    attr_accessor :total , :previous_total ,:items

    def initialize(discount=0)
        @discount=discount.to_f
        @total=0
        @items=[]    
    end


    def add_item( title, price, quantity=1)
        self.previous_total=self.total
        self.total+=price*quantity
        quantity.times do |i|
            self.items.push(title)
        end
    end

    def apply_discount
       
        if self.discount>0
             self.total=self.total-self.total*(self.discount/100.0)
             "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total=self.previous_total
    end


end