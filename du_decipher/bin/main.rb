require_relative "../lib/decipher/decipher"

class Main
  def Main.run(*args)
    raise ArgumentError if args.size != 1    
    filename = args[0][0]
    out = ""
    
    File.open(filename, "r"){|f|
      f.each_line do |line|
        out << Decipher.decode(line.chomp) << "\n"
      end      
    }        
    out
  end
end

puts Main.run(ARGV)
