library(shiny)
ingredients<- function(number,flavor,frosting)
{
  flour<-0
  eggs<-0
  cocoa<-0
  sugar<-0
  vanilla<-0
  butter<-0
  psugar<-0
  milk<-0
  bpowder<-0
  salt<-0
  
  factor<-number/22
  flour<- factor*3 #cups
  eggs <- factor*4 #unit
  sugar<-factor*1.5 #cups
  butter<-factor*1.5 #sticks
  bpowder<-factor*1.5 #tbsp
  
  
  if (flavor=="chocolate") {
    flour<-flour/2
    cocoa<-factor*1
    vanilla<-factor*0.5
  }
  else
  {
    milk<-factor*1 #cups
    vanilla<-factor*2
    salt<-factor*0.75
  }
  
  if (frosting==TRUE)
  {
    psugar=factor*1
    butter=butter+0.5*factor
  }
  
  list("flour"=round(flour,1),"eggs"=ceiling(eggs),"cocoa"=round(cocoa,1),
       "sugar"=round(sugar,1),"vanilla"=round(vanilla,1),
       "butter"=round(butter,1),"psugar"=round(psugar,1),"milk"=round(milk,1),
       "bpowder"=round(bpowder,1),"salt"=ceiling(salt))
}

shinyServer(
  
  function(input, output) {
    output$list <- renderUI({
      
      ingredientes<-ingredients(input$number,input$flavor,input$frosting)
      str1<-paste(ingredientes$flour,"cup(s) of flour")
      str2<-paste(ingredientes$eggs,"egg(s)")
      str3<-paste(ingredientes$sugar,"cup(s) of sugar")
      str4<-paste(ingredientes$butter,"butter stick(s)")
      str5<-paste(ingredientes$bpowder,"tbsp of baking powder")
      if (input$flavor=="chocolate")
      {
        str6=paste(ingredientes$cocoa,"cups(s) of cocoa")
        str7=""
      }
      else
      {
        str6=paste(ingredientes$salt,"tbsp of salt")
        str7=paste(ingredientes$milk,"cup(s) of milk")
      }
      str8=paste(ingredientes$psugar,"cup(s) of confectioners' sugar")
      
      if (input$frosting==TRUE)
        HTML(paste(str1,str2,str3,str4,str5,str8,str6,str7,sep="<br/>"))
      else
        HTML(paste(str1,str2,str3,str4,str5,str6,str7,sep="<br/>"))
      })
  }
  

)