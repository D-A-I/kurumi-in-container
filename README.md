# kurumi-in-container

## 予定

1. `kurumi-client`
   - 各種パスを環境変数から取得するよう変更
1. docker-composeで`client`と`crawler`を連携させる

## メモ

- イメージのビルド

```bash
docker build --no-cache \
-t simpledai/kurumi-in-container \
.
```

- コンテナの実行

```bash
docker run simpledai/kurumi-in-container
```

- コンテナの実行（bash起動）

```bash
docker run -it simpledai/kurumi-in-container \
/bin/bash
```
