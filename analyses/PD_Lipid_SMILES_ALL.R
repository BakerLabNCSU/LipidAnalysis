library("httr")
library("jsonlite")
library(fingerprint)
library(rcdk)

E2E3.CBM <- read.csv("CBM_E2E3_All.csv", stringsAsFactors = F)

lipids <- E2E3.CBM$Name
lipids <- sub("/", "_", lipids)

lipids <- unlist(strsplit(lipids, ";"))
lipids <- sub("_[A-B]$", "", lipids)
# lipids <- sub("_0:0|0:0_$", "", lipids)
lipids <- unique(lipids)

df <- data.frame(abbrev = lipids, smi = NA)
for (i in 1:length(lipids)) {
  call1 <- paste0("https://www.lipidmaps.org/rest/compound/abbrev_chains/", lipids[i],"/smiles/txt")
  get_smiles <- GET(call1)
  get_smiles_text <- content(get_smiles, "text")
  get_smiles_text <- sub(".*smiles\\t(.*)\\n\\n", "\\1", get_smiles_text)
  if (get_smiles_text == "") {
    call1 <- paste0("https://www.lipidmaps.org/rest/compound/abbrev/", lipids[i],"/smiles/txt")
    get_smiles <- GET(call1)
    get_smiles_text <- content(get_smiles, "text")
    get_smiles_text <- sub(".*smiles\\t(.*)\\n\\n", "\\1", get_smiles_text)
  }
  df[i, 2] <- get_smiles_text
}
df <- read.csv("smiles_fix.csv", stringsAsFactors = F)
head(df)
sum(df$smi == "")

write.csv(df, file = "smiles.csv")

# Manually add smiles by searching lipidMAPS

head(df)
sum(df$smi == "")

df.c <- df[df$smi != "", ]
df.na <- df[df$smi == "", ]

head(df.c)

fing <- parse.smiles(df.c$smi)
fing <- lapply(fing, get.fingerprint, type = "circular")
fp.sim <- fp.sim.matrix(fing)
row.names(fp.sim) <- df.c$abbrev
fp.dist <- as.dist(1 - fp.sim)
cls <- hclust(fp.dist)
plot(cls)

save.image("fp.rdata")

