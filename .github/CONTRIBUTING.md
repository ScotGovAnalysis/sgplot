# Contributing to sgplot

This outlines how to propose a change to sgplot. 

## Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation directly using the GitHub web interface, as long as the changes are made in the _source_ file. This generally means you'll need to edit [roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) in an `.R`, not a `.Rd` file. You can find the `.R` file that generates the `.Rd` by reading the comment in the first line.

## Bigger changes

If you want to make a bigger change, it's a good idea to first [file an issue](https://github.com/ScotGovAnalysis/sgplot/issues/new) and make sure the package maintainers agree that it’s needed. 

If you’ve found a bug, please file an issue that illustrates the bug with a minimal [reprex](https://www.tidyverse.org/help/#reprex).

### Pull request process

* If you work in Scottish Government, request write access to the repository by contacting the [package maintainers](https://ScotGovAnalysis.github.io/sgplot/authors.html#authors). If you are external, fork the repository.

* Clone the repository onto your computer and crate a Git branch for your changes.

* Make your changes, commit to git, and then create a PR. The title of your PR should briefly describe the change. The body of your PR should contain `Fixes #issue-number`. This means the issue will automatically close when the PR is merged. Add package maintainers to the PR as reviewers.

* For user-facing changes, add a bullet to the top of `NEWS.md` (i.e. just below the first header).

* Add yourself to the ‘Authors’ section of the `DESCRIPTION` file. As a rule of thumb, please assign your role as author (`"aut"`) when writing an exported function, and as contributor (`"ctb"`) for anything else.

### Code style

*   New code should follow the tidyverse [style guide](https://style.tidyverse.org). 
    You can use the [styler](https://CRAN.R-project.org/package=styler) package to apply these styles, but please don't restyle code that has nothing to do with your PR.  

*  We use [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), for documentation.  

*  We use [testthat](https://cran.r-project.org/package=testthat) for unit tests. 
   Contributions with test cases included are easier to accept.  
