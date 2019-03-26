# linux-desktop-ja

Linux の日本語デスクトップ環境を作るための Vagrantfile です。

## 目次

- [必要なもの](#必要なもの)
- [クローン](#クローン)
- [設定](#設定)
- [起動](#起動)
- [日本語化](#日本語化)
- [ライセンス](#ライセンス)

## 必要なもの

- [VirtualBox]
- [Vagrant]

[VirtualBox]: https://www.virtualbox.org/
[Vagrant]: https://www.vagrantup.com/

**注意**

    動作確認は Vagrant 2.2.4 と VirtualBox 5.2.26 で行っています。
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
ベースイメージは下記のいずれかであれば概ね動作すると思われます。

- bento/centos-7
- bento/ubuntu-14.04
- bento/ubuntu-16.04

## 起動

`Vagrantfile` の置かれたところで `vagrant up` と打てばプロビジョニングが始まります。

    $ cd linux-desktop-ja
    $ vagrant up

## ライセンス

[![license](https://img.shields.io/github/license/rinatz/ubuntu-desktop-ja.svg)](LICENSE)

Copyright (c) 2018 Kenichiro IDA
