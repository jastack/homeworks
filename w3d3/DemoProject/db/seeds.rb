# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ranch_house = House.create(address:'609 Talbot')
utah_house = House.create(address: '1444 Yale Ave')

james = Person.create(name: 'James', house_id: ranch_house)
mike = Person.create(name: 'Mike', house_id: utah_house)
