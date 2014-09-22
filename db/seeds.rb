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