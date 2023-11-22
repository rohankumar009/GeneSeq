sink("Rohan2.txt")
#This loads all data associated with parts 3 and 4 of the exam
load('midterm2_practice.RData')

#Problem 3
#(a) (3 pts) Compute the length of V
v = c(-5, 1, 0, 5, 6, 3, 2, 1, 2)
(length(v))
#print(length(v))

#(b) (3 pts) Print the 4th element of V
v[4]
#(c) (3 pts) Compute the sum of the positive elements in V
sum(v[-1])
#(d) (4 pts) Create a matrix called MV that contains 4 rows, each with a replicated version of V (as shown below)
MV <- matrix(rep(v, times = 4), nrow = 4, byrow = TRUE)
(MV)

#(e) (5 pts) Print the number of columns in M, and print the number of rows in M in that order.
dim(M)
print("This is the columns");ncol(M)
print("This is the rows");nrow(M)
#(f)	(2 pts) Print the element in the 4th row, 2nd column of M.
print("This is the 4th row 2nd column")
M[4,2]
#(g)	(4 pts) Create a new matrix M2 in which the second and third columns of M are switched (as shown below). Do not modify the original M.
M2 <- M
M2[, c(2, 3)] <- M[, c(3, 2)] # 2nd and 3rd column will now be the 3rd and 2nd column

# Print the original matrix M
print("Original matrix M:")
print(M)

# Print the new matrix M2
print("New matrix M2 with second and third columns switched:")
print(M2)
#(h) (4 pts) Print the row index of M that has the largest sum.
row_index <- which.max(rowSums(M))

# Printing the row index
print("The largest sum row index in Matrix M")
print(row_index)

print("---------------------------------------------------------------")
print("The Next Part is just for Part 4 Problems")

#Problem 4
#(a)	(3 pts) Print the DepMapIDs for all the cell lines for which the tissue of origin is “bone”.
print("Part A")
tissue_info$DepMapID[tissue_info$`Tissue of origin` == "bone"]
print("Part B")
#(b)	(3 pts) Print the total number of cell lines and the total number of cell lines for which the tissue of origin is unknown.
nrow(tissue_info)
sum(tissue_info$`Tissue of origin` == "unknown") #how many are unknown as the origin so just 1
print("Part C")
#(c)	(5 pts) Print the tissue of origin info for the cell line “ACH-000049”.
tissue_info$`Tissue of origin`[tissue_info$DepMapID == "ACH-000049"]

print("Part D")
#(d)	(5 pts) Print the gene name that has the maximum gene expression for the cell line  “ACH-000049” as well as its expression value in that cell line.
gene_name = which.max(gene_expr[,"ACH-000049"])
print(gene_name)
gene_expr[gene_name,"ACH-000049"]

print("Part E")
#(e)	(10 pts) Calculate two mean expression profiles: one capturing the mean expression profile across all cell lines with the tissue of origin “bone” and a second capturing the mean expression profile across all cell lines with the tissue of origin “kidney”. Store these in vectors called bone_mean and kidney_mean. Note each of these vectors should contain a single value for each of the 2000 genes.
(bone_lines = tissue_info$DepMapID[tissue_info$`Tissue of origin` == "bone"])
(kidney_lines = tissue_info$DepMapID[tissue_info$`Tissue of origin` == "kidney"])
print("The below is bone mean")
(bone_mean = rowMeans(gene_expr[,bone_lines]))
print("The below is kidney mean")
(kidney_mean = rowMeans(gene_expr[,kidney_lines]))

print("Part F")
#(f)	(7 pts) Compute the difference of the two expression profiles computed in (e) and store this result in a vector bone_kidney_diff. Note that the resulting vector should contain a single value for each of the 2000 genes. Print the gene name and value corresponding to the maximum positive value (gene with largest difference and highest average expression in bone) in this vector and the smallest negative value (gene with largest difference and highest average expression in kidney)
print("Below is the difference of the bone and kidney means- this also indicated that kidney was bigger than bone")
(bone_kidney_diff = bone_mean - kidney_mean)

print("Part G")
#(g)	(12 pts) The tissue of origin information for the cell line “ACH-000513“ is unknown, but we’ve narrowed it down to two possibilities: either bone or kidney. We would like to make a prediction of what the original tissue of origin was for this cell line based on its similarity to the cell lines that are labeled. To do this, complete the following steps:
print("Part G- i")  
#(g-i)	Compute the Pearson correlation coefficient between the cell line “ACH-000513” and each of the bone-derived cell lines and store this in a vector called bone_sim. 
print("Printing correlation between each of the 4 columns for bones")
(bone_sim = cor(gene_expr[,"ACH-000513"],gene_expr[,bone_lines]))

print("Part G- ii")    
#(g-ii)	Compute the Pearson correlation coefficient between the cell line ““ACH-000513”” and each of the kidney-derived cell lines and store this in a vector called kidney_sim. 
print("Printing correlation between each of the 5 columns for kindey")
(kidney_sim = cor(gene_expr[,"ACH-000513"],gene_expr[,kidney_lines]))
  
print("Part G- iii")  
#(g-iii)	Compute the average of bone_sim and the average of  kidney_sim . Note which of these average similarities is larger. Based on these data, this is our prediction of which of these two is the tissue of origin for “ACH-000513”.
print("Mean for correlation from the bone samples")
(mean(bone_sim))
print("Mean for correlation from the kidney samples")
(mean(kidney_sim))

print("The kindney average is larger")
sink()
