module Enumerable

   def my_any?(block)
       result = false 
       if block == nil 
         result = true 
       else
         self.my_each { |key, value|
           result = block.call(key, value)
         }
      end
     
     puts "yhooooo tha result is #{result}"
     result
      
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