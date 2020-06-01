package com.gx.po;

import java.sql.Timestamp;

public class songCommentPo {
	
    private int id;
	
	private String songName;
	
	private String userName;
	
	private String userComment;
	
	private int goodNumber;
	
	private int replayNumber;
	
	private int parentCommentId ;
     
	private Timestamp time;
	
	private String songCommentStuts;//动态生成的
	
	private String mail;

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public int getReplayNumber() {
		return replayNumber;
	}

	public void setReplayNumber(int replayNumber) {
		this.replayNumber = replayNumber;
	}

	public String getSongCommentStuts() {
		return songCommentStuts;
	}

	public void setSongCommentStuts(String songCommentStuts) {
		this.songCommentStuts = songCommentStuts;
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


	
	
}
