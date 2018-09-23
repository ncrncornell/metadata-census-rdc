***Modified by Xi Wu 6/2012***
***Modify program and data***

clear
*John O'Shaughnessy
*Dataset cps_b_0301_0404
*Attempt 1

set more off
capture log close
include config.do

///Open log file and use data 1992///

clear all
log using "$Programs/cpsmar_cps199203_modified.log",text replace
use "$CPSNBER/cpsmar_person_1992.dta"

**DROP UNUSED VARIABLES**

drop a_herntf a_werntf f_mv_fs f_mv_sl falmval famlis fcspval 
drop fdisval fdivval fearnval fedval ffinval ffngcaid ffngcare 
drop ffoodreq ffpos ffposold ffrval fh_seq fheadidx fhousreq fhoussub 
drop fhusbidx finc_alm finc_csp finc_dis finc_div finc_ed finc_fin 
drop finc_fr finc_int finc_oi finc_paw finc_ret finc_rnt finc_se 
drop finc_ss finc_ssi finc_sur finc_uc finc_vet finc_wc finc_ws 
drop fintval fkind flastidx fmlasidx foival fothval fownu6 fpawval 
drop fpctcut fpersons fpovcut frecord frelu18 frelu6 fretval fwcval 
drop fwifeidx fwsval grn_plac h_* halm_yn halmval hc* hdis_yn hdisval 
drop hdiv_yn hdivval hearnval hed_yn hedval hengast hengval hfarm hfdval 
drop hfin_yn hfinval hflunch hflunno hfoodmo hfoodno hfoodsp hfrval hg_* 
drop hh5to18 hhi_yn hhinc hhotlun hhotno hhpos hhstatus hinc_* hintval 
drop hint_yn hlorent hmcaid hmcare hmsa_r hmssz hnumfam hoi_yn 
drop hoival hothval housret hpaw_yn hpawval hpctcut hphhnum hplivqrt 
drop hpmsasz hptelavl hptelhhd hptelint hptenure hpublic hrecord hret_yn 
drop hretval hrnt_yn hrntval hseval hss_yn hssi_yn hssival hssval hsun 
drop hsup_wgt hsur_yn hsurval htop5pct htotval hucval hunder15 hunder18 
drop huunits hvet_yn hvetval hwcval hwsval i_hchi i_hchinn i_hchino 
drop i_hcmcar i_hcmcen i_hengas i_hengva i_hfdval i_hflunc i_hflunn 
drop i_hfoodm i_hfoodn i_hfoods i_hhotlu i_hhotno i_hloren i_hpubli placdscp
drop povll prop_tax scmst tcernval tcffmval tcseval tcwsval 

**RENAME VARIABLES TO MATCH ZERO-OBS SET**

rename apage axage
rename apanywk axanywk
rename apavail axavail
rename apclswkr axclswkr
rename apenrchk axenrchk 
rename apenrlw axenrlw
rename apftabs axftabs 
rename apftpt axftpt
rename apftreas axftreas
rename apgrswk axgrswk
rename aphga axhga
rename aphgc axhgc
rename aphrlywk axhrlywk
rename aphrs axhrs
rename aphrschk axhrschk
rename aphrspay axhrspay
rename aphscol axhscol
rename apind axind
rename apintend axintend 
rename apjobabs axjobabs
rename aplfsr axlfsr
rename aplineno axlineno
rename aplkftpt axlkftpt
rename aplkwk axlkwk
rename aplostim axplostim
rename apmajact axmajact
rename apmaritl axmaritl
rename apmthd axmthd
rename apnlflj axnlflj
rename apocc axocc
rename aporigin axorigin
rename apovrtim axpovrtim
rename apparent axparent
rename appayabs axpayabs
rename aprace axrace
rename aprrp axrrp
rename apsex axsex
rename apspouse axspouse
rename apuncov axuncov
rename apunmem axunmem
rename apuslft axuslft
rename apuslhrs axuslhrs
rename apvet axvet
rename apwantjb axwantjb
rename apwhenlj axwhenlj
rename apwhyabs axwhyabs
rename apwhylft axwhylft
rename apwhylk axwhylk
rename apwhyna axwhyna
rename apwhynl axwhynl
rename apwkslk axwkslk

**SET THE VARIABLES IN A LOCAL MACRO**

