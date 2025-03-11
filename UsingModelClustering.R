# Make new dataset into variable databaru
databaru <- data.frame(Customer_ID="CUST-100", Nama.Pelanggan="Rudi Wilamar",Umur=20,Jenis.Kelamin="Wanita",Profesi="Pelajar",Tipe.Residen="Cluster",NilaiBelanjaSetahun=3.5)

#read Model Identitas.Cluster
Identitas.Cluster <- readRDS(file = "cluster.rds")

#Merge dataset databaru with Identitas.Cluster$Profesi, Identitas.Cluster$Jenis.Kelamin, Identitas.Cluster$Tipe.Residen
databaru <- merge(databaru, Identitas.Cluster$Profesi)
databaru <- merge(databaru, Identitas.Cluster$Jenis.Kelamin)
databaru <- merge(databaru, Identitas.Cluster$Tipe.Residen)

#Define new data in which cluster
which.min(sapply( 1:5, function( x ) sum( ( databaru[Identitas.Cluster$field_yang_digunakan] - Identitas.Cluster$Segmentasi$centers[x,])^2 ) ))

#Define name cluster in new data 
Identitas.Cluster$Segmen.Pelanggan[which.min(sapply( 1:5, function( x ) sum( ( databaru[Identitas.Cluster$field_yang_digunakan] - Identitas.Cluster$Segmentasi$centers[x,])^2 ) )),]


