***Modified by Xi Wu 6/2012***

///Xi Wu 6/2012///
///Project 1 Fill in zero-observation data file///

set more off
capture log close
include config.do

///Open log file and use data 1996///
clear all
log using "$Programs/cpsmar_cps199603_modified.log",text replace
use "$CPSNBER/cpsmar_person_1996.dta"


///Drop variables not contained in zero-obs dataset///
drop i_* hrecord h_seq hhpos huunits h_faminc h_respnm  /*
*/ hnumfam h_type h_month h_year h_mis h_hhnum h_livqrt h_typebc h_tenure h_telhhd /*
*/h_telavl h_telint hg_* hmsa_r hccc_r hunder15 /*
*/hc* hh5to18 hhotlun hhotno hf* hp* hl* he* hi* hw* hs* hu* hv* /*
*/hdi* hre* hrn* hal* hoi* htotval hothval hhinc hm* hhi_yn hhstatus /*
*/fs* flastidx fm* fo* fre* famlis povll frsp* finc* fu* fv* fd* fk* /*
*/fintval frntval fedval fcspval falmval fearnval ft* fp* fh* fw* ff* /*
*/placdscp tc* htop5pct indccode h_idnum prop_tax /*
*/housret hrhtype f_mv_fs f_mv_sl

//*Rename variables to match zero-obs dataset

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

///Reformat variables to match zero-obs dataset///
///Reformat variables into str2 type///
///Save the variable labels in a local macro///
foreach v of var precord pppos a_exprrp p_stat a_pfrel hhdrel /* 
*/famrel hhdfmx parent age1 phf_seq pf_seq prnt_ptr a_uslft a_whyabs a_clswkr /*
*/a_lfsr a_untype a_rcow workyn wtemp nwlook nwlkwk /*  
*/rsnnotw wkswork wkcheck losewks lknone lkweeks lkstrch pyrsn phmemprs hrswk hrcheck /*  
*/ptyn ptweeks ptrsn ljcw wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg /*  
*/weind wemind migsam mig_mtr1 mig_mtr3 mig_mtr4 noemp ern_yn /*  
*/ern_srce ern_otr wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*  
*/wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn vet_typ1 vet_typ2 vet_typ3 /*
*/vet_typ4 vet_typ5 vet_qva sur_yn sur_sc1 sur_sc2 dis_hp dis_cs dis_yn dis_sc1 dis_sc2 ret_yn /*
*/ret_sc1 ret_sc2 int_yn div_yn div_non rnt_yn ed_yn oed_typ1 oed_typ2 oed_typ3 /*
*/csp_yn alm_yn fin_yn oi_off oi_yn ptot_r perlis mcare mcaid champ wrk_ck /*  
*/penplan penincl cov_gh cov_hi ch_mc ch_hi axrrp axparent axage axmaritl axspouse /*  
*/axsex axvet axhga axrace axorigin axlfsr axhrs axwhyabs axpayabs axind axocc axclswkr /*                   
*/axnlflj axuslhrs axhrlywk axunmem axuncov axenrlw axhscol axftpt ppposold fl_665 /*
*/filestat dep_stat marg_tax pemlr pruntype prwkstat prptrea prdisc prcow1 prpertyp /*
*/peabsrsn prnlfsch peinusyr prcitshp pxnatvty pxmntvty pxfntvty pxinusyr mig_reg /*
*/mig_st gediv mig_div perrp a_lineno a_parent a_age a_maritl a_spouse a_sex a_vet /*
*/a_hga a_race a_reorgn a_famnum a_famtyp a_famrel a_hrs1 a_payabs a_wkslk a_whenlj /*
*/a_nlflj a_wantjb a_uslhrs a_hrlywk a_unmem a_uncov a_enrlw a_hscol a_ftpt a_wkstat /*
*/a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc peio1cow dephi paid priv /*
*/prityp depriv pilin1 pilin2 pout out care caid mon oth otyp_1 otyp_2 otyp_3 otyp_4 otyp_5 /*
*/othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 curr curtyp_1 curtyp_2 /*
*/curtyp_3 curtyp_4 curtyp_5{
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }
  
