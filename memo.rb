require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_s

# クラス
class Input
  def comment
    puts "拡張子を除いたファイル名を入力してください"

    #入力された値を変数に格納
    @@file_name = $stdin.gets
  end

  def ask_detail(edit="")
    puts "#{edit}内容を入力してください"
    puts "完了したらcontrol + Dを押します"
  end

  # CSVファイル作成（processの値によって書き込みか追記か選択)
  def csv(process)
    CSV.open("#{@@file_name.chomp}.csv", "#{process}") do |test|
      memo_detail = $stdin.read.split("\n")# 入力された値を文字列で取得し、\nで区切って配列に格納
      test << memo_detail
    end
  end
end

class Display < Input
  def csv_read
    puts "---内容を表示します---"
    puts CSV.read("#{@@file_name.chomp}.csv")
  end
end

# ifで条件分岐
if memo_type.chomp == "1" then
  input = Input.new
  input.comment
  input.ask_detail
  input.csv("w")
elsif memo_type.chomp == "2" then
  display = Display.new
  display.comment
  display.csv_read
  display.ask_detail("追加する")
  display.csv("a")
  display.csv_read
else
  puts "1か2を入力してください"
  exit
end

