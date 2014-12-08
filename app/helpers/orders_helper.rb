module OrdersHelper

  def order_active(order)
		order.status.status_name == "Active"
	end

  def order_inactive(order)
		order.status.status_name == "Inactive"
	end

  def order_pending(order)
		order.status.status_name == "Pending"
	end

  def order_buyback(order)
		order.status.status_name == "Buyback"
	end

end
