# kurumi-in-container

## 予定

1. docker-composeで`client`と`crawler`を連携させる
1. `kurumi-crawler`
   - 非同期でN件クローリングするように変更（処理時間をなるべく減らす）
   - ダウンロードの日数を 10日 or デフォルト（1ヶ月..） を、引数等で切り替えられるように修正

## メモ

-----

## docker

- イメージのビルド

```bash
docker build --no-cache \
-t simpledai/kurumi-in-container \
.
# docker image build.. でもOK
```

- コンテナの実行

```bash
docker run simpledai/kurumi-in-container
# docker container run.. でもOK
```

- コンテナの実行（bash起動）

```bash
docker run -it simpledai/kurumi-in-container \
/bin/bash
# docker container run.. でもOK
```

- ポートのチェック

```bash
 lsof -i -P -n | grep LISTEN
#  -i ネットワークソケットを対象にする（推奨）
#  -P ポート名でなくポート番号を表示
#  -n ホスト名でなくIPアドレスを表示
```
