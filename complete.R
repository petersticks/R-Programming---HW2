complete <- function(directory, id= 1:332) {
#    print (id)
    df<-data.frame()
    j<-1
    for (i in id){
        if (nchar(i)==1) {Fil<-paste0("00",i)}
        if (nchar(i)==2) {Fil<-paste0("0",i)}
        if (nchar(i)==3) {Fil<-i}
        x<-paste0(directory,"/",Fil,".csv")
        pfile<- read.csv(file=x)
        allsul<-pfile[["sulfate"]]
        allnit<-pfile[["nitrate"]]
        good<-complete.cases(allsul, allnit)
        goodpol<-allnit[good]
        goodnc<-NROW(goodpol)
        df[j,"id"]=i
        df[j,"nobs"]=goodnc
        j<-j+1
        #print (goodnc)
        #print (Fil)
       
      }
        df[complete.cases(df[,"nobs"]),]
}


