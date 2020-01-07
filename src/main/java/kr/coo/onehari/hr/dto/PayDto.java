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
	private int payNPension; //국민연금
	private int payHInsurance; //건강보험
	private int payCInsurance; //장기요양보험
	private int empInsurance; //고용보험
	private int carCost; //차량유지비
	private int mealCost; //식대
	private int payIncomeTax; //소득세
	private int payLIncomeTax; //지방소득세
}