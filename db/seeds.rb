# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Flat.destroy_all
Booking.destroy_all
User.destroy_all

# Flat.create!(
#   name: 'Cosy in Amsterdam',
#   address: 'Zeedijk 1 1012 AN Amsterdam',
#   description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
#   price_per_night: 75,
#   number_of_guests: 3
# )

# Flat.create!(
#   name: 'Light & Spacious Garden Flat London',
#   address: '10 Clifton Gardens London W9 1DT',
#   description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
#   price_per_night: 75,
#   number_of_guests: 3
# )
User.create!(
  email: 'laura@gmail.com',
  password: 'angrylolo',
  pseudo: 'lolo'
)

Flat.create!(
  name: 'Historic in Paris',
  address: '16 Villa Gaudelet, Paris',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3,
  user_id: User.first.id
)

User.create!(
  email: 'aymeric@gmail.com',
  password: 'angryricou',
  pseudo: 'ricou'
)

Flat.create!(
  name: 'Soleil à Marseille',
  address: '20 rue Théophile Decanis, Marseille',
  description: 'Soleil, Pastis et Pétanque',
  price_per_night: 75,
  number_of_guests: 3,
  user_id: User.last.id
)

# Flat.create!(
#   name: 'Caliente in Ciudad Real',
#   address: 'Calle Carril de la Fuente 85',
#   description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
#   price_per_night: 75,
#   number_of_guests: 3
# )
