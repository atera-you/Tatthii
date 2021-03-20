ポートフォリオ

必要なコントローラーは現時点でcentral,user,session,micropostの4個

centralのアクション
home トップページ

search 検索アクション　ヘッダーに埋め込む


userアクション
new ユーザー登録画面
create ユーザー登録システム
show ユーザー詳細画面（理想ではファイルごとに絵を投稿したい）
share 画像共有画面
index フォローしている人（ファイルになるかも）が共有している絵の一覧
picture　全ての絵の一覧
destroy 退会システム

sessionアクション
create ログイン

destroy ログアウト

micropost
create 画像システム
destroy 共有停止
update タグ変更


Userモデルに登録するカラム
name
email
password
