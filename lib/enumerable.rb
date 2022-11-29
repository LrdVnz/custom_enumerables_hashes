module Enumerable



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