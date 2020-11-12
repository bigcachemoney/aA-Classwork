json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :image_url, :item_ids
# json.item_ids @pokemon.items.map { |i| i.id }

#use do end block to get object
json.items do
    @pokemon.items.each do |item|
        json.set! item.id do
            json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
        end
    end
end

#with outer array
# json.items @pokemon.items do |item|
#     json.set! item.id do
#         json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
#     end
# end