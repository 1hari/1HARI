package kr.coo.onehari.hr.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//급여 테이블
public class PayDto {
	private Date payMonth; //급여월
	private int empNum; //사번
	private int basicSal; //기본급
	private int nPension; //국민연금
	private int hInsurance; //건강보험
	private int cInsurance; //장기요양보험
	private int empInsurance; //고용보험
	private int carCost; //차량유지비
	private int mealCost; //식대
	private int incomTax; //소득세
	private int lIncomTax; //지방소득세
}