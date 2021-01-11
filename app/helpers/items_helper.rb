module ItemsHelper
  
  def text_placeholder
    <<-"EOS" .strip_heredoc
      商品の説明（1,000文字以内）
      （色,素材,重さ,定価,注意点など）
      
      例) 2010年頃に1万円で購入したジャケットです。ライトグレーで傷は
      ありません。あわせやすいのでおすすめです。
    EOS
  end
  
  def jp_date(date)
    date.strftime("%Y年%m月%d日 %H:%M")
  end  
end
