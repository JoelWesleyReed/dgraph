# Status

### 2022-07-27

This creates an multi-arch image that will work for both amd64 and arm64 in docker.  The arm64 image will not work in k3d.  It results in these errors:

dgraph-zero
```
E0727 20:11:32.284128       1 pool.go:311] CONN: Unable to connect with dgraph-alpha-0.dgraph-alpha.default.svc.cluster.local:7080 : rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial tcp: lookup dgraph-alpha-0.dgraph-alpha.default.svc.cluster.local: device or resource busy"
I0727 20:11:32.366940       1 zero.go:445] Got connection request: cluster_info_only:true
I0727 20:11:32.369046       1 zero.go:470] Connected: cluster_info_only:true
I0727 20:11:32.474379       1 zero.go:445] Got connection request: cluster_info_only:true
I0727 20:11:32.476239       1 zero.go:470] Connected: cluster_info_only:true
I0727 20:11:32.581366       1 zero.go:445] Got connection request: cluster_info_only:true
I0727 20:11:32.583077       1 zero.go:470] Connected: cluster_info_only:true
I0727 20:11:32.665866       1 zero.go:445] Got connection request: cluster_info_only:true
I0727 20:11:32.667444       1 zero.go:470] Connected: cluster_info_only:true
```

dgraph-alpha
```
E0727 19:56:10.033590       1 pool.go:311] CONN: Unable to connect with dgraph-zero-0.dgraph-zero.default.svc.cluster.local:5080 : rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial tcp: lookup dgraph-zero-0.dgraph-zero.default.svc.cluster.local: device or resource busy"
I0727 19:56:10.527467       1 groups.go:1122] Retry Zero Connection
I0727 19:56:10.534309       1 groups.go:1122] Retry Zero Connection
E0727 19:56:10.819633       1 groups.go:1181] Error during SubscribeForUpdates for prefix "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15dgraph.graphql.schema\x00": Unable to find any servers for group: 1. closer err: <nil>
```
