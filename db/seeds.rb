# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Character.delete_all
characters = [{ name: "Merlin" , oznaka: "A",  image: "merlin.png" },
              { name: "Assassin" , oznaka: "B", image: "assassin.png"},
              { name: "Percival", oznaka: "C", image: "percival.png"},
              { name: "Modred", oznaka: "D" , image: "modred.png" },
              { name: "Morgana", oznaka: "E", image: "morgana.png" },
              { name: "Obreon", oznaka: "F", image: "obreon.png"},
              { name: "Loyal Servants of Arthur", oznaka: "G", image: "lsoa.png"},
              { name: "Minion of Mordred" , oznaka: "H", image: "minion.png" }]

characters.each do |c|
  Character.create(c)
end  

Variant.delete_all
variants = [ { description: "Standard 5 player", num_of_players: 5, oznake: "ABGGH"},
             { description: "Standard 6 player", num_of_players: 6, oznake: "ABGGHG"},
             { description: "Standard 7 player", num_of_players: 7, oznake: "ABGGHGH"},
             { description: "Standard 8 player", num_of_players: 8, oznake: "ABGGHGHG"},
             { description: "Standard 9 player", num_of_players: 9,  oznake:"ABGGHGHGG"},
             { description: "Standard 9 player", num_of_players: 10,  oznake:"ABGGHGHGGH"},

             { description: "PercivalMorgana 5 player", num_of_players: 5,  oznake:"ABGCE"},
             { description: "PercivalMorgana 6 player", num_of_players: 6,  oznake:"ABGGCE"},
             { description: "PercivalMorgana 7 player", num_of_players: 7,  oznake:"ABGGHCE"},
             { description: "PercivalMorgana 8 player", num_of_players: 8,  oznake:"ABGGHGCE"},
             { description: "PercivalMorgana 9 player", num_of_players: 9,  oznake:"ABGGHGCEG"},
             { description: "PercivalMorgana 10 player", num_of_players: 10,  oznake:"ABGGHGHGCE"},

             { description: "PercivalMordred 5 player", num_of_players: 5,  oznake:"ABGCD"},
             { description: "PercivalMordred 6 player", num_of_players: 6,  oznake:"ABGGCD"},
             { description: "PercivalMordred 7 player", num_of_players: 7,  oznake:"ABGGHCD"},
             { description: "PercivalMordred 8 player", num_of_players: 8,  oznake:"ABGGHGCD"},
             { description: "PercivalMordred 9 player", num_of_players: 9,  oznake:"ABGGHGCDG"},
             { description: "PercivalMordred 10 player", num_of_players: 10,  oznake:"ABGGHGHGCD"},
             
           ]

variants.each do |v|
  Variant.create(v)
end

