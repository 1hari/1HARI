package kr.coo.onehari.util.util;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
public class ExcelReadOption {

	/**
	 * 엑셀파일의 경로
	 */
	private String filePath;

	/**
	 * 추출할 컬럼 명
	 */
	private List<String> outputColumns;

	/**
	 * 추출을 시작할 행 번호
	 */
	private int startRow;

	public List<String> getOutputColumns() {

		List<String> temp = new ArrayList<String>();
		temp.addAll(outputColumns);

		return temp;
	}

	public void setOutputColumns(List<String> outputColumns) {

		List<String> temp = new ArrayList<String>();
		temp.addAll(outputColumns);

		this.outputColumns = temp;
	}

	public void setOutputColumns(String... outputColumns) {

		if (this.outputColumns == null) {
			this.outputColumns = new ArrayList<String>();
		}

		for (String ouputColumn : outputColumns) {
			this.outputColumns.add(ouputColumn);
		}
	}
}
