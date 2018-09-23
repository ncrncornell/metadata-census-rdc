*Tae Hyun Kim
*Dataset cpsmar_person_2003

set more off
capture log close
include config.do

*Step 1: Load data and open log file
clear all
log using "cpsmar.cps200303_modified.log",text replace
use "$CPSNBER/cpsmar_person_2003.dta", replace

*Sort variables in alphabetical order
order _all, alphabetic

*Step 2: Drop irrelevant variables
drop a_herntf a_rcow a_werntf f_mv_fs-famlis fcspval-fearnval fedval-fhusbidx finc_alm-fretval /*
*/ frntval frspov-geco gestfips-hdivval hearnval-hh5to18 hhi_yn-hhstatus hinc_fr-hintval /*
*/ hlorent-hrccayn hrcmsryn-hrschlyn hrtayn-hwsval i_hengas-i_hhotno i_hloren-i_hpubli /*
*/ i_hunits indccode migsame mjocc peridnum peioind peioocc placdscp povll prhernal prop_tax /*
*/ prwernal talm_val tcernval-toi_val trnt_val tsurval1 tsurval2

*Step 3: Rename variables
rename apage axage
rename apclswkr axclswkr
rename apenrlw axenrlw
rename apftpt axftpt
rename aphga axhga
rename aphrlywk axhrlywk
rename aphrs axhrs
rename aphscol axhscol
rename aplfsr axlfsr
rename apmaritl axmaritl
rename apnlflj axnlflj
rename apparent axparent
rename appayabs axpayabs
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
rename migplac mig_plc
rename i_survl1 i_surva1
rename i_survl2 i_surva2
rename otyp_1 otyp1
rename otyp_2 otyp2
rename otyp_3 otyp3
rename otyp_4 otyp4
rename otyp_5 otyp5

*Step 4: Remake the variables

*Change the format of double
format a_ernlwt %12.0g
format a_fnlwgt %12.0g
format a_hrspay %12.0g
format marsupwt %12.0g

*Recast to double
recast double a_grswk agi alm_val cap_gain cap_loss csp_val dis_val1 dis_val2 div_val /*
*/ dsab_val ed_val eit_cred emcontrb fed_ret fed_tax fica fin_val frm_val frse_val /*
*/ int_val oi_val p_mvcaid p_mvcare paw_val pearnval ph_seq pothval ptotval ret_val1 /*
*/ ret_val2 rnt_val rtm_val se_val semp_val srvs_val ss_val ssi_val statetax sur_val1/*
*/ sur_val2 tax_inc uc_val vet_val wc_val ws_val wsal_val mig_plc nxtres ihsflg i_nxtres/*
*/
format a_grswk agi alm_val cap_gain cap_loss csp_val dis_val1 dis_val2 div_val /*
*/ dsab_val ed_val eit_cred emcontrb fed_ret fed_tax fica fin_val frm_val frse_val /*
*/ int_val oi_val p_mvcaid p_mvcare paw_val pearnval ph_seq pothval ptotval ret_val1 /*
*/ ret_val2 rnt_val rtm_val se_val semp_val srvs_val ss_val ssi_val statetax sur_val1/*
*/ sur_val2 tax_inc uc_val vet_val wc_val ws_val wsal_val mig_plc nxtres ihsflg i_nxtres/*
*/  %12.0g


*Recast to str4
foreach v in industry mig_cnt occup pefntvty pehruslt pemntvty penatvty{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }

