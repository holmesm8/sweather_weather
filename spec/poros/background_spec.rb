require 'rails_helper'

RSpec.describe Background do
  it 'exists with attributes' do
    data = {
 :results=>
  [{:id=>"pBtdIO99UIc",
    :created_at=>"2019-10-08T21:44:07-04:00",
    :updated_at=>"2020-02-07T00:02:42-05:00",
    :promoted_at=>nil,
    :width=>1944,
    :height=>2592,
    :color=>"#5EC0FF",
    :description=>"Colin McIntosh sheetsgiggles.com",
    :alt_description=>"wide-angle photography of buildings during daytime",
    :urls=>
     {:raw=>"https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyODU4MX0",
      :full=>"https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEyODU4MX0",
      :regular=>"https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyODU4MX0",
      :small=>"https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjEyODU4MX0",
      :thumb=>"https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjEyODU4MX0"},
    :links=>
     {:self=>"https://api.unsplash.com/photos/pBtdIO99UIc",
      :html=>"https://unsplash.com/photos/pBtdIO99UIc",
      :download=>"https://unsplash.com/photos/pBtdIO99UIc/download",
      :download_location=>"https://api.unsplash.com/photos/pBtdIO99UIc/download"},
    :categories=>[],
    :likes=>20,
    :liked_by_user=>false,
    :current_user_collections=>[],
    :user=>
     {:id=>"uCjRDd85Gm8",
      :updated_at=>"2020-04-18T14:22:22-04:00",
      :username=>"melissamullinator",
      :name=>"Melissa Van Gogh",
      :first_name=>"Melissa",
      :last_name=>"Van Gogh",
      :twitter_username=>"thehealthymel",
      :portfolio_url=>"http://Thehealthymelissa.com",
      :bio=>"Tag me on insta @thehealthymelissa",
      :location=>"Florida",
      :links=>
       {:self=>"https://api.unsplash.com/users/melissamullinator",
        :html=>"https://unsplash.com/@melissamullinator",
        :photos=>"https://api.unsplash.com/users/melissamullinator/photos",
        :likes=>"https://api.unsplash.com/users/melissamullinator/likes",
        :portfolio=>"https://api.unsplash.com/users/melissamullinator/portfolio",
        :following=>"https://api.unsplash.com/users/melissamullinator/following",
        :followers=>"https://api.unsplash.com/users/melissamullinator/followers"},
      :profile_image=>
       {:small=>"https://images.unsplash.com/profile-1560520480097-c6b5d4435ac8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
        :medium=>"https://images.unsplash.com/profile-1560520480097-c6b5d4435ac8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
        :large=>"https://images.unsplash.com/profile-1560520480097-c6b5d4435ac8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
      :instagram_username=>"thehealthymelissa",
      :total_collections=>4,
      :total_likes=>1183,
      :total_photos=>110,
      :accepted_tos=>true},
    :tags=>[{:type=>"search", :title=>"banister"}, {:type=>"search", :title=>"handrail"}, {:type=>"search", :title=>"office building"}]}]}
    background = Background.new(data)

    expect(background).to be_a Background
    expect(background.id).to eq(nil)
    expect(background.url).to eq(data[:results][0][:urls][:full])
  end
end
