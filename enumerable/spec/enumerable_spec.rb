require "enumerable"

describe Enumerable do

  describe ".my_select" do

    context "when there is no block" do
      it "returns enumerator" do
        expect(['a','b','c'].my_select).to eql(['a','b','c'])
      end
    end

    context "when selecting even numbers" do
      it "returns even numbers" do
        expect([1,2,3,4,5,6,7].my_select { |num| num.even? }).to eql([2,4,6])
      end
    end

    context "when selecting integers" do
      it "returns integers" do
        expect(['LOL',1,'2',3].my_select { |elem| elem.is_a? Integer }).to eql([1,3])
      end
    end
  end

  describe ".my_all?" do

    context "when no block given" do

      it "returns false if nil in element" do
        expect([true,true,nil].my_all?).to eql(false)
      end

      it "returns false if false in element" do
        expect([true,false].my_all?).to eql(false)
      end

      it "returns true if no false/nil in element" do
        expect([66,99,0,true].my_all?).to eql(true)
      end
    end

    context "when all elements meet condition" do

      it "returns true" do
        expect([1,1,3,4,5].my_all? { |num| num >= 0 }).to eql(true)
      end

      it "returns true" do
        expect(['wow','hey','okay'].my_all? { |word| word.length >= 3 }).to eql(true)
      end
    end

    context "when one/more element doesn't meet condition" do

      it "returns false" do
        expect([1,2,3,4,'5'].my_all? { |elem| elem.is_a? Integer }).to eql(false)
      end
    end
  end

  describe ".my_any?" do

    context "when no block given" do

      context "when one element is not nil" do
        it "returns true" do
          expect([1,nil].my_any?).to eql(true)
        end
      end

      context "when one element is not false" do
        it "returns true" do
          expect([4,false].my_any?).to eql(true)
        end
      end

      context "when all elements are false/nil" do
        it "returns false" do
          expect([false,nil,nil].my_any?).to eql(false)
        end
      end
    end

    context "when one or more element meets condition" do
      it "returns true" do
        expect(['ant','bear','cat'].my_any? { |word| word.length >= 4 }).to eql(true)
      end
    end

    context "when no elements meet condition" do
      it "returns false" do
        expect(['hey','wow','1'].my_any? { |elem| elem.is_a? Integer }).to eql(false)
      end
    end
  end
  
  describe ".my_none?" do

    context "when no block given" do

      context "when all elements are false/nil" do
        it "returns true" do
          expect([false,nil,nil].my_none?).to eql(true)
        end
      end

      context "when given empty object" do
        it "returns true" do
          expect([].my_none?).to eql(true)
        end
      end

      context "when one element is truthy value" do
        it "returns false" do
          expect([false,nil,1].my_none?).to eql(false)
        end
      end
    end

    context "when no elements meet condition" do
      it "returns true" do
        expect(%w{ant bear cat}.my_none? { |word| word.length == 5 }).to eql(true)
      end
    end

    context "when one element meets condition" do
      it "returns false" do
        expect(%w{ant bear cat}.my_none? { |word| word.length >= 4 }).to eql(false)
      end
    end 
  end

  describe ".my_count" do

    context "when no block given" do
      it "returns object size" do
        expect([1,2,3,4].my_count).to eql(4)
      end
    end

    context "when given argument" do
      it "returns number of items matching argument" do
        expect([2,2,3,2].my_count(2)).to eql(3)
      end
    end

    context "when given block" do
      it "returns number of items matching block condition" do
        expect([5,4,3,2,1,0].my_count { |num| num > 2 }).to eql(3)
      end
    end
  end

  describe ".my_map" do

    context "when no blocks given" do
      it "returns enumerator" do
        expect([1,2,3].my_map).to eql([1,2,3])
      end
    end

    context "when block given" do
      it "returns the result of the block for each object" do
        expect([1,2,3].my_map { |num| num * 2 }).to eql([2,4,6])
      end
      it "returns the result of the block for each object" do
        expect((1..3).my_map { "wow" }).to eql(["wow","wow","wow"])
      end
    end
  end
end