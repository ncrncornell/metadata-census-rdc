*Tae Hyun Kim
*Dataset cpsmar_person_2010

set more off
capture log close
include config.do

*Step 1: Load data and open log file
clear all
log using "cpsmar.cps201003_modified.log",text replace
use "$CPSNBER/cpsmar_person_2010.dta", replace

*Sort variables in alphabetical order
order _all, alphabetic

*Step 2: Drop irrelevant variables
drop a1age-a1whyabs a_ernlwt a_fnlwgt a_grswk a_herntf a_hrspay /*
*/ a_werntf actc_crd alm_val-alm_yn csp_val ctc_crd dep_stat dis_val1 dis_val2/*
*/ div_val dsab_val ed_val eit_cred-emcontrb ern_val erp_val-fed_ret/*
*/ fedval-fin_val finc_alm-fkind flastidx-frm_val frntval frse_val /*
*/ frspov-fwsval gereg-hdivval hearnval-hhstatus hinc_fr-hintval /*
*/ hlorent-hwsval i_hengas i_hhotno i_hloren i_hpubli i_hunits /*
*/ i_nxtres i_ostper i_ostyp ihsflg mig_cbst mig_dscp mjocc nxtres/*
*/ oi_val p_mvcaid p_mvcare paw_val peafever-peafwhn4 pecohab-pedisrem/*
*/ peioind-pelnmom pemomtyp ph_seq pothval prdisflg prhernal prop_tax /*
*/ prswkxpns-prwkstat ptotval pxdisdrs-pxdisrem ret_val1 ret_val2 rnt_val /*
*/ rtm_val se_val srvs_val ss_val ssi_val sur_val1 sur_val2 talm_val-uc_val /*
*/ vet_val wageotr wc_val wicyn wkswork ws_val wsal_val
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
rename statetax_ac state_income_tax_after_credits
rename statetax_bc state_income_tax_before_credits

*Step 4: Remake the variables


*Recast to double
recast double semp_val pxafever pxafwhn1 pxlnmom pxlndad pxmomtyp pxdadtyp pxcohab/*
*/ mwp_val agi fedtax_ac fedtax_bc int_val pearnval state_income_tax_after_credits/*
*/ state_income_tax_before_credits
format semp_val pxafever pxafwhn1 pxlnmom pxlndad pxmomtyp pxdadtyp pxcohab/*
*/ mwp_val agi fedtax_ac fedtax_bc int_val pearnval state_income_tax_after_credits/*
*/ state_income_tax_before_credits %12.0g


*Recast to str4
foreach v in pefntvty pehruslt industry pemntvty penatvty occup {
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }

