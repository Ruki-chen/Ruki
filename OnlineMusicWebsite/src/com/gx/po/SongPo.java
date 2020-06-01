package com.gx.po;

public class SongPo {
	
    private int id;
	
	private String  songName;
	
	private String singerName;
	
	private String lyric;
	
	private String songPath;
	
	private String albumName;
	
	private String country;
	
	private String schools;
	
	private String year;
	
	private String isPopular;
	
	private String songStuts;//用于展示
	
	
	public String getSongStuts() {
		return songStuts;
	}

	public void setSongStuts(String songStuts) {
		this.songStuts = songStuts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getSingerName() {
		return singerName;
	}

	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}

	public String getLyric() {
		return lyric;
	}

	public void setLyric(String lyric) {
		this.lyric = lyric;
	}

	public String getSongPath() {
		return songPath;
	}

	public void setSongPath(String songPath) {
		this.songPath = songPath;
	}

	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getSchools() {
		return schools;
	}

	public void setSchools(String schools) {
		this.schools = schools;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getIsPopular() {
		return isPopular;
	}

	public void setIsPopular(String isPopular) {
		this.isPopular = isPopular;
	}


}
