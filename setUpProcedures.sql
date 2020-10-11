drop procedure if exists `spAddLogin`;
delimiter //
create procedure `spAddLogin`(`spUser` varchar(25), `spPass` varchar(25))
begin
	insert into `logins`(`user`, `pass`, `linked`, `dateModified`) values (`spUser`, `spPass`, false, current_timestamp());
end //
delimiter ;

drop procedure if exists `spAddUserSettings`;
delimiter //
create procedure `spAddUserSettings`(`spUserID` int)
begin
	insert into `userSettings`(`userID`) values (`spUserID`);
end //
delimiter ;

drop procedure if exists `spAddPlaylist`;
delimiter //
create procedure `spAddPlaylist`(`spUserID` int, `spPlaylistName` varchar(25), `spMood` varchar(25))
begin
	insert into `playlists`(`userID`, `name`, `mood`) values (`spUserID`, `spPlaylistName`, `spMood`);
end //
delimiter ;

drop procedure if exists `spAddSong`;
delimiter //
create procedure `spAddSong`(`spArtist` varchar(100), `spTitle` varchar(100))
begin
	insert into `songs`(`artist`, `title`) values (`spArtist`, `spTitle`);
end //
delimiter ;

drop procedure if exists `spAddPlaylistSong`;
delimiter //
create procedure `spAddPlaylistSong`(`spPlaylistID` int, `spSongID` int)
begin
	insert into `playlistSongs`(`playlistID`, `songID`) values (`spPlaylistID`, `spSongID`);
end //
delimiter ;

drop procedure if exists `spAddLikedSong`;
delimiter //
create procedure `spAddLikedSong`(`userID` int, `spSongID` int, `spLiked` bool)
begin
	insert into `likedSongs`(`userID`, `songID`, `liked`) values (`userID`, `spSongID`, `spLiked`);
end //
delimiter ;

call `spAddLogin`("bwooler", "abc123");
select * from `logins`;

call `spAddUserSettings`((select `ID` from `logins` where `user` = "bwooler"));
select * from `userSettings`;

call `spAddPlaylist`((select `ID` from `logins` where `user` = "bwooler"), "Test Playlist", "Dark");
select * from `playlists`;

call `spAddSong`("Tratix", "Infiltration");
select * from `songs`;

call `spAddPlaylistSong`((select ID from `playlists` where `name` = "Test Playlist"), (select ID from `songs` where `title` = "Infiltration"));
select * from `playlistSongs`;

call `spAddLikedSong`((select `ID` from `logins` where `user` = "bwooler"), (select ID from `songs` where `title` = "Infiltration"), true);
select * from `likedSongs`;