/*Reformatting and relabeling the variables in a single step*/
foreach v of var precord pppos a_exprrp p_stat a_pfrel hhdrel /* 
*/famrel hhdfmx parent age1 phf_seq pf_seq prnt_ptr a_uslft a_whyabs a_clswkr /*
*/a_lfsr a_untype a_rcow workyn wtemp nwlook nwlkwk /*  
*/rsnnotw wkswork wkcheck losewks lknone lkweeks lkstrch pyrsn phmemprs hrswk hrcheck /*  
*/ptyn ptweeks ptrsn ljcw wexp wewkrs welknw weuemp earner clwk weclw poccu2 wemocg /*  
*/weind wemind migsam mig_mtr1 mig_mtr3 mig_mtr4 noemp ern_yn /*  
*/ern_srce ern_otr wageotr wsal_yn seotr semp_yn frmotr frse_yn uc_yn subuc strkuc wc_yn /*  
*/wc_type ss_yn ssi_yn paw_yn paw_typ paw_mon vet_yn vet_typ1 vet_typ2 vet_typ3 /*
*/vet_typ4 vet_typ5 vet_qva sur_yn sur_sc1 sur_sc2 dis_hp dis_cs dis_yn dis_sc1 dis_sc2 ret_yn /*
*/ret_sc1 ret_sc2 int_yn div_yn div_non rnt_yn ed_yn oed_typ1 oed_typ2 oed_typ3 /*
*/csp_yn alm_yn fin_yn oi_off oi_yn ptot_r perlis mcare mcaid champ wrk_ck /*  
*/penplan penincl cov_gh cov_hi ch_mc ch_hi axrrp axparent axage axmaritl axspouse /*  
*/axsex axvet axhga axrace axorigin axlfsr axhrs axwhyabs axpayabs axind axocc axclswkr /*                   
*/axnlflj axuslhrs axhrlywk axunmem axuncov axenrlw axhscol axftpt ppposold fl_665 /*
*/filestat dep_stat marg_tax pemlr pruntype prwkstat prptrea prdisc prcow1 prpertyp /*
*/peabsrsn prnlfsch peinusyr prcitshp pxnatvty pxmntvty pxfntvty pxinusyr mig_reg /*
*/mig_st gediv mig_div perrp a_lineno a_parent a_age a_maritl a_spouse a_sex a_vet /*
*/a_hga a_race a_reorgn a_famnum a_famtyp a_famrel a_hrs1 a_payabs a_wkslk a_whenlj /*
*/a_nlflj a_wantjb a_uslhrs a_hrlywk a_unmem a_uncov a_enrlw a_hscol a_ftpt a_wkstat /*
*/a_explf a_wksch a_civlf a_ftlf a_mjind a_dtind a_mjocc a_dtocc peio1cow dephi paid priv /*
*/prityp depriv pilin1 pilin2 pout out care caid mon oth otyp_1 otyp_2 otyp_3 otyp_4 otyp_5 /*
*/othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 curr curtyp_1 curtyp_2 /*
*/curtyp_3 curtyp_4 curtyp_5{
	gen `v'_str= string(`v') 
	recast str2 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

///Reformatting variables into str4 type///
///Save the variable labels in a local macro///
foreach v of var industry occup pehruslt penatvty pemntvty pefntvty mig_cnt a_ind a_occ{
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }

///Reformat and relabel the variables in a single step///
foreach v in industry occup pehruslt penatvty pemntvty pefntvty mig_cnt a_ind a_occ{
	gen `v'_str= string(`v')
	recast str4 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

///Reformat variables into double type///
recast double ph_seq ern_val ws_val wsal_val se_val semp_val ///
frm_val frse_val uc_val wc_val ss_val ssi_val paw_val vet_val sur_val* ///
srvs_val dis_val* dsab_val ret_val* rtm_val int_val div_val rnt_val ///
ed_val csp_val alm_val fin_val oi_val ptotval pearnval pothval p_mvcare ///
p_mvcaid emcontrb fed_tax eit_cred statetax fica fed_ret agi cap_gain cap_loss /// 
tax_inc


///Append zero-obs file///
append using "$ZEROOBS/cps199603pp.dta"
///Save file///
save "$Output/cps199603pp_filled.dta", replace

log close
include config.do
exit

