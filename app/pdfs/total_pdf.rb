class TotalPdf < Prawn::Document
    def initialize(total_per, day, view)
        super(top_margin: 70)
        @total_per = total_per
        @day = day
        @view = view
        font Rails.root.join("app/assets/fonts/Roboto-Regular.ttf")
        title_day
        list_order
        total_price
    end

    def title_day
        text "Thống kê doanh thu #{@day}", size: 30
    end 

    def list_order
        move_down 20
        table line_order_rows do 
            columns(1..3).align = :right 
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
        end
    end

    def line_order_rows
        [["Tên người mua", "Tổng tiền"]] + 
        @total_per.map do |order|
            [order.buyer.username, price(order.total)]
        end
    end

    def price(num)
        @view.number_to_currency_vnd(num)
    end

    def total_price 
        move_down 15 
        total = 0 
        @total_per.map do |order|
            total += order.total
        end
        text "Tổng tiền bằng #{price(total)}", size: 14 
    end

end