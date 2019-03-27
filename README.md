# linux-desktop-ja

[![license](https://img.shields.io/badge/LICENSE-MIT-blue.svg)](LICENSE)

Linux の日本語デスクトップ環境を作るための Packer テンプレートです。

## 目次

- [必要なもの](#必要なもの)
- [クローン](#クローン)
- [設定](#設定)
- [起動](#起動)
- [ライセンス](#ライセンス)

## 必要なもの

- [Packer]
- [Vagrant] 2.2.4
- [VirtualBox] 5.2.26
- [vagrant-vbguest]

[Packer]: https://www.packer.io/
[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
[vagrant-vbguest]: https://github.com/dotless-de/vagrant-vbguest

## クローン

```shell
$ git clone https://github.com/rinatz/linux-desktop-ja
```

## 実行

```shell
$ packer build TEMPLATE
```

`TEMPLATE` には作成したいイメージに応じて下記のいずれかを指定して下さい。

- lubuntu-14.04-desktop.json
