json.extract! @party, :name, :location, :guests

json.array! @guests do |guest|
    @guest.gift
end