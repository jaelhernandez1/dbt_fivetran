

select 
distinct
pcs.gap_label as new_pscstatus,
new_lastcontactdate,
acc.gap_label as AccountCategoryCode,
aclc.gap_label as AccountClassificationCode,
act.AccountId,
act.AccountNumber,
arc.gap_label as AccountRatingCode,
act.ad_1styearorrenew,
act.ad_AccountBalance,
act.ad_accountbalance_Base,
cast(act.ad_AccountNumber as string) as ad_AccountNumber,
atc.gap_label as ad_AccountType__c,
act.ad_activesubscriptioncount,
act.ad_ageofoldestinvoice,
act.ad_allcustomerlocations,
act.ad_AutoPay,
act.ad_autozonecustomer,
act.ad_billingemail,
bst.gap_label as ad_BusinessShopType__c,
act.ad_chargeoff,
act.ad_CreditBalance,
ach.gap_label as ad_credithold__C,
act.ad_Currency,
act.ad_exemptcertificateId,
es.gap_label as ad_exemptstatus,
act.ad_FleetAccountID__c,
act.ad_hasactivesubscription,
act.ad_invoiceowner,
act.ad_lapsedcasecreatedts,
act.ad_Lapseddatetimestamp,
act.ad_LastInvoiceAmount,
act.ad_LastPaymentAmount,
act.ad_LastPaymentDate,
act.ad_lastreviewdate,
act.ad_latestsubscriptioncancelleddate,
act.ad_latestsubscriptionenddate,
lt.gap_label as ad_locationtype,
act.ad_NationalAccountCode__c,
act.ad_oldinvoicedate,
ot.gap_label as ad_OwnershipType__c,
pl.gap_label as ad_primarylanguage,
CAST(IF(act.ad_removecreditholduntil = '',NULL,act.ad_removecreditholduntil) AS DATETIME)ad_removecreditholduntil,
act.ad_SalesRepName,
s.gap_label as ad_status,
act.ad_taxexempt,
vc.gap_label as ad_verticalchannel,
act.ad_zAccountId,
act.Address1_City,
act.Address1_Country,
act.Address1_County,
act.Address1_Fax,
act.Address1_Line1,
act.Address1_Line2,
act.Address1_Name,
act.Address1_PostalCode,
act.Address1_PrimaryContactName,
act.Address1_StateOrProvince,
btc.gap_label as BusinessTypeCode,
act.CreatedOn,
ctc.gap_label as CustomerTypeCode,
act._DefaultPriceLevelId_value as DefaultPriceLevelId,
pr.name as defaultpricelevelidname,
act.DoNotEMail,
act.DoNotPhone,
act.DoNotPostalMail,
act.DoNotSendMM,
act.MarketingOnly,
act._masterid_value as MasterId,
act.Merged,
act._modifiedby_value as modifiedby,
sys.fullname as modifiedbyname,
act.ModifiedOn,
act.Name,
act._new_accountmanager_value as new_accountmanager,
sys1.fullname as new_accountmanagername,
ar.gap_label as new_AccountRating,
acts.gap_label as new_AccountStatus,
nat.gap_label as new_accounttype,
act.new_annualsubscription,
act.new_AZPricePlan,
act.new_bad,
nc.gap_label as new_Channel,
act.new_childaccountcount,
act.new_childaccountcount_Date,
act._new_collector_value as new_collector,
sys2.fullname as new_collectorname,
nct.gap_label as new_Country,
act.new_CSIFlag,
act.new_customerno,
act.new_custrej,
act.new_custrejamt,
act.new_custrejdate,
act.new_ExpirationDate,
act.new_finalinvoiceamount,
act.new_finalinvoicedate,
act.new_firstname,
act.new_Gen3AccessPoints,
act.new_Gen3AcmSiteId,
act.new_Gen3TrialDays,
act.new_Gen3TrialDaysToGo,
act.new_Gen3TrialSessions,
act.new_Gen3TrialStartDate,
act.new_industry3,
act.new_jobtitle,
act.new_LastInvoice,
act.new_LastInvoiceAmount,
act.new_lastname,
act.new_lastpaymentamount,
act.new_lastpaymentdate,
act.new_LastPhoneCallDate,
act.new_lastsavedate,
act.new_LastTaskDate,
nlc.gap_label as new_leadchannel,
nma.gap_label as new_MasterAccountType,
act.new_monthlysubscription,
act.new_MonthsTenure,
act.new_naicsName,
act._new_NationalAccount_value as new_NationalAccount,
na.new_name as new_nationalaccountname,
act.new_nationalaccounts,
act._new_NationalAccount_value as new_NationalAcct,
act.new_nextinvoiceamount,
act.new_nextinvoicedate,
act.new_PeopleSoftID,
act.new_promocode,
act._new_pscgroupid_value as new_pscGroupId,
pscg.new_GroupName as new_pscGroupIdName,
nrb.gap_label as new_reasonbad,
act._new_Segment2_value as new_Segment2,
seg.new_name as new_segment2name,
act.new_SpecialAccount,
act._new_Subsegment2_value as new_Subsegment2,
sseg.new_name as new_subsegment2name,
act.new_territory,
act._OwnerId_value as OwnerId,
act._ParentAccountId_value as ParentAccountId,
ps.ContactId as PrimaryContactId,
ps.FullName as PrimaryContactIdName,
act.Revenue,
act.SIC,
sc.gap_label as statuscode,
act.Telephone1,
tc.gap_label as TerritoryCode,
act._TerritoryId_value as TerritoryId,
act._TransactionCurrencyId_value as TransactionCurrencyId,
act.ad_oldestinvoicebalance,
zc.gap_label as ad_zuora_chargeoff,
act.ad_originalsalesdate,
act.new_autozonepin,
act.ad_creditholddate
from  msd_landing_bq.account  act
left join  msd_landing_bq.gap_optionsetrefs  acc 
on  act.AccountCategoryCode=acc.gap_value
and acc.gap_optionsetschemaname='AccountCategoryCode' and acc.gap_entityschemaname='Account'


