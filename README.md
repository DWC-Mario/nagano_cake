# ながのケーキ　ECサイト
<img src="https://github.com/DWC-Mario/nagano_cake/assets/59686438/2f63c2e3-6789-4b78-aca3-03a3be033828" alt="naga_nyan" width="200px" height="200px">
<img src="https://github.com/DWC-Mario/nagano_cake/assets/59686438/232abc40-e2fb-4400-8f45-4e174b806359" alt="naga_nyan2" width="200px" height="200px">
<img src="https://github.com/DWC-Mario/nagano_cake/assets/59686438/9a1c96d6-a489-44b3-98de-5fd8d832ecbf" alt="nagano_san" width="200px" height="200px">

## 概要
* 長野県にある洋菓子店「ながのCAKE」の商品の通販を想定した、ECサイトを開発しました。
このECサイトはDMM WEB CAMP生によるチーム開発課題です。実在するお店のサイトではありませんのでご了承ください。

## アプリケーションの詳細な説明
* 下記のような架空の背景をもとにECサイトを開発しました。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 使っている言語・フレームワークのバージョン
* ruby 3.1.2p20
* Rails 6.1.7.3
* Bootstrap v4.5.2

## 環境構築に必要な手順
```
$ git clone git@github.com:DWC-Mario/nagano_cake.git
$ cd nagano_cake
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
```

## 実装した機能
* 顧客側
  - 会員登録、ログイン・ログアウト、退会
  - 会員情報の編集
  - カートへの追加、商品購入
  - 支払い方法、配送先の指定
  - 注文履歴の閲覧
* 管理者側
  - 商品の新規追加、編集、閲覧
  - 商品情報の編集
  - 会員登録されているユーザ情報の閲覧、編集、退会処理
  - ユーザの注文履歴閲覧
* その他
  - 商品検索機能
  - 商品ジャンルごとの商品検索機能

## 使用方法
* 管理者ページのログインについて
  - 初期段階での管理者ページのログインに必要なメールアドレス及びパスワードは下記です。
    - メールアドレス：fa@fa.com
    - パスワード：ffffff

## 作成者アカウント
* 個人GitHubへのリンクを記載しておきます。
    - [だっくん](https://github.com/touchselect)
    - [あーし](https://github.com/takeuchisaki)
    - [やまーな](https://github.com/konohaduku)
    - [ばしさん](https://github.com/0884haruka)
