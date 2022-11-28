require './lib/enumerable.rb'

describe Enumerable do 
   describe ".my-each" do
      it "passes the block on each key-value and returns them" do
          example_hash = {:a => 1, :b => 3, :c => 6}
          my_proc =  Proc.new { |key, value| 
            puts "key is #{key}, value is #{value}" }


          expect(example_hash.my_each(&my_proc)).to eq(example_hash.each(&my_proc))
          
      end
   end
end