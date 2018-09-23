*** Liu, Yukun 06/15/2012, first draft*** 
set more off
capture log close
include config.do

*** Load data and open log file***
clear all
log using "$Programs/cpsmar.cps199803_modified.log",text replace
use "$CPSNBER/cpsmar_person_1998.dta", replace

*** Drop unrelevent variables ***
drop i_* hrecord h_seq hhpos  h_faminc h_respnm h_hhtype h_numper /*
*/ hnumfam h_type h_month h_year h_mis h_hhnum h_livqrt h_typebc h_tenure h_telhhd /*
*/ h_telavl h_telint hg_* hmssz hpmsasz hmsa_r hccc_r hunder15 /*
*/ hc* hh5to18 hhotlun hhotno hf* hp* hl* he* hi* hw* hs* hu* hv* /*
*/ hdi* hre* hrn* hal* hoi* htotval hothval hhinc hm* hhi_yn hhstatus /*
*/ fs* flastidx fm* fo* fre* famlis povll frsp* finc* fu* fv* fd* fk* /*
*/ fintval frntval fedval fcspval falmval fearnval ft* fp* fh* fw* ff* /*
*/  placdscp tc* a_werntf a_herntf /*
*/ htop5pct indccode h_idnum

*** Rename variables accordingly ***
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
rename aphrs axhrs
rename apwhyabs axwhyabs
rename appayabs axpayabs
rename apind axind
rename apocc axocc
rename apclswkr axclswkr
rename apnlflj axnlflj
rename apuslhrs axuslhrs
rename aphrlywk axhrlywk
rename apunmem axunmem
rename apuncov axuncov
rename apenrlw axenrlw
rename aphscol axhscol
rename apftpt axftpt