foreach v of var pppos marg_tax dep_stat ptot_r filestat i_mig4 i_mig1 /*
*/i_peninc i_penpla i_hielse i_hipaid i_hiemp i_hiown i_hiyn i_champ i_mcaid /*
*/i_mcare i_noemp i_ernsrc i_wkchk i_wkswk i_wtemp i_workyn i_occup i_indus /*
*/i_ljcw i_ptrsn i_ptyn i_hrchk i_hrswk i_phmemp i_pyrsn i_lkstr i_lkweek /*
*/i_losewk i_rsnnot i_nwlkwk i_nwlook i_oival i_finval i_finyn i_almval  /*
*/i_cspval i_cspyn i_oedval i_edtyp2 i_edtyp1 i_edyn i_rntval i_rntyn /*
*/i_divval i_divyn i_intval i_intyn i_retvl2 i_retvl1 i_retsc2 i_retsc1 i_retyn /*
*/i_disvl1 i_disvl2 i_distyp i_disyn i_discs i_dishp i_dissc2 i_dissc1 i_survl2 /*
*/i_survl1 i_sursc2 i_sursc1 i_surtyp i_suryn i_vetqva i_vetval i_vettyp i_vetyn /*
*/i_pawmo i_pawval i_pawtyp i_pawyn i_ssival i_ssiyn i_ssval i_ssyn i_wcval i_wctyp /*
*/i_wcyn i_ucval i_ucyn i_frmval i_frmyn i_seval i_seyn i_wsval i_wsyn i_ernval /*
*/i_ernyn axftpt axhscol axenrlw axenrchk axuncov axunmem axgrswk axhrspay /*
*/axhrlywk axuslhrs axintend axwhynl axwantjb axwhylft axnlflj axclswkr axocc /*
*/axind axwhenlj axwhyna axavail axlkftpt axwkslk axwhylk axmthd axlkwk axftabs /*
*/axpayabs axwhyabs axjobabs axftreas axuslft axhrschk axhrs /*
*/axanywk axmajact axlfsr axorigin axrace axhga axvet axsex axspouse axmaritl /*
*/axage axparent axrrp axlineno ch_hi ch_mc cov_hi cov_gh penincl penplan  /*
*/hielse5 hielse4 hielse3 hielse2 hielse1 hipaid hiemp hiown hi_yn champ mcaid /*
*/mcare perlis oi_off oi_yn alm_yn fin_yn oed_typ1 csp_yn oed_typ3 oed_typ2 ed_yn /*
*/ rnt_yn div_non int_yn div_yn ret_yn ret_sc2 ret_sc1 dis_hp  dis_sc1 /*
*/dis_yn dis_cs sur_sc1 sur_sc2 vet_yn sur_yn  vet_typ5 vet_typ4 vet_typ3 /*
*/vet_typ2 vet_typ1 paw_yn paw_mon paw_typ ss_yn ssi_yn wc_yn wc_type uc_yn strkuc /*
*/subuc frmotr frse_yn semp_yn seotr wsal_yn wageotr ern_otr wewkrs ern_yn /*
*/noemp migsun mig_mtr4 mig_mtr3 mig_mtr1 grin_st grin_reg migsame /*
*/wemind weind wemocg poccu2 weclw clwk earner weuemp welknw a_unmem wexp ljcw /*
*/ptrsn ptweeks ptyn hrcheck hrswk phmemprs pyrsn lkstrch lkweeks lknone losewks /*
*/wkcheck wkswork rsnnotw nwlkwk nwlook wtemp workyn a_rcow a_ernel a_dtocc /*
*/a_mjocc a_dtind a_mjind a_ftlf a_civlf a_wksch a_explf a_wkstat a_nlfrea a_untype /*
*/a_lfsr a_ftpt a_hscol a_enrlw a_enrchk a_uncov a_hrlywk a_uslhrs /*
*/a_intend a_whynlb a_whynla a_whynl9 a_whynl8 a_whynl7 a_whynl6 a_whynl5 a_whynl4 /*
*/a_whynl3 a_whynl2 a_whynl1 a_wantjb a_whylft a_nlflj precord a_clswkr /*
*/a_whenlj a_whyna a_avail a_lkftpt a_wkslk a_whylk a_mthd7 a_mthd6 a_mthd5 a_mthd4 /*
*/a_mthd3 a_mthd2 a_mthd1 a_lkwk a_ftabs a_payabs a_whyabs a_jobabs a_ovrtim a_lostim /*
*/a_ftreas a_uslft a_hrschk a_hrs1 a_anywk a_majact fl_665 prnt_ptr pf_seq phf_seq /*
*/age1 parent hhdfmx famrel hhdrel /*
*/a_pfrel a_famrel a_famtyp a_famnum a_reorgn p_stat a_race a_hga a_vet /*
*/a_sex a_spouse a_maritl a_age a_exprrp a_parent a_lineno ppposold ern_srce /*
*/vet_qva dis_sc2 wrk_ck i_almyn i_ptwks{
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }

**REFORMAT VARIABLES INTO STR2**

