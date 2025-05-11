# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users
users = User.create!([
  { name: "Nihal" },
  { name: "Ahmed" },
  { name: "Sara" }
])

# Create Editors
editors = Editor.create!([
  { name: "Editor A" },
  { name: "Editor B" },
  { name: "Editor C" }
])

# Create Posts with creator association and assign random editors
users.each_with_index do |user, i|
  2.times do |j|
    post = Post.create!(
      title: "Post #{j + 1} by #{user.name}",
      content: "This is post number #{j + 1} by #{user.name}.",
      creator_id: user.id
    )

    # Assign 2 random editors
    post.editors << editors.sample(2)
  end
end
