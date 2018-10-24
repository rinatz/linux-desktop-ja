# linux-desktop-ja

Linux の日本語デスクトップ環境を作るための Vagrantfile です。

## 目次

- [必要なもの](#必要なもの)
- [クローン](#クローン)
- [設定](#設定)
- [起動](#起動)
- [日本語化](#日本語化)
- [日本語入力](#日本語入力)
- [ライセンス](#ライセンス)

## 必要なもの

- [VirtualBox]
- [Vagrant]

[VirtualBox]: https://www.virtualbox.org/
[Vagrant]: https://www.vagrantup.com/

**注意**

    動作確認は Vagrant 2.2.0 と VirtualBox 5.2.20 で行っています。
    バージョンの組み合わせがシビアで、
    相性が悪いと上手く起動できないことがあるためご注意下さい。

VirutalBox Guest Addition が古くてたまに起動に失敗することがあるため
[vagrant-vbguest] プラグインを入れておくと安全です。

    $ vagrant plugin install vagrant-vbguest

[vagrant-vbguest]: https://github.com/dotless-de/vagrant-vbguest

## クローン

    $ git clone https://github.com/rinatz/linux-desktop-ja

## 設定

必要に応じて `Vagrantfile` を編集します。
デフォルトのままでいい場合は何もしてくていいです。

### ベースイメージの選択

動作確認済みのベースイメージは下記のとおりです。

| ベースイメージ     | 環境構築 | デスクトップの設定 | ツールの動作確認 | 推奨 |
|--------------------|:--------:|:------------------:|:----------------:|:----:|
| bento/ubuntu-14.04 | OK       | OK                 | OK               | ◯   |
| bento/ubuntu-16.04 | OK       | OK                 |                  |      |
| bento/ubuntu-18.04 | OK       |                    |                  |      |
| bento/centos-7     | OK       |                    |                  |      |

## 起動

`Vagrantfile` の置かれたところで `vagrant up` と打てばプロビジョニングが始まります。

    $ cd linux-desktop-ja
    $ vagrant up

プロビジョニングが終わったら Guest Addition を再インストールした後、
再起動して下さい。

    $ vagrant vbguest --do install
    $ vagrant reload

## 日本語化

デスクトップ環境を日本語化するには次のようにします。

1. デスクトップ左下のメニューから `Preferences` > `Language Support` を選択
1. 表示されるダイアログで `install` を選択（パスワードは `vagrant`）
1. `Language` タブで `日本語` を一番上までドラッグし `Apply System-Wide` ボタンを押す
1. `Regional Formats` で `日本語` を選択し `Apply System-Wide` ボタンを押す
1. 再ログイン

## 日本語入力

日本語入力を有効化するためには次のようにします。

1. デスクトップ右下のキーボードのアイコンを右クリックして `設定` を選択
1. `入力メソッド` の項目にある `キーボード - 英語(US)` を削除して下記をこの順に追加

    - キーボード - 日本語 - 日本語（かな 86）
    - Mozc

1. `全体の設定` タブで `入力メソッドのオンオフ` の項目に `半角/全角キー` を追加

## ライセンス

[![license](https://img.shields.io/github/license/rinatz/ubuntu-desktop-ja.svg)](LICENSE)

Copyright (c) 2018 Kenichiro IDA
