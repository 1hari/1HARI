package kr.coo.onehari.util.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExcelFileType {

	/*
	 * 엑셀파일을 읽어서 Workbook 객체에 리턴한다.
	 * XLS와 XLSX 확장자를 비교한다.
	 * 
	 * @param filePath
	 * @return
	 */
	public static Workbook getWorkbook(String filePath) {
		/*
         * FileInputStream은 파일의 경로에 있는 파일을
         * 읽어서 Byte로 가져온다.
         * 
         * 파일이 존재하지 않는다면은
         * RuntimeException이 발생된다.
         */
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(filePath);
        } catch (FileNotFoundException e) {
            System.out.println("ExcelFileType fis 예외발생: " + e.getMessage());
            log.debug("ExcelFileType fis 예외발생: " + e.getMessage());
        }
        
        Workbook workbook = null;
        
        /*
         * 파일의 확장자를 체크해서 .XLS 라면 HSSFWorkbook에
         * .XLSX라면 XSSFWorkbook에 각각 초기화 한다.
         */
        if (filePath.toUpperCase().endsWith(".XLS")) {
            try {
                workbook = new HSSFWorkbook(fis);
            } catch (IOException e) {
            	System.out.println("ExcelFileType xls 예외발생: " + e.getMessage());
                log.debug("ExcelFileType xls 예외발생: " + e.getMessage());
            }
        } else if(filePath.toUpperCase().endsWith(".XLSX")) {
            try {
                workbook = new XSSFWorkbook(fis);
            } catch (IOException e) {
            	System.out.println("ExcelFileType xlsx 예외발생: " + e.getMessage());
                log.debug("ExcelFileType xlsx 예외발생: " + e.getMessage());
            }
        }
        return workbook;
    }
}
