require "spec_helper"
require "mega_lotto/helper"

class FakeView
  include MegaLotto::Helper
end

describe FakeView do
  describe "#mega_lotto_drawing" do
    it "delegates to MegaLotto::Drawing#draw" do
      drawing = double("drawing")
      allow(MegaLotto::Drawing).to receive(:new).and_return(drawing)
      expect(drawing).to receive(:draw)
      FakeView.new.mega_lotto_drawing
    end
  end
end