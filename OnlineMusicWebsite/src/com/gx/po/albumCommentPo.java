package com.gx.po;

import java.sql.Timestamp;

public class albumCommentPo {
	
	  private int id;
		
		private String albumName;
		
		private String userName;
		
		private String userComment;
		
		private int goodNumber;
		
		private int replayNumber;
		
		private int parentCommentId ;
	     
		private Timestamp time;
		
		private String albumCommentStuts;//动态生成的
		
		private String mail;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getAlbumName() {
			return albumName;
		}

		public void setAlbumName(String albumName) {
			this.albumName = albumName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserComment() {
			return userComment;
		}

		public void setUserComment(String userComment) {
			this.userComment = userComment;
		}

		public int getGoodNumber() {
			return goodNumber;
		}

		public void setGoodNumber(int goodNumber) {
			this.goodNumber = goodNumber;
		}

		public int getReplayNumber() {
			return replayNumber;
		}

		public void setReplayNumber(int replayNumber) {
			this.replayNumber = replayNumber;
		}

		public int getParentCommentId() {
			return parentCommentId;
		}

		public void setParentCommentId(int parentCommentId) {
			this.parentCommentId = parentCommentId;
		}

		public Timestamp getTime() {
			return time;
		}

		public void setTime(Timestamp time) {
			this.time = time;
		}

		public String getAlbumCommentStuts() {
			return albumCommentStuts;
		}

		public void setAlbumCommentStuts(String albumCommentStuts) {
			this.albumCommentStuts = albumCommentStuts;
		}

		public String getMail() {
			return mail;
		}

		public void setMail(String mail) {
			this.mail = mail;
		}
		
		

}
