class Board

  attr_accessor :array_cases, :game_victory, :game_nil

  def initialize
    @A1 = BoardCase.new("a1", " ")
    @A2 = BoardCase.new("a2", " ")
    @A3 = BoardCase.new("a3", " ")
    @B1 = BoardCase.new("b1", " ")
    @B2 = BoardCase.new("b2", " ")
    @B3 = BoardCase.new("b3", " ")
    @C1 = BoardCase.new("c1", " ")
    @C2 = BoardCase.new("c2", " ")
    @C3 = BoardCase.new("c3", " ")

    @game_victory = false

    @game_nil = false

    @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]

  end

  def write_on_case (case_choose, player_symbol)
    @array_cases.map { |item| item.position == case_choose ? item.content = player_symbol : item }
  end

  def status_victory
    if (@A1.content != " " && @A2.content == @A1.content && @A3.content == @A1.content) || (@B1.content != " " && @B2.content == @B1.content && @B3.content == @B1.content) ||
      (@C1.content != " " && @C2.content == @C1.content && @C3.content == @C1.content) || (@A1.content != " " && @B1.content == @A1.content && @C1.content == @A1.content) || 
      (@A2.content != " " && @B2.content == @A2.content && @C2.content == @A2.content) || (@A3.content != " " && @B3.content == @A3.content && @C3.content == @A3.content) || 
      (@A1.content != " " && @B2.content == @A1.content && @C3.content == @A1.content) || (@A3.content != " " && @B2.content == @A3.content && @C1.content == @A3.content)

      @game_victory = true
    end
  end

  def security (choice_to_save)
    @array_cases.each do |this_case|
      if this_case.position == choice_to_save.to_s
        if this_case.content == " "
          return true
        else
          return false
        end 
      end
    end
  end

  def game_nil
    if @A1.content != " " && @A2.content != " " && @A3.content != " " && @B1.content != " " && @B2.content != " " && @B3.content != " " &&
      @C1.content != " " && @C2.content != " " && @C3.content != " "
      return true
    else
      return false
    end
  end

  def show_board
    puts "   1   2  3"
    puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
    puts "   ---------"
    puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
    puts "   ---------"
    puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"

  end
end