# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# The first step of any seed file should be to destroy all current records
Artwork.destroy_all
User.destroy_all
ArtworkShare.destroy_all

# Good practice to destroy data with references first i.e. Drops reference user_ids,
# users reference location_ids

aw1 = Artwork.create(title: 'screamingman', image_url: 'google', artist_id: u1.id)
aw2 = Artwork.create(title: 'monalisa', image_url: 'yahoo', artist_id: u1.id)
aw3 = Artwork.create(title: 'meltingclock', image_url: 'msn', artist_id: u2.id)
aw4 = Artwork.create(title: 'mountain', image_url: 'baidu', artist_id: u2.id)

u1 = User.create(username: 'Apple')
u2 = User.create(username: 'Banana')
u3 = User.create(username: 'Canteloupe')
u4 = User.create(username: 'Durian')
u5 = User.create(username: 'Egg')
u6 = User.create(username: 'Fruit')

ArtworkShare.create!(artwork_id: aw1.id, viewer_id: u2.id)
ArtworkShare.create!(artwork_id: aw2.id, viewer_id: u2.id)
#---------------------------------------------------------------
# user1 = User.create!(username: 'robert')
# user2 = User.create!(username: 'bill')

# artwork1 = Artwork.create!(title: 'nighthawks', image_url: 'google.com', artist_id: user1.id)
# artwork2 = Artwork.create!(title: 'mona lisa', image_url: 'google1.com', artist_id: user2.id, favorite: true)


# comment1 = Comment.create!(body: 'great!', user_id: user1.id, artwork_id: artwork1.id)
# comment2 = Comment.create!(body: 'another great one', user_id: user2.id, artwork_id: artwork2.id)

# Like.create!(user_id: user1.id, likeable_id: comment1.id, likeable_type: 'Comment')
# Like.create!(user_id: user2.id, likeable_id: artwork2.id, likeable_type: 'Artwork')

# Like.create!(user_id: user1.id, likeable_id: artwork2.id, likeable_type: 'Artwork')
# Like.create!(user_id: user2.id, likeable_id: comment1.id, likeable_type: 'Comment')