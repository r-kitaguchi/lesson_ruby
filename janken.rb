#モジュール
module Shout
  def shout(shout)
    puts "#{shout}"
    puts "----------------------------------"
  end
end

module Opponent
  def opponent(num)
    if num == 3
      $random_hand = rand(num)
      janken_hand($random_hand, "相手")
    elsif num == 4
      $random_direct =rand(num)
      face_direction($random_direct, "相手")
    end
    puts "----------------------------------"
  end
end

#クラス
#配列を作成、数字をもとに要素を取り出す
class Janken_battle
  include Shout
  def janken_hand(num, player)
    hands = ["グー", "チョキ", "パー"]
    janken = hands[num]
    puts "#{player} : #{janken}を出しました"
  end
  include Opponent
end

class Facing_battle
  include Shout
  def face_direction(num, player)
    directions = ["上", "下", "左", "右"]
    direction = directions[num]
    puts "#{player} : #{direction}"
  end
  include Opponent
end

#メソッド
def start(start)
  puts "#{start}"
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  $hand = $stdin.gets.to_i
end

def facing_over_there
  puts "あっち向いて〜"
  puts "0(上)1(下)2(左)3(右)"
  $direction = $stdin.gets.to_i
  if $direction != 0 and $direction != 1 and $direction != 2 and $direction != 3
    puts "0 ~ 3を入力してください"
    facing_over_there
  elsif
    facing_battle = Facing_battle.new
    facing_battle.shout("ホイ！")
    facing_battle.face_direction($direction, "あなた")
    facing_battle.opponent(4)
    result
  end
end

def after_janken
  if $random_hand == $hand || 4 <= $hand || 0 > $hand
    start("あいこで・・・")
    if $hand == 3
      exit
    elsif $hand != 0 and $hand != 1 and $hand != 2
      puts "0 ~ 3を入力してください"
      after_janken
    else
      janken_battle = Janken_battle.new
      janken_battle.shout("ショ！")
      janken_battle.janken_hand($hand, "あなた")
      janken_battle.opponent(3)
      after_janken
    end
  else
    facing_over_there
  end
end

def display_result(result)
  if $direction == $random_direct
    puts "あなたの#{result}"
    exit
  end
end

# "あなた"と"相手"のじゃんけん結果をもとに条件分岐
def result
  if $hand + 1 == $random_hand || $hand - 2 == $random_hand
    display_result("勝ち！")
  else
    display_result("負け・・・")
  end
end

#ループ
loop{
  start("じゃんけん・・・")
  if $hand == 3
    break
  elsif $hand != 0 and $hand != 1 and $hand != 2 and $hand != 3
    puts "0 ~ 3を入力してください"
    next
  end
  janken_battle = Janken_battle.new
  janken_battle.shout("ホイ！")
  janken_battle.janken_hand($hand, "あなた")
  janken_battle.opponent(3)
  after_janken
}