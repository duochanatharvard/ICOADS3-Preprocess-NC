#!/bin/csh
#################################################################
# Csh Script to retrieve 257 online Data files of 'ds548.0',
# total 16.67G. This script uses 'wget' to download data.
#
# Highlight this script by Select All, Copy and Paste it into a file;
# make the file executable and run it on command line.
#
# You need pass in your password as a parameter to execute
# this script; or you can set an environment variable RDAPSWD
# if your Operating System supports it.
#
# Contact zji@ucar.edu (Zaihua Ji) for further assistance.
#################################################################


set pswd = $1
if(x$pswd == x && `env | grep RDAPSWD` != '') then
 set pswd = $RDAPSWD
endif
if(x$pswd == x) then
 echo
 echo Usage: $0 YourPassword
 echo
 exit 1
endif
set v = `wget -V |grep 'GNU Wget ' | cut -d ' ' -f 3`
set a = `echo $v | cut -d '.' -f 1`
set b = `echo $v | cut -d '.' -f 2`
if(100 * $a + $b > 109) then
 set opt = 'wget --no-check-certificate'
else
 set opt = 'wget'
endif
set opt1 = '-O Authentication.log --save-cookies auth.rda_ucar_edu --post-data'
set opt2 = "email=duochan@g.harvard.edu&passwd=$pswd&action=login"
$opt $opt1="$opt2" https://rda.ucar.edu/cgi-bin/login
set opt1 = "-N --load-cookies auth.rda_ucar_edu"
set opt2 = "$opt $opt1 https://rda.ucar.edu/data/ds548.0/"
set filelist = ( \
  netcdf_r3.0/ICOADS_R3.0.0_2000-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2000-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2001-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2002-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2003-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2004-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2005-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2006-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2007-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2008-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2009-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2010-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2011-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2012-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2013-12.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-01.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-02.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-03.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-04.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-05.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-06.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-07.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-08.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-09.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-10.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-11.nc \
  netcdf_r3.0/ICOADS_R3.0.0_2014-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2015-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2016-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2017-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2018-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2019-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-05.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-06.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-07.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-08.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-09.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-10.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-11.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2020-12.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2021-01.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2021-02.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2021-03.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2021-04.nc \
  netcdf_r3.0/ICOADS_R3.0.1_2021-05.nc \
)
while($#filelist > 0)
 set syscmd = "$opt2$filelist[1]"
 echo "$syscmd ..."
 $syscmd
 shift filelist
end

