# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.find_or_create_by(status_name: "Active")
Status.find_or_create_by(status_name: "Inactive")
Status.find_or_create_by(status_name: "Pending")
Status.find_or_create_by(status_name: "Buyback")
Status.find_or_create_by(status_name: "Auto Restock")

PaymentStatus.find_or_create_by(payment_status: "Paid")
PaymentStatus.find_or_create_by(payment_status: "Unpaid")

Package.find_or_create_by(
	package_name: "KJ01",
	selling_price: "170",
	buying_price: "184"
)
Package.find_or_create_by(
	package_name: "KJ02",
	selling_price: "200",
	buying_price: "220"
)
Package.find_or_create_by(
	package_name: "KJ03",
	price: "1230",
	term_contract: "11 month"
)
Package.find_or_create_by(
	package_name: "KJ04",
	price: "5450",
	term_contract: "5 month"
)
Package.find_or_create_by(
	package_name: "KJ DELUXE",
	price: "3000",
	term_contract: "12 month"
)

Discount.find_or_create_by(
	discount_date: "17th every month",
	discount_price: "100"
)
Discount.find_or_create_by(
	discount_date: "28th every month",
	discount_price: "100"
)

user = User.create! :login => 'administrator',
                    :email => 'admin@demo.com',
                    :password => 'password',
                    :password_confirmation => 'password',
                    :admin => '1',
                    :created_at => '2014-09-11 14:14:00',
                    :updated_at => '2014-09-11 14:14:14',
                    :confirmed_at => '2014-09-11 14:14:14',
                    :confirmation_sent_at => '2014-09-11 14:14:00',
                    :sign_in_count => '0'