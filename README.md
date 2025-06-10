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
    我為答題在 Spotify 上爬的一些資料，雖然它們都是以無序 (Random) 的方式做收集，但是可以用來驗證回答，與做練習測試之用

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
- 找到一張專輯裡面的歌 - ``ORDER BY``
    ```sql
    -- 假設我們要找歌的專輯為 "A New Day"，其在 album table 中的 id 為 2
    -- 我們將會用其為 song.album_id 的篩選條件值：

    SELECT
        track_number,
        name
    FROM song
    WHERE album_id = 2
    ORDER BY track_number;

    /* 結果：
    +--------------+----------------------------------------------+
    | track_number | name                                         |
    +--------------+----------------------------------------------+
    |            0 | Hello                                        |
    |            1 | Black Curtains                               |
    |            2 | I'm Awesome (Remix) [feat. Mac Lethal]       |
    |            3 | Rock & Roll (Shouts Out Back To The Rappers) |
    |            4 | ??????                                       |
    |            5 | Trying for Kicks - 2002 Remaster             |
    |            6 | Sunshine In You                              |
    |            7 | We Got The Beat                              |
    |            8 | To Live & Die In L.A.                        |
    |            9 | This Is My Life (feat. Lmfao)                |
    +--------------+----------------------------------------------+
    */
    ```

- 找到一首歌所屬的專輯跟創作者 - ``JOIN``
    ```sql
    -- 假設我們要找專輯與創作者的歌曲為 "Don't Speak"，其在 song table 中的 id 為 170：

    SELECT
        song.id AS song_id,
        song.name AS song_name,
        album.title AS album_title,
        artist.name AS artist_name
    FROM song
    LEFT JOIN album
        ON song.album_id = album.id
    LEFT JOIN artist
        ON artist.id = album.artist_id
    WHERE song.id = 170;

    /* 結果：
    +---------+-------------+-------------+-----------------+
    | song_id | song_name   | album_title | artist_name     |
    +---------+-------------+-------------+-----------------+
    |     170 | Don't Speak | B-Sides     | William Mullins |
    +---------+-------------+-------------+-----------------+
    */
    ```

- 找到使用者 Liked Songs - ``CTE / Subquery``
    ```sql
    -- 假設使用者為 "Emily Shelly" 其在 user table 中的 id 為 20：

    SELECT
        id AS song_id,
        name AS song_name
    FROM song
    WHERE id IN ( 
        SELECT song_id
        FROM user_liked_song
        WHERE user_id = 20
        ORDER BY user_liked_song.id
    );

    /* 結果：
    +---------+---------------------------------+
    | song_id | song_name                       |
    +---------+---------------------------------+
    |     341 | When The Music Stops - Live     |
    |     237 | I Used To Love H.E.R.           |
    |      27 | Funk You Up - Long Version      |
    |     406 | Everything Now                  |
    |      18 | Late Night Feelings             |
    |     292 | Generations                     |
    |     ... | ...                             |
    |     221 | Melmanos Annimos                |
    |     254 | Bad Guy                         |
    +---------+---------------------------------+
    257 rows in set (0.00 sec)
    */
    ```

- 找到一個創作者的月總觀看數 - ``GROUP BY``

    ```sql
    -- 假設指定的創作者是 "Taylor Swift"，她在 artist table 中的 id 為 4：

    SELECT
        at.id AS artist_id,
        at.name AS artist_name,
        SUM(sg.monthly_plays) AS artist_total_monthly_plays
    FROM artist AS at
    INNER JOIN album AS ab
        ON ab.artist_id = at.id
    INNER JOIN song AS sg
        ON sg.album_id = ab.id
    WHERE at.id = 4
    GROUP BY at.id, at.name;

    /* 結果：
    +-----------+--------------+----------------------------+
    | artist_id | artist_name  | artist_total_monthly_plays |
    +-----------+--------------+----------------------------+
    |         4 | Taylor Swift |                22531986749 |
    +-----------+--------------+----------------------------+
    */
    ```

- 找到月總觀看數超過一百萬的發燒創作者 - ``GROUP BY ... HAVING``
    ```sql
    -- 考慮我這次準備的資料量比較龐大，月總播放數動輒超過一百億
    -- 因此，我把條件從 月總播放數超過一百萬 更改為 超過兩百億 (20,000,000,000)

    SELECT
        at.id AS artist_id,
        at.name AS artist_name,
        SUM(sg.monthly_plays) AS artist_total_monthly_plays
    FROM artist AS at
    INNER JOIN album AS ab
        ON ab.artist_id = at.id
    INNER JOIN song AS sg
        ON sg.album_id = ab.id
    GROUP BY at.id, at.name
    HAVING artist_total_monthly_plays >= 20000000000;

    /* 結果：
    +-----------+-----------------+----------------------------+
    | artist_id | artist_name     | artist_total_monthly_plays |
    +-----------+-----------------+----------------------------+
    |         2 | 2Pac            |                23614153105 |
    |         4 | Taylor Swift    |                22531986749 |
    |         8 | Top Drawer      |                24296851581 |
    |        11 | William Mullins |                22348466270 |
    +-----------+-----------------+----------------------------+
    */
    ```