foreach v of var pppos marg_tax dep_stat ptot_r filestat i_mig4 i_mig1 /*
*/i_peninc i_penpla i_hielse i_hipaid i_hiemp i_hiown i_hiyn i_champ i_mcaid /*
*/i_mcare i_noemp i_ernsrc i_wkchk i_wkswk i_wtemp i_workyn i_occup i_indus /*
*/i_ljcw i_ptrsn i_ptyn i_hrchk i_hrswk i_phmemp i_pyrsn i_lkstr i_lkweek /*
*/i_losewk i_rsnnot i_nwlkwk i_nwlook i_oival i_finval i_finyn i_almval  /*
*/i_cspval i_cspyn i_oedval i_edtyp2 i_edtyp1 i_edyn i_rntval i_rntyn /*
*/i_divval i_divyn i_intval i_intyn i_retvl2 i_retvl1 i_retsc2 i_retsc1 i_retyn /*
*/i_disvl1 i_disvl2 i_distyp i_disyn i_discs i_dishp i_dissc2 i_dissc1 i_survl2 /*
*/i_survl1 i_sursc2 i_sursc1 i_surtyp i_suryn i_vetqva i_vetval i_vettyp i_vetyn /*
*/i_pawmo i_pawval i_pawtyp i_pawyn i_ssival i_ssiyn i_ssval i_ssyn i_wcval i_wctyp /*
*/i_wcyn i_ucval i_ucyn i_frmval i_frmyn i_seval i_seyn i_wsval i_wsyn i_ernval /*
*/i_ernyn axftpt axhscol axenrlw axenrchk axuncov axunmem axgrswk axhrspay /*
*/axhrlywk axuslhrs axintend axwhynl axwantjb axwhylft axnlflj axclswkr axocc /*
*/axind axwhenlj axwhyna axavail axlkftpt axwkslk axwhylk axmthd axlkwk axftabs /*
*/axpayabs axwhyabs axjobabs axftreas axuslft axhrschk axhrs /*
*/axanywk axmajact axlfsr axorigin axrace axhga axvet axsex axspouse axmaritl /*
*/axage axparent axrrp axlineno ch_hi ch_mc cov_hi cov_gh penincl penplan  /*
*/hielse5 hielse4 hielse3 hielse2 hielse1 hipaid hiemp hiown hi_yn champ mcaid /*
*/mcare perlis oi_off oi_yn alm_yn fin_yn oed_typ1 csp_yn oed_typ3 oed_typ2 ed_yn /*
*/ rnt_yn div_non int_yn div_yn ret_yn ret_sc2 ret_sc1 dis_hp  dis_sc1 /*
*/dis_yn dis_cs sur_sc1 sur_sc2 vet_yn sur_yn  vet_typ5 vet_typ4 vet_typ3 /*
*/vet_typ2 vet_typ1 paw_yn paw_mon paw_typ ss_yn ssi_yn wc_yn wc_type uc_yn strkuc /*
*/subuc frmotr frse_yn semp_yn seotr wsal_yn wageotr ern_otr wewkrs ern_yn /*
*/noemp migsun mig_mtr4 mig_mtr3 mig_mtr1 grin_st grin_reg migsame /*
*/wemind weind wemocg poccu2 weclw clwk earner weuemp welknw a_unmem wexp ljcw /*
*/ptrsn ptweeks ptyn hrcheck hrswk phmemprs pyrsn lkstrch lkweeks lknone losewks /*
*/wkcheck wkswork rsnnotw nwlkwk nwlook wtemp workyn a_rcow a_ernel a_dtocc /*
*/a_mjocc a_dtind a_mjind a_ftlf a_civlf a_wksch a_explf a_wkstat a_nlfrea a_untype /*
*/a_lfsr a_ftpt a_hscol a_enrlw a_enrchk a_uncov a_hrlywk a_uslhrs /*
*/a_intend a_whynlb a_whynla a_whynl9 a_whynl8 a_whynl7 a_whynl6 a_whynl5 a_whynl4 /*
*/a_whynl3 a_whynl2 a_whynl1 a_wantjb a_whylft a_nlflj precord a_clswkr /*
*/a_whenlj a_whyna a_avail a_lkftpt a_wkslk a_whylk a_mthd7 a_mthd6 a_mthd5 a_mthd4 /*
*/a_mthd3 a_mthd2 a_mthd1 a_lkwk a_ftabs a_payabs a_whyabs a_jobabs a_ovrtim a_lostim /*
*/a_ftreas a_uslft a_hrschk a_hrs1 a_anywk a_majact fl_665 prnt_ptr pf_seq phf_seq /*
*/age1 parent hhdfmx famrel hhdrel /*
*/a_pfrel a_famrel a_famtyp a_famnum a_reorgn p_stat a_race a_hga a_vet /*
*/a_sex a_spouse a_maritl a_age a_exprrp a_parent a_lineno ppposold ern_srce /*
*/vet_qva dis_sc2 wrk_ck i_almyn i_ptwks{ 

gen `v'_str= string(`v')
	recast str2 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
            }

**REFORMAT VARIABLES INTO STR4**
foreach v of var a_occ a_ind occup industry  {
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }
foreach v in a_occ a_ind occup industry {
	gen `v'_str= string(`v')
	recast str4 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

**REFORMAT VARIABLES INTO DOUBLE**

recast double ph_seq a_grswk ern_val ws_val wsal_val se_val semp_val ///
frm_val frse_val uc_val wc_val ss_val ssi_val paw_val vet_val sur_val* ///
srvs_val dis_val* dsab_val ret_val* rtm_val int_val div_val rnt_val ///
ed_val csp_val alm_val fin_val oi_val ptotval pearnval pothval ///


///Append zero-obs file///
append using "$ZEROOBS/cps199203pp.dta"
///Save file///
save "$Output/cps199203pp_filled.dta", replace
log close
include config.do
exit

