<?xml version="1.0" encoding="UTF-8"?>
<!-- 
This Stylesheet modified part of CF D800196.
IBOR Replacement (RFR) changes were done to following Notice Types
	All In One Notice
	New Loan Notice
	Rate Change Notice
	Rollover Notice of Intent
	Rollover Confirmation Notice
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
       <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
       <xsl:template match="/">
             <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
             <html>
                    <head>
                           <title>ACBS Notification</title>
                           <style>
                                 body, table, p, th, td, h1, h2 {font:normal 10pt
                                 arial;text-align:left;vertical-align:top;margin:0;padding:0}
                                 p {margin:5px 0 18px 0;font:normal 10pt arial}
                                 p.para {margin:5px 0 18px 0;font:normal 10pt arial;padding-top:8px}
                                 p.regenerated {font-weight:bold;margin:20px 0 10px 0}
                                 p.indent {padding:40px 0 20px 30px}
                                 p.proof {padding:10px 0 0 20px}
                                 p.schedule {margin:25px 0 0 0}
                                 h1 {font-weight:bold;margin-top:18px}
                                 h2 {border:1px solid #000;text-align:center;font:bold 24pt "arial black";padding:20px;margin:10px}
                                 table {border:none;border-collapse:collapse;border-spacing:0}
                                 img {padding-bottom:10px}
                                 .right {text-align:right}
								 .bold {font-weight:bold}
								 .bold-right {font-weight:bold; text-align:right}								 
                                 div.header-logo-right {text-align:right}
                                 div.address td, div.address th {white-space:nowrap}
                                 div.address td.full-width {width:100%}
                                 div.address td.half-width {width:50%}
                                 div.address th {padding-right:8px;font-weight:normal}
                                 div.address th.pad, div.address td.pad {padding-top:18px}
                                 div.sub-heading th {font-weight:normal;width:55px;text-align:right;padding-right:10px}
                                 div.sub-heading th.pad, div.sub-heading td.pad {padding-top:18px}
                                 div.sub-heading th.padb, div.sub-heading td.padb {padding-bottom:18px}
                                 div.section h1 {border-bottom:1px solid #000;line-height:20px;margin-bottom:3px}
                                 div.section table {width:100%}
                                 div.section table.breakdown {margin-top:12px}
                                 div.section table.breakdown td, 
                                 div.section table.breakdown th {width:10px;text-align:center;border:1px solid #000;padding:3px 5px;white-space:nowrap} 								 
                                 div.section table.breakdown th {font-weight:bold}
                                 div.section td, div.section th {width:50%;padding:0 5px 0 5px}
                                 div.section th {font-weight:normal;text-align:right}
                                 div.section td.pad, div.section th.pad {padding-top:18px}
                                 div.section td.padb, div.section th.padb {padding-bottom:18px}
                                 div.flood-subject {padding-top:30px}
                                 div.flood-subject th {width:60px;font-weight:normal}
                                 div.flood-subject td {width:200px;padding-right:20px}
                                 div.user-text p {padding-top:20px}
                                 div.closing td {padding-right:10px}
                                 div.contact-info p.indent {padding:0 0 0 30px}
                                 div.contact-info th {font-weight:normal;width:60px;text-align:right;padding-right:10px}
                                 div.footer-text p {font-size:10pt;padding:30px 0}
                                 div.footer-tag p {padding-top:10px}
                                 div.footer-logo {text-align:right}								 
                           </style>
                    </head>
                    <body>
                           <xsl:apply-templates select="TransactionsProcessedNotice"/>
                           <xsl:apply-templates select="RolloverNoticeOfIntent"/>
                           <xsl:apply-templates select="NewLoanNotice"/>
                           <xsl:apply-templates select="RateChangeNotice"/>
                           <xsl:apply-templates select="RolloverConfirmationNotice"/>                      
                           <xsl:apply-templates select="Flood45DayNotice"/>
                           <xsl:apply-templates select="FacilityFeePaymentNotice"/>
                           <xsl:apply-templates select="AllInOneNotice"/>                    
                           
                    </body>
             </html>
       </xsl:template>
       <!-- New Loan -->
       <xsl:template match="NewLoanNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
             <xsl:apply-templates select="NewBorrowing"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- All In One -->
       <xsl:template match="AllInOneNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <xsl:apply-templates select="LimitTransactionSection"/>
             <xsl:apply-templates select="FeeRateChangeSection"/>
             <xsl:apply-templates select="NewLoanSection"/>
             <xsl:apply-templates select="RolloverSection"/>
             <xsl:apply-templates select="FxRateSection"/>
             <xsl:apply-templates select="LoanRateChangeSection"/>
             <xsl:apply-templates select="CashTransactionsSection"/>
             <xsl:apply-templates select="PaymentInstructionSection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
			 <xsl:if test="RFRAccrualBreakdownSection">
				<xsl:apply-templates select="RFRAccrualBreakdownSection"/>			 
			 </xsl:if>
       </xsl:template>
       <!-- Rollover Confirmation -->
       <xsl:template match="RolloverConfirmationNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
			 <!-- SOFR Changes 
             <xsl:apply-templates select="RolloverInfoSection"/>
             <xsl:apply-templates select="RolloverDetailsSection"/>
             <xsl:apply-templates select="RateSettingSection"/>
             <xsl:apply-templates select="FxSection"/>
             <xsl:apply-templates select="RemittanceSection"/>
			 -->
			 <xsl:apply-templates select="RolloverConfirmationSection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- Rollover Notice of Intent -->
       <xsl:template match="RolloverNoticeOfIntent">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
			 <!-- SOFR Changes 
             <xsl:apply-templates select="RolloverInfoSection"/>
             <xsl:apply-templates select="RolloverDetailsSection"/>
             <xsl:apply-templates select="RateSettingSection"/>
             <xsl:apply-templates select="FxSection"/>
             <xsl:apply-templates select="RemittanceSection"/>
			 -->
			 <xsl:apply-templates select="RolloverNOISection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- Transactions Processed -->
       <xsl:template match="TransactionsProcessedNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
             <xsl:apply-templates select="FacilityTransactionsSection"/>
             <xsl:apply-templates select="CashTransactionsSection"/>
             <xsl:apply-templates select="RemittanceSection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- Facility Fee Payment -->
       <xsl:template match="FacilityFeePaymentNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
             <xsl:apply-templates select="CashTransactionsSection"/>
             <xsl:apply-templates select="RemittanceSection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- Rate Change -->
       <xsl:template match="RateChangeNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <xsl:apply-templates select="RecipientInformation"/>
             <xsl:apply-templates select="CustomerHeading"/>
             <xsl:apply-templates select="FacilityHeading"/>
             <xsl:apply-templates select="Regenerated"/>
             <xsl:apply-templates select="RateInformationSection"/>       
             <xsl:apply-templates select="RateChangeTransaction"/>    
             <xsl:apply-templates select="RateChangeRollover"/>
             <xsl:apply-templates select="RateChangeNewLoan"/>        
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="ContactInformation"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- 45 Day Flood Letter -->
       <xsl:template match="Flood45DayNotice">
             <xsl:if test="NotificationName">
                    <h2>
                           <xsl:value-of select="NotificationName"/>
                    </h2>
             </xsl:if>
             <xsl:apply-templates select="Header"/>
             <p class="para">
                    <xsl:value-of select="NoticeDate"/>
             </p>
             <xsl:apply-templates select="BankAddress"/>
             <xsl:apply-templates select="RecipientAddress"/>
             <xsl:apply-templates select="FloodSubjectSection"/>
             <p class="para">
                    Dear Mortgagors(s):
             </p>
             <xsl:apply-templates select="FloodNoticeLead"/>
             <p class="proof">
                    Proof of insurance Due Date:
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="ProofOfInsuranceDueDate"/>
             </p>
             <xsl:apply-templates select="FloodNoticeInstructions"/>
             <p class="para">
                    <xsl:value-of select="ClosingText"/>
             </p>
             <xsl:apply-templates select="ClosingFooterSection"/>
             <xsl:apply-templates select="UserTextSection"/>
             <xsl:apply-templates select="Footer"/>
       </xsl:template>
       <!-- Header part -->
       <xsl:template match="Header">
             <xsl:apply-templates select="HeaderLogo"/>
             <xsl:apply-templates select="BankAddress"/>
       </xsl:template>
       <!-- Header logo part -->
       <xsl:template match="HeaderLogo">
          <xsl:if test="not(LogoAlign) or LogoAlign = 'LEFT'">
             <div class="header-logo">
               <img src="{LogoUrl}" alt="Logo"/>
             </div>
           </xsl:if>
           <xsl:if test="LogoAlign = 'RIGHT'">
             <div class="header-logo-right">
               <img src="{LogoUrl}" alt="Logo"/>
             </div>                           
           </xsl:if>   
       </xsl:template>
       <!-- Bank address part -->
       <xsl:template match="BankAddress">
             <xsl:apply-templates select="Address"/>
       </xsl:template>
       <!-- Recipient address part -->
       <xsl:template match="RecipientAddress">
             <xsl:apply-templates select="Address"/>
       </xsl:template>
       <!-- Address part -->
       <xsl:template match="Address">
             <div class="address">
                    <table>
                           <tr>
                                 <xsl:if test="not(AddressAlign) or (AddressAlign = 'LEFT')">
                                        <td>
                                               <table>
                                                     <xsl:apply-templates select="AddressLines"/>
                                               </table>
                                        </td>
                                 </xsl:if>
                                 <xsl:if test="(AddressAlign = 'RIGHT')">
                                        <td class="full-width"/>
                                        <td>
                                               <table>
                                                     <xsl:apply-templates select="AddressLines"/>
                                               </table>
                                        </td>
                                 </xsl:if>
                                 <xsl:if test="(AddressAlign = 'CENTER')">
                                        <td class="half-width"/>
                                        <td>
                                               <table>
                                                     <xsl:apply-templates select="AddressLines"/>
                                               </table>
                                        </td>
                                        <td class="half-width"/>
                                 </xsl:if>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Address lines part -->
       <xsl:template match="AddressLines">
             <xsl:for-each select="AddressLine">
                    <tr>
                           <td>
                                 <xsl:value-of select="."/>
                           </td>
                    </tr>
             </xsl:for-each>
             <tr>
                    <td>
                           <xsl:value-of select="City"/>
                           <xsl:text>, </xsl:text>
                           <xsl:value-of select="StateProvince"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="PostalCode"/>
                    </td>
             </tr>
             <xsl:if test="Country">
                    <tr>
                           <td>
                                 <xsl:value-of select="Country"/>
                           </td>
                    </tr>
             </xsl:if>
             <tr>
                    <td>
                           <table>
                                 <tr>
                                        <th class="pad">Phone:</th>
                                        <td class="pad">
                                               <xsl:value-of select="Telephone"/>
                                        </td>
                                 </tr>
                                 <tr>
                                        <th>Fax:</th>
                                        <td>
                                               <xsl:value-of select="Fax"/>
                                        </td>
                                 </tr>
                                 <tr>
                                        <th>Email:</th>
                                        <td>
                                               <xsl:value-of select="Email"/>
                                        </td>
                                 </tr>
                           </table>
                    </td>
             </tr>
       </xsl:template>
       <!-- Recipient information part -->
       <xsl:template match="RecipientInformation">
             <div class="sub-heading">
                    <table>
			 <xsl:if test="Date">
                           <tr>
                                 <th class="pad">Date:</th>
                                 <td class="pad">
                                        <xsl:value-of select="Date"/>
                                 </td>
                           </tr>
                         </xsl:if>
                           <tr>
                                 <th>To:</th>
                                 <td>
                                        <xsl:value-of select="To"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th class="pad">Attn:</th>
                                 <td class="pad">
                                        <xsl:value-of select="Attn"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Phone:</th>
                                 <td>
                                        <xsl:value-of select="Phone"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Fax:</th>
                                 <td>
                                        <xsl:value-of select="Fax"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Email:</th>
                                 <td>
                                        <xsl:value-of select="Email"/>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Customer heading part -->
       <xsl:template match="CustomerHeading">
             <div class="sub-heading">
                    <table>
                           <tr>
                                 <th class="pad">Re:</th>
                                 <td class="pad">
                                        <xsl:value-of select="Regarding"/>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Facility heading part -->
       <xsl:template match="FacilityHeading">
             <div class="sub-heading">
                    <table>
                           <tr>
                                 <th class="pad">Re:</th>
                                 <td class="pad">
                                        <xsl:value-of select="Regarding"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>
                                        <xsl:value-of select="FacilityDesc"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>
                                        <xsl:value-of select="FacilityNumber"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>
                                        <xsl:value-of select="FacilityAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="FacilityAmount"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>
                                        Effective as of
                                        <xsl:value-of select="EffectiveDate"/>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Regenerated message part -->
       <xsl:template match="Regenerated">
             <p class="regenerated">
                    <xsl:value-of select="Message"/>
             </p>
       </xsl:template>
       <!-- Limit transaction section -->
       <xsl:template match="LimitTransactionSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="LimitTransaction"/>
             </div>
       </xsl:template>
       <!-- Limit transaction item -->
       <xsl:template match="LimitTransaction">
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Transaction Description:</th>
                           <td>
                                 <xsl:value-of select="TransactionDesc"/>
                           </td>
                    </tr>
                    <xsl:if test="Limit">
                           <tr>
                                 <th>Limit:</th>
                                 <td>
                                        <xsl:value-of select="Limit"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="TransactionAmount">
                           <tr>
                                 <th class="padb">Transaction Amount:</th>
                                 <td class="padb">
                                        <xsl:value-of select="TransactionCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="TransactionAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalTransAmount">
                           <tr>
                                 <th>Global Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalTransAmountCcy"/>
					<xsl:value-of select="GlobalTransCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalTransAmount"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th class="padb">Your Share:</th>
                                 <td class="padb">
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
       <!-- Fee rate change information section -->
       <xsl:template match="RateInformationSection">
        <div class="section">
             <table>
             	<xsl:if test="SectionTitle">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                </xsl:if>
                <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                </xsl:if>
             	<xsl:if test="RateEffectiveDate">
                    <tr>
                           <th>Rate Effective Date:</th>
                           <td>
                                 <xsl:value-of select="RateEffectiveDate"/>
                           </td>
                    </tr>
                </xsl:if>
                <xsl:if test="TranEffectiveDate">
                    <tr>
                           <th>Rate Effective Date:</th>
                           <td>
                                 <xsl:value-of select="TranEffectiveDate"/>
                           </td>
                    </tr>
                </xsl:if>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <tr>
                           <th>Transaction Description:</th>
                           <td>
                                 <xsl:value-of select="TransactionDesc"/>
                           </td>
                    </tr>
                    <tr>
                           <th class="padb">New Accrual Rate:</th>
                           <td class="padb">
                                 <xsl:value-of select="NewAccrualRate"/>
                           </td>
                    </tr>
             </table>
          </div>
       </xsl:template>
       <xsl:template match="RateChangeTransaction">
             <div class="section">
             	<xsl:if test="SectionTitle">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                </xsl:if>
                <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                </xsl:if>
                <xsl:apply-templates select="FeeRateChange"/>
             </div>
       </xsl:template>
       <xsl:template match="FeeRateChangeSection">
             <div class="section">
             	<xsl:if test="SectionTitle">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                </xsl:if>
                <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                </xsl:if>
                <xsl:apply-templates select="FeeRateChange"/>
             </div>
       </xsl:template>
       <!-- Fee rate change item -->
       <xsl:template match="FeeRateChange">
             <table>
             	<xsl:if test="RateEffectiveDate">
                    <tr>
                           <th>Rate Effective Date:</th>
                           <td>
                                 <xsl:value-of select="RateEffectiveDate"/>
                           </td>
                    </tr>
                </xsl:if>
                <xsl:if test="TranEffectiveDate">
                    <tr>
                           <th>Rate Effective Date:</th>
                           <td>
                                 <xsl:value-of select="TranEffectiveDate"/>
                           </td>
                    </tr>
                </xsl:if>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <tr>
                           <th>Transaction Description:</th>
                           <td>
                                 <xsl:value-of select="TransactionDesc"/>
                           </td>
                    </tr>
                    <tr>
                           <th class="padb">New Accrual Rate:</th>
                           <td class="padb">
                                 <xsl:value-of select="NewAccrualRate"/>
                           </td>
                    </tr>
             </table>
       </xsl:template>
       <!-- New loan section -->
       <xsl:template match="NewLoanSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <xsl:apply-templates select="NewLoan"/>
             </div>
       </xsl:template>
       <!-- New loan item -->
       <xsl:template match="NewLoan">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="ObligorName">
                           <tr>
                                 <th>Loan Obligor:</th>
                                 <td>
                                        <xsl:value-of select="ObligorName"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Loan Number:</th>
                           <td>
                                 <xsl:value-of select="LoanNumber"/>
                           </td>
                    </tr>
                    <xsl:if test="LoanAmount">
                           <tr>
                                 <th>Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="LoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="LoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalLoanAmount">
                           <tr>
                                 <th>Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalLoanAmount"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="PricingOption">
                           <tr>
                                 <th>Pricing Option:</th>
                                 <td>
                                        <xsl:value-of select="PricingOption"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="InterestRateType">
                           <tr>
                                 <th>Interest Rate Type:</th>
                                 <td>
                                        <xsl:value-of select="InterestRateType"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- End D800196 Changes -->
                    <xsl:if test="EscrowDeposit">
                           <tr>
                                 <th>Escrow Deposit:</th>
                                 <td>
                                        <xsl:value-of select="EscrowDepositCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="EscrowDeposit"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="DiscountAmount">
                           <tr>
                                 <th>Discount Amount:</th>
                                 <td>
                                        <xsl:value-of select="DiscountAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="DiscountAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="DiscFeeAmount">
                           <tr>
                                 <th>Discount Fee Amount:</th>
                                 <td>
                                        <xsl:value-of select="DiscFeeAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="DiscFeeAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
             <xsl:apply-templates select="RateScheduleInfo"/>
             <xsl:apply-templates select="FxRateInfo"/>
             <xsl:apply-templates select="FlatFeePayment"/>
             <xsl:apply-templates select="FlatFeeNoPayment"/>
       </xsl:template>
       <!-- New borrowing item -->
       <xsl:template match="NewBorrowing">
             <xsl:apply-templates select="NewBorrowingSection"/>
             <xsl:apply-templates select="RateSettingSection"/>
             <xsl:apply-templates select="FxRateSection"/>
             <xsl:apply-templates select="FlatFeeRateInfoSection"/>
             <xsl:apply-templates select="PaymentInstructionSection"/>
       </xsl:template>
       <!-- New borrowing section -->
       <xsl:template match="NewBorrowingSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <table>
                           <tr>
                                 <th class="padb">Loan Number:</th>
                                 <td class="padb">
                                        <xsl:value-of select="LoanNumber"/>
                                 </td>
                           </tr>
                           <xsl:if test="ObligorName">
                                 <tr>
                                        <th>Loan Obligor:</th>
                                        <td>
                                               <xsl:value-of select="ObligorName"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="LoanAmount">
                                 <tr>
                                        <th>Loan Amount:</th>
                                        <td>
                                               <xsl:value-of select="LoanAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                              <xsl:value-of select="LoanAmount"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="GlobalAmount">
                                 <tr>
                                        <th>Global Loan Amount:</th>
                                        <td>
                                               <xsl:value-of select="GlobalAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="GlobalAmount"/>
                                        </td>
                                 </tr>
                                 <tr>
                                        <th>Your Share:</th>
                                        <td>
                                               <xsl:value-of select="YourShareCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="YourShare"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="PricingOption">
                                 <tr>
                                        <th>Pricing Option:</th>
                                        <td>
                                               <xsl:value-of select="PricingOption"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="InterestRateType">
                                 <tr>
                                        <th>Interest Rate Type:</th>
                                        <td>
                                               <xsl:value-of select="InterestRateType"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="ValueDate">
                                 <tr>
                                        <th>Value Date:</th>
                                        <td>
                                               <xsl:value-of select="ValueDate"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="RateMaturityDate">
                                 <tr>
                                        <th>Rate Maturity Date:</th>
                                        <td>
                                               <xsl:value-of select="RateMaturityDate"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="RateSettingDate">
                                 <tr>
                                        <th>Rate Setting Date:</th>
                                        <td>
                                               <xsl:value-of select="RateSettingDate"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                    </table>
             </div>
       </xsl:template>
       <!-- Rate schedule information item -->
       <xsl:template match="RateScheduleInfo">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <xsl:apply-templates select="AccrualSchedule"/>
			 <!-- D800196 Changes -->
			 <xsl:apply-templates select="RFRAccrualSchedule"/>
			 <!-- End D800196 Changes -->
       </xsl:template>
       <!-- Accrual schedule item -->
       <xsl:template match="AccrualSchedule">
             <table>
                    <xsl:if test="Schedule">
                           <tr>
                                 <th>Schedule:</th>
                                 <td>
                                        <xsl:value-of select="Schedule"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="BaseRate">
					<!-- End D800196 Changes -->
						<tr>
							<th>Base Rate:</th>
							<td>
								<xsl:value-of select="BaseRate"/>
							</td>
						</tr>
					<!-- D800196 Changes -->	
					</xsl:if>
						
					<xsl:if test="AdjustedBaseRate">
						<tr>
							<th>Adjusted Base Rate:</th>
							<td>
								<xsl:value-of select="AdjustedBaseRate"/>
							</td>
						</tr>					
					</xsl:if>
					<!-- End D800196 Changes -->
                    <tr>
                           <th>Margin/Spread Rate:</th>
                           <td>
                                 <xsl:value-of select="MarginSpreadRate"/>
                           </td>
                    </tr>
                    <xsl:if test="ReserveRate">
                           <tr>
                                 <th>Reserve Rate:</th>
                                 <td>
                                        <xsl:value-of select="ReserveRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<!-- D800196 Changes -->
					<xsl:if test="AllInRate">
					<!-- End D800196 Changes -->
						<tr>
							<th>All-In Rate:</th>
							<td>
                                <xsl:value-of select="AllInRate"/>
							</td>
						</tr>
					<!-- D800196 Changes -->	
					</xsl:if>
					
					<xsl:if test="AdjustedAllInRate">
						<tr>
							<th>Adjusted All-In Rate:</th>
							<td>
                                <xsl:value-of select="AdjustedAllInRate"/>
							</td>
						</tr>
					</xsl:if>
					<!-- End D800196 Changes -->
					
                    <xsl:if test="RateSettingDate">
                           <tr>
                                 <th>Rate Setting Date:</th>
                                 <td>
                                        <xsl:value-of select="RateSettingDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="RateMaturityDate">
                           <tr>
                                 <th>Rate Maturity Date:</th>
                                 <td>
                                        <xsl:value-of select="RateMaturityDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="NextRateSettingDate">
                           <tr>
                                 <th>Next Rate Setting Date:</th>
                                 <td>
                                        <xsl:value-of select="NextRateSettingDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
	   
	   <!-- D800196 Changes -->
	   <!-- RFR Accrual schedule item -->
       <xsl:template match="RFRAccrualSchedule">
					
            <xsl:if test="RFRSectionSubText">
                    <p class="para">
                           <xsl:value-of select="RFRSectionSubText"/>
                    </p>
			</xsl:if>
			
	   
             <table>
                    <xsl:if test="RateDescription">
                           <tr>
                                 <th>Rate Description:</th>
                                 <td>
                                        <xsl:value-of select="RateDescription"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="BaseRateAtStartofPeriod">					
						<tr>
							<th>Base Rate at Start of Period:</th>
							<td>
								<xsl:value-of select="BaseRateAtStartofPeriod"/>
							</td>
						</tr>					
					</xsl:if>
					
					<xsl:if test="AdjBaseRateAtStartofPeriod">					
						<tr>
							<th>Adjusted Base Rate at Start of Period:</th>
							<td>
								<xsl:value-of select="AdjBaseRateAtStartofPeriod"/>
							</td>
						</tr>					
					</xsl:if>				
						
                    <tr>
                           <th>Margin/Spread Rate:</th>
                           <td>
                                 <xsl:value-of select="MarginSpreadRate"/>
                           </td>
                    </tr>
					
                    <xsl:if test="ReserveSpreadAdjRate">
                           <tr>
                                 <th>Reserve/Spread Adjustment Rate:</th>
                                 <td>
                                        <xsl:value-of select="ReserveSpreadAdjRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
										
					<xsl:if test="StarttingAllInRate">					
						<tr>
							<th>Starting All-In Rate:</th>
							<td>
                                <xsl:value-of select="StarttingAllInRate"/>
							</td>
						</tr>					
					</xsl:if>
					
					<xsl:if test="AdjStarttingAllInRate">
						<tr>
							<th>Adjusted Starting All-In Rate:</th>
							<td>
                                <xsl:value-of select="AdjStarttingAllInRate"/>
							</td>
						</tr>
					</xsl:if>					
					
					<xsl:if test="YearBasis">
                           <tr>
                                 <th>Year Basis:</th>
                                 <td>
                                        <xsl:value-of select="YearBasis"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="ReferenceRateCalcMethod">
                           <tr>
                                 <th>Reference Rate Calculation Method:</th>
                                 <td>
                                        <xsl:value-of select="ReferenceRateCalcMethod"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="RateSetLagDays">
                           <tr>
                                 <th>Rate Set Lag Days:</th>
                                 <td>
                                        <xsl:value-of select="RateSetLagDays"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="IndexEffectiveDate">
                           <tr>	
								<th>Index Effective Date:</th>							
								<td>
									<xsl:value-of select="IndexEffectiveDate"/>
								</td>
							</tr>
                    </xsl:if>
																		
					<xsl:if test="NextRatePeriodDate">
                           <tr>
                                 <th>Next Rate Period Date:</th>
                                 <td>
                                        <xsl:value-of select="NextRatePeriodDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
	   
       <!-- FX rate information item -->
       <xsl:template match="FxRateInfo">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <xsl:apply-templates select="FxRate"/>
       </xsl:template>
       <!-- FX rate item -->
       <xsl:template match="FxRate">
             <table>
                    <xsl:if test="ObligorName">
                           <tr>
                                 <th>Loan Obligor:</th>
                                 <td>
                                        <xsl:value-of select="ObligorName"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="LoanNumber">
                           <tr>
                                 <th>Loan Number:</th>
                                 <td>
                                        <xsl:value-of select="LoanNumber"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Loan Currency:</th>
                           <td>
                                 <xsl:value-of select="LoanCcy"/>
                           </td>
                    </tr>
                    <tr>
                           <th>Facility Currency:</th>
                           <td>
                                 <xsl:value-of select="FacilityCcy"/>
                           </td>
                    </tr>
                    <tr>
                           <th>From Date:</th>
                           <td>
                                 <xsl:value-of select="FromDate"/>
                           </td>
                    </tr>
                    <tr>
                           <th>To Date:</th>
                           <td>
                                 <xsl:value-of select="ToDate"/>
                           </td>
                    </tr>
                    <tr>
                           <th>Rate For The Period:</th>
                           <td>
                                 <xsl:value-of select="PeriodRate"/>
                           </td>
                    </tr>
             </table>
       </xsl:template>
       <!-- Flat fee payment item -->
       <xsl:template match="FlatFeePayment">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <xsl:if test="FeeAmount">
                           <tr>
                                 <th>Fee Amount:</th>
                                 <td>
                                        <xsl:value-of select="FeeAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="FeeAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalFeeAmount">
                           <tr>
                                 <th>Global Fee Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalFeeAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalFeeAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
       <!-- Flat fee no payment item -->
       <xsl:template match="FlatFeeNoPayment">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <xsl:if test="FeeAmount">
                           <tr>
                                 <th>Fee Amount:</th>
                                 <td>
                                        <xsl:value-of select="FeeAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="FeeAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalFeeAmount">
                           <tr>
                                 <th>Global Fee Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalFeeAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalFeeAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
       <!-- Flat fee rate information section -->
       <xsl:template match="FlatFeeRateInfoSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <xsl:apply-templates select="FlatFeeRateInfo"/>
             </div>
       </xsl:template>
       <!-- Flat fee rate information item -->
       <xsl:template match="FlatFeeRateInfo">
             <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
             </xsl:if>
             <table>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <xsl:if test="TransactionAmount">
                          <tr>
                                 <th>Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="TransactionAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="TransactionAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalTransAmount">
                           <tr>
                                 <th>Global Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalTransAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalTransAmount"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Effective Date:</th>
                           <td>
                                 <xsl:value-of select="EffectiveDate"/>
                           </td>
                    </tr>
                    <tr>
                           <th class="padb">End Date:</th>
                           <td class="padb">
                                 <xsl:value-of select="EndDate"/>
                           </td>
                    </tr>
             </table>
       </xsl:template>
       <!-- Rollover section -->
       <xsl:template match="RolloverSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <xsl:apply-templates select="Rollover"/>
             </div>
       </xsl:template>
       <!-- Rollover item -->
       <xsl:template match="Rollover">
             <xsl:apply-templates select="RolloverDetails"/>
             <xsl:apply-templates select="RolloverRates"/>
       </xsl:template>
       <!-- Rollover details item -->
       <xsl:template match="RolloverDetails">
             <p class="para">
                    <xsl:value-of select="SectionText"/>
             </p>
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Loan Number:</th>
                           <td>
                                 <xsl:value-of select="LoanNumber"/>
                           </td>
                    </tr>
                    <xsl:if test="LoanAmount">
                           <tr>
                                 <th>Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="LoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="LoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalLoanAmount">
                           <tr>
                                 <th>Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalLoanAmount"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="InterestRateType">
                           <tr>
                                 <th>Interest Rate Type:</th>
                                 <td>
                                        <xsl:value-of select="InterestRateType"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="PricingOption">
					<!-- End D800196 Changes -->
						<tr>
                           <th>Pricing Option:</th>
                           <td>
                                 <xsl:value-of select="PricingOption"/>
                           </td>
						</tr>
					</xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="RateMaturityDate">
					<!-- End D800196 Changes -->
						<tr>
                           <th>Rate Maturity Date:</th>
                           <td>
                                 <xsl:value-of select="RateMaturityDate"/>
                           </td>
						</tr>
					</xsl:if>
                    <xsl:if test="NewLoanAmount">
                           <tr>
                                 <th>New Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="NewLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="NewLoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="NewGlobalLoanAmount">
                           <tr>
                                 <th>New Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="NewGlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="NewGlobalLoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourNewShare">
                           <tr>
                                 <th>Your New Share:</th>
                                 <td>
                                        <xsl:value-of select="YourNewShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourNewShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="NewRateMaturityDate">
                           <tr>
                                 <th>New Rate Maturity Date:</th>
                                 <td>
                                        <xsl:value-of select="NewRateMaturityDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
       <!-- Rollover rates item -->
       <xsl:template match="RolloverRates">
             <xsl:apply-templates select="RateSchedule"/>
			 <!-- D800225 Changes -->
			 <xsl:apply-templates select="RFRRateSchedule"/>
			 <!-- END D800225 Changes -->
       </xsl:template>
	   
	   <!-- Rollover Notice Of Intent section -->
 	    <xsl:template match="RolloverNOISection">
			 <xsl:apply-templates select="RolloverInfoSection"/>
             <xsl:apply-templates select="RolloverDetailsSection"/>
             <xsl:apply-templates select="RateSettingSection"/>
             <xsl:apply-templates select="FxSection"/>
             <xsl:apply-templates select="RemittanceSection"/>
	    </xsl:template>

		<!-- Rollover Confirmation section -->
 	    <xsl:template match="RolloverConfirmationSection">
			 <xsl:apply-templates select="RolloverInfoSection"/>
             <xsl:apply-templates select="RolloverDetailsSection"/>
             <xsl:apply-templates select="RateSettingSection"/>
             <xsl:apply-templates select="FxSection"/>
             <xsl:apply-templates select="RemittanceSection"/>

	    </xsl:template>
		
       <!-- Rollover information section -->
       <xsl:template match="RolloverInfoSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <table>
                           <xsl:if test="BorrowerName">
                                 <tr>
                                        <th class="padb">Borrower Name:</th>
                                        <td class="padb">
                                               <xsl:value-of select="BorrowerName"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="PricingOption">
                                 <tr>
                                        <th>Pricing Option:</th>
                                        <td>
                                               <xsl:value-of select="PricingOption"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="InterestRateType">
                                 <tr>
                                        <th>Interest Rate Type:</th>
                                        <td>
                                               <xsl:value-of select="InterestRateType"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <tr>
                                 <th>Loan Number:</th>
                                 <td>
                                        <xsl:value-of select="LoanNumber"/>
                                 </td>
                           </tr>
                           <xsl:if test="LoanAmount">
                                 <tr>
                                        <th>Loan Amount:</th>
                                        <td>
                                               <xsl:value-of select="LoanAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="LoanAmount"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="GlobalAmount">
                                 <tr>
                                        <th>Global Amount:</th>
                                        <td>
                                               <xsl:value-of select="GlobalAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="GlobalAmount"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="GlobalLoanAmount">
                                 <tr>
                                        <th>Global Loan Amount:</th>
                                        <td>
                                               <xsl:value-of select="GlobalLoanAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="GlobalLoanAmount"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="YourShare">
                                 <tr>
                                        <th>Your Share:</th>
                                        <td>
                                               <xsl:value-of select="YourShareCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="YourShare"/>
                                        </td>
                                 </tr>
                           </xsl:if>
						   <xsl:if test="RateMaturityDate">
                           <tr>
                                 <th>Rate Maturity Date:</th>
                                 <td>
                                        <xsl:value-of select="RateMaturityDate"/>
                                 </td>
                           </tr>
						   </xsl:if>
                    </table>
             </div>
       </xsl:template>
       <!-- Rollover details section -->
       <xsl:template match="RolloverDetailsSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <table>
                           <tr>
                                 <th>Value Date:</th>
                                 <td>
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                           <xsl:if test="AdditionalAdvanceRequested">
                                 <tr>
                                        <th>Additional Advance Requested:</th>
                                        <td>
                                               <xsl:value-of select="AdditionalAdvanceRequestedCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="AdditionalAdvanceRequested"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="PaydownAmount">
                                 <tr>
                                        <th>Paydown Amount:</th>
                                        <td>
                                               <xsl:value-of select="PaydownAmountCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="PaydownAmount"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <tr>
                                 <th>New Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="NewLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="NewLoanAmount"/>
                                 </td>
                           </tr>
                           <xsl:if test="YourShareOfAdvance">
                                 <tr>
                                        <th>Your Share Of Advance:</th>
                                        <td>
                                               <xsl:value-of select="YourShareOfAdvanceCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="YourShareOfAdvance"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="YourShareOfPaydown">
                                 <tr>
                                        <th>Your Share Of Paydown:</th>
                                        <td>
                                               <xsl:value-of select="YourShareOfPaydownCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="YourShareOfPaydown"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="NewRateMaturityDate">
                                 <tr>
                                        <th>New Rate Maturity Date:</th>
                                        <td>
                                               <xsl:value-of select="NewRateMaturityDate"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <xsl:if test="NewLegalMaturityDate">
                                 <tr>
                                        <th>New Legal Maturity Date:</th>
                                        <td>
                                               <xsl:value-of select="NewLegalMaturityDate"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                           <tr>
                                 <th class="pad">Interest Due At Rollover:</th>
                                 <td class="pad">
                                        <xsl:value-of select="InterestDueAtRolloverCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="InterestDueAtRollover"/>
                                 </td>
                           </tr>
                           <xsl:if test="YourShareOfInterestDue">
                                 <tr>
                                        <th>Your Share Of Interest Due:</th>
                                        <td>
                                               <xsl:value-of select="YourShareOfInterestDueCcy"/>
                                               <xsl:text> </xsl:text>
                                               <xsl:value-of select="YourShareOfInterestDue"/>
                                        </td>
                                 </tr>
                           </xsl:if>
                    </table>
             </div>
       </xsl:template>
       <!-- FX rate section -->
       <xsl:template match="FxRateSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="FxRate"/>
             </div>
       </xsl:template>
       <!-- Loan rate change section -->
       <xsl:template match="LoanRateChangeSection">
             <div class="section">
                    <h1 class="head1">
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="LoanRateChange"/>
             </div>
       </xsl:template>
       <!-- Loan rate change item -->
       <xsl:template match="LoanRateChange">
             <table>
                    <xsl:if test="ObligorName">
                           <tr>
                                 <th>Loan Obligor:</th>
                                 <td>
                                        <xsl:value-of select="ObligorName"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="LoanNumber">
	                    <tr>
	                           <th>Loan Number:</th>
	                           <td>
	                                 <xsl:value-of select="LoanNumber"/>
	                           </td>
	                    </tr>
                    </xsl:if>
                    <xsl:if test="LoanAmount">
                           <tr>
                                 <th>Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="LoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="LoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalLoanAmount">
                           <tr>
                                 <th>Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalLoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="PricingOption">
                           <tr>
                                 <th>Pricing Option:</th>
                                 <td>
                                        <xsl:value-of select="PricingOption"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="InterestRateType">
                           <tr>
                                 <th class ="padb">Interest Rate Type:</th>
                                 <td class ="padb">
                                        <xsl:value-of select="InterestRateType"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- End D800196 Changes -->
                    <xsl:if test="Schedule">
                           <tr>
                                 <th>Schedule:</th>
                                 <td>
                                        <xsl:value-of select="Schedule"/>
                                  </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="RateScheduleId">
                           <tr>
                                 <th>Rate Schedule:</th>
                                 <td>
                                        <xsl:value-of select="RateScheduleId"/>
                                  </td>
                           </tr>
                    </xsl:if>                    
                    <tr>
                           <th>Rate Effective Date:</th>
                           <td>
                                 <xsl:value-of select="RateEffectiveDate"/>
                           </td>
                    </tr>
                    <xsl:if test="NewBaseRate">
                           <tr>
                                 <th>New Base Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewBaseRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<!-- D800196 Changes -->
					<xsl:if test="NewAdjustedBaseRate">
                           <tr>
                                 <th>Adjusted New Base Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewAdjustedBaseRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- End D800196 Changes -->
					
                    <xsl:if test="NewMarginSpreadRate">
                           <tr>
                                 <th>New Margin/Spread Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewMarginSpreadRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="NewReserveRate">
                           <tr>
                                 <th>New Reserve Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewReserveRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<!-- D800196 Changes -->
					<xsl:if test="NewMinimumRate">
                           <tr>
                                 <th>New Minimum Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewMinimumRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="NewMaximumRate">
                           <tr>
                                 <th>New Maximum Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewMaximumRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="NewMinimumBaseRate">
                           <tr>
                                 <th>New Minimum Base Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewMinimumBaseRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="NewMaximumBaseRate">
                           <tr>
                                 <th>New Maximum Base Rate:</th>
                                 <td>
                                        <xsl:value-of select="NewMaximumBaseRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="NewAllInRate">
					<!-- End D800196 Changes -->
					
                    <tr>
                           <th>New All-In Rate:</th>
                           <td>
                                 <xsl:value-of select="NewAllInRate"/>
                           </td>
                    </tr>
					
					<!-- D800196 Changes -->
					</xsl:if>
					
					<xsl:if test="NewAdjustedAllInRate">
						<tr>
                           <th>Adjusted New All-In Rate:</th>
                           <td>
                                 <xsl:value-of select="NewAdjustedAllInRate"/>
                           </td>
						</tr>
					</xsl:if>
					<!-- End D800196 Changes -->
					
             </table>
       </xsl:template>
       
       <!-- Rate change (Transaction) -->
       <xsl:template match="RateChangeTransaction">
             <xsl:apply-templates select="LoanInformationSection"/>
             <xsl:apply-templates select="RateTransactionSection"/>
       </xsl:template>       
       
       <!-- Rate change (Rollover) -->
       <xsl:template match="RateChangeRollover">
             <xsl:apply-templates select="LoanInformationSection"/>
	     <div class="section">
             	<xsl:apply-templates select="RateSchedule"/>
				<!-- SOFR Changes -->
				<xsl:apply-templates select="RFRRateSchedule"/>
				<!-- End SOFR Changes -->
				
	     </div>
       </xsl:template>     
       
       <!-- Rate change (New Loan) -->
       <xsl:template match="RateChangeNewLoan">
             <xsl:apply-templates select="LoanInformationSection"/>
			 <xsl:if test="RateScheduleSection">
				<xsl:apply-templates select="RateScheduleSection"/>			 
			 </xsl:if>
			 <!-- D800196 Changes -->
			 <xsl:if test="RFRRateScheduleSection">
				<xsl:apply-templates select="RFRRateScheduleSection"/>
			 </xsl:if>
			 <!-- D800196 Changes -->
       </xsl:template>  
                     
       <!-- Loan information section -->
       <xsl:template match="LoanInformationSection">
	<xsl:if test=". != ''">
           <div class="section">
              <h1>
                     <xsl:value-of select="SectionTitle"/>
              </h1>
              <p class="para">
                     <xsl:value-of select="SectionText"/>
              </p>
             <table>
                    <xsl:if test="BorrowerName">
                           <tr>
                                 <th>Borrower Name:</th>
                                 <td>
                                        <xsl:value-of select="BorrowerName"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th class="padb">Loan Number:</th>
                           <td class="padb">
                                 <xsl:value-of select="LoanNumber"/>
                           </td>
                    </tr>
                    <xsl:if test="LoanAmount">
                           <tr>
                                 <th>Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="LoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="LoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalAmount">
                           <tr>
                                 <th>Global Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalLoanAmount">
                           <tr>
                                 <th>Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalLoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="PricingOption">
                           <tr>
                                 <th>Pricing Option:</th>
                                 <td>
                                        <xsl:value-of select="PricingOption"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="InterestRateType">
                           <tr>
                                 <th>Interest Rate Type:</th>
                                 <td>
                                        <xsl:value-of select="InterestRateType"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                          <th>Value Date:</th>
                          <td>
                                 <xsl:value-of select="ValueDate"/>
                          </td>
                    </tr>
                    <tr>
                          <th>Maturity Date:</th>
                          <td>
                                 <xsl:value-of select="MaturityDate"/>
                          </td>
                    </tr>
                </table>
            </div>
	</xsl:if>
       </xsl:template>                     
                            
       <!-- Rate transaction section -->
       <xsl:template match="RateTransactionSection">
             <div class="section">
             	<xsl:if test="SectionTitle">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                </xsl:if>
                <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                 </xsl:if>
	             <table style="margin-bottom:18px">
	             	   <xsl:if test="RateScheduleId">
	                           <tr>
	                                 <th>Rate Schedule:</th>
	                                 <td>
	                                        <xsl:value-of select="RateScheduleId"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>
	                    <xsl:if test="RateEffectiveDate">
	                           <tr>
	                                 <th>Rate Effective Date:</th>
	                                 <td>
	                                        <xsl:value-of select="RateEffectiveDate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>
	                    <xsl:if test="NewBaseRate">
	                           <tr>
	                                 <th>New Base Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewBaseRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>
									
						<!-- D800196 Changes -->
						<xsl:if test="NewAdjustedBaseRate">
	                           <tr>
	                                 <th>Adjusted New Base Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewAdjustedBaseRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>																
						<!-- D800196 Changes -->
						
	                    <xsl:if test="NewMarginSpreadRate">
	                           <tr>
	                                 <th>New Margin/Spread Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewMarginSpreadRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>
	                    <xsl:if test="NewReserveRate">
	                           <tr>
	                                 <th>New Reserve Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewReserveRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>
						
						<!-- D800196 Changes -->
						<xsl:if test="NewMinimumRate">
	                           <tr>
	                                 <th>New Minimum Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewMinimumRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>						

						<xsl:if test="NewMaximumRate">
	                           <tr>
	                                 <th>New Maximum Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewMaximumRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>						
						
						<xsl:if test="NewMinimumBaseRate">
	                           <tr>
	                                 <th>New Minimum Base Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewMinimumBaseRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>						

						<xsl:if test="NewMaximumBaseRate">
	                           <tr>
	                                 <th>New Maximum Base Rate:</th>
	                                 <td>
	                                        <xsl:value-of select="NewMaximumBaseRate"/>
	                                 </td>
	                           </tr>
	                    </xsl:if>						
						<!-- End D800196 Changes -->
						
						<!-- D800196 Changes -->
						<xsl:if test="NewAlllInRate">
						<!-- End D800196 Changes -->
							<tr>
	                           <th>New All-In Rate:</th>
	                           <td>
	                                 <xsl:value-of select="NewAlllInRate"/>
	                           </td>
							</tr>
							
						<!-- D800196 Changes -->	
						</xsl:if>						
						
						<xsl:if test="AdjustedNewAlllInRate">
							<tr>
	                           <th>Adjusted New All-In Rate:</th>
	                           <td>
	                                 <xsl:value-of select="AdjustedNewAlllInRate"/>
	                           </td>
							</tr>
						</xsl:if>					
						<!-- End D800196 Changes -->
						
	             </table>
             </div>
       </xsl:template>
                     
       <!-- Facility transactions section -->
       <xsl:template match="FacilityTransactionsSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="FacilityTransaction"/>
             </div>
       </xsl:template>
       <!-- Facility transaction item -->
       <xsl:template match="FacilityTransaction">
             <table style="margin-bottom:18px">
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Transaction Description:</th>
                           <td>
                                 <xsl:value-of select="TransactionDesc"/>
                           </td>
                    </tr>
                    <xsl:if test="Limit">
                           <tr>
                                 <th>Limit:</th>
                                 <td>
                                        <xsl:value-of select="Limit"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="TransactionAmount">
                           <tr>
                                 <th>Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="TransactionAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="TransactionAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourTranShare">
                           <tr>
                                 <th>Your Share of Transaction:</th>
                                 <td>
                                        <xsl:value-of select="YourTranShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourTranShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
       <!-- Cash transactions section -->
       <xsl:template match="CashTransactionsSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <xsl:if test="SectionText">
                           <p class="para">
                                 <xsl:value-of select="SectionText"/>
                           </p>
                    </xsl:if>
		    <xsl:apply-templates select="ValueDateGroup"/>
                    <xsl:apply-templates select="FacilityCashTrans"/>
                    <xsl:if test="SectionText2">
                           <p class="para">
                                 <xsl:value-of select="SectionText2"/>
                           </p>
                    </xsl:if>
                    <xsl:apply-templates select="LoanCashTrans"/>
             </div>
       </xsl:template>
       <!-- Cash transactions value date groupings -->
       <xsl:template match="ValueDateGroup">
             <xsl:if test="ValueDate">
		<table>
                   <tr>
                         <th class="padb">Value Date:</th>
                         <td class="padb">
                              <xsl:value-of select="ValueDate"/>
                         </td>
                   </tr>
		</table>
              </xsl:if>
             <xsl:apply-templates select="FacilityCashTrans"/>
             <xsl:apply-templates select="LoanCashTrans"/>
       </xsl:template>
       <!-- Facility cash transaction item -->
       <xsl:template match="FacilityCashTrans">
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="TransactionDesc">
                           <tr>
                                 <th>Transaction Description:</th>
                                 <td>
                                        <xsl:value-of select="TransactionDesc"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Fee Description:</th>
                           <td>
                                 <xsl:value-of select="FeeDescription"/>
                           </td>
                    </tr>
                    <xsl:if test="TransactionAmount">
                           <tr>
                                 <th class="padb">Transaction Amount:</th>
                                 <td class="padb">
                                        <xsl:value-of select="TransactionAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="TransactionAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalTransAmount">
                           <tr>
                                 <th>Global Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalTransAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalTransAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th class="padb">Your Share:</th>
                                 <td class="padb">
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourTranShare">
                           <tr>
                                 <th class="padb">Your Share of Transaction:</th>
                                 <td class="padb">
                                        <xsl:value-of select="YourTranShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourTranShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:apply-templates select="FatcaWithheld"/>
             </table>
             <xsl:apply-templates select="AccrualBreakdown"/>            
             <xsl:apply-templates select="FacilityFeeBreakdownSection"/>			 		 
       </xsl:template>
       <!-- Loan cash transaction item -->
       <xsl:template match="LoanCashTrans">
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="ObligorName">
                           <tr>
                                 <th class="padb">Loan Obligor:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ObligorName"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="BorrowerName">
                           <tr>
                                 <th class="padb">Borrower Name:</th>
                                 <td class="padb">
                                        <xsl:value-of select="BorrowerName"/>
                                 </td>
                           </tr>
                    </xsl:if>
		    <xsl:if test="LoanNumber">
                    	<tr>
                           <th>Loan Number:</th>
                           <td>
                                 <xsl:value-of select="LoanNumber"/>
                           </td>
                    	</tr>
		    </xsl:if>
                    <xsl:if test="LoanAmount">
                           <tr>
                                 <th>Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="LoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="LoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalAmount">
                           <tr>
                                 <th>Global Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalLoanAmount">
                           <tr>
                                 <th>Global Loan Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalLoanAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalLoanAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShare">
                           <tr>
                                 <th>Your Share:</th>
                                 <td>
                                        <xsl:value-of select="YourShareCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShare"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="PricingOption">
                           <tr>
                                 <th>Pricing Option:</th>
                                 <td>
                                        <xsl:value-of select="PricingOption"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="InterestRateType">
                           <tr>
                                 <th class="padb">Interest Rate Type:</th>
                                 <td class="padb">
                                        <xsl:value-of select="InterestRateType"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Transaction Description:</th>
                           <td>
                                 <xsl:value-of select="TransactionDesc"/>
                           </td>
                    </tr>
					
					<!-- D800196 Changes -->
					<xsl:if test="ReferenceRateCalcMethod">
                           <tr>
                                 <th>Reference Rate Calculation Method:</th>
                                 <td>
                                        <xsl:value-of select="ReferenceRateCalcMethod"/>
                                 </td>
                           </tr>
                    </xsl:if>

					<xsl:if test="YearBasis">
                           <tr>
                                 <th>Year Basis:</th>
                                 <td>
                                        <xsl:value-of select="YearBasis"/>
                                 </td>
                           </tr>
                    </xsl:if>	
					
					<xsl:if test="RateSetLagDays">
                           <tr>
                                 <th>Rate Set Lag Days:</th>
                                 <td>
                                        <xsl:value-of select="RateSetLagDays"/>
                                 </td>
                           </tr>
                    </xsl:if>	
					
					<xsl:if test="BaseRateAtStartofPeriod">
                           <tr>
                                 <th>Base Rate At Start of Period:</th>
                                 <td>
                                        <xsl:value-of select="BaseRateAtStartofPeriod"/>
                                 </td>
                           </tr>
                    </xsl:if>	
					
					<xsl:if test="AdjBaseRateAtStartofPeriod">
                           <tr>
                                 <th>Adjusted Base Rate At Start of Period:</th>
                                 <td>
                                        <xsl:value-of select="AdjBaseRateAtStartofPeriod"/>
                                 </td>
                           </tr>
                    </xsl:if>						
					
					<xsl:if test="InitialRateDate">
                           <tr>
                                 <th>Initial Rate Date:</th>
                                 <td>
                                        <xsl:value-of select="InitialRateDate"/>
                                 </td>
                           </tr>
                    </xsl:if>											
					
					<!-- End D800196 Changes -->
					
                    <xsl:if test="TransactionAmount">
                           <tr>
                                 <th class="padb">Transaction Amount:</th>
                                  <td class="padb">
                                        <xsl:value-of select="TransactionAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="TransactionAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="GlobalTransAmount">
                           <tr>
                                 <th>Global Transaction Amount:</th>
                                 <td>
                                        <xsl:value-of select="GlobalTransAmountCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="GlobalTransAmount"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="YourShareTrans">
                           <tr>
                                 <th class="padb">Your Share of Transaction:</th>
                                 <td class="padb">
                                        <xsl:value-of select="YourShareTransCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="YourShareTrans"/>
                                 </td>
                           </tr>
                    </xsl:if>					
                    <xsl:apply-templates select="FatcaWithheld"/>								
					
             </table>
             <xsl:apply-templates select="AccrualBreakdown"/>
			 <!-- D800196 Changes -->
			 <!-- <xsl:apply-templates select="RFRAccrualBreakdown"/>            -->
			 <!-- End D800196 Changes -->
       </xsl:template>
       <!-- FATCA withheld item -->
       <xsl:template match="FatcaWithheld">
             <tr>
                    <th>FATCA Withheld:</th>
                    <td>
                           <xsl:value-of select="WithheldCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="Withheld"/>
                    </td>
             </tr>
             <tr>
                    <th class="padb">Amount Due To You:</th>
                    <td class="padb">
                           <xsl:value-of select="AmountDueCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="AmountDue"/>
                    </td>
             </tr>
       </xsl:template>
       <!-- Facility fee breakdown section -->
       <xsl:template match="FacilityFeeBreakdownSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="AccrualBreakdown"/>
             </div>
       </xsl:template>
       <!-- Accrual breakdown table -->
       <xsl:template match="AccrualBreakdown">
             <xsl:if test="ScheduleId">
                 <p class="schedule">Schedule ID:<xsl:text> </xsl:text><xsl:value-of select="ScheduleId"/></p>
             </xsl:if>
             <table class="breakdown">
                    <tr>
                           <th>From Date</th>
                           <th>Accrued To</th>
                           <th>Days</th>
                           <th>Balance Accrued On</th>
                           <th>Rate</th>
                           <th>Amount Accrued</th>
                    </tr>
                    <xsl:apply-templates select="AccrualRow"/>
                    <tr>
                           <td/>
                           <td/>
                           <td/>
                           <td/>
                           <th>Total</th>
                           <td class="right">
                                 <xsl:value-of select="TotalCcy"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="Total"/>
                           </td>
                    </tr>
             </table>
       </xsl:template>
       <!-- Accrual breakdown table row -->
       <xsl:template match="AccrualRow">
             <tr>
                    <td>
                           <xsl:value-of select="FromDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="AccruedTo"/>
                    </td>
                    <td>
                           <xsl:value-of select="Days"/>
                    </td>
                    <td class="right">
                           <xsl:value-of select="BalanceAccruedOnCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="BalanceAccruedOn"/>
                    </td>
                    <td>
                           <xsl:value-of select="Rate"/>
                    </td>
                    <td class="right">
                           <xsl:value-of select="AmountAccruedCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="AmountAccrued"/>
                    </td>
             </tr>
       </xsl:template>
	   <!-- D800196 Changes -->
	    <xsl:template match="RFRAccrualBreakdownSection">
			<div class="section">
				<xsl:apply-templates select="RFRAccrualBreakdown"/>			
			</div>	
		</xsl:template>
	   
	   <!-- RFR Accrual breakdown table -->
       <xsl:template match="RFRAccrualBreakdown">
             <xsl:if test="LoanNumber">
                 <table>
					<tr>
						<td class="bold">Interest Payment - Accrual Amount Detailed Breakdown</td>
						<td class="bold-right">Loan Number: <xsl:text> </xsl:text> <xsl:value-of select="LoanNumber"/></td>
					</tr>
					<tr>
						<td colspan="2">Note: Published Rate or All-in Rate reflect any minimum or maximum controls in place at the time the rate was in effect.</td>
						<!-- <td><xsl:text> </xsl:text></td> -->
					</tr>	
				</table>						 
             </xsl:if>
			 <!-- Compound By Accruals -->
			 
			 <xsl:if test="RFRCalcMethod = 'BYBALANCE'">
				<table class="breakdown">
                    <tr>
                           <th>Start Date</th>
                           <th>End Date</th>
                           <th># Days</th>
                           <th>Pub Rate</th>
                           <th>Margin</th>
                           <th>Spread Adj</th>
						   <th>All-in Rate</th>
						   <th>Amt Accrued On</th>
						   <th>Int Cmpd Bal</th> 
						   <th>Amt Accrued</th>
                    </tr>
                    <xsl:apply-templates select="RFRBalanceAccrualRow"/>
                    <tr>
                           <td/>
                           <td/>
                           <td/>
                           <td/>
						   <td/>
						   <td/>
						   <td/>
						   <td/>
                           <th>Total</th>
                           <td class="right">
                                 <xsl:value-of select="TotalCcy"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="Total"/>
                           </td>
                    </tr>
				</table>	

				<p><xsl:text> </xsl:text></p>				
			 </xsl:if>
			 
			 <xsl:if test="RFRCalcMethod = 'BYRATE'">
				<table class="breakdown">
                    <tr>
                           <th>Start Date</th>
                           <th>End Date</th>
                           <th># Days</th>
                           <th>Pub Rate</th>
						   <th>Cmpnd Rate</th>
                           <th>Margin</th>
                           <th>Spread Adj</th>
						   <th>All-in Rate</th>
						   <th>Amt Accrued On</th>						   
						   <th>Amt Accrued</th>
                    </tr>
                    <xsl:apply-templates select="RFRRateAccrualRow"/>
                    <tr>
                           <td/>
                           <td/>
                           <td/>
                           <td/>
						   <td/>
						   <td/>
						   <td/>
						   <td/>
                           <th>Total</th>
                           <td class="right">
                                 <xsl:value-of select="TotalCcy"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="Total"/>
                           </td>
                    </tr>
				</table>
				<p><xsl:text> </xsl:text></p>				
			 </xsl:if>
			 
			 <xsl:if test="RFRCalcMethod = 'SIMPLE'">
				<table class="breakdown">
                    <tr>
                           <th>Start Date</th>
                           <th>End Date</th>
                           <th># Days</th>
                           <th>Pub Rate</th>						   
                           <th>Margin</th>
                           <th>Spread Adj</th>
						   <th>All-in Rate</th>
						   <th>Amt Accrued On</th>						   
						   <th>Amt Accrued</th>
                    </tr>
                    <xsl:apply-templates select="RFRSimpleAccrualRow"/>
                    <tr>
                           <td/>
                           <td/>
                           <td/>                           
						   <td/>
						   <td/>
						   <td/>
						   <td/>
                           <th>Total</th>
                           <td class="right">
                                 <xsl:value-of select="TotalCcy"/>
                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="Total"/>
                           </td>
                    </tr>
				</table>		
				<p><xsl:text> </xsl:text></p>					
			 </xsl:if>
			 
       </xsl:template>
       <!-- RFR Balance breakdown table row -->
       <xsl:template match="RFRBalanceAccrualRow">
             <tr>
                    <td>
                           <xsl:value-of select="PeriodFromDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="PeriodEndDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="Days"/>
                    </td>
					<td>
                           <xsl:value-of select="PublishedRate"/>
                    </td>
					<td>
                           <xsl:value-of select="MarginRate"/>
                    </td>
					<td>
                           <xsl:value-of select="SpreadAdjRate"/>
                    </td>
					<td>
                           <xsl:value-of select="AllInRate"/>
                    </td>
                    <td class="right">
                           <xsl:value-of select="BalanceAccruedOnCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="BalanceAccruedOn"/>
                    </td>   
					<td class="right">
                           <xsl:value-of select="NotionalCompBalOnCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="NotionalCompBalOn"/>
                    </td>   
                    <td class="right">
                           <xsl:value-of select="AmountAccruedCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="AmountAccrued"/>
                    </td>
             </tr>
       </xsl:template>
	   
	   <!-- RFR Rate breakdown table row -->
       <xsl:template match="RFRRateAccrualRow">
             <tr>
                    <td>
                           <xsl:value-of select="PeriodFromDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="PeriodEndDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="Days"/>
                    </td>
					<td>
                           <xsl:value-of select="PublishedRate"/>
                    </td>
					<td>
                           <xsl:value-of select="CompBaseRate"/>
                    </td>
					<td>
                           <xsl:value-of select="MarginRate"/>
                    </td>
					<td>
                           <xsl:value-of select="SpreadAdjRate"/>
                    </td>
					<td>
                           <xsl:value-of select="AllInRate"/>
                    </td>
                    <td class="right">
                           <xsl:value-of select="BalanceAccruedOnCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="BalanceAccruedOn"/>
                    </td>   					
                    <td class="right">
                           <xsl:value-of select="AmountAccruedCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="AmountAccrued"/>
                    </td>
             </tr>
       </xsl:template>
	   
	   <!-- RFR Simple breakdown table row -->
       <xsl:template match="RFRSimpleAccrualRow">
             <tr>
                    <td>
                           <xsl:value-of select="PeriodFromDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="PeriodEndDate"/>
                    </td>
                    <td>
                           <xsl:value-of select="Days"/>
                    </td>
					<td>
                           <xsl:value-of select="PublishedRate"/>
                    </td>					
					<td>
                           <xsl:value-of select="MarginRate"/>
                    </td>
					<td>
                           <xsl:value-of select="SpreadAdjRate"/>
                    </td>
					<td>
                           <xsl:value-of select="AllInRate"/>
                    </td>
                    <td class="right">
                           <xsl:value-of select="BalanceAccruedOnCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="BalanceAccruedOn"/>
                    </td>   					
                    <td class="right">
                           <xsl:value-of select="AmountAccruedCcy"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="AmountAccrued"/>
                    </td>
             </tr>
       </xsl:template>
	   
       <!-- Rate setting section -->
       <xsl:template match="RateSettingSection">
             <div class="section">
                    <xsl:if test="SectionTitle">
                           <h1>
                                 <xsl:value-of select="SectionTitle"/>
                           </h1>
                    </xsl:if>
                    <xsl:if test="SectionText">
                           <p class="para">
                                 <xsl:value-of select="SectionText"/>
                           </p>
                    </xsl:if>
                    <!-- D800196 Changes -->
					<xsl:if test="RFRAccrualSchedule">
						<xsl:apply-templates select="RFRAccrualSchedule"/>					
					</xsl:if>
					<xsl:if test="RFRRateSchedule">
						<xsl:apply-templates select="RFRRateSchedule"/>					
					</xsl:if>
					<!-- End D800196 Changes -->	
					<xsl:if test="RateSchedule">					
						<xsl:apply-templates select="RateSchedule"/>						
					</xsl:if>
             </div>
       </xsl:template>
       <!-- Rate schedule section -->
       <xsl:template match="RateScheduleSection">
             <div class="section">
                    <xsl:if test="SectionTitle">
                           <h1>
                                 <xsl:value-of select="SectionTitle"/>
                           </h1>
                    </xsl:if>
                    <xsl:if test="SectionText">
                           <p class="para">
                                 <xsl:value-of select="SectionText"/>
                           </p>
                    </xsl:if>
					<!-- D800196 Changes -->
					<!-- <xsl:apply-templates select="RFRAccrualSchedule"/> -->				
					<!-- End D800196 Changes -->
                    <xsl:apply-templates select="RateSchedule"/>
             </div>
       </xsl:template>
	   <!-- D800196 Changes -->
	   <!-- RFR Rate schedule section -->
       <xsl:template match="RFRRateScheduleSection">
             <div class="section">
                    <xsl:if test="SectionTitle">
                           <h1>
                                 <xsl:value-of select="SectionTitle"/>
                           </h1>
                    </xsl:if>
                    <xsl:if test="SectionText">
                           <p class="para">
                                 <xsl:value-of select="SectionText"/>
                           </p>
                    </xsl:if>					
					<xsl:apply-templates select="RFRRateSchedule"/>					                    
             </div>
       </xsl:template>
	   <!-- D800196 Changes -->
	   <!-- RFR Accrual schedule item -->
       <xsl:template match="RFRRateSchedule">
					
            <xsl:if test="SectionTitle">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
             </xsl:if>
             <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
             </xsl:if>
             <xsl:if test="SectionSubText">
                    <p class="para">
                           <xsl:value-of select="SectionSubText"/>
                    </p>
             </xsl:if>
			
	   
             <table>
                    <xsl:if test="RateDescription">
                           <tr>
                                 <th>Rate Description:</th>
                                 <td>
                                        <xsl:value-of select="RateDescription"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
					<xsl:if test="BaseRateAtStartofPeriod">					
						<tr>
							<th>Base Rate at Start of Period:</th>
							<td>
								<xsl:value-of select="BaseRateAtStartofPeriod"/>
							</td>
						</tr>					
					</xsl:if>
					
					<xsl:if test="AdjBaseRateAtStartofPeriod">					
						<tr>
							<th>Adjusted Base Rate at Start of Period:</th>
							<td>
								<xsl:value-of select="AdjBaseRateAtStartofPeriod"/>
							</td>
						</tr>					
					</xsl:if>				
						
                    <tr>
                           <th>Margin/Spread Rate:</th>
                           <td>
                                 <xsl:value-of select="MarginSpreadRate"/>
                           </td>
                    </tr>
					
                    <xsl:if test="ReserveSpreadAdjRate">
                           <tr>
                                 <th>Reserve/Spread Adjustment Rate:</th>
                                 <td>
                                        <xsl:value-of select="ReserveSpreadAdjRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
										
					<xsl:if test="StarttingAllInRate">					
						<tr>
							<th>Starting All-In Rate:</th>
							<td>
                                <xsl:value-of select="StarttingAllInRate"/>
							</td>
						</tr>					
					</xsl:if>
					
					<xsl:if test="AdjStarttingAllInRate">
						<tr>
							<th>Adjusted Starting All-In Rate:</th>
							<td>
                                <xsl:value-of select="AdjStarttingAllInRate"/>
							</td>
						</tr>
					</xsl:if>					
					
					<xsl:if test="YearBasis">
                           <tr>
                                 <th>Year Basis:</th>
                                 <td>
                                        <xsl:value-of select="YearBasis"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="ReferenceRateCalcMethod">
                           <tr>
                                 <th>Reference Rate Calculation Method:</th>
                                 <td>
                                        <xsl:value-of select="ReferenceRateCalcMethod"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="RateSetLagDays">
                           <tr>
                                 <th>Rate Set Lag Days:</th>
                                 <td>
                                        <xsl:value-of select="RateSetLagDays"/>
                                 </td>
                           </tr>
                    </xsl:if>
					
                    <xsl:if test="IndexEffectiveDate">
                           <tr>	
								<th>Index Effective Date:</th>							
								<td>
									<xsl:value-of select="IndexEffectiveDate"/>
								</td>
							</tr>
                    </xsl:if>
																		
					<xsl:if test="NextRatePeriodDate">
                           <tr>
                                 <th>Next Rate Period Date:</th>
                                 <td>
                                        <xsl:value-of select="NextRatePeriodDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
             </table>
       </xsl:template>
	   <!-- End D800196 Changes -->
       <!-- Rate schedule item -->
       <xsl:template match="RateSchedule">
             <xsl:if test="SectionTitle">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
             </xsl:if>
             <xsl:if test="SectionText">
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
             </xsl:if>
             <xsl:if test="SectionSubText">
                    <p class="para">
                           <xsl:value-of select="SectionSubText"/>
                    </p>
             </xsl:if>
             <table>
                    <xsl:if test="Schedule">
                           <tr>
                                 <th>Schedule:</th>
                                 <td>
                                        <xsl:value-of select="Schedule"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="RateScheduleId">
                           <tr>
                                 <th>Rate Schedule:</th>
                                 <td>
                                        <xsl:value-of select="RateScheduleId"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="RateEffectiveDate">
                           <tr>
                                 <th>Rate Effective Date:</th>
                                 <td>
                                        <xsl:value-of select="RateEffectiveDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="CurrentRateSettingDate">
                           <tr>
                                 <th>Current Rate Setting Date:</th>
                                 <td>
                                        <xsl:value-of select="CurrentRateSettingDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
					<!-- D800196 Changes -->
					<xsl:if test="BaseRate">
					<!-- End D800196 Changes -->
						<tr>
                           <th>Base Rate:</th>
                           <td>
                                 <xsl:value-of select="BaseRate"/>
                           </td>
						</tr>
					<!-- D800196 Changes -->
					</xsl:if>
					
					<xsl:if test="AdjustedBaseRate">
						<tr>
                           <th>Adjusted Base Rate:</th>
                           <td>
                                 <xsl:value-of select="AdjustedBaseRate"/>
                           </td>
						</tr>					
					</xsl:if>				
					<!-- End D800196 Changes -->										
                    <tr>
                           <th>Margin/Spread Rate:</th>
                           <td>
                                 <xsl:value-of select="MarginSpreadRate"/>
                           </td>
                    </tr>
					<xsl:if test="ReserveRate">
                           <tr>
                                 <th>Reserve Rate:</th>
                                 <td>
                                        <xsl:value-of select="ReserveRate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    
					<!-- D800196 Changes -->
					<xsl:if test="AllInRate">
					<!-- End D800196 Changes -->
						<tr>
                           <th>All-In Rate:</th>
                           <td>
                                 <xsl:value-of select="AllInRate"/>
                           </td>
						</tr>
					
					<!-- D800196 Changes -->
					</xsl:if>
					
					<xsl:if test="AdjustedAllInRate">
						<tr>
                           <th>Adjusted All-In Rate:</th>
                           <td>
                                 <xsl:value-of select="AdjustedAllInRate"/>
                           </td>
						</tr>					
					</xsl:if>
					<!-- End D800196 Changes -->
					
                    <xsl:if test="ProjectedInterest">
                           <tr>
                                 <th class="pad">Projected Interest:</th>
                                 <td class="pad">
                                        <xsl:value-of select="ProjectedInterest"/>
                                 </td>
                           </tr>
                    </xsl:if>									
             </table>
       </xsl:template>
       <!-- FX section -->
       <xsl:template match="FxSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <table>
                           <tr>
                                 <th>Loan Currency:</th>
                                 <td>
                                        <xsl:value-of select="LoanCurrency"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Facility Currency:</th>
                                 <td>
                                        <xsl:value-of select="FacilityCurrency"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>From Date:</th>
                                 <td>
                                        <xsl:value-of select="FromDate"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>To Date:</th>
                                 <td>
                                        <xsl:value-of select="ToDate"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th>Rate For Period:</th>
                                 <td>
                                        <xsl:value-of select="RateForPeriod"/>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Payment instruction section -->
       <xsl:template match="PaymentInstructionSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <xsl:apply-templates select="CashSettlement"/>
             </div>
       </xsl:template>
       <!-- Remittance section -->
       <xsl:template match="RemittanceSection">
             <div class="section">
                    <h1>
                           <xsl:value-of select="SectionTitle"/>
                    </h1>
                    <p class="para">
                           <xsl:value-of select="SectionText"/>
                    </p>
                    <table>
                           <xsl:apply-templates select="PaymentInstruction"/>
                    </table>
             </div>
       </xsl:template>
       <!-- Cash settlement item -->
       <xsl:template match="CashSettlement">
             <table>
                    <xsl:if test="ValueDate">
                           <tr>
                                 <th class="padb">Value Date:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ValueDate"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="ToBePaidByYou">
                           <tr>
                                 <th class="padb">To Be Paid By You:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ToBePaidByYouCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="ToBePaidByYou"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="ToBePaidToYou">
                           <tr>
                                 <th class="padb">To Be Paid To You:</th>
                                 <td class="padb">
                                        <xsl:value-of select="ToBePaidToYouCcy"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="ToBePaidToYou"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:apply-templates select="PaymentInstruction"/>
             </table>
       </xsl:template>
       <!-- Payment instruction item -->
       <xsl:template match="PaymentInstruction">
             <xsl:if test="ValueDate">
                    <tr>
                           <th class="padb">Value Date:</th>
                           <td class="padb"><xsl:value-of select="ValueDate"/></td>
                    </tr>
             </xsl:if>
             <xsl:if test="For">
                    <tr>
                           <th class="padb">For<xsl:text> </xsl:text><xsl:value-of select="ForCcy"/><xsl:text> </xsl:text><xsl:value-of select="For"/></th>
                           <td class="padb"/>
                    </tr>
             </xsl:if>
             <xsl:if test="not(CashSettlements)">
                    <tr>
                           <th>Bank:</th>
                           <td>
                                 <xsl:value-of select="Bank"/>
                           </td>
                    </tr>
                    <xsl:if test="Aba">
                           <tr>
                                 <th>ABA #:</th>
                                 <td>
                                        <xsl:value-of select="Aba"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="Swift">
                           <tr>
                                 <th>SWIFT #:</th>
                                 <td>
                                        <xsl:value-of select="Swift"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <xsl:if test="AbaSwift">
                           <tr>
                                 <th>ABA/SWIFT #:</th>
                                 <td>
                                        <xsl:value-of select="AbaSwift"/>
                                 </td>
                           </tr>
                    </xsl:if>
                    <tr>
                           <th>Account:</th>
                           <td>
                                 <xsl:value-of select="Account"/>
                           </td>
                    </tr>
                    <tr>
                           <th>Account Name:</th>
                           <td>
                                 <xsl:value-of select="AccountName"/>
                           </td>
                    </tr>
                    <tr>
                           <th class="padb">Reference:</th>
                           <td class="padb">
                                 <xsl:value-of select="Reference"/>
                           </td>
                    </tr>
             </xsl:if>
             <xsl:if test="CashSettlements">
                    <tr>
                           <th class="padb">Cash Settlements:</th>
                           <td class="padb">
                                 <xsl:value-of select="CashSettlements"/>
                           </td>
                    </tr>
             </xsl:if>
       </xsl:template>
       <!-- Flood subject section -->
       <xsl:template match="FloodSubjectSection">
             <div class="flood-subject">
                    <table>
                           <tr>
                                 <th>Re:</th>
                                 <td>Flood Insurance</td>
                                 <td/>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>Account Number:</td>
                                 <td>
                                        <xsl:value-of select="AccountNumber"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td>Property Address:</td>
                                 <td>
                                        <xsl:value-of select="Address1"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td/>
                                 <td>
                                        <xsl:value-of select="Address2"/>
                                 </td>
                           </tr>
                           <tr>
                                 <th/>
                                 <td/>
                                 <td>
                                        <xsl:value-of select="City"/>
                                        <xsl:if test="State">
                                               <xsl:text>, </xsl:text>
                                               <xsl:value-of select="State"/>
                                        </xsl:if>
                                        <xsl:if test="PostCode">
                                              <xsl:text> </xsl:text>
                                               <xsl:value-of select="PostCode"/>
                                        </xsl:if>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- Flood notice lead -->
       <xsl:template match="FloodNoticeLead">
             <xsl:for-each select="Paragraph">
                    <p class="para">
                           <xsl:value-of select="."/>
                    </p>
             </xsl:for-each>
       </xsl:template>
       <!-- Flood notice instructions -->
       <xsl:template match="FloodNoticeInstructions">
             <xsl:for-each select="Paragraph">
                    <p class="para">
                           <xsl:value-of select="."/>
                    </p>
             </xsl:for-each>
       </xsl:template>
       <!-- Closing footer section -->
       <xsl:template match="ClosingFooterSection">
             <div class="closing">
                    <table>
                           <tr>
                                 <td colspan="2">
                                        <xsl:value-of select="ContactName"/>
                                 </td>
                           </tr>
                           <tr>
                                 <td>Phone:</td>
                                 <td>
                                        <xsl:value-of select="Telephone"/>
                                 </td>
                           </tr>
                           <tr>
                                 <td>Fax:</td>
                                 <td>
                                        <xsl:value-of select="Fax"/>
                                 </td>
                           </tr>
                           <tr>
                                 <td>Email:</td>
                                 <td>
                                        <xsl:value-of select="Email"/>
                                 </td>
                           </tr>
                    </table>
             </div>
       </xsl:template>
       <!-- User text section -->
       <xsl:template match="UserTextSection">
             <div class="user-text">
                    <p class="para">
                           <xsl:value-of select="UserText"/>
                    </p>
             </div>
       </xsl:template>
       <!-- Notice contact information -->
       <xsl:template match="ContactInformation">
             <div class="contact-info">
                    <p class="para">
                           <xsl:value-of select="ContactText"/>
                    </p>
                    <p class="indent">
                           <xsl:value-of select="Name"/>
                    </p>
					<xsl:if test ="Phone or Email">
                    <table>
                        <xsl:if test="Phone">
                           <tr>
                                 <th>Phone:</th>
                                 <td>
                                        <xsl:value-of select="Phone"/>
                                 </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="Email">
                           <tr>
                                 <th>Email:</th>
                                 <td>
                                        <xsl:value-of select="Email"/>
                                 </td>
                           </tr>
                        </xsl:if>
                    </table>
					</xsl:if>
             </div>
       </xsl:template>
       <!-- Notice footer -->
       <xsl:template match="Footer">


                    <div class="footer-text">
                           <p class="para">Some footer text to show where the text will be positioned within the document.</p>
                    </div>



             <xsl:if test="FooterLogoUrl">
                    <div class="footer-logo">
                           <img src="{FooterLogoUrl}" alt="Footer Logo"/>
                    </div>
             </xsl:if>
             <xsl:if test="FooterTag">
                    <p class="footer-tag">Delivered to you by FIS ACBS Loan Systems</p>
             </xsl:if>
       </xsl:template>
</xsl:stylesheet>

