library(dplyr)
library(tidyr)
View(voyage)
voyages2 <- voyages %>% select(voyageid, yearam, ptdepimp, shipname)
voyages3 <- voyages %>% select(voyageid, shipname, contains("captain"),contains("owner"))
sm <- voyages %>% filter(ptdepimp == "Saint-Malo")
cies_sm1 <- sm %>%
  filter(grepl("Compagnie", ownera)) %>% 
  select(voyageid, ownera, 2:105)
cies_sm1

cies_sm2<- sm %>%
  filter(grepl("Compagnie", ownera) | grepl("Compagnie", ownerb)) %>%
  select(voyageid, ownera,ownerb,2:105)
abolition_ru <- voyages %>% 
  filter(yearam >= 1807)
## guerre trente ans : 1618-1648
trente_ans <- voyages %>% 
  filter(yearam >= 1618 & yearam <= 1648)
chrono_voyages <- voyages %>% 
  arrange(yearam)%>%
  select(1,yearam, 2:105)

nb_esclaveEmb <- voyages %>% 
  filter(ptdepimp == "Liverpool") %>%
  drop_na(slaximp)%>%
  select(yearam, nbEsclaves = sum(slaximp))

alphaTraite <- voyages %>% 
  distinct(ptdepimp)%>%
  filter(!grepl("port unspecified", ptdepimp))%>%
  arrange(ptdepimp)
vectPays <- c("Spain / Uruguay","Portugal / Brazil","Great Britain")
tab <- voyages %>%
  filter(yearam <= 1562 & yearam >= 1514)%>%
  filter(natinimp %in% vectPays)%>%
  count(yearam,natinimp)
voyages2 <- voyages %>%
  group_by(intervalles = cut(yearam, breaks = seq(1500,1875, by = 25), include.lowest = TRUE, dig.lab = 4))%>%
  summarise(n_expeditions = n())
