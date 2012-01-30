
class Decipher
  
  def Decipher.decode(s)
    out = ""
    s.each_byte do |b|
      out << (b-7).chr
    end    
    out        
  end
    
end
