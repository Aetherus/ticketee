# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_admin = User.create(email: 'seed@ticketee.com',
                        password: 'P@ssw0rd')
sample_admin.admin = true
sample_admin.confirm!

sample_project = Project.create(name: 'Ticketee Beta')
