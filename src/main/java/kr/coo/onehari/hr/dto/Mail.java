package kr.coo.onehari.hr.dto;

import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Mail {

	private String fromAdmin;
	private String toEmp;
	private String subject;
	private String content;
	private String velocityTemplate;
	private Map<String, Object> emailMap = null;
	
}
