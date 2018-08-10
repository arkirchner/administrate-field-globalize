require "administrate/field/globalize/string"

describe Administrate::Field::Globalize::String do
  describe "#to_partial_path" do
    it "returns a partial based on the page being rendered" do
      page = :show
      field = Administrate::Field::Globalize::String.new(:name, "foo", page)

      path = field.to_partial_path

      expect(path).to eq("/fields/globalize/string/#{page}")
    end
  end
end
