# ckb-indexer-docker
CKB Indexer Dockerfile

# Quick Start
```bash
docker run \
  -p 18116:8116 --name ckb-mainnet-indexer -d \
  -v $PWD/mainnet:/data/ \
  -it --rm nervos/ckb-indexer -c YOUR_CKB_SERVER:8114 -s /data -l 0.0.0.0:8116
```

```bash
echo '{
    "id": 2,
    "jsonrpc": "2.0",
    "method": "get_transactions",
    "params": [
        {
            "script": {
                "code_hash": "0x9bd7e06f3ecf4be0f2fcd2188b23f1b9fcc88e5d4b65a8637b17723bbda3cce8",
                "hash_type": "type",
                "args": "0x8211f1b938a107cd53b6302cc752a6fc3965638d"
            },
            "script_type": "lock"
        },
        "asc",
        "0x64"
    ]
}' \
| tr -d '\n' \
| curl -H 'content-type: application/json' -d @- \
http://localhost:18116
```
