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

   describe ".my-any?" do 
      
      let (:result) { false }

       context "when passed an empty block" do
          it "returns true if self isn't empty" do
              proc_bloc = Proc.new {}
              result = hash.my_any?(proc_bloc)
              expect(result).to eq(true)
          end
       end

       context "when passed a valid block with conditions"  do
          it "returns true if an element satisfies it" do
              bloc_proc = Proc.new { |key, value| value > 5 }

              result = hash.my_any?(bloc_proc) 
              expect(result).to eq(true)

          end

         it "returns false if an element doesn't satisfy it" do
              
             bloc_proc = Proc.new { |key, value| key == 'f' }
             result = hash.my_any?(bloc_proc)
             expect(result).to eq(false)

         end
       end
   end
end