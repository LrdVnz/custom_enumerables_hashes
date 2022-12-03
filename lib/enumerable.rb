module Enumerable

   def my_any?(block)
       result = false 
       if block.call(key = 1, value = 1) === nil 
         result = true 
       else
         self.my_each { |key, value|
           result = block.call(key, value)
         }
      end
     result
   end

   def my_each_key(&block)
     resulting_hash = {}

     return self if block_given? == false  

     self.my_each { |key, value| 
         block.call(key, value)
     }

   end


end


class Hash 

  def my_each(&block)
     i = 0 
     hash_values = self.values 
     hash_keys = self.keys 

     while i < self.count
      block.call(hash_keys[i], hash_values[i] ) 
      i+= 1 
     end
    self
 end

end