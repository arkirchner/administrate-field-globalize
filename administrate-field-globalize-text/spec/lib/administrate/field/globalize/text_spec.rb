require "administrate/field/globalize/text"

describe Administrate::Field::Globalize::Text do
  describe "#to_partial_path" do
    it "returns a partial based on the page being rendered" do
      page = :show
      field = Administrate::Field::Globalize::Text.new(:name, "foo", page)

      path = field.to_partial_path

      expect(path).to eq("/fields/globalize/text/#{page}")
    end
  end
end
