# じゃんけんメソッド
def janken
	rival_hand = rand(3)
	jankens = ["グー", "チョキ", "パー"]
	
	puts "じゃんけん、、、"
	puts "0 (グー)、1 (チョキ)、2 (パー)、3 (戦わない)"
	my_hand = gets.to_i
  
	# 数字0〜3が入力されるまでループ
	while my_hand >= 4
	  puts "--------------------------------------------------"
	  puts "数字0〜3のみ入力してください"
	  puts "じゃんけん、、、"
	  puts "0 (グー)、1 (チョキ)、2 (パー)、3 (戦わない)"
	  my_hand = gets.to_i
	  
	end
	
	# 適切に数字が入力された場合
	if my_hand == 0 || my_hand == 1 || my_hand == 2
	  puts "ホイ！"
	  puts "あなた：#{jankens[my_hand]}を出しました"
	  puts "相手：#{jankens[rival_hand]}を出しました"
	  puts "--------------------------------------------------"
	  
	  # あいこの場合 (勝負がつくまでループ)
	  if my_hand == rival_hand
		puts "あいこ！"
		return true
	  
	  #  勝ちの場合
	  elsif (my_hand == 0 && rival_hand == 1) || (my_hand == 1 && rival_hand == 2) || (my_hand == 2 && rival_hand == 0) 
		$janken_result = "win"
		return false
	  
	  # 負けの場合
	  elsif (my_hand == 0 && rival_hand == 2) || (my_hand == 1 && rival_hand == 0) || (my_hand == 2 && rival_hand == 1) 
		$janken_result = "lose"
		return false
		
	  end
	
	elsif my_hand == 3
	  puts "戦わない"
	  exit
	
	end
  
  end
  # ここまでがじゃんけんメソッド
  
  # あっち向いてホイメソッド
  def hoi_game
	rival_direction = rand(3)
	directions = ["上", "下", "左", "右"]
	
	puts "あっち向いて、、、"
	puts "0 (上)、1 (下)、2 (左)、3 (右)"
	my_direction = gets.to_i
	puts "ホイ！"
	puts "--------------------------------------------------"
	puts "あなた：#{directions[my_direction]}"
	puts "相手：#{directions[rival_direction]}"
	
	# 勝ちの場合
	if $janken_result == "win" && my_direction == rival_direction
	  puts "おめでとう！あなたの勝ち！"
	  return false
	
	# 負けの場合
	elsif $janken_result == "lose" && my_direction == rival_direction
	  puts "残念、、、あなたの負け。"
	  return false
	
	#勝負がつかなかった場合
	else
	  puts "もう一度じゃんけんから！"
	  puts "--------------------------------------------------"
	  return true
  
	end
  
  end
  # ここまでがあっち向いてホイメソッド
  
  # 一連のゲームメソッド
  def game
	if janken == true
	  return true
	  
	elsif hoi_game == true
	  return true
	  
	else
	  return false
	
	end
  
  end
  
  # 戻り値がtrueなら、常に一連のゲームを繰り返す
  next_game = true
  while next_game
	next_game = game
  
  end
