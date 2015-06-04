require 'spec_helper'

module MegaLotto
  describe VERSION do
    it 'has a version number' do
      expect(MegaLotto::VERSION).not_to be nil
    end
  end

  describe Drawing do
    describe "#draw" do
      let(:draw) { MegaLotto::Drawing.new.draw }

      it "returns an array" do
        expect(draw).to be_a(Array)
      end
       
      it "returns an array with 6 elements" do
        expect(draw.size).to eq(6)
      end

      it "each element is an integer" do
        draw.each do |drawing|
          expect(drawing).to be_a(Integer)
        end
      end

      it "each element is less than 60" do
        draw.each do |drawing|
          expect(drawing).to be < 60
        end
      end
    end
  end

  describe "#configure" do
    before do
      MegaLotto.configure do |config|
        config.drawing_count = 10
      end
    end

    it "returns an array with 10 elements" do
      draw = MegaLotto::Drawing.new.draw
      expect(draw).to be_a(Array)
      expect(draw.size).to eq(10)
    end

    after :each do
      MegaLotto.reset
    end
  end

  describe ".reset" do
    before :each do
      MegaLotto.configure do |config|
        config.drawing_count = 10
      end
    end

    it "resets the configuration" do
      MegaLotto.reset

      config = MegaLotto.configuration

      expect(config.drawing_count).to eq(6)
    end
  end
end
