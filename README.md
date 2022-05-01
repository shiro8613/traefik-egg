# Envoy-Proxy-egg
## 使用法
1. PterodactylのパネルでEggのインポートを選びます (BASIC ADMINISTRATION > Nests > Import Egg)
2. [egg-traefik.json](/egg-traefik.json) をインポートします
3. Eggを使用してサーバーを作成します
4. 必要に応じてFile Managerで [/traefik/traefik.yaml](/traefik/traefik.yaml) を編集します
5. サーバーを起動します

## ビルド手順
頑張ってください（記述がめんどかった....）

### 公開手順
上に同じ
## traefik.yaml 及び Dockerfile 編集時の注意点

改行コードがLFに設定されていることを確認してください。  
![改行コードがLF](https://i.gyazo.com/b6b16545db760b583d458a94e29c273a.png)  

誤って改行コードCRLFに設定されていると読み込み時に
```
cd /home/container\r
```
となる場合があるため注意！

使用Dockerイメージ
`tomservs/traefik-ubuntu`[DockerHub](https://hub.docker.com/repository/docker/tomservs/traefik-ubuntu)
