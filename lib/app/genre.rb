class Genre

	attr_accessor :players

  def initialize
    @players = []
  end

	def ask_name

		genre = ""

		while genre != "homme" && genre != "femme" && genre != "non-binaire"
  		puts "Quel est ton genre ? 'homme', 'femme' ou 'non-binaire'"
  		print "> "
  		genre = gets.chomp.to_s
   	end

   	if genre == "femme"
   		puts "Quel est le pseudo de la première joueuse ?"
   		print "> "
   	else
   		puts "Quel est le pseudo du premier joueur ?"
   		print "> "
 		end
 		@players << Player.new(gets.chomp.to_s, "o")

 		genre = ""

   	while genre != "homme" && genre != "femme" && genre != "non-binaire"
  		puts "Quel est ton genre ? 'homme', 'femme' ou 'non-binaire'"
  		print "> "
  		genre = gets.chomp.to_s
  	end

    if genre == "femme"
    	puts "Quel est le pseudo de la seconde joueuse ?"
    	print "> "
    else 
    	puts "Quel est le pseudo du second joueur ?"
    	print "> "
    end
    @players << Player.new(gets.chomp.to_s, "x")
  end

end