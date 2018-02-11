cp_lotka <- function(r1,r2,a12,a21,K1,K2,x1_int,x2_int){
    library(deSolve)
    
    Pars <- c(r1,r2,a12,a21,K1,K2)
    State <- c(x1=x1_int, x2=x2_int)
    
    
    LotVmod <- function (Time, State, Pars) {
        with(as.list(c(State, Pars)), {
            dx1 = r1*x1*(1-(x1+a12*x2)/K1)
            dx2 = r2*x2*(1-(x2+a21*x1)/K2)
            return(list(c(dx1, dx2)))
        })
    }
    ## equilibrium point
    x1 <- (K1-a12*K2)/(1-a12*a21)
    x2 <- (K2-a21*K1)/(1-a12*a21)
    print(c(x1,x2))

    Time <- seq(0, 10, by = 1)
    out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
}

plot_DE <- function(out){
    matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
    legend("topright", c("x1", "x2"), lty = c(1,2), col = c(1,2), box.lwd = 0)
}

# plot(out[,2], out[,3],xlab="x1", ylab="x2",type = "l")


## Phase Portrait
source('C:/Users/user/Desktop/R functions/PhasePortraitFc.R')

model <- function (Time, State, Pars) {
    with(as.list(c(State, Pars)), {
        dx1 = r1*x1*(1-(x1+a12*x2)/K1)
        dx2 = r2*x2*(1-(x2+a21*x1)/K2)
        return(list(c(dx1, dx2)))
    })
}
# p <- c(r1=0.5,r2=0.5, a12=1,a21=0.5, K1=1,K2=0.8) # p is a named vector of parameters
# s <- c(x1=2,x2=0.5) # s is the state
# plane(tstep=0.5,portrait=T, xmax=1.5,ymax=2.5)


# cp_lotka(r1=0.5,r2=0.5, a12=1,a21=0.5, K1=1,K2=0.8, x1_int=.2, x2_int=.05)