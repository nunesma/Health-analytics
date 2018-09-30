
library(read.dbc)

########################################################################
######################## SIH 2007 ######################################
########################################################################

# diretorio bancos do DATASUS 1998 a 2007
setwd("~/TabWin 2014/SIH 2007/RD")

b981 <- read.dbc("RDSE9801.dbc")
b0712 <- read.dbc("rdse0712.dbc")

f <- colnames(b0712)[colnames(b0712)%in%colnames(b981)]

# 1998
b981 <- read.dbc("RDSE9801.dbc")
b982 <- read.dbc("RDSE9802.dbc")
b983 <- read.dbc("RDSE9803.dbc")
b984 <- read.dbc("RDSE9804.dbc")
b985 <- read.dbc("RDSE9805.dbc")
b986 <- read.dbc("RDSE9806.dbc")
b987 <- read.dbc("RDSE9807.dbc")
b988 <- read.dbc("RDSE9808.dbc")
b989 <- read.dbc("RDSE9809.dbc")
b9810 <- read.dbc("RDSE9810.dbc")
b9811 <- read.dbc("RDSE9811.dbc")
b9812 <- read.dbc("RDSE9812.dbc")
f <- c("UF_ZI", "ANO_CMPT", "MES_CMPT", "ESPEC", "CGC_HOSP", "N_AIH", "IDENT", "CEP", "MUNIC_RES", "NASC", "SEXO", "MARCA_UTI", "PROC_REA", "VAL_SH", "VAL_SP", "VAL_TOT", "US_TOT", "DT_INTER", "DT_SAIDA", "DIAG_PRINC", "DIAG_SECUN", "IDADE", "DIAS_PERM", "MORTE", "CAR_INT")
b98 <- rbind(b981[f], b982[f], b983[f], b984[f], b985[f], 
             b986[f], b987[f], b988[f], b989[f], b9810[f], 
             b9811[f], b9812[f])

# 1999
b991 <- read.dbc("RDSE9901.dbc")
b992 <- read.dbc("RDSE9902.dbc")
b993 <- read.dbc("RDSE9903.dbc")
b994 <- read.dbc("RDSE9904.dbc")
b995 <- read.dbc("RDSE9905.dbc")
b996 <- read.dbc("RDSE9906.dbc")
b997 <- read.dbc("RDSE9907.dbc")
b998 <- read.dbc("RDSE9908.dbc")
b999 <- read.dbc("RDSE9909.dbc")
b9910 <- read.dbc("RDSE9910.dbc")
b9911 <- read.dbc("RDSE9911.dbc")
b9912 <- read.dbc("RDSE9912.dbc")
b99 <- rbind(b991[f], b992[f], b993[f], b994[f], b995[f], 
             b996[f], b997[f], b998[f], b999[f], b9910[f], 
             b9911[f], b9912[f])

# 2000
b001 <- read.dbc("rdse0001.dbc")
b002 <- read.dbc("rdse0002.dbc")
b003 <- read.dbc("rdse0003.dbc")
b004 <- read.dbc("rdse0004.dbc")
b005 <- read.dbc("rdse0005.dbc")
b006 <- read.dbc("rdse0006.dbc")
b007 <- read.dbc("rdse0007.dbc")
b008 <- read.dbc("rdse0008.dbc")
b009 <- read.dbc("rdse0009.dbc")
b0010 <- read.dbc("rdse0010.dbc")
b0011 <- read.dbc("rdse0011.dbc")
b0012 <- read.dbc("rdse0012.dbc")
b00 <- rbind(b001[f], b002[f], b003[f], b004[f], b005[f], 
             b006[f], b007[f], b008[f], b009[f], b0010[f], 
             b0011[f], b0012[f])