*** Saving the variable labels in a local macro ***
foreach v of var precord pppos a_lineno a_parent a_exprrp a_age a_maritl a_spouse a_sex /*
*/a_vet  a_race p_stat a_reorgn a_famnum a_famtyp a_famrel a_pfrel hhdrel /*
*/ famrel hhdfmx parent age1  phf_seq pf_seq prnt_ptr caid /*
*/  a_hrs1  a_uslft  mig_cnt paid depriv mon /*
*/ a_whyabs a_payabs  priv prityp /*
*/ a_wkslk a_whenlj a_clswkr pilin1 pilin2 pout /*
*/ a_nlflj a_wantjb a_uslhrs a_hrlywk a_unmem /*
*/ a_uncov a_enrlw a_hscol a_ftpt a_lfsr a_untype a_wkstat /*
*/ a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc /*
*/ a_rcow workyn wtemp nwlook nwlkwk rsnnotw wkswork wkcheck losewks lknone /*
*/ lkweeks lkstrch pyrsn phmemprs hrswk hrcheck ptyn ptweeks ptrsn ljcw /*
*/ wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg weind wemind /*
*/ migsame mig_mtr* noemp ern_yn ern_srce ern_otr /* 
*/ wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*
*/ wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn vet_typ* vet_qva /*
*/ sur_yn sur_sc* dis_hp dis_cs dis_yn dis_sc* ret_yn ret_sc* int_yn /*
*/ div_yn div_non rnt_yn ed_yn oed_typ* csp_yn alm_yn fin_yn oi_off oi_yn /*
*/ ptot_r perlis mcare mcaid champ wrk_ck penplan penincl cov_gh cov_hi /*
*/ ch_mc ch_hi axrrp axparent axage axmaritl axspouse axsex axvet /*
*/ axhga  axrace axorigin axlfsr axhrs oth otyp_1 otyp_2 otyp_3 otyp_4 otyp_5 /*
*/ axwhyabs axpayabs pxinusyr perrp othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 /*
*/ pemntvty pefntvty dephi care othstper    /*       
*/ axind axocc axclswkr axnlflj axuslhrs out /*     
*/ axhrlywk axunmem axuncov axenrlw axhscol axftpt /*                 
*/ ppposold a_ind a_occ industry occup a_hga /*
*/ mig_mtr1 mig_mtr3 mig_mtr4 vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 /*
*/sur_sc1 sur_sc2 dis_sc1 dis_sc2 ret_sc1 ret_sc2 oed_typ1 oed_typ2 oed_typ3 fl_665 filestat dep_stat /*
*/ marg_tax mig_reg mig_st gediv mig_div pemlr pruntype prwkstat prptrea prdisc prcow1 prpertyp /*
*/peabsrsn peio1cow prnlfsch pehruslt penatvty peinusyr prcitshp pxnatvty pxmntvty pxfntvty ihsflg nxtres{

 	local l`v' : variable label `v'

        if `"`l`v''"' == "" {

 		local l`v' "`v'"

  	}

  }
  
  *** Reformatting and relabeling the variables in a single step ***
  foreach v in a_wkslk a_whenlj caid /*
  */ famrel hhdfmx parent age1  phf_seq pf_seq prnt_ptr  /*
 */  a_hrs1  a_uslft prityp depriv mon oth /*
  */ a_whyabs a_payabs pilin1 pilin2 pout out /*
 */  precord pppos a_lineno a_parent a_exprrp a_age a_maritl a_spouse a_sex a_clswkr /*
*/a_vet  a_race p_stat a_reorgn a_famnum a_famtyp a_famrel a_pfrel hhdrel /*
*/ a_nlflj a_wantjb a_uslhrs a_hrlywk a_unmem /*
*/ a_uncov a_enrlw a_hscol a_ftpt a_lfsr a_untype a_wkstat /*
*/ a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc /*
*/ a_rcow workyn wtemp nwlook nwlkwk rsnnotw wkswork wkcheck losewks lknone /*
*/ lkweeks lkstrch pyrsn phmemprs hrswk hrcheck ptyn ptweeks ptrsn ljcw /*
*/ wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg weind wemind /*
*/ migsame  noemp ern_yn ern_srce ern_otr   /* 
*/ wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*
*/ wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn  vet_qva /*
*/ sur_yn dis_hp dis_cs dis_yn  ret_yn  int_yn /*
*/ div_yn div_non rnt_yn ed_yn  csp_yn alm_yn fin_yn oi_off oi_yn /*
*/ ptot_r perlis mcare mcaid champ wrk_ck penplan penincl cov_gh cov_hi /*
*/ ch_mc ch_hi axrrp axparent axage axmaritl axspouse axsex axvet /*
*/ axhga  axrace axorigin axlfsr axhrs  /*
*/ axwhyabs axpayabs dephi paid priv /*
*/ pxinusyr perrp mig_cnt otyp_1 otyp_2 otyp_3 otyp_4 otyp_5 /*       
*/ axind axocc axclswkr axnlflj axuslhrs /*     
*/ axhrlywk axunmem axuncov axenrlw axhscol axftpt /*                 
*/ ppposold a_hga care othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 /*
*/ mig_mtr1 mig_mtr3 mig_mtr4 vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 /*
*/ sur_sc1 sur_sc2 dis_sc1 dis_sc2 ret_sc1 ret_sc2 oed_typ1 oed_typ2 oed_typ3 fl_665 filestat dep_stat /*
*/ marg_tax mig_reg mig_st gediv mig_div pemlr pruntype prwkstat prptrea prdisc prcow1 prpertyp /*
*/ peabsrsn peio1cow prnlfsch pehruslt penatvty peinusyr prcitshp pxnatvty pxmntvty pxfntvty ihsflg nxtres{

	gen `v'_str= string(`v')

	recast str2 `v'_str

	format `v'_str %2s

	drop `v'

	rename `v'_str `v'

	label var `v' "`l`v''"

}

foreach v in a_ind a_occ industry occup pemntvty pefntvty  {

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
append using "$ZEROOBS/cps199803pp.dta"
*** Save file ***
save "$Output/cps199803pp_filled.dta", replace

log close
include config.do
exit
