# TODOアプリ（RailsAPI練習用）

以下に対してリクエストを送ることができます。

* `https://todo-api-practice.onrender.com`

* パラメータ
  * タスクタイトル：title
  * タスク内容：content
```
# タスク一覧
GET https://todo-api-practice.onrender.com/tasks

# タスク詳細
GET https://todo-api-practice.onrender.com/tasks/id

# タスク作成
POST https://todo-api-practice.onrender.com/tasks

# タスク編集
PATCH https://todo-api-practice.onrender.com/tasks/id

# タスク削除
DELETE https://todo-api-practice.onrender.com/tasks/id
```


## 環境構築
以下の資料を参考に環境構築しました。
https://hackmd.io/@SKjw2RY-RNCUNSdJfEWPig/rkt40B0FR

### 変更点
※変更前
`docker compose run --rm web bundle exec rails new . -d postgresql -j esbuild --css=tailwind`

↓

※変更後
`docker compose run --rm web bundle exec rails new . --api -d postgresql`