left join  msd_landing_bq.gap_optionsetrefs  aclc on 
cast((case when act.AccountClassificationCode='' then '-999' else act.AccountClassificationCode end)  as integer)=aclc.gap_value
and aclc.gap_optionsetschemaname='AccountClassificationCode' and aclc.gap_entityschemaname='Account'


left join  msd_landing_bq.gap_optionsetrefs  arc on 
cast((case when act.AccountRatingCode='' then '-999' else act.AccountRatingCode end) as integer)=arc.gap_value
and arc.gap_optionsetschemaname='AccountRatingCode' and arc.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  atc on 
cast((case when (act.ad_AccountType__c is null or act.ad_AccountType__c='')then '-999' else act.ad_AccountType__c end) as integer) =atc.gap_value
and atc.gap_optionsetschemaname='ad_AccountType__c' 
and atc.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  bst on
 cast((case when act.ad_BusinessShopType__c='' then '-999' else act.ad_BusinessShopType__c end) as integer)=bst.gap_value
and bst.gap_optionsetschemaname='ad_BusinessShopType__c' and bst.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  ach on 
cast((case when act.ad_CreditHold__c='' then '-999' else act.ad_CreditHold__c end) as integer) =ach.gap_value
and ach.gap_optionsetschemaname='ad_CreditHold__c' and ach.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  es on 
cast((case when act.ad_exemptstatus='' then '-999' else act.ad_exemptstatus end) as integer)=es.gap_value
and es.gap_optionsetschemaname='ad_exemptstatus' and es.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  ot on 
cast((case when act.ad_OwnershipType__c='' then '-999' else act.ad_OwnershipType__c end) as integer)=ot.gap_value
and ot.gap_optionsetschemaname='ad_OwnershipType__c' and ot.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  pl on 
cast((case when act.ad_primarylanguage='' then '-999' else act.ad_primarylanguage end) as integer) =pl.gap_value
and pl.gap_optionsetschemaname='ad_primarylanguage' and pl.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  s on 
cast((case when act.ad_Status='' then '-999' else act.ad_Status end) as integer) =s.gap_value
and s.gap_optionsetschemaname='ad_Status' and s.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  vc on 
--act.ad_verticalchannel=vc.gap_value
 cast((case when act.ad_verticalchannel='' then '-999' else act.ad_verticalchannel end) as integer)=vc.gap_value
and vc.gap_optionsetschemaname='ad_verticalchannel' and vc.gap_entityschemaname='Account' 