foreach v in pefntvty pehruslt industry pemntvty penatvty occup{
gen `v'_str= string(`v')
recast str4 `v'_str
format `v'_str %4s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}



foreach v in a_famrel a_age a_civlf a_clswkr a_dtind a_dtocc a_enrlw a_explf/*
*/ a_exprrp a_famnum a_famtyp a_ftlf a_ftpt a_hga a_hrlywk a_hrs1 a_hscol a_lfsr/*
*/ a_lineno a_maritl a_mjind a_nlflj a_parent a_payabs a_pfrel a_sex a_spouse/*
*/ a_uncov a_unmem a_untype a_uslft a_uslhrs a_wantjb a_whenlj a_whyabs a_wksch/*
*/ a_wkslk a_wkstat age1 ahiper ahityp1 ahityp2 ahityp3 ahityp4 ahityp5 ahityp6/*
*/ caid care ch_hi ch_mc champ clwk cov_gh cov_hi csp_yn dephi depriv dis_cs dis_hp/*
*/ dis_sc2 dis_sc1 dis_yn div_non div_yn earner ed_yn ern_otr ern_srce ern_yn fin_yn/*
*/ fl_665 frmotr frse_yn gediv hea hi hi_yn hiemp hilin1 hilin2 hiout hiown hipaid/*
*/ hityp i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv i_discs/*
*/ i_dishp i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1/*
*/ i_edtyp2 i_edyn i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn/*
*/ i_hea i_hengva i_hfdval i_hflunc i_hflunn i_hfoodm i_hfoodn i_hfoods i_hhotlu/*
*/ i_hi i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr i_lkweek/*
*/ i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook i_occup i_oedval/*
*/ i_oival i_oth i_otyp i_out i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_pchip /*
*/ i_peninc i_penpla i_phmemp i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1/*
*/ i_retsc2 i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn/*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 i_surva2 i_suryn/*
*/ i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn i_wctyp i_wcval i_wcyn i_wkchk/*
*/ i_wkswk i_workyn i_wsval i_wsyn i_wtemp iahiper iahityp int_yn ljcw lknone lkstrch/*
*/ lkweeks losewks marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 mig_reg/*
*/ mig_st migsame mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth/*
*/ othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3/*
*/ otyp4 otyp5 out p_stat paid paidccyn paidcyna parent paw_mon paw_typ paw_yn pchip/*
*/ peabsrsn pehspnon peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq /*
*/phf_seq phmemprs pilin1 pilin2 poccu2 pout povll pppos ppposold prcitshp prcow1/*
*/ prdisc prdthsp prdtrace precord prerelg prityp priv prnlfsch prpertyp prptrea /*
*/ptot_r ptrsn ptweeks ptyn pxfntvty pxhspnon pxinusyr pxmntvty pxnatvty pxrace1/*
*/ pyrsn resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia ret_sc1 ret_sc2/*
*/ ret_yn rnt_yn rsnnotw semp_yn seotr ss_yn ssi_yn ssikdyna ssikidyn sskidyn/*
*/ sskidyna strkuc subuc sur_sc1 sur_sc2 sur_yn uc_yn vet_qva vet_typ1 vet_typ2/*
*/ vet_typ3 vet_typ4 vet_typ5 vet_yn wc_type wc_yn weclw weind welknw wemind/*
*/ wemocg weuemp wewkrs wexp wicyna wkcheck workyn wrk_ck wsal_yn wtemp{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }
foreach v in a_famrel a_age a_civlf a_clswkr a_dtind a_dtocc a_enrlw a_explf/*
*/ a_exprrp a_famnum a_famtyp a_ftlf a_ftpt a_hga a_hrlywk a_hrs1 a_hscol a_lfsr/*
*/ a_lineno a_maritl a_mjind a_nlflj a_parent a_payabs a_pfrel a_sex a_spouse/*
*/ a_uncov a_unmem a_untype a_uslft a_uslhrs a_wantjb a_whenlj a_whyabs a_wksch/*
*/ a_wkslk a_wkstat age1 ahiper ahityp1 ahityp2 ahityp3 ahityp4 ahityp5 ahityp6/*
*/ caid care ch_hi ch_mc champ clwk cov_gh cov_hi csp_yn dephi depriv dis_cs dis_hp/*
*/ dis_sc2 dis_sc1 dis_yn div_non div_yn earner ed_yn ern_otr ern_srce ern_yn fin_yn/*
*/ fl_665 frmotr frse_yn gediv hea hi hi_yn hiemp hilin1 hilin2 hiout hiown hipaid/*
*/ hityp i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv i_discs/*
*/ i_dishp i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1/*
*/ i_edtyp2 i_edyn i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn/*
*/ i_hea i_hengva i_hfdval i_hflunc i_hflunn i_hfoodm i_hfoodn i_hfoods i_hhotlu/*
*/ i_hi i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr i_lkweek/*
*/ i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook i_occup i_oedval/*
*/ i_oival i_oth i_otyp i_out i_paid i_pawmo i_pawtyp i_pawval i_pawyn i_pchip /*
*/ i_peninc i_penpla i_phmemp i_pout i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn i_retsc1/*
*/ i_retsc2 i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn/*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 i_surva2 i_suryn/*
*/ i_ucval i_ucyn i_vetqva i_vettyp i_vetval i_vetyn i_wctyp i_wcval i_wcyn i_wkchk/*
*/ i_wkswk i_workyn i_wsval i_wsyn i_wtemp iahiper iahityp int_yn ljcw lknone lkstrch/*
*/ lkweeks losewks marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 mig_reg/*
*/ mig_st migsame mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth/*
*/ othstper othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3/*
*/ otyp4 otyp5 out p_stat paid paidccyn paidcyna parent paw_mon paw_typ paw_yn pchip/*
*/ peabsrsn pehspnon peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq /*
*/phf_seq phmemprs pilin1 pilin2 poccu2 pout povll pppos ppposold prcitshp prcow1/*
*/ prdisc prdthsp prdtrace precord prerelg prityp priv prnlfsch prpertyp prptrea /*
*/ptot_r ptrsn ptweeks ptyn pxfntvty pxhspnon pxinusyr pxmntvty pxnatvty pxrace1/*
*/ pyrsn resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia ret_sc1 ret_sc2/*
*/ ret_yn rnt_yn rsnnotw semp_yn seotr ss_yn ssi_yn ssikdyna ssikidyn sskidyn/*
*/ sskidyna strkuc subuc sur_sc1 sur_sc2 sur_yn uc_yn vet_qva vet_typ1 vet_typ2/*
*/ vet_typ3 vet_typ4 vet_typ5 vet_yn wc_type wc_yn weclw weind welknw wemind/*
*/ wemocg weuemp wewkrs wexp wicyna wkcheck workyn wrk_ck wsal_yn wtemp{
gen `v'_str= string(`v')
recast str2 `v'_str
format `v'_str %2s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}


*Step 5: Append to the zero-obs file
append using "$ZEROOBS/cps201003ppasec.dta"

*Step 6: Save file
save "$Output/cps201003pp_filled.dta"

log close
include config.do
exit
