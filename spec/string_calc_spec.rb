describe "#add" do
  it "returns 0 when the input is an empty string" do
    add("")
  end

  it "returns the number D when the input is 'D'" do
    expect(add("2")).to eq(2)
  end

  it "returns 6 when the input is '2,4'" do
    expect(add("2,4")).to eq(6)
  end

  it "returns 10 when the input is '2,4,1,3'" do
    expect(add("2,4,1,3")).to eq(10)
  end

  it 'returns 6 when the input is "1\n2,3"' do
    expect(add("1\n2,3")).to eq(6)
  end

  it "throws an error when input string is invalid e.g. '1,\\n'" do
    expect { add("1,\n") }.to raise_error(RuntimeError, "Invalid string")
  end
end