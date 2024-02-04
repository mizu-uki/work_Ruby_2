class HumanPlayer
  def choose_hand()
    hands = ["グー","チョキ","パー","戦わない"]
    loop do
      puts "じゃんけん・・・"
      puts "0（グー）1（チョキ）2（パー）3（戦わない）"
      choice = gets.chomp.to_i
      if (0..2).include?(choice)
        puts "ホイ！"
        puts "ーーーーーーーー"
        puts "あなた：#{hands[choice]}を出しました"
        return choice
      elsif choice == 3
        puts "ゲームを終了します"
        puts "ーーーーーーーー"
        return nil
      else
        puts "不正な値です。もう一度お願いします。"
        puts "ーーーーーーーー"
      end
    end
  end
  
  def choose_direction()
    directions = ["上","下","左","右"]
    loop do
      puts "0（上）1（下）2（左）3（右）"
      choice = gets.chomp.to_i
      if (0..3).include?(choice)
        puts "ホイ！"
        puts "ーーーーーーーー"
        puts "あなた：#{directions[choice]}を出しました"
        return choice
      else
        puts "不正な値です。もう一度お願いします。"
        puts "ーーーーーーーー"
      end
    end
  end
end

class ComputerPlayer
  def choose_hand()
    hands = ["グー","チョキ","パー"]
    choice = rand(3)
    puts "相手：#{hands[choice]}を出しました"
    puts "ーーーーーーーー"
    return choice
  end

  def choose_direction()
    directions = ["上","下","左","右"]
    choice = rand(4)
    puts "相手：#{directions[choice]}を出しました"
    puts "ーーーーーーーー"
    return choice
  end
end

class Play
  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    winner = ""
  end

  def play_janken()
    loop do
      player_hand = @human.choose_hand
      break if player_hand.nil?
      
      computer_hand = @computer.choose_hand
      result = (player_hand - computer_hand + 3) % 3
      if result == 0
        puts "あいこで・・・" 
      elsif  result == 2
        puts "あなたの勝利！あっち向いて〜"
        winner = "あなた"
        break if play_direction(winner)
      elsif  result == 1
        puts "相手の勝利！あっち向いて〜"
        winner = "相手"
        break if play_direction(winner)
      end
    end
  end

  def play_direction(win)
    if win == "あなた"
      result = @human.choose_direction - @computer.choose_direction
      if result == 0
        puts "あなたの勝利です！おめでとう！ゲームを終了します。"
        puts "ーーーーーーーー"
        return true
      else
        puts "セーフ！もう一度。"
        puts "ーーーーーーーー"
        return false
      end
    elsif win == "相手"
      result = @human.choose_direction - @computer.choose_direction
      if result == 0
        puts "相手の勝利です！残念でした１ゲームを終了します。"
        puts "ーーーーーーーー"
        return true
      else
        puts "セーフ！もう一度。"
        puts "ーーーーーーーー" 
        return false
      end 
    end
  end
end

Play.new.play_janken()