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

   describe ".my_select" do 
      context "when given an empty block" do 
         it "returns the original hash" do 
           
            my_proc = Proc.new {}
             
            expect(hash.my_select(my_proc)).to eq(hash)
         end
      end

      context "when given a valid block" do 
         it "returns an hash with truthy values" do 
            my_proc = Proc.new { |key, value| 
                   value >= 3 
            }

            expect(hash.my_select(my_proc)).to eq(hash.select(&my_proc))

         end
      end
   end

   describe ".my_fetch" do 
      context "when given an empty block" do 
        it "returns the default value given" do 
            
         expect(hash.my_fetch(:f, 9)).to eq(hash.fetch(:f,9))

        end
      end

      context "when a given key is found" do 
         it "returns its value" do 
          
            expect(hash.my_fetch(:a)).to eq(1)

         end
      end 
   end 


   describe ".my_has_key" do 
       context "when given a key" do 
         it "returns true if the key is present" do 
                
            expect(hash.my_has_key(:b)).to eq(true)

         end

         it "returns false if key isn't present" do 
            
            expect(hash.my_has_key(:f)).to eq(false)
         end
       end
   end

   describe ".my_has_value" do 
       context "when given a value" do 
          it "returns true if value is present" do
         
           expect(hash.my_has_value(3)).to eq(true)
          end

          it "returns false if value isn't present" do 

           expect(hash.my_has_value(4)).to eq(false)
          end 
       end 
   end 

   describe ".my_size" do 
     context "when given an hash" do 
       it "returns the size of it" do 
            
         expect(hash.my_size).to eq(hash.size)

       end
     end
   end 

   describe ".my_transform_keys " do 
      context "when given a block" do 
          it "returns an hash with the transformed keys" do 
            my_proc = Proc.new { |key| 
               if key == :a or key == :b
                 key = key.to_s
               end
            }

            expect(hash.my_transform_keys(&my_proc)).to eq(hash.transform_keys(&my_proc))

          end
      end
   end 

   describe ".my_transform_values " do 
       context "when given a block" do 
         it "returns an hash with the transformed values" do 
            my_proc = Proc.new { |value| 
               if value <= 3 
                  value = value * 2 
               end 
            }

            expect(hash.my_transform_values(&my_proc)).to eq(hash.transform_values(&my_proc))

         end 
       end 
   end 

end