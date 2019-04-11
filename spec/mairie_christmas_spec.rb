require_relative "../lib/mairie_christmas"



describe "the get_city function" do

  test = get_city

  it "should return more than 100 city_halls" do
    expect(test.length > 100).to eq(true)
  end
end