foreach v in industry mig_cnt occup pefntvty pehruslt pemntvty penatvty{
gen `v'_str= string(`v')
recast str4 `v'_str
format `v'_str %4s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}

foreach v in care ccayn ccayna ch_hi ch_mc champ clwk cmsrvyna comsrvyn cov_gh /*
*/ cov_hi csp_yn dep_stat dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non/*
*/ div_yn earner ed_yn ern_otr ern_srce ern_yn famrel filestat fin_yn frmotr frse_yn/*
*/ gediv hea hhdfmx hhdrel hi hi_yn hiemp hilin1 hilin2 hiout strkuc subuc sur_sc1/*
*/ sur_sc2 sur_yn tranyn tranyna tretval1 tretval2 uc_yn vet_qva vet_typ1 vet_typ2/*
*/ vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn weclw weind welknw wemind/*
*/ wemocg weuemp wewkrs wexp wicyn wicyna wkcheck wkswork workyn wrk_ck wsal_yn wtemp/*
*/ ahityp6 alm_yn axage axclswkr axenrlw axftpt axhga axhrlywk axhrs axhscol axlfsr/*
*/ axmaritl axnlflj axparent axpayabs axrrp axsex axspouse axuncov axunmem axuslhrs/*
*/ axvet axwhyabs caid jryn jryna jtyn jtyna ljcw lknone lkstrch lkweeks losewks/*
*/ marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 mig_reg mig_st/*
*/ mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth othstper/*
*/ othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3 otyp4 otyp5/*
*/ out p_stat paid paidccyn paidcyna parent paw_mon paw_typ paw_yn pchip peabsrsn pehspnon/*
*/ peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq phf_seq phmemprs pilin1/*
*/ pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc prdtrace prdthsp precord/*
*/ prerelg prityp priv prnlfsch prnt_ptr prpertyp i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn/*
*/ i_retsc1 i_retsc2 i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn/*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 i_surva2 i_suryn i_ucval/*
*/ i_ucyn i_vetqva i_vettyp i_vetval i_vetyn i_wctyp i_wcval i_wcyn i_wkchk i_wkswk/*
*/ i_workyn i_wsval i_wsyn i_wtemp iahiper iahityp int_yn jcyn jcyna hiown hipaid/*
*/ hityp hrcheck hrswk i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv/*
*/ i_discs i_dishp i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1/*
*/ i_edtyp2 i_edyn i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea/*
*/ prptrea pruntype prwkstat ptot_r ptrsn ptweeks ptyn pxfntvty pxinusyr pxmntvty pxnatvty/*
*/ pyrsn resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia ret_sc1 ret_sc2 ret_yn rnt_yn/*
*/ rsnnotw scholyna schoolyn semp_yn seotr ss_yn ssi_yn ssikdyna ssikidyn sskidyn sskidyna/*
*/ a_mjind a_nlflj a_parent a_payabs a_pfrel a_sex a_spouse a_uncov a_unmem a_untype a_uslft/*
*/ a_uslhrs a_vet a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 ahiper ahityp1/*
*/ ahityp2 ahityp3 ahityp4 ahityp5 a_age a_civlf a_clswkr a_dtind a_dtocc a_enrlw a_explf/*
*/ a_exprrp a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hga a_hrlywk a_hrs1 a_hscol a_lfsr/*
*/ a_lineno a_maritl i_hi i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr/*
*/ i_lkweek i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook i_occup/*
*/ i_oedval i_oival i_ostper i_ostyp i_oth i_otyp i_out i_paid i_pawmo i_pawtyp i_pawval/*
*/ i_pawyn i_pchip i_peninc i_penpla i_phmemp i_pout{
  local l`v' : variable label `v'
        if `"`l`v''"' == "" {
  local l`v' "`v'"
  }
  }
