# pg_ext_learn
関西DB勉強会用レポジトリ  
https://kansaidbstudy.connpass.com/event/144933/

## ハンズオン環境について
参加者の環境を揃えるため、さくらのクラウドを使用します。  
また、PostgreSQLのインストール状態を揃えるため、Dockerで初期環境を構築するようにします。

## サーバー環境構築(事前準備)
10分くらいで完了します。

1. さくらのクラウドで最低環境のサーバーを用意してください。  
    - OS: CentOS7
    - サーバープラン: 1仮想コア / 1GB
    - ディスクプラン: 20GB / SSDプラン
    - 接続先のネットワーク： インターネット
    - 作成数: 1
2. サーバーが作成できたら、接続してください。  
Windowsユーザーの場合は[Tera Term](https://ja.osdn.net/projects/ttssh2/)など、MACユーザーの場合は標準のターミナルなどでSSH接続してください。
3. 当レポジトリをクローンしてください。
```terminal
[ユーザー名@ホスト名 ~]$ git clone https://github.com/ester41/pg_ext_learn.git
[ユーザー名@ホスト名 ~]$ 
```
4. ルートユーザーに昇格し、クローンしたフォルダーに移動してください。
```terminal
[ユーザー名@ホスト名 ~]$ su
パスワード:
[root@ホスト名 *****]# cd pg_ext_learn/
[root@ホスト名 pg_ext_learn]# 
```
5. インストールスクリプトを実行してください。
```terminal
[root@ホスト名 pg_ext_learn]# ./install.sh
[root@ホスト名 pg_ext_learn]# 
```

## Dockerコンテナ内への入りかた
```terminal
[root@ホスト名 pg_ext_learn]# ./login.sh
[root@ホスト名 pg_ext_learn]# 
```

## Docekrコンテナの再開の仕方
```terminal
[root@ホスト名 pg_ext_learn]# ./start.sh
[root@ホスト名 pg_ext_learn]# 
```

## Dockerコンテナの止め方
```terminal
[root@ホスト名 pg_ext_learn]# ./stop.sh
[root@ホスト名 pg_ext_learn]# 
```
