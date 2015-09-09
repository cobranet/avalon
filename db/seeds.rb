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
              { name: "Obreon", oznaka: "F", image: "oberon.png"},
              { name: "Loyal Servants of Arthur", oznaka: "G", image: "lsoa.png"},
              { name: "Minion of Mordred" , oznaka: "H", image: "minion.png" },
              { name: "Loyal Servants of Arthur", oznaka: "I", image: "lsoa1.png"},
              { name: "Loyal Servants of Arthur", oznaka: "J", image: "lsoa2.png"},
              { name: "Loyal Servants of Arthur", oznaka: "K", image: "lsoa3.png"},
              { name: "Loyal Servants of Arthur", oznaka: "L", image: "lsoa4.png"},
              { name: "Minion of Mordred" , oznaka: "M", image: "minion1.png" },
              { name: "Minion of Mordred" , oznaka: "N", image: "minion2.png" }
              
              
             ]

characters.each do |c|
  Character.create(c)
end  

Variant.delete_all
variants = [ { description: "Standard", num_of_players: 5, oznake: "ABGIH"},
             { description: "Standard", num_of_players: 6, oznake: "ABGIHJ"},
             { description: "Standard", num_of_players: 7, oznake: "ABGIHJH"},
             { description: "Standard", num_of_players: 8, oznake: "ABGIHJMK"},
             { description: "Standard", num_of_players: 9,  oznake:"ABHGIMJK"},
             { description: "Standard", num_of_players: 10,  oznake:"ABGIHJMKLN"},

             { description: "PercivalMorgana", num_of_players: 5,  oznake:"ABGCE"},
             { description: "PercivalMorgana", num_of_players: 6,  oznake:"ABGICE"},
             { description: "PercivalMorgana", num_of_players: 7,  oznake:"ABGIHCE"},
             { description: "PercivalMorgana", num_of_players: 8,  oznake:"ABGIHJCE"},
             { description: "PercivalMorgana", num_of_players: 9,  oznake:"ABGIHJCEK"},
             { description: "PercivalMorgana", num_of_players: 10,  oznake:"ABGIHJMKCE"},

             { description: "PercivalMordred", num_of_players: 5,  oznake:"ABGCD"},
             { description: "PercivalMordred", num_of_players: 6,  oznake:"ABGICD"},
             { description: "PercivalMordred", num_of_players: 7,  oznake:"ABGIHCD"},
             { description: "PercivalMordred", num_of_players: 8,  oznake:"ABGIHJDCD"},
             { description: "PercivalMordred", num_of_players: 9,  oznake:"ABGIHJCDK"},
             { description: "PercivalMordred", num_of_players: 10,  oznake:"ABGIHJMKCD"},

             { description: "OberonMordred", num_of_players: 5,  oznake:"ABGFD"},
             { description: "OberonMordred", num_of_players: 6,  oznake:"ABGIFD"},
             { description: "OberonMordred", num_of_players: 7,  oznake:"ABGIHFD"},
             { description: "OberonMordred", num_of_players: 8,  oznake:"ABGIHJDFD"},
             { description: "OberonMordred", num_of_players: 9,  oznake:"ABGIHJFDK"},
             { description: "OberonMordred", num_of_players: 10,  oznake:"ABGIHJMKFD"},


             { description: "OberonMorgana", num_of_players: 5,  oznake:"ABGCF"},
             { description: "OberonMorgana", num_of_players: 6,  oznake:"ABGICF"},
             { description: "OberonMorgana", num_of_players: 7,  oznake:"ABGIHCF"},
             { description: "OberonMorgana", num_of_players: 8,  oznake:"ABGIHJCF"},
             { description: "OberonMorgana", num_of_players: 9,  oznake:"ABGIHJCFK"},
             { description: "OberonMorgana", num_of_players: 10,  oznake:"ABGIHJMKCF"},

             
           ]

variants.each do |v|
  Variant.create(v)
end