# 2001
b011 <- read.dbc("rdse0101.dbc")
b012 <- read.dbc("rdse0102.dbc")
b013 <- read.dbc("rdse0103.dbc")
b014 <- read.dbc("rdse0104.dbc")
b015 <- read.dbc("rdse0105.dbc")
b016 <- read.dbc("rdse0106.dbc")
b017 <- read.dbc("rdse0107.dbc")
b018 <- read.dbc("rdse0108.dbc")
b019 <- read.dbc("rdse0109.dbc")
b0110 <- read.dbc("rdse0110.dbc")
b0111 <- read.dbc("rdse0111.dbc")
b0112 <- read.dbc("rdse0112.dbc")
b01 <- rbind(b011[f], b012[f], b013[f], b014[f], b015[f], 
             b016[f], b017[f], b018[f], b019[f], b0110[f], 
             b0111[f], b0112[f])

# 2002
b021 <- read.dbc("rdse0201.dbc")
b022 <- read.dbc("rdse0202.dbc")
b023 <- read.dbc("rdse0203.dbc")
b024 <- read.dbc("rdse0204.dbc")
b025 <- read.dbc("rdse0205.dbc")
b026 <- read.dbc("rdse0206.dbc")
b027 <- read.dbc("rdse0207.dbc")
b028 <- read.dbc("rdse0208.dbc")
b029 <- read.dbc("rdse0209.dbc")
b0210 <- read.dbc("rdse0210.dbc")
b0211 <- read.dbc("rdse0211.dbc")
b0212 <- read.dbc("rdse0212.dbc")
b02 <- rbind(b021[f], b022[f], b023[f], b024[f], b025[f], 
             b026[f], b027[f], b028[f], b029[f], b0210[f], 
             b0211[f], b0212[f])

# 2003
b031 <- read.dbc("rdse0301.dbc")
b032 <- read.dbc("rdse0302.dbc")
b033 <- read.dbc("rdse0303.dbc")
b034 <- read.dbc("rdse0304.dbc")
b035 <- read.dbc("rdse0305.dbc")
b036 <- read.dbc("rdse0306.dbc")
b037 <- read.dbc("rdse0307.dbc")
b038 <- read.dbc("rdse0308.dbc")
b039 <- read.dbc("rdse0309.dbc")
b0310 <- read.dbc("rdse0310.dbc")
b0311 <- read.dbc("rdse0311.dbc")
b0312 <- read.dbc("rdse0312.dbc")
b03 <- rbind(b031[f], b032[f], b033[f], b034[f], b035[f], 
             b036[f], b037[f], b038[f], b039[f], b0310[f], 
             b0311[f], b0312[f])

# 2004
b041 <- read.dbc("rdse0401.dbc")
b042 <- read.dbc("rdse0402.dbc")
b043 <- read.dbc("rdse0403.dbc")
b044 <- read.dbc("rdse0404.dbc")
b045 <- read.dbc("rdse0405.dbc")
b046 <- read.dbc("rdse0406.dbc")
b047 <- read.dbc("rdse0407.dbc")
b048 <- read.dbc("rdse0408.dbc")
b049 <- read.dbc("rdse0409.dbc")
b0410 <- read.dbc("rdse0410.dbc")
b0411 <- read.dbc("rdse0411.dbc")
b0412 <- read.dbc("rdse0412.dbc")
b04 <- rbind(b041[f], b042[f], b043[f], b044[f], b045[f], 
             b046[f], b047[f], b048[f], b049[f], b0410[f], 
             b0411[f], b0412[f])


# 2005
b051 <- read.dbc("rdse0501.dbc")
b052 <- read.dbc("rdse0502.dbc")
b053 <- read.dbc("rdse0503.dbc")
b054 <- read.dbc("rdse0504.dbc")
b055 <- read.dbc("rdse0505.dbc")
b056 <- read.dbc("rdse0506.dbc")
b057 <- read.dbc("rdse0507.dbc")
b058 <- read.dbc("rdse0508.dbc")
b059 <- read.dbc("rdse0509.dbc")
b0510 <- read.dbc("rdse0510.dbc")
b0511 <- read.dbc("rdse0511.dbc")
b0512 <- read.dbc("rdse0512.dbc")
b05 <- rbind(b051[f], b052[f], b053[f], b054[f], b055[f], 
             b056[f], b057[f], b058[f], b059[f], b0510[f], 
             b0511[f], b0512[f])

