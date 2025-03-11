#Import dataset using read.csv
pelanggan <- read.csv("https://storage.googleapis.com/dqlab-dataset/customer_segments.txt", sep="\t")

#Convert column in dataset to numeric type
pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])

#Merge dataset between pelanggan and pelanggan_matrix
pelanggan <- data.frame(pelanggan, pelanggan_matrix)

#Normalisation column NilaiBelanjaSetahun 
pelanggan$NilaiBelanjaSetahun = pelanggan$NilaiBelanjaSetahun/1000000

#Set master data using unique
Profesi <- unique(pelanggan[c("Profesi","Profesi.1")])
Jenis.Kelamin <- unique(pelanggan[c("Jenis.Kelamin","Jenis.Kelamin.1")])
Tipe.Residen <- unique(pelanggan[c("Tipe.Residen","Tipe.Residen.1")])

#Part of K-Means
set.seed(1)

#Set 5 column for Clustering using K-Means
field_yang_digunakan = c("Jenis.Kelamin.1", "Umur", "Profesi.1", "Tipe.Residen.1","NilaiBelanjaSetahun")

#Function K-Means to make 5 cluster with 25 scenario random 
segmentasi <- kmeans(x=pelanggan[field_yang_digunakan], centers=5, nstart=25)

#Make a new dataset named Segmen.Pelanggan with two column cluster and Nama.Segmen
Segmen.Pelanggan <- data.frame(cluster=c(1,2,3,4,5), Nama.Segmen=c("Silver Youth Gals", "Diamond Senior Member", "Gold Young Professional", "Diamond Professional", "Silver Mid Professional"))



#Merge all asset into variable Identitas.Cluster
Identitas.Cluster <- list(Profesi = Profesi, Jenis.Kelamin = Jenis.Kelamin, Tipe.Residen = Tipe.Residen, segmentasi=segmentasi, Segmen.Pelanggan=Segmen.Pelanggan, field_yang_digunakan=field_yang_digunakan)

#Save model to cluster.rds
saveRDS(Identitas.Cluster,"cluster.rds")
