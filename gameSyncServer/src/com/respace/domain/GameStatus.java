package com.respace.domain;

//{"${member.name}":"${member.value}","${otherMembers}"}
public class GameStatus {
	public static String TYPE_PAPER = "paper";
	public static String TYPE_ROCK = "rock";
	public static String TYPE_SCISSOR = "scissor";
	
	FacebookResponse leftUser;
	String leftUserChoise  = "";
	int leftUserWins;
	boolean isLeftUserWin;
	
	
	FacebookResponse rightUser;
	String rightUserChoise = "";
	int rightUserWins;
	boolean isRightUserWin;
	
	
	
	public String getLeftUserChoise() {
		return leftUserChoise;
	}
	public void setLeftUserChoise(String leftUserChoise) {
		this.leftUserChoise = leftUserChoise;
	}
	public int getLeftUserWins() {
		return leftUserWins;
	}
	public void setLeftUserWins(int leftUserWins) {
		this.leftUserWins = leftUserWins;
	}
	public int getRightUserWins() {
		return rightUserWins;
	}
	public void setRightUserWins(int rightUserWins) {
		this.rightUserWins = rightUserWins;
	}
	public String getRightUserChoise() {
		return rightUserChoise;
	}
	public void setRightUserChoise(String rightUserChoise) {
		this.rightUserChoise = rightUserChoise;
	}
	
	public boolean isDecisionFinished(){
		if(!this.rightUserChoise.isEmpty() && !this.leftUserChoise.isEmpty())
			return true;
		return false;
	}
	
	public void leftWins(){
		this.leftUserWins++;
		this.isLeftUserWin = true;
		this.isRightUserWin = false;
	}
	public void rightWins(){
		this.rightUserWins++;
		this.isLeftUserWin = false;
		this.isRightUserWin = true;
	}
	public void draw(){
		this.isLeftUserWin = false;
		this.isRightUserWin = false;
	}
	
	public void resetChoise(){
		this.leftUserChoise = "";
		this.rightUserChoise = "";
	}
	public void resetScore(){
		this.leftUserWins = 0;
		this.rightUserWins = 0;
	}
	
	@Override
	public String toString() {
		return "{\"leftUser\":" + leftUser
				+ ",\"leftUserChoise\":\"" + leftUserChoise
				+ "\",\"leftUserWins\":\"" + leftUserWins
				+ "\",\"isLeftUserWin\":\"" + isLeftUserWin
				+ "\",\"rightUser\":" + rightUser
				+ ",\"rightUserChoise\":\"" + rightUserChoise
				+ "\",\"rightUserWins\":\"" + rightUserWins
				+ "\",\"isRightUserWin\":\"" + isRightUserWin + "\"}";
	}
	public FacebookResponse getLeftUser() {
		return leftUser;
	}
	public void setLeftUser(FacebookResponse leftUser) {
		this.leftUser = leftUser;
	}
	public FacebookResponse getRightUser() {
		return rightUser;
	}
	public void setRightUser(FacebookResponse rightUser) {
		this.rightUser = rightUser;
	}
	
}
