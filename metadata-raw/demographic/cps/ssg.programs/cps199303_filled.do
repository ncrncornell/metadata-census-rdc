*** Liu, Yukun 06/15/2012, first draft*** 
set more off
capture log close
include config.do

*** Load data and open log file***
clear all
log using "$Programs/cpsmar.cps199303_modified.log",text replace
use "$CPSNBER/cpsmar_person_1993.dta", replace

*** Drop unrelevent variables ***
drop i_* hrecord h_seq hhpos huunits h_faminc h_respnm h_hhtype h_numper /*
*/ hnumfam h_type h_month h_year h_mis h_hhnum h_livqrt h_typebc h_tenure h_telhhd /*
*/ h_telavl h_telint hg_* hmssz hpmsasz hmsa_r hccc_r hunder15 /*
*/ hc* hh5to18 hhotlun hhotno hf* hp* hl* he* hi* hw* hs* hu* hv* /*
*/ hdi* hre* hrn* hal* hoi* htotval hothval hhinc hm* hhi_yn hhstatus /*
*/ fs* flastidx fm* fo* fre* famlis povll frsp* finc* fu* fv* fd* fk* /*
*/ fintval frntval fedval fcspval falmval fearnval ft* fp* fh* fw* ff* /*
*/ grn_plac placdscp tc* a_werntf a_herntf /*
*/ htop5pct indccode h_idnum

*** Rename variables accordingly ***
rename aplineno axlineno
rename aprrp axrrp
rename apparent axparent 
rename apage axage
rename apmaritl axmaritl
rename apspouse axspouse
rename apsex axsex
rename apvet axvet
rename aphga axhga
rename aprace axrace 
rename aporigin axorigin
rename aplfsr axlfsr
rename apmajact axmajact
rename apanywk axanywk
rename aphrs axhrs
rename aphrschk axhrschk
rename apuslft axuslft
rename apftreas axftreas
rename aplostim axlostim
rename apovrtim axovrtim
rename apjobabs axjobabs
rename apwhyabs axwhyabs
rename appayabs axpayabs
rename apftabs axftabs
rename aplkwk axlkwk
rename apmthd axmthd
rename apwhylk axwhylk
rename apwkslk axwkslk
rename aplkftpt axlkftpt
rename apavail axavail
rename apwhyna axwhyna
rename apwhenlj axwhenlj
rename apind axind
rename apocc axocc
rename apclswkr axclswkr
rename apnlflj axnlflj
rename apwhylft axwhylft
rename apwantjb axwantjb
rename apwhynl axwhynl
rename apintend axintend
rename apuslhrs axuslhrs
rename aphrlywk axhrlywk
rename aphrspay axhrspay
rename apgrswk axgrswk
rename apunmem axunmem
rename apuncov axuncov
rename apenrchk axenrchk
rename apenrlw axenrlw
rename aphscol axhscol
rename apftpt axftpt

