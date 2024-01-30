generate_wordclouds <- function(group) {
  group_sym <- rlang::sym(group)
  word_counts <- label_merged %>%
    group_by(!!group_sym, lowercaseLemma) %>%
    summarise(count = n()) %>%
    arrange(desc(count))%>%
    select(word = lowercaseLemma, freq = count)
  
  two_kinds <- head(unique(label_merged[[group]]), 2)
  kind1 = two_kinds[1]
  kind2 = two_kinds[2]
  
  word_counts_kind1 <- word_counts %>%
    ungroup() %>%
    filter(!!group_sym == kind1)%>%
    select(word, freq)%>%
    head(50)
  w1 = wordcloud2(word_counts_kind1, color='random-dark')
  saveWidget(w1, paste0("../figs/temp1", ".html"), selfcontained = F)
  
  word_counts_kind2 <- word_counts %>%
    ungroup() %>%
    filter(!!group_sym == kind2)%>%
    select(word, freq)%>%
    head(50)
  w2 = wordcloud2(word_counts_kind2, color='random-dark')
  saveWidget(w2, paste0("../figs/temp2", ".html"), selfcontained = F)
  
  if (file.exists(paste0("../figs/",group, kind1,".png"))) {
    img1 <- readPNG(paste0("../figs/",group, kind1,".png"))
    draw_image(img1)
  }else{
    webshot("../figs/temp1.html", paste0("../figs/",group, kind1,".png"), delay = 20)
    img1 <- readPNG(paste0("../figs/",group, kind1,".png"))
    draw_image(img1)
  }
  if (file.exists(paste0("../figs/",group, kind2,".png"))) {
    img2 <- readPNG(paste0("../figs/",group, kind2,".png"))
    draw_image(img2)
  }else{
    webshot("../figs/temp2.html", paste0("../figs/",group, kind2,".png"), delay = 15)
    img2 <- readPNG(paste0("../figs/",group, kind2,".png"))
    draw_image(img2)
  }
}

draw_image <- function(image){
  r <- nrow(image)/ncol(image)
  plot(c(0,10),c(0,r*10),type = "n",asp=1, axes=FALSE, xlab='', ylab ='')
  rasterImage(image,0,0,10,10*r, angle = 0)
}
  