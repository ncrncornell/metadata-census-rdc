***Modified by Xi Wu 6/2012***

//Xi Wu 6/2012///
///Project 1 Fill in zero-observation data file///

set more off
capture log close
include config.do

///Open log file and use data 2006///

clear all
log using "$Programs/cpsmar_cps200603_modified.log",text replace
use "$CPSNBER/cpsmar_person_2006.dta", replace


///Drop variables not contained in zero-obs dataset///
drop hrecord h_seq hhpos h_respnm hnumfam h_type h_month h_year h_mis h_hhnum /*
*/h_livqrt h_typebc h_tenure h_telhhd h_telavl h_telint hunder15 /*
*/hc* hh5to18 hhotlun hhotno hf* hp* hl* he* hi* hw* hs* hu* hv* /*
*/hdi* hre* hrn* hal* hoi* htotval hothval hhinc hm* hhi_yn hhstatus /*
*/fs* flastidx fm* fo* fre* famlis povll frsp* finc* fu* fv* fd* fk* /*
*/fintval frntval fedval fcspval falmval fearnval ft* fp* fh* fw* ff* /*
*/tc* htop5pct prop_tax housret hrhtype f_mv_fs f_mv_sl 

//*Rename variables to match zero-obs dataset

rename aprrp axrrp
rename apparent axparent 
rename apage axage
rename apmaritl axmaritl
rename apspouse axspouse
rename aphga axhga
rename aplfsr axlfsr
rename aphrs axhrs
rename apwhyabs axwhyabs
rename appayabs axpayabs
rename apclswkr axclswkr
rename apnlflj axnlflj
rename apuslhrs axuslhrs
rename aphrlywk axhrlywk
rename apunmem axunmem
rename apuncov axuncov
rename apenrlw axenrlw
rename aphscol axhscol
rename apftpt axftpt
rename i_disvl1 i_disva1
rename i_disvl2 i_disva2
rename i_retvl1 i_retva1
rename i_retvl2 i_retva2
rename i_survl1 i_surva1
rename i_survl2 i_surva2

///Reformat variables to match zero-obs dataset///
///Reformat variables into str2 type///
///Save the variable labels in a local macro///
foreach v of var a_civlf a_age a_clswkr a_dtind a_dtocc a_enrlw a_hga a_explf a_exprrp /*
*/a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hrlywk ahiper ahityp1 ahityp2 ahityp3 ahityp4 /*
*/ahityp5 ahityp6 a_hrs1 a_hscol a_lfsr a_lineno a_maritl a_mjind alm_yn a_nlflj a_parent /*
*/a_payabs a_pfrel a_sex a_spouse a_uncov a_unmem a_untype a_uslft a_uslhrs /*
*/a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 axage axclswkr axenrlw axftpt /*
*/axhga axhrlywk axhrs axhscol axlfsr axmaritl axnlflj axparent axpayabs axrrp  /*
*/axspouse axuncov axunmem axuslhrs axwhyabs caid care ch_hi ch_mc champ clwk cov_gh /*
*/cov_hi csp_yn dep_stat dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non /*
*/div_yn earner ed_yn ern_otr ern_srce ern_yn famrel filestat fl_665 hrcheck hrswk gediv /*
*/ljcw lknone lkstrch lkweeks losewks marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 /*
*/mig_reg migsame mig_st mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn /*
*/oth othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 out paid parent /*
*/paw_mon paw_typ paw_yn peabsrsn peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq /*
*/phf_seq phmemprs pilin1 pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc precord /*
*/prerelg prityp priv prnlfsch prnt_ptr prpertyp prptrea pruntype prwkstat p_stat ptot_r ptrsn /*
*/ptweeks ptyn pxfntvty pxinusyr pxmntvty pxnatvty pyrsn ret_sc1 ret_sc2 ret_yn rnt_yn rsnnotw /*
*/scholyna schoolyn semp_yn seotr ssi_yn strkuc subuc sur_sc1 ss_yn sur_sc2 sur_yn uc_yn vet_qva /*
*/vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn weclw weind welknw /*
*/wemind wemocg weuemp wewkrs wexp wkcheck wkswork workyn wrk_ck wsal_yn wtemp ccayn ccayna /*
*/cmsrvyna comsrvyn fin_yn frmotr frse_yn hhdfmx hhdrel iahiper iahityp int_yn jcyn jcyna jryn /*
*/paidccyn paidcyna pchip resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia sskidyna sskidyn ssikdyna /*
*/ssikidyn tranyn tranyna wicyn wicyna jryna jtyn jtyna prdtrace pehspnon prdthsp hhdrel /*
*/i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv i_discs i_dishp /*
*/i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1 i_edtyp2 i_edyn /*
*/i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea i_hi i_hiout i_hrchk /*
*/i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr i_lkweek i_losewk /*
*/i_mig1 i_mig2 i_mig3 /*
*/i_mon i_noemp i_nwlkwk i_nwlook i_occup i_oedval i_oival i_oth i_otyp /*
*/i_out i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_pchip i_peninc i_penpla i_phmemp /*
*/i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1 i_retsc2 i_retva1 i_retva2 i_retyn /*
*/i_rntval i_rntyn i_rsnnot i_seval i_seyn i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 /*
*/i_sursc2 i_surva1 i_surva2 i_suryn i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn /*
*/i_wctyp i_wcval i_wcyn i_wkchk i_wkswk i_workyn i_wsval i_wsyn i_wtemp {
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }
  
