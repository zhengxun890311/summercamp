package com.skcc.summerCamp.user.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xwpf.usermodel.Borders;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

public class WordTest {

	public static void main(String[] args) throws IOException {
		XWPFDocument document = new XWPFDocument();
		FileOutputStream fop = new FileOutputStream(new File("f:/poidemo.docx"));
		XWPFTable table = document.createTable();
		XWPFParagraph paragraph = document.createParagraph();
		paragraph.setBorderLeft(Borders.BASIC_BLACK_DASHES);
		paragraph.setBorderRight(Borders.BASIC_BLACK_DOTS);
		paragraph.setBorderTop(Borders.BALLOONS_HOT_AIR);
		paragraph.setBorderBottom(Borders.BASIC_THIN_LINES);
		XWPFRun run = paragraph.createRun();
		run.setText("this is the paragraph");
		XWPFTableRow rowOne = table.getRow(0);
		rowOne.getCell(0).setText("col one,row one");
		rowOne.addNewTableCell().setText("col two,row one");
		rowOne.addNewTableCell().setText("col three,row one");
		rowOne.addNewTableCell().setText("col four,row one");
		
		XWPFTableRow tableRowTwo  = table.createRow();
		tableRowTwo.getCell(0).setText("col one,row two");
		tableRowTwo.getCell(1).setText("col two,row two");
		tableRowTwo.getCell(2).setText("col three,row two");
		tableRowTwo.getCell(3).setText("col three,row two");
		
		document.write(fop);
		fop.flush();
		fop.close();
	}
}
