<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

element.style {
    position: absolute;
    left: 0px;
    top: 0px;
    table-layout: fixed;
    border-collapse: collapse;
    border-spacing: 0px;
    width: 624px;
}
.gridstyle01 .gridHeaderTableDefault {
    border-top: 0px solid #e1e1e1;
    border-left: none;
    border-bottom: 1px solid #bdbdbd;
    border-right: none;
}
.gridHeaderTableDefault {
    border-top: 3px solid #6ca5e3;
    border-bottom: 1px solid #b1c5d5;
    border-left: 1px solid #b1c5d5;
    border-right: 0 solid #b1c5d5;
    cursor: default;
}

table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
.w2grid {
    background-color: #fff;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}
Style Attribute {
    display: block;
    visibility: visible;
}
html, body {
    margin: 0px;
    padding: 0px;
    color: #020202;
    font-size: 12px;
    font-style: normal;
    font-family: 'NanumGothicWeb','NanumGothic','dotum', 'Tahoma', 'AppleGothic';
}
body {
    height: 100%;
    margin: 0;
    padding: 0;
    font: 12px "돋움",Dotum,Helvetica,AppleGothic,Sans-serif;
    position: relative;
}

/* grid style1 */
.gridstyle01 {
	position: relative;
	width: 100%;
}

.gridstyle01 .gridHeaderTableDefault {
	border: none;
}

.gridstyle01 thead.gridHeaderTableDefault {
	borer: none !important;
}

.gridstyle01 thead.gridHeaderTableDefault nobr span {
	color: #b53737;
	line-height: 1.7em;
}

.gridstyle01 .gridHeaderTDDefault {
	border: none !important;
	background: #848182;
	color: #fff;
	font-weight: bold;
}

.gridstyle01 .gridBodyDefault {
	border: 1px solid #bdbdbd;
	background-color: #fff;
	font-size: 11px;
	text-align: center;
	color: #3c3c3c;
}

.gridstyle01 .gridSubtotalDefault {
	border: 1px solid #7f9988
}

.gridstyle01 .gridBodyDefault_rowNumber {
	background-color: #fff !important;
	text-align: center;
}

.gridstyle01.w2grid nobr {
	display: block;
	margin: 0px;
	text-overflow: ellipsis;
	overflow: hidden;
	line-height: 1.7;
}

.gridstyle01.w2grid .w2grid_embedded_input {
	color: #F4F5BA;
}

.gridstyle01 .gridBodyDefault_select nobr {
	text-align: center !important;
}

.gridstyle01 .w2input {
	border: 1px solid #9d4f54 !important;
}

.gridstyle01 .w2input_focus {
	border: 1px solid #9d4f54 !important;
}

.gridstyle01 td[inputtype$="checkbox"] {
	text-align: center !important;
}

.gridstyle01 td[readonly$="true"] {
	background: #f7f6f4;
}

.gridstyle01 .gridSubtotalDefault {
	border: #bdbdbd 1px solid;
	background: #F2E8DB;
	font-size: 11px;
	font-weight: bold;
	color: #55524e;
}

.gridstyle01 .gridFooterTableDefault {
	border: #bdbdbd 1px solid;
	border-bottom: #bababa 0px solid;
}

.gridstyle01 .gridFooterTDDefault {
	background: #E4E5D3;
	border: #bdbdbd 1px solid;
	color: #3c3c3c;
	font-weight: bold;
	font-size: 11px;
}

.gridstyle01.w2grid td table img {
	cursor: pointer;
}

.gridstyle01 .gridFooterTDDefault nobr {
	padding: 0px 0px 0px 3px;
	line-height: 1;
}

.gridstyle01 .gridBodyDefault.gridBodyDefault_select[readonly$="true"] {
	background: #f1efef url(uiplugin/selectbox/images/select_arrow.gif)
		no-repeat right center;
}

.grid_dbc {
	border: 2px solid #d41c23 !important;
	height: 18px !important;
}

.grid_body {
	border: 1px solid #bdbdbd;
	height: 20px;
}

.grid_body_column {
	border: 1px solid #bdbdbd;
	text-align: center;
	background-color: transparent;
	font-size: 11px;
}

.grid_body_column_rowNumber {
	background-color: #fff !important;
}

.noRMC2 {
	top: 55px !important;
}

.noRMC3 {
	top: 75px !important;
}

.noRMC4 {
	top: 95px !important;
}

.noRMC5 {
	top: 115px !important;
}
element.style {
}
.grdContents {
    overflow: hidden;
    padding: 5px;
}
.w2group {
    background-color: transparent;
}
.w2group {
    background-color: #fff;
}
user agent stylesheet
div {
    display: block;
}
Style Attribute {
    display: block;
    visibility: visible;
}
html, body {
    margin: 0px;
    padding: 0px;
    color: #020202;
    font-size: 12px;
    font-style: normal;
    font-family: 'NanumGothicWeb','NanumGothic','dotum', 'Tahoma', 'AppleGothic';
}
body {
    height: 100%;
    margin: 0;
    padding: 0;
    font: 12px "돋움",Dotum,Helvetica,AppleGothic,Sans-serif;
    position: relative;
}
</style>
</head>
<body>

	<div id="tabMain" style="" class="w2tabcontrol contab mgt10">
		<div id="tabMain_container" class="w2tabcontrol_container"
			style="height: 384px;">
			<div id="tabMain_contents_content1" class="w2tabcontrol_contents"
				role="tabpanel" aria-labeledby="입고예정정보등록(SOLID)" aria-hidden="false"
				style="display: block; visibility: visible;">
				<div id="tabMain_contents_content1_body"
					style="overflow-y: auto; height: -29px;"
					class="w2group w2tabcontrol_contents_wrapper">
					<div id="group70" style="" class="w2group grdContents">
						<div id="groupTab0" style="" class="w2group clfix mgb3">
							<div id="groupTitle0" style="" class="w2group ">
								<h3 id="textbox92" style="width: 150px;"
									class="w2textbox ssb_title fl">발주정보</h3>
							</div>
						</div>
						<div id="grid11" class="w2grid gridstyle01"
							style="height: 76px; overflow: hidden;" role="application"
							tabindex="0">
							<div id="grid11_main_div"
								style="z-index: 10; overflow: hidden; position: absolute; inset: 0px; float: left;">
								<div id="grid11_dataLayer"
									style="position: absolute; width: 100%; top: 0px; bottom: 0px; overflow: hidden;">
									<table id="grid11_body_table" class="gridHeaderTableDefault"
										style="position: absolute; left: 0px; top: 0px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; width: 624px;"
										summary="" role="grid">
										<colgroup>
											<col id="grid11_col_body_0"
												style="width: 60px; white-space: nowrap">
											<col id="grid11_col_body_1"
												style="width: 201px; white-space: nowrap;">
											<col id="grid11_col_body_2"
												style="width: 50px; white-space: nowrap">
											<col id="grid11_col_body_3"
												style="width: 201px; white-space: nowrap;">
											<col id="grid11_col_body_4"
												style="width: 121px; white-space: nowrap;">
											<col id="grid11_col_body_5"
												style="width: 79px; white-space: nowrap;">
											<col id="grid11_col_body_6"
												style="width: 81px; white-space: nowrap;">
											<col id="grid11_col_body_7"
												style="width: 81px; white-space: nowrap;">
											<col id="grid11_col_body_8"
												style="width: 70px; white-space: nowrap">
											<col id="grid11_col_body_9"
												style="width: 81px; white-space: nowrap;">
											<col id="grid11_col_body_10"
												style="width: 81px; white-space: nowrap;">
											<col id="grid11_col_body_11"
												style="width: 70px; white-space: nowrap">
											<col id="grid11_col_body_12"
												style="width: 81px; white-space: nowrap;">
											<col id="grid11_col_body_13"
												style="width: 0px; white-space: nowrap">
										</colgroup>
										<caption
											style="height: 1.5px; background-color: rgb(108, 165, 227);"></caption>
										<thead>
											<tr></tr>
										</thead>
										<thead id="grid11_head_table" style="width: 624px;"
											class="gridHeaderTableDefault">
											<tr role="row" class="gridHeaderStyle_0">
												<th id="grid11_column622"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="60" value="협력회사" colindex="0" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column0"
													col_id="column622" header_id="column622"><nobr>협력회사</nobr></th>
												<th id="grid11_column2058"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="200" value="협력회사명" colindex="1" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column1"
													col_id="column2058" header_id="column2058"><nobr>협력회사명</nobr></th>
												<th id="grid11_column2183"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="50" value="브랜드" colindex="2" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column2"
													col_id="column2183" header_id="column2183"><nobr>브랜드</nobr></th>
												<th id="grid11_column2181"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="200" value="브랜드명" colindex="3" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column3"
													col_id="column2181" header_id="column2181"><nobr>브랜드명</nobr></th>
												<th id="grid11_column2060"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="120" value="PO번호" colindex="4" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column4"
													col_id="column2060" header_id="column2060"><nobr>PO번호</nobr></th>
												<th id="grid11_column2062"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="입고예정일자" colindex="5" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column5"
													col_id="column2062" header_id="column2062"><nobr>입고예정일자</nobr></th>
												<th id="grid11_column2187"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="발주일자" colindex="6" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column6"
													col_id="column2187" header_id="column2187"><nobr>발주일자</nobr></th>
												<th id="grid11_column2066"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="총 발주수량" colindex="7" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column7"
													col_id="column2066" header_id="column2066"><nobr>총 발주수량</nobr></th>
												<th id="grid11_column2401"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="70" value="추가<BR>입고율(%)" colindex="8"
													role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column8"
													col_id="column2401" header_id="column2401"><nobr>
														추가<br>입고율(%)
													</nobr></th>
												<th id="grid11_column2068"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="총 입고수량" colindex="9" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column9"
													col_id="column2068" header_id="column2068"><nobr>총
														입고수량</nobr></th>
												<th id="grid11_column2070"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="총 잔량" colindex="10" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column10"
													col_id="column2070" header_id="column2070"><nobr>총
														잔량</nobr></th>
												<th id="grid11_column2072"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="70" value="총 입고횟수" colindex="11" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column11"
													col_id="column2072" header_id="column2072"><nobr>총
														입고횟수</nobr></th>
												<th id="grid11_column2074"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="80" value="최종입고일자" colindex="12" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column12"
													col_id="column2074" header_id="column2074"><nobr>최종입고일자</nobr></th>
												<th id="grid11_column2384"
													style="height: 20px; text-align: center" inputtype="text"
													or_wd="70" colindex="13" role="gridcell"
													class="gridHeaderTDDefault gridHeaderTDDefault_data grid11_header__column13"
													col_id="column2384" header_id="column2384"><nobr></nobr></th>
											</tr>
										</thead>
										<tbody id="grid11_body_tbody">
											<tr role="row" trindex="0"
												class="grid_body_row w2grid_hidedRow" style="display: none;">
												<td id="grid11_cell_0_0" style="" inputtype="text"
													width="70" readonly="true" colindex="0" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_0_"
													col_id="VND_CD" tdindex="0"></td>
												<td id="grid11_cell_0_1" style="" inputtype="text"
													width="70" textalign="left" readonly="true" colindex="1"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_1_"
													col_id="VND_NM" tdindex="1"></td>
												<td id="grid11_cell_0_2" style="" inputtype="text"
													width="70" readonly="true" colindex="2" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_2_"
													col_id="BRAN_CD" tdindex="2"></td>
												<td id="grid11_cell_0_3" style="" inputtype="text"
													width="70" textalign="left" readonly="true" colindex="3"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_3_"
													col_id="BRAN_NM" tdindex="3"></td>
												<td id="grid11_cell_0_4" style="" inputtype="text"
													width="70" readonly="true" colindex="4" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_4_"
													col_id="PO_NO" tdindex="4"></td>
												<td id="grid11_cell_0_5" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="5"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_5_"
													col_id="RECP_EXPT_DT" tdindex="5"></td>
												<td id="grid11_cell_0_6" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="6"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_6_"
													col_id="PUR_ORD_DT" tdindex="6"></td>
												<td id="grid11_cell_0_7" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="7"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_7_"
													col_id="TO_QTY" tdindex="7"></td>
												<td id="grid11_cell_0_8" style="" inputtype="text"
													width="70" datatype="number" readonly="true"
													displayformat="#,##0%" colindex="8" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_8_"
													col_id="ADD_RCV_RATE" tdindex="8"></td>
												<td id="grid11_cell_0_9" style="" inputtype="expression"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number"
													expression="fn_calcQty3(rowIndex())" colindex="9"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_9_"
													col_id="CALC_TI_QTY" tdindex="9"></td>
												<td id="grid11_cell_0_10" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="10"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_10_"
													col_id="RM_QTY" tdindex="10"></td>
												<td id="grid11_cell_0_11" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="11"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_11_"
													col_id="RECP_CNT" tdindex="11"></td>
												<td id="grid11_cell_0_12" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="12"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_12_"
													col_id="RECP_MDT" tdindex="12"></td>
												<td id="grid11_cell_0_13" style="" inputtype="text"
													width="70" colindex="13" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_13_"
													col_id="TI_QTY" tdindex="13"></td>
											</tr>
											<tr role="row" trindex="0"
												class="grid_body_row w2grid_hidedRow" style="display: none;">
												<td id="grid11_cell_1_0" style="" inputtype="text"
													width="70" readonly="true" colindex="0" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_0_"
													col_id="VND_CD" tdindex="14"></td>
												<td id="grid11_cell_1_1" style="" inputtype="text"
													width="70" textalign="left" readonly="true" colindex="1"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_1_"
													col_id="VND_NM" tdindex="15"></td>
												<td id="grid11_cell_1_2" style="" inputtype="text"
													width="70" readonly="true" colindex="2" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_2_"
													col_id="BRAN_CD" tdindex="16"></td>
												<td id="grid11_cell_1_3" style="" inputtype="text"
													width="70" textalign="left" readonly="true" colindex="3"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_3_"
													col_id="BRAN_NM" tdindex="17"></td>
												<td id="grid11_cell_1_4" style="" inputtype="text"
													width="70" readonly="true" colindex="4" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_4_"
													col_id="PO_NO" tdindex="18"></td>
												<td id="grid11_cell_1_5" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="5"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_5_"
													col_id="RECP_EXPT_DT" tdindex="19"></td>
												<td id="grid11_cell_1_6" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="6"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_6_"
													col_id="PUR_ORD_DT" tdindex="20"></td>
												<td id="grid11_cell_1_7" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="7"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_7_"
													col_id="TO_QTY" tdindex="21"></td>
												<td id="grid11_cell_1_8" style="" inputtype="text"
													width="70" datatype="number" readonly="true"
													displayformat="#,##0%" colindex="8" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_8_"
													col_id="ADD_RCV_RATE" tdindex="22"></td>
												<td id="grid11_cell_1_9" style="" inputtype="expression"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number"
													expression="fn_calcQty3(rowIndex())" colindex="9"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_9_"
													col_id="CALC_TI_QTY" tdindex="23"></td>
												<td id="grid11_cell_1_10" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="10"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_10_"
													col_id="RM_QTY" tdindex="24"></td>
												<td id="grid11_cell_1_11" style="" inputtype="text"
													width="70" textalign="right" displayformat="#,###"
													readonly="true" datatype="number" colindex="11"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_11_"
													col_id="RECP_CNT" tdindex="25"></td>
												<td id="grid11_cell_1_12" style="" inputtype="text"
													width="70" datatype="date" readonly="true" colindex="12"
													role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_12_"
													col_id="RECP_MDT" tdindex="26"></td>
												<td id="grid11_cell_1_13" style="" inputtype="text"
													width="70" colindex="13" role="gridcell"
													class="gridBodyDefault gridBodyDefault_data grid11_columnstyle_13_"
													col_id="TI_QTY" tdindex="27"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="grid11_scrollX_div"
								style="z-index: 20; overflow-x: hidden; overflow-y: hidden; position: absolute; height: 0px; left: 0px; right: 0px; bottom: 0px;">
								<table id="grid11_scrollX_table"
									style="height: 18px; table-layout: fixed; border-collapse: collapse; border-spacing: 0px; width: 100%">
									<tbody>
										<tr>
											<td id="grid11_scrollX_left"
												style="border: 0px solid red; padding: 0px; height: 18px; width: 633px; vertical-align: bottom;"><div
													style="height: 18px; overflow-x: scroll; overflow-y: hidden"></div></td>
											<td
												style="border: 0px solid orange; padding: 0px 0px 0px 0px; height: 18px;"><div
													id="grid11_scrollX_right"
													style="height: 18px; border: 0px solid blue; overflow-x: scroll; overflow-y: hidden; padding: 0px 0px 0px 0px; padding-top: -5px;"
													tabindex="-1">
													<div id="grid11_scroll_size"
														style="height: 1px; width: 625px;"></div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="grid11_scrollY_div"
								style="z-index: 15; position: absolute; overflow: hidden; width: 0px; height: 100%; right: 0px;">
								<div id="grid11_size_y"
									style="height: 0px; position: absolute; top: 0px; left: 0px; width: 18px;"></div>
							</div>
							<div id="grid11_iScrollX" class="w2grid_iScrollX"
								style="visibility: hidden;"></div>
							<div id="grid11_iScrollY" class="w2grid_iScrollY"
								style="visibility: hidden;"></div>
							<div id="grid11_resize_line"
								style="display: none; position: absolute; top: 10px; bottom: 0px; border: 0px dashed #222222; border-left-width: 1px;"></div>
							<div id="grid11_noresult"
								style="display: none; position: relative; width: auto; color: rgb(85, 85, 85); border: 1px solid rgb(222, 198, 199); background-color: rgb(248, 240, 241); text-align: center; top: 35px; padding: 10px;"
								class="noRMC2">조회된 데이터가 없습니다.</div>
						</div>
					</div>
					
					</div>
				</div>
			</div>
		</div>
</body>
</html>