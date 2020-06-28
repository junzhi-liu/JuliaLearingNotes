#using pkgs needed
using Distributions
using StatsBase
using CSV
using DataFrames
using HypothesisTests
using StatsPlots
using GLM
pyplot()

age=rand(18:80,100)
wcc=round.(rand(Distributions.Normal(12,2),100),digits=1)
crp=round.(Int,rand(Distributions.Chisq(4),100).*10)
treatment=rand(["A","B"],100)
result=rand(["Improved","Static","Worse"],100)

#Mean of the age variable
mean(age)
#Median of age variable
median(age)
#Standard deciation of age
std(age)
#Variance of age
var(age)
#Mean of wcc
mean(wcc)
#Standard deciation of wcc
std(wcc)
#Descriptive statistics of the age variable
StatsBase.describe(age)
#The summarystats() function omits the length and typy
StatsBase.summarystats(wcc)

data=DataFrame(Age=age,WCC=wcc,CRP=crp,Treatment=treatment,Result=result)
#Number of rows and columns
size(data)
#First six rows
head(data)
tail(data)
view(data,3,:)
deleterows!(data,(3,6,9))
dataA=data[data[:Treatment].=="A",:]#Only patient in treatment group A
dataB=data[data[:Treatment].=="B",:]#Only patient in treatment group B

describe(data)
#Counting the number of patients in group A and B
by(data,:Treatment,df->DataFrame(N=size(df,1)))
#The size argument will give the same output other than adding the number of variables
by(data,:Treatment,size)
#Mean age of group A and B patients
by(data,:Treatment,df->mean(df.Age))
#Standard deviation of groups A and B patients
by(data,:Treatment,df->std(df.Age))

by(data,:Treatment,df->describe(df.Age))

StatsPlots.@df data density(:Age,group=:Treatment,title="Distribution of ages by treatment group",xlab="Age",ylab="Distribution",legend=:topright)

StatsPlots.@df data density(:Age,group=:Result,title="Distrbution of ages by result group",xlab="Age",ylab="Distribution",legend=:topright)

StatsPlots.@df data density(:Age,group=(:Treatment,:Result),title="Distribution of ages by treatment and result groups",xlab="Age",ylab="Distribution",legend=:topright)

StatsPlots.@df data boxplot(:Treatment,:WCC,lab="WCC",title="white cell count by treatment group",xlab="Groups",ylab="WCC")

StatsPlots.@df data boxplot(:Result,:WCC,lab="WCC",title="white cell count by result group",xlab="Groups",ylab="WCC")

StatsPlots.@df data StatsPlots.corrplot([:Age :WCC :CRP],grid=false)#No comma's between arguments in list

StatsPlots.@df data StatsPlots.cornerplot([:Age :WCC :CRP],grid=false, compact=true)

#Difference in age between patients in group A and B
HypothesisTests.EqualVarianceTTest(data[:Age],dataB[:Age])

#Only the p value for the difference in white cell count between patients in groups A and B
pvalue(EqualVarianceTTest(dataA[:WCC],dataB[:WCC]))

#Difference in c-reactice protein level between patients in groups A and B for unequal variances
UnequalVarianceTTest(dataA[:CRP],dataB[:CRP])

#Simple model predicting CRP
fit(LinearModel,@formula(CRP~1),data)

#Adding Age as a predictor variable
fit(LinearModel,@formula(CRP~Age),data)

#Adding Age and WCC as predictor variables
fit(LinearModel,@formula(CRP~Age+WCC),data)

by(dataA,:Result,df->DataFrame(N=size(df,1)))

by(dataB,:Result,df->DataFrame(N=size(df,1)))

#Enter the data in similar order here
observed=reshape([10,22,16,19,17,16],(2,3))
observed

ChisqTest(observed)

CSV.write("ProjectData_1_point_0.csv",data);

CSV.write()
a=[[1,2,3][4,5,6]]
b=[1,2,3]
a*b

repeat([1, 2], 3)

typeof(("A", 3, "B", 4, "C", 2))

a = [[1, 2, 3] [4, 5, 6] ]
b = [1,2,3]

a*b

In((:A==200),my_dictionary)

[2,2,2]

typeof(("A", 3, "B", 4, "C", 2))