/*Reformatting and relabeling the variables in a single step*/
foreach v of var a_civlf a_age a_clswkr a_dtind a_dtocc a_enrlw a_hga a_explf a_exprrp /*
*/a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hrlywk ahiper ahityp1 ahityp2 ahityp3 ahityp4 /*
*/ahityp5 ahityp6 a_hrs1 a_hscol a_lfsr a_lineno a_maritl a_mjind alm_yn a_nlflj a_parent /*
*/a_payabs a_pfrel a_sex a_spouse a_uncov a_unmem a_untype a_uslft a_uslhrs /*
*/a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 axage axclswkr axenrlw axftpt /*
*/axhga axhrlywk axhrs axhscol axlfsr axmaritl axnlflj axparent axpayabs axrrp  /*
*/axspouse axuncov axunmem axuslhrs axwhyabs caid care ch_hi ch_mc champ clwk cov_gh /*
*/cov_hi csp_yn dep_stat dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non /*
*/div_yn earner ed_yn ern_otr ern_srce ern_yn famrel filestat fl_665 hrcheck hrswk gediv /*
*/ljcw lknone lkstrch lkweeks losewks marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 /*
*/mig_reg migsame mig_st mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn /*
*/oth othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 out paid parent /*
*/paw_mon paw_typ paw_yn peabsrsn peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq /*
*/phf_seq phmemprs pilin1 pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc precord /*
*/prerelg prityp priv prnlfsch prnt_ptr prpertyp prptrea pruntype prwkstat p_stat ptot_r ptrsn /*
*/ptweeks ptyn pxfntvty pxinusyr pxmntvty pxnatvty pyrsn ret_sc1 ret_sc2 ret_yn rnt_yn rsnnotw /*
*/scholyna schoolyn semp_yn seotr ssi_yn strkuc subuc sur_sc1 ss_yn sur_sc2 sur_yn uc_yn vet_qva /*
*/vet_typ1 vet_typ2 vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn weclw weind welknw /*
*/wemind wemocg weuemp wewkrs wexp wkcheck wkswork workyn wrk_ck wsal_yn wtemp ccayn ccayna /*
*/cmsrvyna comsrvyn fin_yn frmotr frse_yn hhdfmx hhdrel iahiper iahityp int_yn jcyn jcyna jryn /*
*/paidccyn paidcyna pchip resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia sskidyna sskidyn ssikdyna /*
*/ssikidyn tranyn tranyna wicyn wicyna jryna jtyn jtyna prdtrace pehspnon prdthsp hhdrel /*
*/i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv i_discs i_dishp /*
*/i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1 i_edtyp2 i_edyn /*
*/i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea i_hi i_hiout i_hrchk /*
*/i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr i_lkweek i_losewk /*
*/i_mig1 i_mig2 i_mig3 /*
*/i_mon i_noemp i_nwlkwk i_nwlook i_occup i_oedval i_oival i_oth i_otyp /*
*/i_out i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_pchip i_peninc i_penpla i_phmemp /*
*/i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1 i_retsc2 i_retva1 i_retva2 i_retyn /*
*/i_rntval i_rntyn i_rsnnot i_seval i_seyn i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 /*
*/i_sursc2 i_surva1 i_surva2 i_suryn i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn /*
*/i_wctyp i_wcval i_wcyn i_wkchk i_wkswk i_workyn i_wsval i_wsyn i_wtemp {
	gen `v'_str= string(`v') 
	recast str2 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

///Reformatting variables into str4 type///
///Save the variable labels in a local macro///
foreach v of var industry occup pehruslt penatvty pemntvty pefntvty mig_cnt {
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }

///Reformat and relabel the variables in a single step///
foreach v in industry occup pehruslt penatvty pemntvty pefntvty mig_cnt {
	gen `v'_str= string(`v')
	recast str4 `v'_str
	format `v'_str %4s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

///Reformat variables into double type///
recast double ph_seq ern_val ws_val wsal_val se_val semp_val ///
frm_val frse_val uc_val wc_val ss_val ssi_val paw_val vet_val sur_val* ///
srvs_val dis_val* dsab_val ret_val* rtm_val int_val div_val rnt_val ///
ed_val csp_val alm_val fin_val oi_val ptotval pearnval pothval p_mvcare ///
p_mvcaid emcontrb eit_cred statetax* fica fed_ret agi cap_gain cap_loss /// 
tax_inc i_nxtres i_ostper i_ostyp

///Append zero-obs file///
append using "$ZEROOBS/cps200603ppasec.dta"

///Save file///
save "$Output/cps200603ppasec_filled.dta", replace
log close
include config.do
exit
