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


   def my_select(block)
      resulting_pairs = {}

    if block.call(key = 1, value = 1) === nil 
       return self 
    else
       self.my_each { |key, value| 
          if block.call(key, value) === true 
            resulting_pairs[key] = value 
          end
      }
      resulting_pairs 
    end
   end

   def my_fetch(key, value = nil) 
     found = false 

    self.my_each { |self_key, self_value| 
         if self_key == key
           found = true  
           return self_value 
         end 
    }
    return value if found == false
   end 


   def my_has_key(given_key) 
      result = false 

      self.my_each { |key| 
          if key == given_key 
            result = true
          end 
      }

      result 
   end 

   def my_has_value(given_value)
      result = false 

      self.my_each { |key, value|
        if given_value == value 
          result = true
        end 
      }
      result
   end

   def my_size 
      size = 0 

      self.my_each { |key|  size += 1 }
      
      size 

   end 

   def my_transform_keys(&block)
       return self if block_given? == false 
      
       resulting_hash = {}


       self.my_each { |key, value| 
          resulting_hash[block.call(key,value)] = value 
      }

      resulting_hash

   end 

   def my_transform_values(&block)
       return self if block_given? == false 

       resulting_hash = {} 

       self.my_each { |key, value| 
            resulting_hash[key] = block.call(value)
      }

      resulting_hash

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