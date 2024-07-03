# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Booking.destroy_all
Flat.destroy_all

laura = User.create!(
  email: 'laura@gmail.com',
  password: 'angrylolo',
  pseudo: 'lolo',
  admin: true
)

aymeric = User.create!(
  email: 'aymeric@gmail.com',
  password: 'angryricou',
  pseudo: 'ricou',
  admin: true
)

Flat.create!(
  name: 'Historic in Paris',
  address: '12 Place de la république, Paris',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3,
  user: laura
)

Flat.create!(
  name: 'Soleil à Marseille',
  address: '20 rue Théophile Decanis, Marseille',
  description: 'Soleil, Pastis et Pétanque',
  price_per_night: 75,
  number_of_guests: 3,
  user: aymeric
)

# Flat.create!(
#   name: 'Caliente in Ciudad Real',
#   address: 'Calle Carril de la Fuente 85',
#   description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
#   price_per_night: 75,
#   number_of_guests: 3
# )
