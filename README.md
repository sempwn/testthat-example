# testthat-example

An example file and structure layout for performing testing in R

## How to run tests

Open `RStudio` and then run the following command from the folder directory:

```r
testthat::test_dir("tests")
```

This should produce the following result:

```console
/ |  OK F W S | Context
/ |   0       | test_process_dataColumn 'date' violates assertion 'is_uniq' 2 times
    verb redux_fn predicate column index      value
1 assert       NA   is_uniq   date    20 2020-02-20
2 assert       NA   is_uniq   date    21 2020-02-20

/ |   2       | test_process_dataColumn 'lab_test' violates assertion 'within_bounds(0, Inf)' 1 time
    verb redux_fn             predicate   column index value
1 assert       NA within_bounds(0, Inf) lab_test    21    -1

/ |   3       | test_process_data [0.2 s]

== Results =====================================================================
Duration: 0.4 s

OK:       3
Failed:   0
Warnings: 0
Skipped:  0
```