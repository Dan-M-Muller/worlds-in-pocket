# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts'destruindo user'
User.destroy_all

puts'criando user'

User.create!(email: 'julin@realuser.com', password: '123456', first_name: 'Julinho', last_name: 'Balinha', age: 17)
User.create!(email: 'juju@user.com', password: '123456', first_name: 'Julio', last_name: 'Balas', age: 25)
User.create!(email: 'jukaliao@user.com', password: '123456', first_name: 'Juliao', last_name: 'Balao', age: 45)
User.create!(email: 'superjuca@user.com', password: '123456', first_name: 'Juliaozao', last_name: 'Balaozao', age: 51)
User.create!(email: 'jusi@user.com', password: '123456', first_name: 'Julia', last_name: 'Balah', age: 29)
User.create!(email: "juvbargao@emailreal.confia", password: '123456', first_name: "Juvenal", last_name: "Borga", age: 13)
User.create!(email: "zein@emailreal.confia", password: '123456', first_name: "Jose", last_name: "Adarmiro", age: 26)
User.create!(email: "luruta@emailreal.confia", password: '123456', first_name: "Luciana", last_name: "Rutamorao", age: 22)
User.create!(email: "a.remora@emailreal.confia", password: '123456', first_name: "Andrea", last_name: "Moraci Redoma", age: 14)
User.create!(email: "albertin_tilim@emailreal.confia", password: '123456', first_name: "Hodalberto", last_name: "Tilimpiado", age: 18)

puts "Criou todos usuarios"
