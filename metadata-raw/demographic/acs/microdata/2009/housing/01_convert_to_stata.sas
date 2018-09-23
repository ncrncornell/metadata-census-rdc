/* $Id$ */
/* $URL$ */

/* read files in directory */
%let cwd=%sysget(PWD);

filename dirlist pipe "cd &cwd; ls -1 *sas7bdat"  ;


data filenames;
	infile dirlist length=reclen;
	length name $ 200;
	input name $varying200. reclen;
	basename=scan(name,1);
run;

proc print data=filenames;
run;

libname here "&cwd.";

data _null_;
	set filenames;
	call execute("proc export data=here."||trim(left(basename)));
	call execute("dbms=stata ");
	call execute("file='&cwd./"||trim(left(basename))||".dta' replace;run;");
run;
	