*** Saving the variable labels in a local macro ***
foreach v of var precord pppos a_lineno a_parent a_exprrp a_age a_maritl a_spouse a_sex /*
*/a_vet  a_race p_stat a_reorgn a_famnum a_famtyp a_famrel a_pfrel hhdrel /*
*/ famrel hhdfmx parent age1  phf_seq pf_seq prnt_ptr a_majact /*
*/ a_anywk a_hrs1 a_hrschk a_uslft a_ftreas a_lostim a_ovrtim a_jobabs /*
*/ a_whyabs a_payabs a_ftabs a_lkwk a_mthd1 a_mthd2 a_mthd3 a_mthd4 a_mthd5 a_mthd6 /*
*/ a_mthd7 a_whylk a_wkslk a_lkftpt a_avail a_whyna a_whenlj a_clswkr /*
*/ a_nlflj a_whylft a_wantjb a_whynl* a_intend a_uslhrs a_hrlywk a_unmem /*
*/ a_uncov a_enrchk a_enrlw a_hscol a_ftpt a_lfsr a_untype a_nlfrea a_wkstat /*
*/ a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc a_ernel /*
*/ a_rcow workyn wtemp nwlook nwlkwk rsnnotw wkswork wkcheck losewks lknone /*
*/ lkweeks lkstrch pyrsn phmemprs hrswk hrcheck ptyn ptweeks ptrsn ljcw /*
*/ wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg weind wemind /*
*/ migsame grin_reg grin_st mig_mtr* migsun noemp ern_yn ern_srce ern_otr /* 
*/ wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*
*/ wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn vet_typ* vet_qva /*
*/ sur_yn sur_sc* dis_hp dis_cs dis_yn dis_sc* ret_yn ret_sc* int_yn /*
*/ div_yn div_non rnt_yn ed_yn oed_typ* csp_yn alm_yn fin_yn oi_off oi_yn /*
*/ ptot_r perlis mcare mcaid champ wrk_ck penplan penincl cov_gh cov_hi /*
*/ ch_mc ch_hi axlineno axrrp axparent axage axmaritl axspouse axsex axvet /*
*/ axhga  axrace axorigin axlfsr axmajact axanywk axhrs axhrschk /*
*/ axuslft axftreas axlostim axovrtim axjobabs axwhyabs axpayabs /*
*/ axftabs axlkwk axmthd axwhylk axwkslk axlkftpt axavail axwhyna axwhenlj /*       
*/ axind axocc axclswkr axnlflj axwhylft axwantjb axwhynl axintend axuslhrs /*     
*/ axhrlywk axhrspay axgrswk axunmem axuncov axenrchk axenrlw axhscol axftpt /*                 
*/ ppposold a_ind a_occ industry occup a_hga a_whynl1 a_whynl2 a_whynl3 a_whynl4 a_whynl5 a_whynl6 a_whynl7 a_whynl8 a_whynl9 a_whynla a_whynlb /*
*/ mig_mtr1 mig_mtr3 mig_mtr4 vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 /*
*/sur_sc1 sur_sc2 dis_sc1 dis_sc2 ret_sc1 ret_sc2 oed_typ1 oed_typ2 oed_typ3 fl_665 filestat dep_stat /*
*/ marg_tax{

 	local l`v' : variable label `v'

        if `"`l`v''"' == "" {

 		local l`v' "`v'"

  	}

  }
  
  *** Reformatting and relabeling the variables in a single step ***
  foreach v in a_mthd7 a_whylk a_wkslk a_lkftpt a_avail a_whyna a_whenlj/*
  */ famrel hhdfmx parent age1  phf_seq pf_seq prnt_ptr a_majact /*
 */ a_anywk a_hrs1 a_hrschk a_uslft a_ftreas a_lostim a_ovrtim a_jobabs /*
  */ a_whyabs a_payabs a_ftabs a_lkwk a_mthd1 a_mthd2 a_mthd3 a_mthd4 a_mthd5 a_mthd6 /*
 */  precord pppos a_lineno a_parent a_exprrp a_age a_maritl a_spouse a_sex a_clswkr /*
*/a_vet  a_race p_stat a_reorgn a_famnum a_famtyp a_famrel a_pfrel hhdrel /*
*/ a_nlflj a_whylft a_wantjb a_intend a_uslhrs a_hrlywk a_unmem /*
*/ a_uncov a_enrchk a_enrlw a_hscol a_ftpt a_lfsr a_untype a_nlfrea a_wkstat /*
*/ a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc a_ernel /*
*/ a_rcow workyn wtemp nwlook nwlkwk rsnnotw wkswork wkcheck losewks lknone /*
*/ lkweeks lkstrch pyrsn phmemprs hrswk hrcheck ptyn ptweeks ptrsn ljcw /*
*/ wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg weind wemind /*
*/ migsame grin_reg grin_st  migsun noemp ern_yn ern_srce ern_otr /* 
*/ wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*
*/ wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn  vet_qva /*
*/ sur_yn dis_hp dis_cs dis_yn  ret_yn  int_yn /*
*/ div_yn div_non rnt_yn ed_yn  csp_yn alm_yn fin_yn oi_off oi_yn /*
*/ ptot_r perlis mcare mcaid champ wrk_ck penplan penincl cov_gh cov_hi /*
*/ ch_mc ch_hi axlineno axrrp axparent axage axmaritl axspouse axsex axvet /*
*/ axhga  axrace axorigin axlfsr axmajact axanywk axhrs axhrschk /*
*/ axuslft axftreas axlostim axovrtim axjobabs axwhyabs axpayabs /*
*/ axftabs axlkwk axmthd axwhylk axwkslk axlkftpt axavail axwhyna axwhenlj /*       
*/ axind axocc axclswkr axnlflj axwhylft axwantjb axwhynl axintend axuslhrs /*     
*/ axhrlywk axhrspay axgrswk axunmem axuncov axenrchk axenrlw axhscol axftpt /*                 
*/ ppposold a_hga a_whynl1 a_whynl2 a_whynl3 a_whynl4 a_whynl5 a_whynl6 a_whynl7 a_whynl8 a_whynl9 a_whynla a_whynlb /*
*/ mig_mtr1 mig_mtr3 mig_mtr4 vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 /*
*/ sur_sc1 sur_sc2 dis_sc1 dis_sc2 ret_sc1 ret_sc2 oed_typ1 oed_typ2 oed_typ3 fl_665 filestat dep_stat /*
*/ marg_tax{

	gen `v'_str= string(`v')

	recast str2 `v'_str

	format `v'_str %2s

	drop `v'

	rename `v'_str `v'

	label var `v' "`l`v''"

}

foreach v in a_ind a_occ industry occup {

	gen `v'_str= string(`v')

	recast str4 `v'_str

	format `v'_str %2s

	drop `v'

	rename `v'_str `v'
	
	label var `v' "`l`v''"

} 

*** Recast these variable's types into double ***
recast double ph_seq a_grswk ern_val ws_val wsal_val se_val semp_val /*
*/ frm_val frse_val uc_val wc_val ss_val ssi_val paw_val vet_val sur_val* /*
*/ srvs_val dis_val* dsab_val ret_val* rtm_val int_val div_val rnt_val /*
*/ ed_val csp_val alm_val fin_val oi_val ptotval pearnval pothval 

*** Fill in zero-obs file ***
append using "$ZEROOBS/cps199303pp.dta"
*** Save file ***
save "$Output/cps199303pp_filled.dta", replace

log close
include config.do
exit
