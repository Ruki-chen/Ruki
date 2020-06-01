package com.gx.po;

import java.sql.Timestamp;
import java.util.List;

public class SongListInformationPo {
	
	   private int id;
		
		private String  songListName ;
		
		private String mail;
		
		private String  songPath;
		
		private Timestamp time;
		
		private String songStuts;//展示
		
		private String songName;//用于展示的po
		
		private String singerName;//用于展示的po
		
		private List<String> musicPathList;//用于展示的po
		
		public List<String> getMusicPathList() {
			return musicPathList;
		}

		public void setMusicPathList(List<String> musicPathList) {
			this.musicPathList = musicPathList;
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

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		
		public String getSongListName() {
			return songListName;
		}

		public void setSongListName(String songListName) {
			this.songListName = songListName;
		}

		public String getMail() {
			return mail;
		}

		public void setMail(String mail) {
			this.mail = mail;
		}

		

		public String getSongPath() {
			return songPath;
		}

		public void setSongPath(String songPath) {
			this.songPath = songPath;
		}

		public Timestamp getTime() {
			return time;
		}

		public void setTime(Timestamp time) {
			this.time = time;
		}

		public String getSongStuts() {
			return songStuts;
		}

		public void setSongStuts(String songStuts) {
			this.songStuts = songStuts;
		}

}
