***Modified by Xi Wu 6/2012***

//Xi Wu 6/2012///
///Project 1 Fill in zero-observation data file///

set more off
capture log close
include config.do

///Open log file and use data 2007///

clear all
log using "$Programs/cpsmar_cps200703_modified.log",text replace
use "$CPSNBER/cpsmar_person_2007.dta", replace

///Drop variables not contained in zero-obs dataset///
drop i_* hrecord h_seq hhpos h_respnm hnumfam h_type h_month h_year h_mis h_hhnum /*
*/h_livqrt h_typebc h_tenure h_telhhd h_telavl h_telint hunder15 /*
*/hc* hh5to18 hhotlun hhotno hf* hp* hl* he* hi* hw* hs* hu* hv* /*
*/hdi* hre* hrn* hal* hoi* htotval hothval hhinc hm* hhi_yn hhstatus /*
*/fs* flastidx fm* fo* fre* famlis povll frsp* finc* fu* fv* fd* fk* /*
*/fintval frntval fedval fcspval falmval fearnval ft* fp* fh* fw* ff* /*
*/tc* htop5pct prop_tax housret hrhtype f_mv_fs f_mv_sl 

//*Rename variables to match zero-obs dataset


///Reformat variables to match zero-obs dataset///
///Reformat variables into str2 type///
///Save the variable labels in a local macro///
foreach v of var a_civlf a_age a_clswkr a_dtind a_dtocc a_enrlw a_hga a_explf a_exprrp /*
*/a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hrlywk ahiper ahityp1 ahityp2 ahityp3 ahityp4 /*
*/ahityp5 ahityp6 a_hrs1 a_hscol a_lfsr a_lineno a_maritl a_mjind alm_yn a_nlflj a_parent /*
*/a_payabs a_pfrel a_sex a_spouse a_uncov a_unmem a_untype a_uslft a_uslhrs /*
*/a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 caid care ch_hi ch_mc champ clwk cov_gh /*
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
*/a1rrp{
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
*/a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 caid care ch_hi ch_mc champ clwk cov_gh /*
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
*/cmsrvyna comsrvyn fin_yn frmotr frse_yn hhdfmx iahiper iahityp int_yn jcyn jcyna jryn /*
*/paidccyn paidcyna pchip resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia sskidyna sskidyn ssikdyna /*
*/ssikidyn tranyn tranyna wicyn wicyna jryna jtyn jtyna prdtrace pehspnon prdthsp hhdrel /*
*/a1rrp{
	gen `v'_str= string(`v') 
	recast str2 `v'_str
	format `v'_str %2s
	drop `v'
	rename `v'_str `v'
	label var `v' "`l`v''"
}

///Reformatting variables into str4 type///
///Save the variable labels in a local macro///
foreach v of var industry occup pehruslt penatvty pemntvty pefntvty {
 	local l`v' : variable label `v'
        if `"`l`v''"' == "" {
 		local l`v' "`v'"
  	}
  }

///Reformat and relabel the variables in a single step///
foreach v in industry occup pehruslt penatvty pemntvty pefntvty {
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
tax_inc 


///Append zero-obs file///
append using "$ZEROOBS/cps200703ppasec.dta"

///Save file///
save "$Output/cps200703ppasec_filled.dta", replace
log close
include config.do
exit

