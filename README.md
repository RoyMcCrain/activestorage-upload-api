# README

## Documentation

### Model

- reports memo:string, pic:string, order:integer
- ActiveStorage::attachments
- ActiveStorage::blobs

### Routes

- /api/images/upload

showは未実装

### Gem

- google-cloud-storage ~> 1.8

## How to upload files

`$ bundle exec rails server`

`$ curl localhost:3000/api/reports/create -F "report[images]=@test_mini.jpg" -F "memo=inu"`

/storage/tx/wk に保存される

### GCS

<https://console.cloud.google.com/storage/browser/acst-bucket;tab=objects?forceOnBucketsSortingFiltering=false&project=achilles-demo&prefix=&forceOnObjectsSortingFiltering=false>

achilles-demoのacst-bucket

## TODO

- [x] 1Report複数画像
- [ ] 複数画像の同時アップロード
- [ ] MutationでDB関連付けができるような返り値を作る
- [ ] リネーム
- [ ] リサイズ
- [ ] バリデーション
- [ ] Spec
