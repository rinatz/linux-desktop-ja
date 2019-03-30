# linux-desktop-ja

[![license](https://img.shields.io/badge/LICENSE-MIT-blue.svg)](LICENSE)

Linux の日本語デスクトップ環境を作るための Packer テンプレートです。

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
- lubuntu-16.04-desktop.json
- centos-7-desktop.json

`ansible_tags, ansible_skip_tags` という変数に Ansible のタグを指定することができます。`playbooks` 配下の各ロール名に合わせたタグ名をカンマ区切りで指定して下さい。デフォルトではどのロールも実行しません。

**例**

```shell
$ packer build -var 'ansible_tags=setup,scm,buildpack' lubuntu-14.04-desktop.json
```
