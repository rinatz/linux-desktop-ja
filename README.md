# linux-desktop-ja

[![license](https://img.shields.io/badge/LICENSE-MIT-blue.svg)](LICENSE)

Linux の日本語デスクトップ環境を作るための Packer テンプレートです。

## 必要なもの

- [Packer]
- [Vagrant] 2.2.4
- [VirtualBox] 5.2.26
- [vagrant-vbguest]

## クローン

```shell
$ git clone https://github.com/rinatz/linux-desktop-ja
```

## イメージ作成

### ISO から VirtualBox イメージ作成

ISO から VirtualBox イメージを作成します。同時に Box イメージとしてパッケージングします。

```shell
$ packer build TEMPLATE
```

`TEMPLATE` には作成したいイメージに応じて下記のいずれかを指定して下さい。

- lubuntu-14.04-desktop.json
- lubuntu-16.04-desktop.json
- centos-7-desktop.json

`ansible_tags, ansible_skip_tags` という変数に Ansible のタグを指定することができます。[playbooks/roles] 配下の各ロール名に合わせたタグ名をカンマ区切りで指定して下さい。デフォルトではどのロールも実行しません。

**例**

```shell
$ packer build -var 'ansible_tags=setup,scm,buildpack' lubuntu-14.04-desktop.json
```

### 既存の Box から新たな Box イメージ作成

既存の Box イメージに対して Ansible を実行することで新たな Box イメージを作成することができます。 Box イメージに Ansible をインストールした後に下記を実行して下さい。

```shell
$ ansible-playbook -c local -i localhost, site.yml --tags=TAGS
```

`TAGS` には [playbooks/roles] 配下の各ロール名に合わせたタグ名をカンマ区切りで指定して下さい。 `--tags` を指定しなければすべてのロールを実行します。

**例**

```shell
$ ansible-playbook -c local -i localhost, site.yml --tags=setup,scm,buildpack
```

[Packer]: https://www.packer.io/
[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
[vagrant-vbguest]: https://github.com/dotless-de/vagrant-vbguest
[playbooks/roles]: ./playbooks/roles
