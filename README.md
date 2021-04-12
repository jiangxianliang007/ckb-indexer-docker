# ckb-indexer-docker
```
docker run \
  -p 8116:8116 --name ckb-mainnet-indexer -d \
  -v $PWD/mainnet:/data/ \
  -it --rm jiangxianliang/ckb-indexer:0.2.0 -c YOUR_CKB_SERVER:8114 -s /data -l 0.0.0.0:8116
 ```
 
 ```
 echo '{
    "id": 2,
    "jsonrpc": "2.0",
    "method": "get_tip"
}' \
| tr -d '\n' \
| curl -H 'content-type: application/json' -d @- \
http://localhost:8116
```