foreach v in care ccayn ccayna ch_hi ch_mc champ clwk cmsrvyna comsrvyn cov_gh /*
*/ cov_hi csp_yn dep_stat dephi depriv dis_cs dis_hp dis_sc1 dis_sc2 dis_yn div_non/*
*/ div_yn earner ed_yn ern_otr ern_srce ern_yn famrel filestat fin_yn frmotr frse_yn/*
*/ gediv hea hhdfmx hhdrel hi hi_yn hiemp hilin1 hilin2 hiout strkuc subuc sur_sc1/*
*/ sur_sc2 sur_yn tranyn tranyna tretval1 tretval2 uc_yn vet_qva vet_typ1 vet_typ2/*
*/ vet_typ3 vet_typ4 vet_typ5 vet_yn wageotr wc_type wc_yn weclw weind welknw wemind/*
*/ wemocg weuemp wewkrs wexp wicyn wicyna wkcheck wkswork workyn wrk_ck wsal_yn wtemp/*
*/ ahityp6 alm_yn axage axclswkr axenrlw axftpt axhga axhrlywk axhrs axhscol axlfsr/*
*/ axmaritl axnlflj axparent axpayabs axrrp axsex axspouse axuncov axunmem axuslhrs/*
*/ axvet axwhyabs caid jryn jryna jtyn jtyna ljcw lknone lkstrch lkweeks losewks/*
*/ marg_tax mcaid mcare mig_div mig_mtr1 mig_mtr3 mig_mtr4 mig_reg mig_st/*
*/ mon noemp nwlkwk nwlook oed_typ1 oed_typ2 oed_typ3 oi_off oi_yn oth othstper/*
*/ othstyp1 othstyp2 othstyp3 othstyp4 othstyp5 othstyp6 otyp1 otyp2 otyp3 otyp4 otyp5/*
*/ out p_stat paid paidccyn paidcyna parent paw_mon paw_typ paw_yn pchip peabsrsn pehspnon/*
*/ peinusyr peio1cow pemlr penincl penplan perlis perrp pf_seq phf_seq phmemprs pilin1/*
*/ pilin2 poccu2 pout pppos ppposold prcitshp prcow1 prdisc prdtrace prdthsp precord/*
*/ prerelg prityp priv prnlfsch prnt_ptr prpertyp i_priv i_ptrsn i_ptwks i_ptyn i_pyrsn/*
*/ i_retsc1 i_retsc2 i_retva1 i_retva2 i_retyn i_rntval i_rntyn i_rsnnot i_seval i_seyn/*
*/ i_ssival i_ssiyn i_ssval i_ssyn i_sursc1 i_sursc2 i_surva1 i_surva2 i_suryn i_ucval/*
*/ i_ucyn i_vetqva i_vettyp i_vetval i_vetyn i_wctyp i_wcval i_wcyn i_wkchk i_wkswk/*
*/ i_workyn i_wsval i_wsyn i_wtemp iahiper iahityp int_yn jcyn jcyna hiown hipaid/*
*/ hityp hrcheck hrswk i_almval i_almyn i_caid i_care i_cspval i_cspyn i_dephi i_depriv/*
*/ i_discs i_dishp i_dissc1 i_dissc2 i_disva1 i_disva2 i_disyn i_divval i_divyn i_edtyp1/*
*/ i_edtyp2 i_edyn i_ernsrc i_ernval i_ernyn i_finval i_finyn i_frmval i_frmyn i_hea/*
*/ prptrea pruntype prwkstat ptot_r ptrsn ptweeks ptyn pxfntvty pxinusyr pxmntvty pxnatvty/*
*/ pyrsn resnss1 resnss2 resnssa resnssi1 resnssi2 resnssia ret_sc1 ret_sc2 ret_yn rnt_yn/*
*/ rsnnotw scholyna schoolyn semp_yn seotr ss_yn ssi_yn ssikdyna ssikidyn sskidyn sskidyna/*
*/ a_mjind a_nlflj a_parent a_payabs a_pfrel a_sex a_spouse a_uncov a_unmem a_untype a_uslft/*
*/ a_uslhrs a_vet a_wantjb a_whenlj a_whyabs a_wksch a_wkslk a_wkstat age1 ahiper ahityp1/*
*/ ahityp2 ahityp3 ahityp4 ahityp5 a_age a_civlf a_clswkr a_dtind a_dtocc a_enrlw a_explf/*
*/ a_exprrp a_famnum a_famrel a_famtyp a_ftlf a_ftpt a_hga a_hrlywk a_hrs1 a_hscol a_lfsr/*
*/ a_lineno a_maritl i_hi i_hiout i_hrchk i_hrswk i_indus i_intval i_intyn i_ljcw i_lkstr/*
*/ i_lkweek i_losewk i_mig1 i_mig2 i_mig3 i_mon i_noemp i_nwlkwk i_nwlook i_occup/*
*/ i_oedval i_oival i_ostper i_ostyp i_oth i_otyp i_out i_paid i_pawmo i_pawtyp i_pawval/*
*/ i_pawyn i_pchip i_peninc i_penpla i_phmemp i_pout{
gen `v'_str= string(`v')
recast str2 `v'_str
format `v'_str %2s
drop `v'
rename `v'_str `v'
label var `v' "`l`v''"
}

*Step 5: Append to the zero-obs file
append using "$ZEROOBS/cps200303ppasec.dta"

*Step 6: Save file
save "$Output/cps200303pp_filled.dta"

log close
include config.do
exit
