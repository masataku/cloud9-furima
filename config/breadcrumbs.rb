#ルート
crumb :root do
  link "メルカリ", root_path
end

#ユーザーページ
crumb :user_page do |user|
  link user.name, "users/#{params[:id]}/user_page"
end 

#お知らせ
crumb :notification do
  link "お知らせ", notifications_path
end

#マイページ
crumb :mypage do
  link "マイページ", user_path
end

#いいね一覧
crumb :like_index do
  link "いいね一覧", "users/#{params[:id]}/like_index"
  parent :mypage
end  

#出品一覧
crumb :saling_index do
  link "出品した商品-出品中", "users/#{params[:id]}/saling_index"
  parent :mypage
end

#売却一覧
crumb :sold_index do
  link "出品した商品-売却済み", "users/#{params[:id]}/sold_index"
  parent :mypage
end

#購入一覧
crumb :buyed_index do
  link "購入した商品-過去の取引", "users/#{params[:id]}/buyed_index"
  parent :mypage
end

#プロフィール
crumb :profile do
  link "プロフィール", "users/#{params[:id]}/edit"
  parent :mypage
end

#発送元・お届け先住所変更
crumb :addressee do
  link "発送元・お届け先住所変更", "users/#{params[:id]}/addressee"
  parent :mypage
end

#メール/パスワード
crumb :password do
  link "メール/パスワード", "users/#{params[:id]}/password"
  parent :mypage
end

#本人情報
crumb :identity do
  link "本人情報", "users/#{params[:id]}/identity"
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).