*Tae Hyun Kim
*Dataset cpsmar_person_2008

set more off
capture log close
include config.do

*Step 1: Load data and open log file
clear all
log using "cpsmar.cps200803_modified.log",text replace
use "$CPSNBER/cpsmar_person_2008.dta", replace

*Sort variables in alphabetical order
order _all, alphabetic

*Step 2: Drop irrelevant variables
drop a1age-a1whyabs a_herntf a_werntf f_mv_fs-fearnval fedval-fhusbidx /*
*/ finc_alm-fkind flastidx-fretval frntval frspov-fwsval gereg-h_respnm /*
*/ h_telavl-hh5to18 hhi_yn-hhstatus hinc_fr-hintval hlorent-hrccayn /*
*/ hrcmsryn-hrschlyn hrtayn-hwsval i_hengas-i_hhotno i_hloren-i_hpubli /*
*/ i_hunits i_ostper i_ostyp mig_cbst mig_dscp mjocc peioind peioocc /*
*/ peridnum pf_seq povll talm_val tcernval-toi_val tretval1-tsurval2

*Step 3: Rename variables
rename i_disvl1 i_disva1
rename i_disvl2 i_disva2
rename i_retvl1 i_retva1
rename i_retvl2 i_retva2
rename i_survl1 i_surva1
rename i_survl2 i_surva2
rename otyp_1 otyp1
rename otyp_2 otyp2
rename otyp_3 otyp3
rename otyp_4 otyp4
rename otyp_5 otyp5
rename statetax_ac statetax_a
rename statetax_bc statetax_b

*Step 4: Remake the variables

*Recast to double
recast double agi alm_val cap_gain dis_val1 div_val dsab_val ern_val fed_ret fedtax_ac /*
*/ fedtax_bc fica fin_val frm_val frse_val h_seq int_val oi_val p_mvcaid /*
*/ pearnval ph_seq pothval prop_tax ptotval ret_val1 ret_val2 rnt_val rtm_val se_val/*
*/ semp_val srvs_val ss_val statetax_a statetax_b sur_val1 sur_val2 tax_inc uc_val /*
*/ vet_val wc_val ws_val wsal_val a_grswk actc_crd cap_loss csp_val ctc_crd /*
*/ dis_val2 ed_val eit_cred emcontrb p_mvcare paw_val peafwhn4 pecohab pxafever/*
*/ prswkxpns ssi_val a_ernlwt prwernal pelndad pelnmom pemomtyp pedadtyp/*
*/ peafever peafwhn1 peafwhn2 peafwhn3 i_nxtres pxlnmom pxlndad pxmomtyp pxdadtyp/*
*/ nxtres ihsflg prhernal pxafwhn1 pxcohab

format agi alm_val cap_gain dis_val1 div_val dsab_val ern_val fed_ret fedtax_ac /*
*/ fedtax_bc fica fin_val frm_val frse_val h_seq int_val oi_val p_mvcaid /*
*/ pearnval ph_seq pothval prop_tax ptotval ret_val1 ret_val2 rnt_val rtm_val se_val/*
*/ semp_val srvs_val ss_val statetax_a statetax_b sur_val1 sur_val2 tax_inc uc_val /*
*/ vet_val wc_val ws_val wsal_val a_grswk actc_crd cap_loss csp_val ctc_crd /*
*/ dis_val2 ed_val eit_cred emcontrb p_mvcare paw_val peafwhn4 pecohab pxafever/*
*/ prswkxpns ssi_val a_ernlwt prwernal pelndad pelnmom pemomtyp pedadtyp/*
*/ peafever peafwhn1 peafwhn2 peafwhn3 i_nxtres pxlnmom pxlndad pxmomtyp pxdadtyp/*
*/ nxtres ihsflg prhernal pxafwhn1 pxcohab %12.0g

format a_ernlwt a_fnlwgt a_hrspay marsupwt %12.0g


*Recast to str4
foreach v in industry marg_tax occup pefntvty pehruslt peinusyr penatvty pemntvty {
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }

