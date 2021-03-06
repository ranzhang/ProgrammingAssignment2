##Given a matrix x, returns a list to indicate properties of the matrix
##these properties are actually provided thru methods
##specifically it keeps track of:
##    matrix itself
##    Inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                         ##init cache inverse matrix to nothing
  
  getMatrix <- function() x         ##return the matrix x
  
  setMatrix <- function(y) {        ##caches the matrix y to x in global, init m
    x <<- y
    m <<- NULL
  }
  
  getInv <- function() m            ##return the inverse matrix m
  
  setInv <- function(m1){           ##cache the Inv matrix m1 to m
    m <<- m1
    
  }
  
  ##main body
  ##the list provides 4 functions as defined above
  list(getMatrix = getMatrix, setMatrix = setMatrix, getInv = getInv, setInv = setInv)

}


##function to compute inverse of matrix that is referenced by a list x
##x is a special list generated by makeCacheMatrix 
##if x indicates an inverse cache, no computation of inverse if performed
##x is in the global environ
cacheSolve <- function(x, ...) {
  
  ##first see if there is an inverse already
  m <- x$getInv()           ##call the getInv() to get the inverse
  if (!is.null(m)){         ##cache m is not empty
    return(m)
  }
  
  ##if cache m is empty
  original = x$getMatrix()      ##get the original matrix 
  inv = solve(original)         ##compute its inverse matrix 
  x$setInv(inv)                 ##cache the inverse
  inv                           ##return the inverse matrix 
}
