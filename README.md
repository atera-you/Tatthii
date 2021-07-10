## アプリ概要
twitterの埋め込み機能を用いて好きな絵を共有することができるサイトです。

## 製作背景
私自身twitterやpixivなどを利用して好みの絵を探すことがよくあるのですが、まだ自分の知らない自分が好きであろう絵を探し尽くしたいという思いがあり、なにかいい手段はないかと考えた結果、好きな絵の趣味が似通っている人を効率よく探すことができれば好きな絵を発見しやすくなるのではないかといった考えに至りこのサイトを製作しました。
twitterと比較した時の固有性としては
- twitterのリツイート機能では基本的に自分をフォローしている人にしか共有できないのに対してtatthiiでは画像を探したいと思ってこのサイトを訪れた人全員に対して共有ができる
- twitterでは仮に好きな絵の趣味が似通っている人を見つけても日常的な呟きなども表示され過去のリツイートを探すのに手間がかかる
- twitterではタグやキーワードで画像検索をかけた時にグッズなどの投稿もひっかかるがそれがない
などが挙げられると考えています。

## 機能
- 新規会員登録・ログイン機能
- SNS 認証ログイン機能（Twitter/ Gem omniauth)
- ユーザー情報編集機能
- フォロー機能(ajax)
- ツイート共有機能(Gem summernote)
- 共有一覧表示機能
- タグ付け機能(Gem acts-as-taggable-on)
- タグ検索、絞り込み機能(Gem acts-as-taggable-on)

## 使用技術
フロントエンド
- HTML/CSS
- Sass
- Bootstrap
- Javascript(jquery)
バックエンド
- Ruby2.6.6
- Rails6.0.3
- Rspec
インフラ
- AWS EC2 (Amazon Linux2)/RDS(PostgreSQL)/VPC)
- AWS(ACM,Route53,ALB)
- Capistrano（自動デプロイ）