# 2006
b061 <- read.dbc("rdse0601.dbc")
b062 <- read.dbc("rdse0602.dbc")
b063 <- read.dbc("rdse0603.dbc")
b064 <- read.dbc("rdse0604.dbc")
b065 <- read.dbc("rdse0605.dbc")
b066 <- read.dbc("rdse0606.dbc")
b067 <- read.dbc("rdse0607.dbc")
b068 <- read.dbc("rdse0608.dbc")
b069 <- read.dbc("rdse0609.dbc")
b0610 <- read.dbc("rdse0610.dbc")
b0611 <- read.dbc("rdse0611.dbc")
b0612 <- read.dbc("rdse0612.dbc")
b06 <- rbind(b061[f], b062[f], b063[f], b064[f], b065[f], 
             b066[f], b067[f], b068[f], b069[f], b0610[f], 
             b0611[f], b0612[f])

# 2007
b071 <- read.dbc("rdse0701.dbc")
b072 <- read.dbc("rdse0702.dbc")
b073 <- read.dbc("rdse0703.dbc")
b074 <- read.dbc("rdse0704.dbc")
b075 <- read.dbc("rdse0705.dbc")
b076 <- read.dbc("rdse0706.dbc")
b077 <- read.dbc("rdse0707.dbc")
b078 <- read.dbc("rdse0708.dbc")
b079 <- read.dbc("rdse0709.dbc")
b0710 <- read.dbc("rdse0710.dbc")
b0711 <- read.dbc("rdse0711.dbc")
b0712 <- read.dbc("rdse0712.dbc")
b07 <- rbind(b071[f], b072[f], b073[f], b074[f], b075[f], 
             b076[f], b077[f], b078[f], b079[f], b0710[f], 
             b0711[f], b0712[f])
# inicia "CID_ASSO", "CID_MORTE"
# v3 = c("UF_ZI", "ANO_CMPT", "MES_CMPT", "ESPEC", "CGC_HOSP", "N_AIH", "IDENT", "CEP", "MUNIC_RES", "NASC", "SEXO", "UTI_MES_IN", "UTI_MES_AN", "UTI_MES_AL", "UTI_MES_TO", "MARCA_UTI", "UTI_INT_IN", "UTI_INT_AN", "PROC_REA", "VAL_SH", "VAL_SP", "VAL_SADT", "VAL_SANGUE", "VAL_SADTSR", "VAL_TOT", "VAL_UTI", "US_TOT", "DT_INTER", "DT_SAIDA", "DIAG_PRINC", "DIAG_SECUN", "IDADE", "DIAS_PERM", "MORTE", "CAR_INT", "SEQ_AIH5", "CNES", "CID_ASSO", "CID_MORTE")
# b07 <- rbind(b071[v3], b072[v3], b073[v3], b074[v3], b075[v3], 
#             b076[v3], b077[v3], b078[v3], b079[v3], b0710[v3], 
#             b0711[v3], b0712[v3])

b1 <- rbind(b98, b99, b00, b01, b02, b03, b04, b05, b06, b07)


########################################################################
######################## SIH 2008 ######################################
########################################################################
# library(read.dbc)

# diretorio bancos do DATASUS 2008 a 2017

setwd("~/TabWin 2014/SIH 2008/RD")

b081 <- read.dbc("RDSE0801.dbc")
b1712 <- read.dbc("RDSE1712.dbc")

v <- colnames(b1712)[colnames(b1712)%in%colnames(b081)]



