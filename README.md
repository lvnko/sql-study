#### Week #028 ~ #029
# 初探 SQL

## A. 專案檔案概覽
關於本專案的檔案分佈可以參考以下簡錄：
- **學習筆記** [``/docs/overview.md``](/docs/overview.md)：<br/>
    關於不同 SQL 語法及用法的筆記，總共分了 14 個章節
- **學習檔案** [``/materials/sqlite_db/*``](/materials/sqlite_db/)：<br/>
    為了輔佐筆記中的 SQL 學習，可以在這個檔案夾裡的 SQLite DB 來做練習
- **實作練習** [``/README.md#b-習作``](#b-習作)：<br/>
    課程最後有提到一些習作題目，我把回答整理在本文的 B 章節中
- **實作材料** [``/materials/exercise_sql/*``](/materials/exercise_sql/)：<br/>
    我為答題在 Spotify 上爬的一些資料，可以用來驗證回答，也可以用來做練習與測試

## B. 習作
課程最後以 Spotify 為需求藍本，針對其功能給出了一系列的問題，我在本章節給出解答：

### B.1 開始步驟
1. 在 **MySQL (v8.0)** 上使用 ``/materials/exercise_sql/`` 裡的 .sql 檔案建立 database，順序如下：
    > 1. spotify_clone_artist.sql
    > 2. spotify_clone_album.sql
    > 3. spotify_clone_song.sql
    > 4. spotify_clone_user.sql
    > 5. spotify_clone_playlist.sql
    > 6. spotify_clone_playlist_entry.sql
    > 7. spotify_clone_user_follower.sql
    > 8. spotify_clone_artist_follower.sql
    > 9. spotify_clone_user_added_playlist.sql
    > 10. spotify_clone_user_added_album.sql
    > 11. spotify_clone_user_liked_song.sql
2. 在 MySQL Command Line console/terminal 上執行 [B.2](#b2-基礎需求)、[B.3](#b3-進階需求) 與 [B.4](#b4-追加需求) 中的 SQL 回答做驗證或測試。

###  B.2 基礎需求
- 找到一張專輯裡面的歌 - ORDER BY
    ```sql
    SELECT
        track_number,
        name
    FROM song
    WHERE album_id = 2
    ORDER BY track_number;
    ```
- 找到一首歌所屬的專輯跟創作者 - JOIN
- 找到使用者 Liked Songs - CTE
- 找到一個創作者的月總觀看數/找到月總觀看數超過一百萬的發燒創作者 - GROUP BY / HAVING
- 使用者對一首歌按愛心 - INSERT
- 創作者更新封面圖片和自我介紹 - Update
- 創作者下架專輯 - DELETE
- 將歌單中的兩首歌調換顺序 - TRANSACTION
- 發現原本設計的Table不完美或需求改變 - ALTER TABLE

### B.3. 進階需求
- Your Library 頁面
    - 使用者取得擁有 Play list 和每個 Play list 裡的歌
    - 使用者取得所追蹤的 Album 和每個 Album 裡的歌
    - 使用者取得 Liked Playlist 和其中的歌
- Artist 頁面
    - 取得創作者 TOP 5 歌
    - 取得創作者發表過的專輯
- 使用者取得他的 Followers / Followings

### B.4. 追加需求
- 使用者 Follow (使用者 / 專輯 / Public Playlist)
- 使用者發佈歌單
- 將一首歌加入/移除歌單

