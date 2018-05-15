require "caesar_cipher"

describe CaesarCipher do

  describe ".encode" do

    context "when '', 1" do
      it "returns ''" do
        expect(CaesarCipher.encode("", 1)).to eql("")
      end
    end

    context "when 'a', 1" do
      it "returns 'b'" do
        expect(CaesarCipher.encode("a", 1)).to eql("b")
      end
    end

    context "when 'A', 1" do
      it "returns 'B'" do
        expect(CaesarCipher.encode("A", 1)).to eql("B")
      end
    end

    context "when 'zZ', 1" do
      it "returns 'aA'" do
        expect(CaesarCipher.encode("zZ", 1)).to eql("aA")
      end
    end

    context "when 'Heart Shaker!', 16" do
      it "returns 'Xuqhj Ixqauh!'" do
        expect(CaesarCipher.encode("Heart Shaker!", 16)).to eql("Xuqhj Ixqauh!")
      end
    end

    context "when 'What is Love?', 345" do
      it "returns 'Doha pz Svcl?'" do
        expect(CaesarCipher.encode("What is Love?", 345)).to eql("Doha pz Svcl?")
      end
    end
  end
end