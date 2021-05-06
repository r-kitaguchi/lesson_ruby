# # booksハッシュにオブジェクトを格納する
# books = {
#     "title" => "Rubyでハッシュしよう！",
#     "company" => "プログラミングで学ぶ社",
#     "page" => 321,
#     "price" => 2980
# }

# # booksハッシュに格納されたオブジェクトを確認する
# p books

# # ハッシュにキーを指定して出力する
# puts books["title"]
# puts books["price"]

# # bookハッシュのtitleがキーのオブジェクトを更新する
# books["title"] = "Rubyで配列を作ろう！"
# books["price"] = 3800

# # ハッシュにキーを指定して出力する
# puts books["title"]
# puts books["price"]

# books = {
#     title: "Rubyでハッシュしよう！",
#     company: "プログラミングで学ぶ社",
#     page: 321,
#     price: 2980
# }

# p books
# puts books[:title]
# puts books[:price]

# books[:title] = "Rubyで配列を作ろう！"
# books[:price] = 3800

# puts books[:title]
# puts books[:price]

hash_a = {
    "title" => "文字列型で定義しています"
}
hash_b = {
    1 => "数値型で定義しています"
}
hash_c = {
    title: "シンボルで定義しています"
}
p hash_a["title"]
# p hash_a[title] 参照できない

p hash_b[1]
# p hash_b["1"] 参照できない

p hash_c[:title]
