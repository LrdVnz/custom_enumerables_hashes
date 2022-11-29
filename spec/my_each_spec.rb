require './lib/enumerable.rb'

describe Enumerable do 
   subject(:hash)  { {:a => 1, :b => 3, :c => 6} }
   describe ".my-each" do

      it "returns an empty hash if the block is empty" do
         
         expect(hash.my_each { |key, value| #nothing here
         }).to eq(hash)

      end

      it "passes the block on each key-value pair" do
          my_each_result = {}
         each_result = {}
          
         hash.my_each { |key, value| 
            my_each_result[key] = value 
         }

         hash.each { |key, value| 
            each_result[key] = value 
         }

          expect(my_each_result).to eq(each_result)
          
      end
   end
end