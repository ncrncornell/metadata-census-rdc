/*$Id: 07_run_zeroobs_gal.sas -1   $*/
/*$URL: http://otm-vc2svn.dev.ces.census.gov/svn/LEHD/branches/ticket1332-snapshot2014/02_processing/zeroobs/07_run_zeroobs_gal.sas $*/

%let processes= gal ;

%run_zeroobs(state=ks,processes=&processes);

