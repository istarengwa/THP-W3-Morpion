class Game

  attr_accessor :board, :genre, :statsx, :statso

  def initialize
    @board = Board.new
    @genre = Genre.new
    @statsx = 0
    @statso = 0
  end

  def select_player
    while @board.game_victory == false
      @genre.players.each { |item| choose_case(item) }
    end
  end

  # Pour définir la fin ou la continuation d'une partie
  def choose_case (player)
    if @board.game_victory == false
      puts "#{player.name} avec le symbole '#{player.symbol}' à toi de jouer sur la case que tu souhaites. Exemple : a1, b2, c3..."
      print "> "
      choice = gets.chomp.to_s

      #Pour relancer en cas de mauvaise information de placement
      while choice != "a1" && choice != "a2" && choice != "a3" && choice != "b1" && choice != "b2" && choice != "b3" && choice != "c1" && choice != "c2" && choice != "c3"
      	puts "je n'ai pas compris ton choix, refait ta commande. Exemple : a1, b2, c3..."
      	print ">"
      	choice = gets.chomp.to_s
      end

      #Pour relancer en cas de case pleine + mauvaise info
      puts "le test de la boucle"
      while @board.security(choice) == false
      	puts "la case est déjà prise, choisi une autre case"
      	print "> "
      	choice = gets.chomp.to_s
      	while choice != "a1" && choice != "a2" && choice != "a3" && choice != "b1" && choice != "b2" && choice != "b3" && choice != "c1" && choice != "c2" && choice != "c3"
      		puts "je n'ai pas compris ton choix, refait ta commande. Exemple : a1, b2, c3..."
      		print ">"
      		choice = gets.chomp.to_s
      	end
      end

      #Pour placer le choix
      @board.write_on_case(choice, player.symbol) #permet d'écrire le symbole du joueur dans la case choisi
      @board.show_board
      @board.status_victory

  	  if @board.game_victory == true #Dans Board, si le scanner trouve une ligne complete, le joueur gagne
    	  puts "Bravo #{player.name}!! Tu as gagné !!"
    	  if player.name == @genre.players[0].name #compteur du premier joueur
    	  	@statso += 1
    	  else #compteur du second joueur
    	  	@statsx += 1
    	  end

    	elsif @board.game_nil == true #Dans Board, si le scanner ne trouve plus de case disponible sans ligne complète, égalité
      	puts "la partie est finie, égalité!!"
      	ask_new_game
    	end
    end
  end

  #Pour relancer une partie en tapant "rejouer" dans le terminal
  def ask_new_game
    puts "Tape 'rejouer' pour relancer une partie de morpion!"
    print "> "
    new_game = gets.chomp.to_s

    if new_game == "rejouer"
      @board.array_cases.map! { |item| item.content = " " }
      self.relance
    end
  end

  #Permet de lancer l'application du morpion
  def perform
    @genre.ask_name #demande le pseudo et le genre aux joueurs
   	puts "#{@genre.players[0].name} a pour symbole : #{@genre.players[0].symbol}"
    puts "#{@genre.players[1].name} a pour symbole : #{@genre.players[1].symbol}"
    @board.show_board
    select_player
    ask_new_game
  end

  def relance
   	puts "#{@genre.players[0].name} a pour symbole : #{@genre.players[0].symbol} avec #{@statso} victoires"
    puts "#{@genre.players[1].name} a pour symbole : #{@genre.players[1].symbol} avec #{@statsx} victoires"
    @board.show_board
    select_player
    ask_new_game
  end
end