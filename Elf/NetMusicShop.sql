USE netmusicshop;

SELECT Users.UserRealName ,COUNT(Collections.UserName) AS '收藏的歌曲数'
FROM users,collections
WHERE users.username=collections.username
GROUP BY collections.username 
HAVING count(collections.username)>=2;

SELECT AlbumName,count(songs.AlbumID) AS '包含歌曲数'
FROM Albums,songs
WHERE albums.albumid=songs.albumid
GROUP BY albumname
HAVING count(songs.AlbumID)>=10;



SELECT  SongTitle
FROM songs
WHERE songid NOT IN(
SELECT songid
FROM collections);