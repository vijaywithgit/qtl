\name{plotRF}
\alias{plotRF}

\title{Plot recombination fractions}

\description{
  Plot a grid showing the recombination fractions for all pairs of
  markers, and/or the LOD scores for tests of linkage between pairs of
  markers.
}

\usage{
plotRF(x, chr, what=c("both","lod","rf"), alternate.chrid=FALSE,
        zmax=12, mark.diagonal=FALSE,
        col.scheme=c("viridis", "redblue"), \dots)
}

\arguments{
  \item{x}{An object of class \code{cross}. See
   \code{\link{read.cross}} for details.}
  \item{chr}{Optional vector indicating the chromosomes to plot.
  This should be a vector of character strings referring to chromosomes
  by name; numeric values are converted to strings.  Refer to
  chromosomes with a preceding \code{-} to have all chromosomes but
  those considered.  A logical (TRUE/FALSE) vector may also be used.}
  \item{what}{Indicate whether to plot LOD scores, recombination
               fractions or both.}
  \item{alternate.chrid}{If TRUE and more than one chromosome is
    plotted, alternate the placement of chromosome
     axis labels, so that they may be more easily distinguished.}
  \item{zmax}{Maximum LOD score plotted; values above this are all
    thresholded at this value.}
  \item{mark.diagonal}{If TRUE, include black line segments around the
  pixels along the diagonal, to better separate the upper left triangle
  from the lower right triangle.}
  \item{col.scheme}{The color palette. The default is "viridis"; see
  Option D at \url{https://bids.github.io/colormap}}
  \item{\dots}{Generally ignored, but you can include \code{main} to
  change or omit the title of the figure.}
}

\value{None.}

\details{
  Uses \code{\link[graphics]{image}} to plot a grid showing the
  recombination fractions and/or LOD scores for all pairs of markers.
  (The LOD scores are for a test of \eqn{r = 1/2}.)
  If both are plotted, the recombination fractions are in the upper left
  triangle while the LOD scores are in the lower right triangle.

  With \code{col.scheme="viridis"} (the default), purple corresponds to
  a large LOD score or a small recombination fraction, while yellow is
  the reverse. With \code{col.scheme="redblue"}, red corresponds to a
  large LOD or a small recombination fraction, while blue is the
  reverse.  Note that missing values appear in light gray.

  Recombination fractions are transformed by \eqn{-4(\log_2{r}+1)}{%
    -4(log2(r)+1)} to make them on the same sort of scale as LOD
  scores.  Values of LOD or the transformed recombination fraction that
  are above 12 are set to 12.
}


\examples{
data(badorder)
badorder <- est.rf(badorder)
plotRF(badorder)

# plot just chr 1
plotRF(badorder, chr=1)

# plot just the recombination fractions
plotRF(badorder, what="rf")

# plot just the LOD scores, and just for chr 2 and 3
plotRF(badorder, chr=2:3, what="lod")
}

\seealso{ \code{\link{est.rf}}, \code{\link{pull.rf}}, \code{\link{plot.rfmatrix}},
  \code{\link[graphics]{image}},
  \code{\link{badorder}}, \code{\link{ripple}} }

\author{Karl W Broman, \email{kbroman@biostat.wisc.edu} }

\keyword{hplot}