# v <- c("UF_ZI", "ANO_CMPT", "MES_CMPT", "ESPEC", "CGC_HOSP", "N_AIH", "IDENT", "CEP", "MUNIC_RES", "NASC", "SEXO", "UTI_MES_TO", "MARCA_UTI", "UTI_INT_TO", "PROC_SOLIC", "PROC_REA", "VAL_SH" , "VAL_SP", "VAL_TOT", "VAL_UTI", "US_TOT", "DT_INTER", "DT_SAIDA", "DIAG_PRINC", "DIAG_SECUN", "COD_IDADE", "IDADE", "DIAS_PERM", "MORTE", "CAR_INT", "CNES", "CID_ASSO", "CID_MORTE")
# f <- c("UF_ZI", "ANO_CMPT", "MES_CMPT", "ESPEC", "CGC_HOSP", "N_AIH", "IDENT", "CEP", "MUNIC_RES", "NASC", "SEXO", "MARCA_UTI", "PROC_REA", "VAL_SH", "VAL_SP", "VAL_TOT", "US_TOT", "DT_INTER", "DT_SAIDA", "DIAG_PRINC", "DIAG_SECUN", "IDADE", "DIAS_PERM", "MORTE", "CAR_INT")
# Trocado o f pot v
# v <- c("UF_ZI", "ANO_CMPT", "MES_CMPT", "ESPEC", "CGC_HOSP", "N_AIH", "IDENT", "CEP", "MUNIC_RES", "NASC", "SEXO", "MARCA_UTI", "PROC_REA", "VAL_SH", "VAL_SP", "VAL_TOT", "US_TOT", "DT_INTER", "DT_SAIDA", "DIAG_PRINC", "DIAG_SECUN", "IDADE", "DIAS_PERM", "MORTE", "CAR_INT")

# 2008
b081 <- read.dbc("RDSE0801.dbc")
b082 <- read.dbc("RDSE0802.dbc")
b083 <- read.dbc("RDSE0803.dbc")
b084 <- read.dbc("RDSE0804.dbc")
b085 <- read.dbc("RDSE0805.dbc")
b086 <- read.dbc("RDSE0806.dbc")
b087 <- read.dbc("RDSE0807.dbc")
b088 <- read.dbc("RDSE0808.dbc")
b089 <- read.dbc("RDSE0809.dbc")
b0810 <- read.dbc("RDSE0810.dbc")
b0811 <- read.dbc("RDSE0811.dbc")
b0812 <- read.dbc("RDSE0812.dbc")
b08 <- rbind(b081[v], b082[v], b083[v], b084[v], b085[v], 
             b086[v], b087[v], b088[v], b089[v], b0810[v], 
             b0811[v], b0812[v])

# 2009
b091 <- read.dbc("RDSE0901.dbc")
b092 <- read.dbc("RDSE0902.dbc")
b093 <- read.dbc("RDSE0903.dbc")
b094 <- read.dbc("RDSE0904.dbc")
b095 <- read.dbc("RDSE0905.dbc")
b096 <- read.dbc("RDSE0906.dbc")
b097 <- read.dbc("RDSE0907.dbc")
b098 <- read.dbc("RDSE0908.dbc")
b099 <- read.dbc("RDSE0909.dbc")
b0910 <- read.dbc("RDSE0910.dbc")
b0911 <- read.dbc("RDSE0911.dbc")
b0912 <- read.dbc("RDSE0912.dbc")
b09 <- rbind(b091[v], b092[v], b093[v], b094[v], b095[v], 
             b096[v], b097[v], b098[v], b099[v], b0910[v], 
             b0911[v], b0912[v])

# 2010
b101 <- read.dbc("RDSE1001.dbc")
b102 <- read.dbc("RDSE1002.dbc")
b103 <- read.dbc("RDSE1003.dbc")
b104 <- read.dbc("RDSE1004.dbc")
b105 <- read.dbc("RDSE1005.dbc")
b106 <- read.dbc("RDSE1006.dbc")
b107 <- read.dbc("RDSE1007.dbc")
b108 <- read.dbc("RDSE1008.dbc")
b109 <- read.dbc("RDSE1009.dbc")
b1010 <- read.dbc("RDSE1010.dbc")
b1011 <- read.dbc("RDSE1011.dbc")
b1012 <- read.dbc("RDSE1012.dbc")
b10 <- rbind(b101[v], b102[v], b103[v], b104[v], b105[v], 
             b106[v], b107[v], b108[v], b109[v], b1010[v], 
             b1011[v], b1012[v])

