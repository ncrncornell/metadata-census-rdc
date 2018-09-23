*Tae Hyun Kim
*Dataset cpsmar_person_2009

set more off
capture log close
include config.do

*Step 1: Load data and open log file
clear all
log using "cpsmar.cps200903_modified.log",text replace
use "$CPSNBER/cpsmar_person_2009.dta", replace

*Sort variables in alphabetical order
order _all, alphabetic

*Step 2: Drop irrelevant variables
drop a1age-a1whyabs a_ernlwt a_fnlwgt a_grswk a_herntf a_hrspay a_werntf actc_crd agi /*
*/ alm_val alm_yn csp_val dis_val1 dis_val2 div_val dsab_val ed_val-emcontrb /*
*/ ern_val f_mv_fs-famlis fcspval-fin_val finc_alm-fkind flastidx-fwsval gereg-hdivval /*
*/ hearnval-hh5to18 hhi_yn-hhstatus finc_fr-hintval hlorent-hwsval i_hengas-i_hhotno /*
*/ i_hloren i_hpubli i_hunits i_nxtres i_ostper i_ostyp int_val marsupwt mjocc /*
*/ mig_dscp p_mvcaid p_mvcare paw_val peafever-pedisrem peioind-pelnmom pemomtyp /*
*/ peridnum ph_seq pothval povll prdisflg prhernal prop_tax prswkxpns prwernal ptotval/*
*/ pxdisear pxdiseye pxdisout pxdisphy pxdisrem ret_val1 ret_val2 rnt_val-rtm_val /*
*/ srvs_val-ss_val ssi_val statetax_ac-statetax_bc sur_val1 sur_val2 talm_val-uc_yn /*
*/ vet_val wc_val ws_val wsal_val cap_gain cap_loss ctc_crd dep_stat dis_hp oi_val nxtres/*
*/ se_val

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

*Step 4: Remake the variables


*Recast to double
recast double semp_val pxafever pxafwhn1 pxlnmom pxlndad pxmomtyp pxdadtyp pxcohab pxdisdrs ihsflg
format semp_val pxafever pxafwhn1 pxlnmom pxlndad pxmomtyp pxdadtyp pxcohab pxdisdrs ihsflg %12.0g


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



