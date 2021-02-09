FactoryBot.define do
  factory :item do
    name {"商品名です"}
    text {"商品説明です"}
    price {1000}
    image {"113055.jpg"}
    state {"新品未使用"}
    region {"北海道"}
    shipping_date {"1~2日で発送"}
    shipping_method {"未定"}
    shipping_charge {"送料込み(出品者負担)"}
  end
end
