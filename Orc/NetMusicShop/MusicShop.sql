select UserName, count(SongID) as 收藏数
from collections
group by UserName
HAVING 收藏数 >= 2;