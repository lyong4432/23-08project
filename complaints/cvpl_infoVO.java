package kr.or.project.main.domain;

import java.util.Date;

public class cvpl_infoVO {
	private int CVPL_NO; 
	private String MANAGE_NO; // 관리 번호 
	private String CVPL_KND; // 민원 종류 
	private String SJ; // 제목
	private String WRITNG_CN; // 작성내용
	private String WRITNG_PASSWORD; // 작성자비밀번호 
	private char ANSWER_COMPT_AT; // 답변완료여부
	private Date WRITNG_DT; // 작성일시 
	private String WRITNG_NM; // 작성자 
	private String ANSWER_CN; // 답변내용
	private String ANSWER_PASSWORD; // 담당자비밀번호
	private Date ANSWER_DT; // 답변작성일시 
	private String ANSWER_NM; // 담당자 
	
	public int getCVPL_NO() {
		return CVPL_NO;
	}
	public void setCVPL_NO(int cVPL_NO) {
		CVPL_NO = cVPL_NO;
	}
	public String getMANAGE_NO() {
		return MANAGE_NO;
	}
	public void setMANAGE_NO(String mANAGE_NO) {
		MANAGE_NO = mANAGE_NO;
	}
	public String getCVPL_KND() {
		return CVPL_KND;
	}
	public void setCVPL_KND(String cVPL_KND) {
		CVPL_KND = cVPL_KND;
	}
	public String getSJ() {
		return SJ;
	}
	public void setSJ(String sJ) {
		SJ = sJ;
	}
	public String getWRITNG_CN() {
		return WRITNG_CN;
	}
	public void setWRITNG_CN(String wRITNG_CN) {
		WRITNG_CN = wRITNG_CN;
	}
	public String getWRITNG_PASSWORD() {
		return WRITNG_PASSWORD;
	}
	public void setWRITNG_PASSWORD(String wRITNG_PASSWORD) {
		WRITNG_PASSWORD = wRITNG_PASSWORD;
	}
	public char getANSWER_COMPT_AT() {
		return ANSWER_COMPT_AT;
	}
	public void setANSWER_COMPT_AT(char aNSWER_COMPT_AT) {
		ANSWER_COMPT_AT = aNSWER_COMPT_AT;
	}
	public Date getWRITNG_DT() {
		return WRITNG_DT;
	}
	public void setWRITNG_DT(Date wRITNG_DT) {
		WRITNG_DT = wRITNG_DT;
	}
	public String getWRITNG_NM() {
		return WRITNG_NM;
	}
	public void setWRITNG_NM(String wRITNG_NM) {
		WRITNG_NM = wRITNG_NM;
	}
	public String getANSWER_CN() {
		return ANSWER_CN;
	}
	public void setANSWER_CN(String aNSWER_CN) {
		ANSWER_CN = aNSWER_CN;
	}
	public String getANSWER_PASSWORD() {
		return ANSWER_PASSWORD;
	}
	public void setANSWER_PASSWORD(String aNSWER_PASSWORD) {
		ANSWER_PASSWORD = aNSWER_PASSWORD;
	}
	public Date getANSWER_DT() {
		return ANSWER_DT;
	}
	public void setANSWER_DT(Date aNSWER_DT) {
		ANSWER_DT = aNSWER_DT;
	}
	public String getANSWER_NM() {
		return ANSWER_NM;
	}
	public void setANSWER_NM(String aNSWER_NM) {
		ANSWER_NM = aNSWER_NM;
	}
	@Override
	public String toString() {
		return "cvpl_infoVO [CVPL_NO=" + CVPL_NO + ", MANAGE_NO=" + MANAGE_NO + ", CVPL_KND=" + CVPL_KND + ", SJ=" + SJ
				+ ", WRITNG_CN=" + WRITNG_CN + ", WRITNG_PASSWORD=" + WRITNG_PASSWORD + ", ANSWER_COMPT_AT="
				+ ANSWER_COMPT_AT + ", WRITNG_DT=" + WRITNG_DT + ", WRITNG_NM=" + WRITNG_NM + ", ANSWER_CN=" + ANSWER_CN
				+ ", ANSWER_PASSWORD=" + ANSWER_PASSWORD + ", ANSWER_DT=" + ANSWER_DT + ", ANSWER_NM=" + ANSWER_NM
				+ "]";
	}
	
}