- 使用者對一首歌按愛心 - ``INSERT``
    ```sql
    -- 假設使用者 "Wallace Evans" (user.id:27) 對
    -- 歌曲 "Our Generation" (song.id:204) 按了愛心

    INSERT INTO
        user_liked_song (song_id, user_id)
        VALUES (204, 27);

    /* 結果：
    Query OK, 1 row affected (0.00 sec)
    */
    -- 注意！若你重複執行以上 SQL 會有以下錯誤訊息：
    -- ERROR 1062 (23000): Duplicate entry '204-27' for key 'unq_song_user_pair'

    -- 原因：因為考慮到一個用戶是沒有辦法重複對同一首歌加愛心，
    -- 因此我設定了 UNIQUE(song_id, user_id) 的 CONSTRAINT
    ```

- 創作者更新封面圖片和自我介紹 - ``UPDATE``
    ```sql
    -- 假設使用者為 "Helen Abbott" (user.id:2)

    UPDATE user
    SET
        profile_pic='https://pbs.twimg.com/profile_images/978932102895951878/8By0mcHO_400x400.jpg',
        bio='搖滾Electronic Music Producer & DJ'
    WHERE id=2;

    /* 結果：
    Query OK, 1 row affected (0.02 sec)
    Rows matched: 1  Changed: 1  Warnings: 0
    */
    ```

- 創作者下架專輯 - ``DELETE``
    ```sql
    -- 假設創作者想要下架的專輯是 "Ain't No Sunshine (feat. Jasmine Pace)" (album.id:42)
    -- 該專輯內收錄了一首歌 "Ghost of You" (song.id:326)

    DELETE FROM album
    WHERE id = 42;

    /* 結果：
    Query OK, 1 row affected (0.01 sec)

    -- 該專輯刪除後，若再去執行查詢已找不到
    mysql> select * from album where id = 42;
    Empty set (0.00 sec)

    -- 原先在該專輯內的歌曲 "Ghost of You"，也一樣找不到了
    mysql> select * from song where id = 326;
    Empty set (0.00 sec)
    */
    ```

- 將歌單中的兩首歌調換顺序 - ``TRANSACTION``
    ```sql
    /* 在歌單 "BTS AS MELHORES 💜" 中有以下 5 首歌：
    mysql> SELECT * FROM playlist_entry WHERE playlist_id = 1 ORDER BY order_number;
    +-----+-------------+---------+--------------+
    | id  | playlist_id | song_id | order_number |
    +-----+-------------+---------+--------------+
    | 148 |           1 |     377 |            0 |
    | 362 |           1 |      42 |            1 | <-
    | 680 |           1 |     492 |            2 |
    | 714 |           1 |      38 |            3 | <-
    | 949 |           1 |     474 |            4 |
    +-----+-------------+---------+--------------+
    -- 假設我們要把第二首 (order_number:1, id:362) 
    -- 跟第四首歌 (order_number:3, id:714) 的順序調換
    */

    -- Step 0: 打開 TRANSACTION 
    START TRANSACTION;

    -- Step 1: Store the order_number of id 362 in a variable
    SELECT @order_362 := order_number FROM playlist_entry WHERE id = 362 AND playlist_id = 1;

    -- Step 2: Store the order_number of id 714 in a variable
    SELECT @order_714 := order_number FROM playlist_entry WHERE id = 714 AND playlist_id = 1;

    -- Step 3: Update id 362's order_number to a temporary value to avoid constraint violation
    UPDATE playlist_entry
    SET order_number = -1
    WHERE id = 362 AND playlist_id = 1;

    -- Step 4: Update id 714's order_number to the stored value of id 362
    UPDATE playlist_entry
    SET order_number = @order_362
    WHERE id = 714 AND playlist_id = 1;

    -- Step 5: Update id 362's order_number to the stored value of id 714
    UPDATE playlist_entry
    SET order_number = @order_714
    WHERE id = 362 AND playlist_id = 1;

    -- Step 6: 查詢改變過後結果是否跟想要的一樣
    SELECT * FROM playlist_entry
    WHERE playlist_id = 1 ORDER BY order_number;
    /*
    +-----+-------------+---------+--------------+
    | id  | playlist_id | song_id | order_number |
    +-----+-------------+---------+--------------+
    | 148 |           1 |     377 |            0 |
    | 714 |           1 |      38 |            1 | <-
    | 680 |           1 |     492 |            2 |
    | 362 |           1 |      42 |            3 | <-
    | 949 |           1 |     474 |            4 |
    +-----+-------------+---------+--------------+
    -- 可以發現歌曲 362 與 714 的位置已經調換！
    */

    -- Step 7: COMMIT 所有指令，完成歌單歌曲調換顺序動作
    COMMIT;
    ```

- 發現原本設計的Table不完美或需求改變 - ``ALTER TABLE``
```sql


ALTER TABLE user
MODIFY COLUMN bio varchar(500);


```

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

