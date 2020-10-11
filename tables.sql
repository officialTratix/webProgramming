drop table if exists likedSongs;
drop table if exists playlistSongs;
drop table if exists songs;
drop table if exists playlists;
drop table if exists userSettings;
drop table if exists logins;

create table logins(
	`ID` int primary key auto_increment,
    `user` varchar(25),
    `pass` varchar(25),
    `linked` bool,
    `dateModified` datetime
);

create table userSettings(
	`ID` int primary key auto_increment,
    `userID` int,
    foreign key (userID) references logins(ID)
    #list of settings
);

create table playlists(
	`ID` int primary key auto_increment,
    `userID` int,
    `name` varchar(25),
    `mood` varchar(25), #this could reference another table of different moods
    foreign key (userID) references logins(ID)
);

create table songs(
	`ID` int primary key auto_increment,
    `artist` varchar(100),
    `title` varchar(100)
    #field for every attribute
);

create table playlistSongs(
	`ID` int primary key auto_increment,
    `playlistID` int,
    `songID` int,
    foreign key (playlistID) references playlists(ID),
    foreign key (songID) references songs(ID)
);

create table likedSongs(
	`ID` int primary key auto_increment,
    `userID` int,
    `songID` int,
    `liked` bool,
    foreign key (userID) references logins(ID),
    foreign key (songID) references songs(ID)
);