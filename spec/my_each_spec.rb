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


   describe ".my_each_key" do 
      context "when given no block" do
        it "returns the original hash" do 
           resulting_hash = hash.my_each_key 

            expect(resulting_hash).to eq(hash)

        end
      end

      context "when given a valid block" do
        it "runs the block on each key" do
         my_each_key_array = []
         each_key_array = []
         
         hash.my_each_key  { |key| 
            my_each_key_array.push(key)
         }
    
          hash.each_key { |key| 
               each_key_array.push(key)
            }

            expect(my_each_key_array).to eq(each_key_array)
         
        end
      end
   end


end