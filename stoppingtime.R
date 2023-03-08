#----------------setting the seed as mentioned in the homework--------------------#
set.seed(13112231)
#-----Lets apply the given distribution Pr(T=t) = 1/t(t+1) for t ∈ {1,2,3,...}.---#
#---------------and find the associated probabilities of possible Ts--------------#
prob_t = sapply(1:100000, function(t) 1/t(t+1)) 
#t = sample(1:1000, size=1, prob = prob_t) 


prova2 = function(){
  x <- runif(1,0,1) #sample X
  repeat{
    t = sample(1:100000, size=1, prob = prob_t) #sample T
    #print(paste("t:", t))
    y = sapply(1:t, function(j) runif(1,0,1))[t] #does i sampling of Y and takes the Y at t, Y(t)
    if(y < x){ #repeats until the condition is not matched 
      break
    }
  }
#----------here we will get the value of x and y at stopped time t,--------------#
#------------------if and only if the condition ("Y(t) < X")---------------------#
  #print(paste("x:", x))
  #print(paste("y:", y))
  return(t)
}

#m = 10
#sapply(1:m, function(n) prova2())
my_string = "Time taken for sample size M: "
M = list(1,10,100,1000,10000,100000)
for (p in M) {
  beg <- Sys.time()
  sapply(1:p, function(n) prova2())
  fin <- Sys.time() - beg
  print(paste("Time taken for sample size M =", p ,"is:",fin ,"seconds."))
  
}

#fin <- Sys.time() - beg
#print(fin)
