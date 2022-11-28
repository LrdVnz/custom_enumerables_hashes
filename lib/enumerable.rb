module Enumerable





end


class Hash 


 def my_each(&block)
     i = 0 
    while i < self.count
     block.call(self[i]) 
      i+= 1 
    end
   

 end


end