# 2011
b111 <- read.dbc("RDSE1101.dbc")
b112 <- read.dbc("RDSE1102.dbc")
b113 <- read.dbc("RDSE1103.dbc")
b114 <- read.dbc("RDSE1104.dbc")
b115 <- read.dbc("RDSE1105.dbc")
b116 <- read.dbc("RDSE1106.dbc")
b117 <- read.dbc("RDSE1107.dbc")
b118 <- read.dbc("RDSE1108.dbc")
b119 <- read.dbc("RDSE1109.dbc")
b1110 <- read.dbc("RDSE1110.dbc")
b1111 <- read.dbc("RDSE1111.dbc")
b1112 <- read.dbc("RDSE1112.dbc")
b11 <- rbind(b111[v], b112[v], b113[v], b114[v], b115[v], 
             b116[v], b117[v], b118[v], b119[v], b1110[v], 
             b1111[v], b1112[v])

# 2012
b121 <- read.dbc("RDSE1201.dbc")
b122 <- read.dbc("RDSE1202.dbc")
b123 <- read.dbc("RDSE1203.dbc")
b124 <- read.dbc("RDSE1204.dbc")
b125 <- read.dbc("RDSE1205.dbc")
b126 <- read.dbc("RDSE1206.dbc")
b127 <- read.dbc("RDSE1207.dbc")
b128 <- read.dbc("RDSE1208.dbc")
b129 <- read.dbc("RDSE1209.dbc")
b1210 <- read.dbc("RDSE1210.dbc")
b1211 <- read.dbc("RDSE1211.dbc")
b1212 <- read.dbc("RDSE1212.dbc")
b12 <- rbind(b121[v], b122[v], b123[v], b124[v], b125[v], 
             b126[v], b127[v], b128[v], b129[v], b1210[v], 
             b1211[v], b1212[v])

# 2013
b131 <- read.dbc("RDSE1301.dbc")
b132 <- read.dbc("RDSE1302.dbc")
b133 <- read.dbc("RDSE1303.dbc")
b134 <- read.dbc("RDSE1304.dbc")
b135 <- read.dbc("RDSE1305.dbc")
b136 <- read.dbc("RDSE1306.dbc")
b137 <- read.dbc("RDSE1307.dbc")
b138 <- read.dbc("RDSE1308.dbc")
b139 <- read.dbc("RDSE1309.dbc")
b1310 <- read.dbc("RDSE1310.dbc")
b1311 <- read.dbc("RDSE1311.dbc")
b1312 <- read.dbc("RDSE1312.dbc")
b13 <- rbind(b131[v], b132[v], b133[v], b134[v], b135[v], 
             b136[v], b137[v], b138[v], b139[v], b1310[v], 
             b1311[v], b1312[v])

# 2014
b141 <- read.dbc("RDSE1401.dbc")
b142 <- read.dbc("RDSE1402.dbc")
b143 <- read.dbc("RDSE1403.dbc")
b144 <- read.dbc("RDSE1404.dbc")
b145 <- read.dbc("RDSE1405.dbc")
b146 <- read.dbc("RDSE1406.dbc")
b147 <- read.dbc("RDSE1407.dbc")
b148 <- read.dbc("RDSE1408.dbc")
b149 <- read.dbc("RDSE1409.dbc")
b1410 <- read.dbc("RDSE1410.dbc")
b1411 <- read.dbc("RDSE1411.dbc")
b1412 <- read.dbc("RDSE1412.dbc")
b14 <- rbind(b141[v], b142[v], b143[v], b144[v], b145[v], 
             b146[v], b147[v], b148[v], b149[v], b1410[v], 
             b1411[v], b1412[v])

