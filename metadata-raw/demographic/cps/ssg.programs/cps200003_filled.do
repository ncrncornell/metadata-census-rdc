*Tae Hyun Kim
*Dataset cpsmar_person_2000

set more off
capture log close
include config.do

*Step 1: Load data and open log file
clear all
log using "cpsmar.cps200003_modified.log",text replace
use "$CPSNBER/cpsmar_person_2000.dta", replace

*Sort variables in alphabetical order
order _all, alphabetic

*Step 2: Drop irrelevant variables
drop a_herntf
drop a_werntf
drop f_mv_fs-famlis
drop fcspval-finc_se
drop fmlasidx-geco
drop h_faminc-hdivval
drop hearnval-hi_yn
drop hinc_fr-hintval
drop hiown
drop hlorent-hpublic
drop hrecord-hrntval
drop hseval-hwsval
drop i_hengas-i_hhotno
drop i_hloren-i_hpubli
drop i_hunits
drop indccode
drop int_val-int_yn
drop placdscp
drop povll
drop prop_tax
drop talm_val
drop tcernval-tsurval2


*Step 3: Rename variables to match zero-obs dataset
rename apage axage
rename apclswkr axclswkr
rename apenrlw axenrlw
rename apftpt axftpt
rename aphga axhga
rename aphrlywk axhrlywk
rename aphrs axhrs
rename aphscol axhscol
rename apind axind
rename aplfsr axlfsr
rename apmaritl axmaritl
rename apnlflj axnlflj
rename apocc axocc
rename aporigin axorigin
rename apparent axparent
rename appayabs axpayabs
rename aprace axrace
rename aprrp axrrp
rename apsex axsex
rename apspouse axspouse
rename apuncov axuncov
rename apunmem axunmem
rename apuslhrs axuslhrs
rename apvet axvet
rename apwhyabs axwhyabs
rename i_disvl1 i_disva1
rename i_disvl2 i_disva2
rename i_retvl1 i_retva1
rename i_retvl2 i_retva2
rename i_survl1 i_surva1
rename i_survl2 i_surva2
rename migplac mig_plc
rename otyp_1 otyp1
rename otyp_2 otyp2
rename otyp_3 otyp3
rename otyp_4 otyp4
rename otyp_5 otyp5

*Step 4: Begin remake the variables

*default: change byte to str wit format %2s