foreach v in wsal_yn wrk_ck workyn wtemp wkswork wkcheck wicyna wicyn wexp/*
*/ wewkrs weuemp wemocg wemind welknw weind weclw wc_yn wc_type wageotr /*
*/ vet_yn vet_typ5 vet_typ4 vet_typ3 vet_typ2 vet_typ1 vet_qva sur_yn sur_sc2/*
*/ sur_sc1 subuc strkuc sskidyna sskidyn ssikidyn ssikdyna ssi_yn ss_yn seotr/*
*/ semp_yn schoolyn scholyna ret_yn ret_sc2 ret_sc1 resnssia resnssi2 resnssi1/*
*/ resnssa resnss2 resnss1 pyrsn pxnatvty pxmntvty/*
*/ pxinusyr pxfntvty ptyn ptweeks/*
*/ ptrsn ptot_r prwkstat pruntype prptrea prpertyp prnlfsch priv prityp prerelg/*
*/ precord prdtrace prdthsp prdisc prcow1 prcitshp ppposold pppos pout poccu2/*
*/ pilin2 pilin1 phmemprs phf_seq pf_seq a_clswkr a_civlf perrp perlis penplan/*
*/ penincl pemlr peio1cow peinusyr pehspnon a_age peabsrsn a_famnum a_exprrp/*
*/ pchip paw_yn paw_typ paw_mon parent paidcyna paidccyn paid p_stat out otyp5/*
*/ otyp4 otyp3 otyp2 otyp1 othstyp6 othstyp5 othstyp4 othstyp3 othstyp2 othstyp1/*
*/ othstper oth oi_yn oi_off oed_typ3 oed_typ2 oed_typ1 nwlook nwlkwk noemp mon/*
*/ migsame mig_st mig_reg mig_mtr4 mig_mtr3 mig_mtr1 mig_div mig_cbst mcaid mcare/*
*/ marg_tax losewks lkweeks lkstrch lknone ljcw jtyna jtyn jryna jryn jcyna jcyn/*
*/ int_yn iahityp iahiper i_wtemp i_wsyn i_wsval i_workyn i_wkswk a_explf/*
*/ i_wkchk i_wcyn i_wcval i_wctyp i_vetyn i_vetval i_vettyp i_vetqva i_ucyn a_enrlw/*
*/ a_dtocc i_ucval i_suryn i_surva2 i_surva1 i_sursc2 i_sursc1 i_ssyn i_ssval/*
*/ i_ssiyn i_ssival i_seyn i_seval i_rsnnot i_rntyn i_rntval i_retyn i_retva2/*
*/ i_retva1 i_retsc2 i_retsc1 i_pyrsn i_ptyn i_ptwks i_ptrsn i_priv i_pout i_phmemp/*
*/ i_penpla i_peninc i_pchip i_pawyn i_pawval i_pawtyp i_pawmo i_paid i_out i_otyp /*
*/ i_oth i_oival i_oedval i_occup i_nwlook i_nwlkwk i_noemp i_mon i_mig3 i_mig2 /*
*/ i_mig1 i_losewk i_lkweek i_lkstr i_ljcw i_intyn i_intval i_indus i_hrswk i_hrchk/*
*/ i_hiout i_hi i_hea i_frmyn i_frmval i_finyn i_finval i_ernyn i_ernval i_ernsrc/*
*/ i_edyn i_edtyp2 i_edtyp1 i_divyn i_divval i_disyn i_disva2 i_disva1 i_dissc2/*
*/ i_dissc1 i_dishp i_discs i_depriv i_dephi i_cspyn i_cspval i_care i_caid i_almyn/*
*/ i_almval hityp hipaid hiown hiout fin_yn famrel ern_yn ern_srce ern_otr earner/*
*/ div_yn div_non dis_yn dis_sc2 dis_sc1 dis_cs depriv dephi csp_yn cov_hi cov_gh/*
*/ comsrvyn cmsrvyna clwk champ ch_mc ch_hi ccayna ccayn care caid ahityp6 ahityp5/*
*/ ahityp4 ahityp3 ahityp2 ahityp1 ahiper age1 a_wkstat a_wkslk a_wksch a_whyabs/*
*/ a_whenlj a_wantjb a_uslhrs a_uslft a_untype a_unmem a_uncov a_spouse a_sex/*
*/ a_pfrel a_payabs a_parent a_nlflj a_mjind a_maritl a_lineno a_lfsr a_hscol/*
*/ a_dtind a_hrs1 a_hrlywk a_hga a_ftpt a_ftlf a_famtyp a_famrel{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }
foreach v in wsal_yn wrk_ck workyn wtemp wkswork wkcheck wicyna wicyn wexp/*
*/ wewkrs weuemp wemocg wemind welknw weind weclw wc_yn wc_type wageotr /*
*/ vet_yn vet_typ5 vet_typ4 vet_typ3 vet_typ2 vet_typ1 vet_qva sur_yn sur_sc2/*
*/ sur_sc1 subuc strkuc sskidyna sskidyn ssikidyn ssikdyna ssi_yn ss_yn seotr/*
*/ semp_yn schoolyn scholyna ret_yn ret_sc2 ret_sc1 resnssia resnssi2 resnssi1/*
*/ resnssa resnss2 resnss1 pyrsn pxnatvty pxmntvty/*
*/ pxinusyr pxfntvty ptyn ptweeks/*
*/ ptrsn ptot_r prwkstat pruntype prptrea prpertyp prnlfsch priv prityp prerelg/*
*/ precord prdtrace prdthsp prdisc prcow1 prcitshp ppposold pppos pout poccu2/*
*/ pilin2 pilin1 phmemprs phf_seq pf_seq a_clswkr a_civlf perrp perlis penplan/*
*/ penincl pemlr peio1cow peinusyr pehspnon a_age peabsrsn a_famnum a_exprrp/*
*/ pchip paw_yn paw_typ paw_mon parent paidcyna paidccyn paid p_stat out otyp5/*
*/ otyp4 otyp3 otyp2 otyp1 othstyp6 othstyp5 othstyp4 othstyp3 othstyp2 othstyp1/*
*/ othstper oth oi_yn oi_off oed_typ3 oed_typ2 oed_typ1 nwlook nwlkwk noemp mon/*
*/ migsame mig_st mig_reg mig_mtr4 mig_mtr3 mig_mtr1 mig_div mig_cbst mcaid mcare/*
*/ marg_tax losewks lkweeks lkstrch lknone ljcw jtyna jtyn jryna jryn jcyna jcyn/*
*/ int_yn iahityp iahiper i_wtemp i_wsyn i_wsval i_workyn i_wkswk a_explf/*
*/ i_wkchk i_wcyn i_wcval i_wctyp i_vetyn i_vetval i_vettyp i_vetqva i_ucyn a_enrlw/*
*/ a_dtocc i_ucval i_suryn i_surva2 i_surva1 i_sursc2 i_sursc1 i_ssyn i_ssval/*
*/ i_ssiyn i_ssival i_seyn i_seval i_rsnnot i_rntyn i_rntval i_retyn i_retva2/*
*/ i_retva1 i_retsc2 i_retsc1 i_pyrsn i_ptyn i_ptwks i_ptrsn i_priv i_pout i_phmemp/*
*/ i_penpla i_peninc i_pchip i_pawyn i_pawval i_pawtyp i_pawmo i_paid i_out i_otyp /*
*/ i_oth i_oival i_oedval i_occup i_nwlook i_nwlkwk i_noemp i_mon i_mig3 i_mig2 /*
*/ i_mig1 i_losewk i_lkweek i_lkstr i_ljcw i_intyn i_intval i_indus i_hrswk i_hrchk/*
*/ i_hiout i_hi i_hea i_frmyn i_frmval i_finyn i_finval i_ernyn i_ernval i_ernsrc/*
*/ i_edyn i_edtyp2 i_edtyp1 i_divyn i_divval i_disyn i_disva2 i_disva1 i_dissc2/*
*/ i_dissc1 i_dishp i_discs i_depriv i_dephi i_cspyn i_cspval i_care i_caid i_almyn/*
*/ i_almval hityp hipaid hiown hiout fin_yn famrel ern_yn ern_srce ern_otr earner/*
*/ div_yn div_non dis_yn dis_sc2 dis_sc1 dis_cs depriv dephi csp_yn cov_hi cov_gh/*
*/ comsrvyn cmsrvyna clwk champ ch_mc ch_hi ccayna ccayn care caid ahityp6 ahityp5/*
*/ ahityp4 ahityp3 ahityp2 ahityp1 ahiper age1 a_wkstat a_wkslk a_wksch a_whyabs/*
*/ a_whenlj a_wantjb a_uslhrs a_uslft a_untype a_unmem a_uncov a_spouse a_sex/*
*/ a_pfrel a_payabs a_parent a_nlflj a_mjind a_maritl a_lineno a_lfsr a_hscol/*
*/ a_dtind a_hrs1 a_hrlywk a_hga a_ftpt a_ftlf a_famtyp a_famrel{
gen `v'_str= string(`v')
recast str2 `v'_str
format `v'_str %2s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}


*Step 5: Append to the zero-obs file
append using "$ZEROOBS/cps200903ppasec.dta"

*Step 6: Save file
save "$Output/cps200903pp_filled.dta"

log close
include config.do
exit
