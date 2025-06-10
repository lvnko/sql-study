#### Week #028 ~ #029
# 初探 SQL

## A. 概覽
(介紹專案檔案)
- **學習筆記** [``/docs/overview.md``](/docs/overview.md)：<br/>
    關於不同 SQL 語法及用法的筆記，總共分了 14 個章節
- **學習檔案** [``/materials/sqlite_db/*``](/materials/sqlite_db/)：<br/>
    為了輔佐筆記中的 SQL 學習，可以在這個檔案夾裡的 SQLite DB 來做練習
- **實作練習** [``/README.md#b-習作``](#b-習作)：<br/>
    課程最後有提到一些習作題目，我把回答整理在本文的 B 章節中
- **實作材料** [``/materials/exercise_sql``](/materials/exercise_sql/)：<br/>
    我為答題在 Spotify 上爬的一些資料，可以用來驗證回答，也可以用來做練習與測試

## B. 習作
以介紹習作
### 開始步驟
1. 使用 /materials/exercise_sql/ 裡的 .sql 檔案建立 database
2. 執行以下習作回答的 SQL
### 15.1. 基礎需求
- 找到一張專輯裡面的歌 - ORDER BY
- 找到一首歌所屬的專輯跟創作者 - JOIN
- 找到使用者 Liked Songs - CTE
- 找到一個創作者的月總觀看數/找到月總觀看數超過一百萬的發燒創作者 - GROUP BY / HAVING
- 使用者對一首歌按愛心 - INSERT
- 創作者更新封面圖片和自我介紹 - Update
- 創作者下架專輯 - DELETE
- 將歌單中的兩首歌調換顺序 - TRANSACTION
- 發現原本設計的Table不完美或需求改變 - ALTER TABLE

### 15.2. 進階需求
- Your Library 頁面
    - 使用者取得擁有 Play list 和每個 Play list 裡的歌
    - 使用者取得所追蹤的 Album 和每個 Album 裡的歌
    - 使用者取得 Liked Playlist 和其中的歌
- Artist 頁面
    - 取得創作者 TOP 5 歌
    - 取得創作者發表過的專輯
- 使用者取得他的 Followers / Followings

### 15.3. 追加需求
- 使用者 Follow (使用者 / 專輯 / Public Playlist)
- 使用者發佈歌單
- 將一首歌加入/移除歌單

