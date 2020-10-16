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

`$ curl -F 'memo=memo' -F 'order=1' -F 'images[]=@test_fire.jpg' -F 'images[]=@test_mini.jpg' -F 'order=1' localhost:3000/api/images/upload`

/storage/tx/wk に保存される

### GCS

<https://console.cloud.google.com/storage/browser/acst-bucket;tab=objects?forceOnBucketsSortingFiltering=false&project=achilles-demo&prefix=&forceOnObjectsSortingFiltering=false>

achilles-demoのacst-bucket

### ConoHa

<https://manage.conoha.jp/Dashboard/>

Image-1234 <http://160.251.15.106/>

user:image1234

## TODO

- [x] 1Report複数画像
- [x] 複数画像の同時アップロード
- [ ] MutationでDB関連付けができるような返り値を作る
- [x] リネーム
- [ ] リサイズ
- [ ] バリデーション
- [ ] Spec（Gemいれるとこから）
