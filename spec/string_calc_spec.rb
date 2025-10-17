describe "#add" do
  it "returns 0 when the input is an empty string" do
    add("")
  end

  it "returns the number D when the input is 'D'" do
    expect(add("2")).to eq(2)
  end
end