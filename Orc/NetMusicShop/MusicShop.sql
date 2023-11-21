select UserName, count(SongID) as 收藏数
from collections
group by UserName
HAVING 收藏数 >= 2;


select AlbumName, count(SongNumber) as 歌曲数
from albums, songs
where albums.AlbumID = songs.AlbumID
group by  AlbumName
HAVING 歌曲数 >=10;