foreach v in industry marg_tax occup pefntvty pehruslt peinusyr penatvty pemntvty {
gen `v'_str= string(`v')
recast str4 `v'_str
format `v'_str %4s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}



foreach v in a_pfrel a_sex a_uslhrs a_wantjb lkweeks losewks a_ftpt i_ptrsn /*
*/ i_ptwks i_ptyn i_pyrsn i_penpla i_phmemp i_pout i_priv int_yn jcyn ed_yn ahiper /*
*/ ahityp1 a_enrlw a_explf prptrea pruntype prwkstat ptot_r i_vetyn i_wctyp /*
*/ i_wcval i_wcyn jcyna jryn jryna jtyn a_mjind a_nlflj cov_gh cov_hi fin_yn fl_665 /*
*/ sskidyna strkuc subuc a_spouse i_seval i_seyn i_ssival i_ssiyn a_lineno a_maritl /*
*/ wexp wicyn wicyna wkcheck wkswork i_surva1 i_surva2 i_suryn i_ucval a_parent a_payabs/*
*/ i_ssval i_ssyn i_sursc1 i_sursc2 mcaid mcare mig_div mig_mtr1 mig_mtr3 i_intval/*
*/ i_intyn i_ljcw i_lkstr i_lkweek i_losewk i_mig1 i_mig2 ss_yn ssi_yn ssikdyna/*
*/ ssikidyn sskidyn ppposold prcitshp prcow1 prdisc prdthsp penincl penplan perlis/*
*/ ch_mc champ clwk i_hiout i_hrchk i_hrswk i_indus dis_yn div_non a_dtind a_dtocc/*
*/ dis_hp dis_sc1 dis_sc2 pemlr i_frmval i_frmyn i_hea i_hi/*
*/ semp_yn seotr rnt_yn rsnnotw scholyna schoolyn a_civlf a_clswkr i_ernval i_ernyn/*
*/ i_finval i_finyn i_edtyp1 i_edtyp2 i_edyn i_ernsrc i_pawval i_pawyn i_pchip i_peninc/*
*/ pehspnon peio1cow peabsrsn/*
*/ ret_sc1 ret_sc2 ret_yn i_out i_paid i_pawmo i_pawtyp i_disva2/*
*/ i_disyn i_divval i_divyn i_dishp i_dissc1 i_dissc2 i_disva1 i_cspyn i_dephi i_depriv/*
*/ i_discs a_age a_ftlf weind welknw wemind wemocg weuemp wewkrs i_almyn i_caid i_care/*
*/ i_cspval csp_yn dep_stat hityp hrcheck hrswk i_almval i_retsc1 i_retsc2 i_retva1/*
*/ i_retva2 hilin2 hiout hiown hipaid pilin2 poccu2 pout pppos hi hi_yn hiemp hilin1/*
*/ i_oival i_oth i_otyp i_nwlook i_occup i_oedval resnss1 resnss2 resnssa/*
*/ resnssi1 resnssi2 resnssia i_mig3 i_mon i_noemp i_nwlkwk dephi depriv dis_cs hhdfmx/*
*/ hhdrel a_famrel a_famtyp frmotr frse_yn gediv pxmntvty pxnatvty/*
*/ pyrsn ahityp2 ahityp3 perrp phf_seq phmemprs pilin1 caid i_wkchk i_wkswk i_workyn/*
*/ i_wsval i_wsyn ptrsn ptweeks ptyn ern_otr ern_srce i_retyn i_rntval i_rntyn/*
*/ i_rsnnot jtyna ljcw lknone lkstrch ccayn ccayna ch_hi a_wksch a_wkslk care othstyp1/*
*/ othstyp2 othstyp3 othstyp4 othstyp5 a_wkstat oi_off oi_yn oth othstper a_whenlj a_whyabs/*
*/ a_hga a_hrlywk a_hrs1 p_stat paid paidccyn paidcyna parent mon noemp nwlkwk nwlook/*
*/ i_ucyn i_vetqva i_vettyp i_vetval ahityp6 alm_yn mig_mtr4 mig_reg mig_st/*
*/ migsame workyn wrk_ck wsal_yn wtemp vet_yn wageotr wc_type wc_yn weclw div_yn earner/*
*/ vet_typ2 vet_typ3 vet_typ4 vet_typ5 tranyn tranyna uc_yn vet_qva vet_typ1 otyp5 out/*
*/ filestat age1 i_wtemp iahiper iahityp prdtrace precord prerelg a_uncov/*
*/ a_unmem cmsrvyna comsrvyn a_exprrp a_famnum ahityp4 ahityp5 prityp priv prnlfsch/*
*/ prpertyp ern_yn othstyp6 otyp1 otyp2 otyp3 otyp4 a_untype a_uslft paw_mon paw_typ/*
*/ paw_yn pchip oed_typ1 oed_typ2 oed_typ3 sur_sc1 sur_sc2 sur_yn/*
*/ a_hscol a_lfsr pxfntvty pxinusyr{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }
foreach v in a_pfrel a_sex a_uslhrs a_wantjb lkweeks losewks a_ftpt i_ptrsn /*
*/ i_ptwks i_ptyn i_pyrsn i_penpla i_phmemp i_pout i_priv int_yn jcyn ed_yn ahiper /*
*/ ahityp1 a_enrlw a_explf prptrea pruntype prwkstat ptot_r i_vetyn i_wctyp /*
*/ i_wcval i_wcyn jcyna jryn jryna jtyn a_mjind a_nlflj cov_gh cov_hi fin_yn fl_665 /*
*/ sskidyna strkuc subuc a_spouse i_seval i_seyn i_ssival i_ssiyn a_lineno a_maritl /*
*/ wexp wicyn wicyna wkcheck wkswork i_surva1 i_surva2 i_suryn i_ucval a_parent a_payabs/*
*/ i_ssval i_ssyn i_sursc1 i_sursc2 mcaid mcare mig_div mig_mtr1 mig_mtr3 i_intval/*
*/ i_intyn i_ljcw i_lkstr i_lkweek i_losewk i_mig1 i_mig2 ss_yn ssi_yn ssikdyna/*
*/ ssikidyn sskidyn ppposold prcitshp prcow1 prdisc prdthsp penincl penplan perlis/*
*/ ch_mc champ clwk i_hiout i_hrchk i_hrswk i_indus dis_yn div_non a_dtind a_dtocc/*
*/ dis_hp dis_sc1 dis_sc2 pemlr i_frmval i_frmyn i_hea i_hi/*
*/ semp_yn seotr rnt_yn rsnnotw scholyna schoolyn a_civlf a_clswkr i_ernval i_ernyn/*
*/ i_finval i_finyn i_edtyp1 i_edtyp2 i_edyn i_ernsrc i_pawval i_pawyn i_pchip i_peninc/*
*/ pehspnon peio1cow peabsrsn/*
*/ ret_sc1 ret_sc2 ret_yn i_out i_paid i_pawmo i_pawtyp i_disva2/*
*/ i_disyn i_divval i_divyn i_dishp i_dissc1 i_dissc2 i_disva1 i_cspyn i_dephi i_depriv/*
*/ i_discs a_age a_ftlf weind welknw wemind wemocg weuemp wewkrs i_almyn i_caid i_care/*
*/ i_cspval csp_yn dep_stat hityp hrcheck hrswk i_almval i_retsc1 i_retsc2 i_retva1/*
*/ i_retva2 hilin2 hiout hiown hipaid pilin2 poccu2 pout pppos hi hi_yn hiemp hilin1/*
*/ i_oival i_oth i_otyp i_nwlook i_occup i_oedval resnss1 resnss2 resnssa/*
*/ resnssi1 resnssi2 resnssia i_mig3 i_mon i_noemp i_nwlkwk dephi depriv dis_cs hhdfmx/*
*/ hhdrel a_famrel a_famtyp frmotr frse_yn gediv pxmntvty pxnatvty/*
*/ pyrsn ahityp2 ahityp3 perrp phf_seq phmemprs pilin1 caid i_wkchk i_wkswk i_workyn/*
*/ i_wsval i_wsyn ptrsn ptweeks ptyn ern_otr ern_srce i_retyn i_rntval i_rntyn/*
*/ i_rsnnot jtyna ljcw lknone lkstrch ccayn ccayna ch_hi a_wksch a_wkslk care othstyp1/*
*/ othstyp2 othstyp3 othstyp4 othstyp5 a_wkstat oi_off oi_yn oth othstper a_whenlj a_whyabs/*
*/ a_hga a_hrlywk a_hrs1 p_stat paid paidccyn paidcyna parent mon noemp nwlkwk nwlook/*
*/ i_ucyn i_vetqva i_vettyp i_vetval ahityp6 alm_yn mig_mtr4 mig_reg mig_st/*
*/ migsame workyn wrk_ck wsal_yn wtemp vet_yn wageotr wc_type wc_yn weclw div_yn earner/*
*/ vet_typ2 vet_typ3 vet_typ4 vet_typ5 tranyn tranyna uc_yn vet_qva vet_typ1 otyp5 out/*
*/ filestat age1 i_wtemp iahiper iahityp prdtrace precord prerelg a_uncov/*
*/ a_unmem cmsrvyna comsrvyn a_exprrp a_famnum ahityp4 ahityp5 prityp priv prnlfsch/*
*/ prpertyp ern_yn othstyp6 otyp1 otyp2 otyp3 otyp4 a_untype a_uslft paw_mon paw_typ/*
*/ paw_yn pchip oed_typ1 oed_typ2 oed_typ3 sur_sc1 sur_sc2 sur_yn/*
*/ a_hscol a_lfsr pxfntvty pxinusyr{
gen `v'_str= string(`v')
recast str2 `v'_str
format `v'_str %2s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}


*Step 5: Append to the zero-obs file
append using "$ZEROOBS/asec08pp.dta"

*Step 6: Save file
save "$Output/cps200803pp_filled.dta"

log close
include config.do
exit