foreach v in a_civlf a_age a_clswkr a_dtind a_dtocc a_enrlw a_hga /*
*/ a_explf a_exprrp a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hrlywk/*
*/ a_hrs1 a_hscol a_ind a_lfsr a_lineno a_maritl a_mjind a_mjocc alm_yn/*
*/ a_nlflj a_occ a_parent a_payabs a_pfrel a_race a_rcow /*
*/ a_reorgn a_sex a_spouse a_uncov a_unmem a_untype a_uslft /*
*/ a_uslhrs a_vet a_wantjb a_whenlj a_whyabs a_wksch a_wkslk /*
*/ a_wkstat age1 axage axclswkr axenrlw axftpt axhga axhrlywk /*
*/ axhrs axhscol axind axlfsr axmaritl axnlflj axocc axorigin axparent/*
*/ axpayabs axrace axrrp axsex axspouse axuncov axunmem axuslhrs axvet/*
*/ axwhyabs caid care ch_hi ch_mc champ clwk cov_gh cov_hi csp_yn dep_stat/*
*/ dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non/*
*/ div_yn earner ed_yn ern_otr ern_srce ern_yn famrel fl_665 hea hiemp hilin1/*
*/ hilin2 hiout hipaid hityp hrcheck hrswk gediv i_almval i_almyn i_caid /*
*/ i_care i_cspval i_cspyn i_dephi i_depriv i_discs i_dishp i_dissc1 i_dissc2/*
*/ i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1 i_edtyp2 i_edyn/*
*/ i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea i_hi/*
*/ i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr /*
*/ i_lkweek i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook/*
*/ i_occup i_oedval i_oival i_ostper i_ostyp i_oth i_otyp i_out/*
*/ i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_peninc i_penpla/*
*/ i_phmemp i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1 i_retsc2/*
*/ i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn /*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 /*
*/ i_surva2 i_suryn i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn/*
*/ i_wctyp i_wcval i_wcyn i_wkchk i_wkswk i_workyn i_wsval i_wsyn i_wtemp/*
*/ ljcw lknone lkstrch lkweeks losewks marg_tax mcaid mcare mig_div/*
*/ mig_mtr1 mig_mtr3 mig_mtr4 mig_reg migsame mig_st mon noemp nwlkwk/*
*/ nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth othstper othstyp1/*
*/ othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3 otyp4/*
*/ otyp5 out paid parent paw_mon paw_typ paw_yn peabsrsn peinusyr /*
*/ peio1cow pemlr penincl penplan perlis perrp pf_seq phf_seq phmemprs /*
*/ pilin1 pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc precord /*
*/ prerelg prityp priv prnlfsch prnt_ptr prpertyp prptrea pruntype /*
*/ prwkstat p_stat ptot_r ptrsn ptweeks ptyn pxfntvty pxinusyr /*
*/ pxmntvty pxnatvty pyrsn ret_sc1 ret_sc2 ret_yn rnt_yn rsnnotw /*
*/ semp_yn seotr ssi_yn strkuc subuc sur_sc1 ss_yn sur_sc2 sur_yn uc_yn vet_qva /*
*/ vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn /*
*/ weclw weind welknw wemind wemocg weuemp wewkrs wexp wkcheck wkswork /*
*/ workyn wrk_ck wsal_yn wtemp{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }
foreach v in a_civlf a_age a_clswkr a_dtind a_dtocc a_enrlw a_hga /*
*/ a_explf a_exprrp a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hrlywk/*
*/ a_hrs1 a_hscol a_ind a_lfsr a_lineno a_maritl a_mjind a_mjocc alm_yn/*
*/ a_nlflj a_occ a_parent a_payabs a_pfrel a_race a_rcow /*
*/ a_reorgn a_sex a_spouse a_uncov a_unmem a_untype a_uslft /*
*/ a_uslhrs a_vet a_wantjb a_whenlj a_whyabs a_wksch a_wkslk /*
*/ a_wkstat age1 axage axclswkr axenrlw axftpt axhga axhrlywk /*
*/ axhrs axhscol axind axlfsr axmaritl axnlflj axocc axorigin axparent/*
*/ axpayabs axrace axrrp axsex axspouse axuncov axunmem axuslhrs axvet/*
*/ axwhyabs caid care ch_hi ch_mc champ clwk cov_gh cov_hi csp_yn dep_stat/*
*/ dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non/*
*/ div_yn earner ed_yn ern_otr ern_srce ern_yn famrel fl_665 hea hiemp hilin1/*
*/ hilin2 hiout hipaid hityp hrcheck hrswk gediv i_almval i_almyn i_caid /*
*/ i_care i_cspval i_cspyn i_dephi i_depriv i_discs i_dishp i_dissc1 i_dissc2/*
*/ i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1 i_edtyp2 i_edyn/*
*/ i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea i_hi/*
*/ i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr /*
*/ i_lkweek i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook/*
*/ i_occup i_oedval i_oival i_ostper i_ostyp i_oth i_otyp i_out/*
*/ i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_peninc i_penpla/*
*/ i_phmemp i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1 i_retsc2/*
*/ i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn /*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 /*
*/ i_surva2 i_suryn i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn/*
*/ i_wctyp i_wcval i_wcyn i_wkchk i_wkswk i_workyn i_wsval i_wsyn i_wtemp/*
*/ ljcw lknone lkstrch lkweeks losewks marg_tax mcaid mcare mig_div/*
*/ mig_mtr1 mig_mtr3 mig_mtr4 mig_reg migsame mig_st mon noemp nwlkwk/*
*/ nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth othstper othstyp1/*
*/ othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3 otyp4/*
*/ otyp5 out paid parent paw_mon paw_typ paw_yn peabsrsn peinusyr /*
*/ peio1cow pemlr penincl penplan perlis perrp pf_seq phf_seq phmemprs /*
*/ pilin1 pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc precord /*
*/ prerelg prityp priv prnlfsch prnt_ptr prpertyp prptrea pruntype /*
*/ prwkstat p_stat ptot_r ptrsn ptweeks ptyn pxfntvty pxinusyr /*
*/ pxmntvty pxnatvty pyrsn ret_sc1 ret_sc2 ret_yn rnt_yn rsnnotw /*
*/ semp_yn seotr ssi_yn strkuc subuc sur_sc1 ss_yn sur_sc2 sur_yn uc_yn vet_qva /*
*/ vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn /*
*/ weclw weind welknw wemind wemocg weuemp wewkrs wexp wkcheck wkswork /*
*/ workyn wrk_ck wsal_yn wtemp{
gen `v'_str= string(`v')
recast str2 `v'_str
format `v'_str %2s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}


*variable a_fnlwgt: same type double, but different format
format a_fnlwgt %12.0g
label variable a_fnlwgt "Final weight (2 implied decimal places"

format a_hrspay %12.0g
label variable a_hrspay "How much does ... earn per hour?"

format marsupwt %12.0g
label variable marsupwt "March supplement final weight (2impli)"


*change variables from int to double with format %12.0g
recast double a_grswk
format a_grswk %12.0g
label variable a_grswk "How much does ... usually earn per" 

recast double agi
format agi %12.0g

recast double csp_val
format csp_val %12.0g
label variable csp_val "Item 70c - How much did ... receive in"

recast double cap_loss

recast double div_val

recast double ed_val
format ed_val %12.0g
label variable ed_val "Item 69h - Total amount of educational"

recast double eit_cred
format eit_cred %12.0g
label variable eit_cred "Earn income tax credit"

recast double emcontrb
format emcontrb %12.0g
label variable emcontrb "Employer contribution for health"

recast double i_nxtres

recast double paw_val
format paw_val %12.0g
label variable paw_val "Item 59e - How much did ... receive in"

recast double p_mvcaid
format p_mvcaid %12.0g
label variable p_mvcaid "Person market value of medicaid"

recast double p_mvcare
format p_mvcare %12.0g
label variable p_mvcare "Person market value of medicare"

recast double ssi_val
format ssi_val %12.0g
label variable ssi_val "Item 57c - How much did ... receive in"

*change variables from byte to double
recast double ihsflg
format ihsflg %12.0g
label variable ihsflg "Recode: Covered by Indian Health"

recast double mig_plc
format mig_plc %12.0g
label variable mig_plc "Item 55a - Metropolitan statistical ar"

recast double nxtres
format nxtres %12.0g
label variable nxtres "What was ... main reason for moving?"

*change variables from long to double with format %12.0g
recast double alm_val
format alm_val %12.0g
label variable alm_val "Item 71c - How much did ... receive in"

recast double cap_gain
format cap_gain %12.0g
label variable cap_gain "Amount of capital gains"

recast double dis_val1
format dis_val1 %12.0g
label variable dis_val1 "Item 64e - How much did .. receive fr"

recast double dis_val2
format dis_val2 %12.0g
label variable dis_val2 "Item 64g - How muc did ... receive fr"

recast double dsab_val
format dsab_val %12.0g
label variable dsab_val "Recode total amount of disability inco"

recast double ern_val
format ern_val %12.0g
label variable ern_val "Item 48 a&b - How much did ... earn"

recast double oi_val
format oi_val %12.0g
label variable oi_val "Item 63d - How much did ... receive in"

recast double pearnval
format pearnval %12.0g
label variable pearnval "Recode - Total persons earnings"

recast double ph_seq
format ph_seq %12.0g
label variable ph_seq "Household seq number"

recast double pothval
format pothval %12.0g
label variable pothval "Recode - total other persons income"

recast double ptotval
format ptotval %12.0g
label variable ptotval "Recode - Total persons income"

recast double ret_val1
recast double ret_val2
recast double rnt_val
recast double rtm_val
recast double se_val
recast double semp_val
recast double srvs_val
recast double statetax
recast double sur_val1
recast double sur_val2
recast double tax_inc
recast double uc_val
recast double vet_val
recast double wc_val
recast double ws_val
recast double wsal_val


*From int to str4
gen industry_str= string(industry)
recast str4 industry_str
format industry_str %4s
drop industry
rename industry_str industry
label variable industry "Item 46b - Industry of longest job"

gen mig_cnt_str= string(mig_cnt)
recast str4 mig_cnt_str
format mig_cnt_str %4s
drop mig_cnt
rename mig_cnt_str mig_cnt
label variable mig_cnt "Country of previous residence"

gen occup_str= string(occup)
recast str4 occup_str
format occup_str %4s
drop occup
rename occup_str occup
label variable occup "Item 46c - Occupation of longest job"

gen pefntvty_str= string(pefntvty)
recast str4 pefntvty_str
format pefntvty_str %4s
drop pefntvty
rename pefntvty_str pefntvty
label variable pefntvty "In what country was your father born?"

gen penatvty_str= string(penatvty)
recast str4 penatvty_str
format penatvty_str %4s
drop penatvty
rename penatvty_str penatvty
label variable penatvty "In what country were you born?"

gen pemntvty_str= string(pemntvty)
recast str4 pemntvty_str
format pemntvty_str %4s
drop pemntvty
rename pemntvty_str pemntvty
label variable pemntvty "In what country was your mother born?"

gen pehruslt_str= string(pehruslt)
recast str4 pehruslt_str
format pehruslt_str %4s
drop pehruslt
rename pehruslt_str pehruslt

*Step 5: Append to the zero-obs file
append using "$ZEROOBS/cps200003pp.dta"

*Step 6: Save file
save "$Output/cps200003pp_filled.dta"

log close
include config.do
exit


