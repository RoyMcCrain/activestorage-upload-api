# README

## Documentation

### Model

- image_log uploaded_at:datetime

↑これ、postsがいい

- ActiveStorage::attachments
- ActiveStorage::blobs

### Routes

- /api/images/upload

showは未実装

### Gem

- google-cloud-storage ~> 1.8

## How to upload files

### ローカル環境

`$ bundle exec rails db:create`

`$ bundle exec rails db:migrate`

`$ ETITOR=vi bundle exec rails credentials:edit`
でcredentialsを設定

`$ bundle exec rails server`

`$ curl -F 'images[]=@test_fire.jpg' -F 'images[]=@test_mini.jpg' localhost:3000/api/images/upload`

＊images[]=@ファイルパス.jpg

### 許可されている拡張子はpng, jpg, jpeg, gifのみ

正常：返り値サンプル

~~~ json
{"url":["https://storage.cloud.google.com/acst-bucket/yqgnqrc1fc01u8ci5bkmkk14dlmd","https://storage.cloud.google.com/acst-bucket/16t2an2vaponp8bnl0146czwjpo5"]}
~~~

### それ以外の拡張子を送信すると200でエラーメッセージ

異常：返り値サンプル

~~~ json
{"error":"Invalid extension."}
~~~

### GCS

<https://console.cloud.google.com/storage/browser/acst-bucket;tab=objects?forceOnBucketsSortingFiltering=false&project=achilles-demo&prefix=&forceOnObjectsSortingFiltering=false>

achilles-demoのacst-bucket

### ConoHa（停止中）

<https://manage.conoha.jp/Dashboard/>

Image-1234 <http://160.251.15.106/>

user:image1234
