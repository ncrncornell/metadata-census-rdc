local files : dir "." files "*.dta"

foreach file of local files {
  use `file'
  set obs 10
  saveold `file', replace
}