left join  msd_landing_bq.gap_optionsetrefs  btc on act.BusinessTypeCode=btc.gap_value
and btc.gap_optionsetschemaname='BusinessTypeCode' and btc.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  ctc on 
cast((case when act.CustomerTypeCode='' then '-999' else act.CustomerTypeCode end) as integer)=ctc.gap_value
and ctc.gap_optionsetschemaname='CustomerTypeCode' and ctc.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  ar on 
-- act.new_AccountRating =ar.gap_value
cast((case when act.new_AccountRating='' then '-999' else act.new_AccountRating end)  as integer)=ar.gap_value
and ar.gap_optionsetschemaname='new_AccountRating' and ar.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  acts on 
-- act.new_AccountStatus=acts.gap_value
cast((case when act.new_AccountStatus='' then '-999' else act.new_AccountStatus end) as integer)=acts.gap_value
and acts.gap_optionsetschemaname='new_AccountStatus' and acts.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nat on act.new_accounttype=nat.gap_value
and nat.gap_optionsetschemaname='new_accounttype' and nat.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nc on act.new_Channel=nc.gap_value
and nc.gap_optionsetschemaname='new_Channel' and nc.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nct on act.new_Country=nct.gap_value
and nct.gap_optionsetschemaname='new_Country' and nct.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nlc on 
-- act.new_leadchannel=nlc.gap_value
cast((case when act.new_leadchannel='' then '-999' else act.new_leadchannel end) as integer)=nlc.gap_value
and nlc.gap_optionsetschemaname='new_leadchannel' and nlc.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nma on 
-- act.new_MasterAccountType =nma.gap_value
cast((case when act.new_MasterAccountType='' then '-999' else act.new_MasterAccountType end) as integer)=nma.gap_value
and nma.gap_optionsetschemaname='new_MasterAccountType' and nma.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  nrb on 
-- act.new_reasonbad=nrb.gap_value
cast((case when act.new_reasonbad='' then '-999' else act.new_reasonbad end)  as integer)=nrb.gap_value
and nrb.gap_optionsetschemaname='new_reasonbad' and nrb.gap_entityschemaname='Account' 

left join  msd_landing_bq.gap_optionsetrefs  tc on act.TerritoryCode=tc.gap_value
and tc.gap_optionsetschemaname='TerritoryCode' and tc.gap_entityschemaname='Account' 
left join  msd_landing_bq.gap_optionsetrefs  zc 
on cast((case when act.ad_zuora_chargeoff='' then '-999' else act.ad_zuora_chargeoff end)as integer)=zc.gap_value
and zc.gap_optionsetschemaname='ad_zuora_chargeoff' and zc.gap_entityschemaname='Account' 
left join  msd_landing_bq.gap_optionsetrefs  sc on act.StatusCode=sc.gap_value
and sc.gap_optionsetschemaname='StatusCode' and sc.gap_entityschemaname='Account'
left join  msd_landing_bq.contact  ps on act._PrimaryContactId_value=ps.ContactId
left join  msd_landing_bq.gap_optionsetrefs  lt on 
cast((case when act.ad_locationtype='' then '-999' else act.ad_locationtype end) as integer)=lt.gap_value
and lt.gap_optionsetschemaname='ad_locationtype' and lt.gap_entityschemaname='Account'
left join  msd_landing_bq.gap_optionsetrefs  naics on 
cast((case when act.new_NAICS='' then '-999' else act.new_NAICS end) as integer)=naics.gap_value
and naics.gap_optionsetschemaname='new_NAICS' and naics.gap_entityschemaname='Account'
left join  msd_landing_bq.gap_optionsetrefs  pcs on act.new_pscstatus=pcs.gap_value
and pcs.gap_optionsetschemaname='new_pscstatus' and pcs.gap_entityschemaname='Account'
left join  msd_landing_bq.systemusers  sys
on act._ModifiedBy_value=sys.SystemUserId

left join  msd_landing_bq.pricelevel  pr
on act._defaultpricelevelid_value=pr.PriceLevelId

left join  msd_landing_bq.systemusers  sys1
on act._new_accountmanager_value=sys1.SystemUserId

left join  msd_landing_bq.systemusers  sys2
on act._new_collector_value=sys2.SystemUserId

left join  msd_landing_bq.new_nationalaccounts  na
on act._new_NationalAccount_value=na.new_nationalaccountId

left join  msd_landing_bq.vw_new_segments seg
on act._new_Segment2_value=seg.new_segmentId

left join  msd_landing_bq.vw_new_subsegments sseg
on act._new_Subsegment2_value=sseg.new_subsegmentId

left join  msd_landing_bq.new_pscgroups  pscg
on act._new_pscgroupid_value =  pscg.new_PSCGroupId