# 2015
b151 <- read.dbc("RDSE1501.dbc")
b152 <- read.dbc("RDSE1502.dbc")
b153 <- read.dbc("RDSE1503.dbc")
b154 <- read.dbc("RDSE1504.dbc")
b155 <- read.dbc("RDSE1505.dbc")
b156 <- read.dbc("RDSE1506.dbc")
b157 <- read.dbc("RDSE1507.dbc")
b158 <- read.dbc("RDSE1508.dbc")
b159 <- read.dbc("RDSE1509.dbc")
b1510 <- read.dbc("RDSE1510.dbc")
b1511 <- read.dbc("RDSE1511.dbc")
b1512 <- read.dbc("RDSE1512.dbc")
b15 <- rbind(b151[v], b152[v], b153[v], b154[v], b155[v], 
             b156[v], b157[v], b158[v], b159[v], b1510[v], 
             b1511[v], b1512[v])

# 2016
b161 <- read.dbc("RDSE1601.dbc")
b162 <- read.dbc("RDSE1602.dbc")
b163 <- read.dbc("RDSE1603.dbc")
b164 <- read.dbc("RDSE1604.dbc")
b165 <- read.dbc("RDSE1605.dbc")
b166 <- read.dbc("RDSE1606.dbc")
b167 <- read.dbc("RDSE1607.dbc")
b168 <- read.dbc("RDSE1608.dbc")
b169 <- read.dbc("RDSE1609.dbc")
b1610 <- read.dbc("RDSE1610.dbc")
b1611 <- read.dbc("RDSE1611.dbc")
b1612 <- read.dbc("RDSE1612.dbc")
b16 <- rbind(b161[v], b162[v], b163[v], b164[v], b165[v], 
             b166[v], b167[v], b168[v], b169[v], b1610[v], 
             b1611[v], b1612[v])

# 2017
b171 <- read.dbc("RDSE1701.dbc")
b172 <- read.dbc("RDSE1702.dbc")
b173 <- read.dbc("RDSE1703.dbc")
b174 <- read.dbc("RDSE1704.dbc")
b175 <- read.dbc("RDSE1705.dbc")
b176 <- read.dbc("RDSE1706.dbc")
b177 <- read.dbc("RDSE1707.dbc")
b178 <- read.dbc("RDSE1708.dbc")
b179 <- read.dbc("RDSE1709.dbc")
b1710 <- read.dbc("RDSE1710.dbc")
b1711 <- read.dbc("RDSE1711.dbc")
b1712 <- read.dbc("RDSE1712.dbc")
b17 <- rbind(b171[v], b172[v], b173[v], b174[v], b175[v], 
             b176[v], b177[v], b178[v], b179[v], b1710[v], 
             b1711[v], b1712[v])

# 2018
b181 <- read.dbc("RDSE1801.dbc")
b182 <- read.dbc("RDSE1802.dbc")
b183 <- read.dbc("RDSE1803.dbc")
b184 <- read.dbc("RDSE1804.dbc")
b185 <- read.dbc("RDSE1805.dbc")
b186 <- read.dbc("RDSE1806.dbc")
b187 <- read.dbc("RDSE1807.dbc")
# b188 <- read.dbc("RDSE1808.dbc")
# b189 <- read.dbc("RDSE1809.dbc")
# b1810 <- read.dbc("RDSE1810.dbc")
# b1811 <- read.dbc("RDSE1811.dbc")
# b1812 <- read.dbc("RDSE1812.dbc")
b18 <- rbind(b181[v], b182[v], b183[v], b184[v], b185[v], 
             b186[v], b187[v])
# (, b188[v], b189[v], b1810[v], 
#             b1811[v], b1812[v])

b2 <- rbind(b08, b09, b10, b11, b12, b13, b14, b15, b16, b17)

c <- colnames(b2)[colnames(b2)%in%colnames(b1)]
banco <- rbind(b1[c], b2[c])
