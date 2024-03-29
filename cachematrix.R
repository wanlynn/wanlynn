## Week3 assignment by Wanlin Zhou
## caching the inverse of a matrix

## the makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function()x
  setinv<-function(solve) inv<<-solve
  getinv<-function() inv
  list(set=set,get=get,
       setinv=setinv,getinv=getinv)
}


##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##If the inverse has been culculated, this function would retrieve it from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data)
  x$setinv(inv)
  inv
  }

