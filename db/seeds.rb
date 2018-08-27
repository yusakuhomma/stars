# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Department.create(name: '社長',display: 1)
Department.create(name: '取締役',display: 2)
Department.create(name: '映像事業本部長',display: 3)
Department.create(name: '開発本部/技術開発室/R&Dグループ',display: 100)


Category.create(name: '外国語',display: 10)
Category.create(name: 'プログラミング言語',display: 30)
