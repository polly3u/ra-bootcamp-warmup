library("tidyverse")

list_file_seito <- list.files("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\生徒数")
list_file_gakkyuu <- list.files("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数")
list_file_futoukou <- list.files("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数")

#不登校読み込み
read_futoukou <- function(file_name) {
  df <- readxl::read_xlsx(
    paste0("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\", file_name))
  return(df)
  }

list_dfs_futoukou <- purrr::map(list_file_futoukou, read_futoukou)

folder_path_futoukou <- "C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数"

file_path_futoukou <- list.files(folder_path_futoukou, full.names = T)

file_path_futoukou

file_name_futoukou <- 
  list.files(folder_path_futoukou, full.names = F) |>
  str_remove("C:/Users/81801/OneDrive/ブートキャンプ/事前課題１/data/raw/不登校生徒数)

list_dfs_futoukou <- 
  map(file_path_futoukou, \(path){
    readxl::read_xlsx(path)
  }) |>
  setNames(file_path_futoukou)

#read_list <- function(filename) {
# df_read <- filename |> purrr::read_xlsx(paste0("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数")) return(df)}

#list_dfs <- purrr::map(list_file_futoukou, read_list)
#return(list_dfs)

# df_2013 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2013年度_不登校生徒数.xlsx")
# df_2014 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2014年度_不登校生徒数.xlsx")
# df_2015 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2015年度_不登校生徒数.xlsx")
# df_2016 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2016年度_不登校生徒数.xlsx")
# df_2017 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2017年度_不登校生徒数.xlsx")
# df_2018 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2018年度_不登校生徒数.xlsx")
# df_2019 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2019年度_不登校生徒数.xlsx")
# df_2020 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2020年度_不登校生徒数.xlsx")
# df_2021 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2021年度_不登校生徒数.xlsx")
# df_2022 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数\\2022年度_不登校生徒数.xlsx")

df_futoko <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\生徒数\\生徒数.xlsx")

#学級数読み込み
# df_seito1 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_1.xlsx")
# df_seito2 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_2.xlsx")
# df_seito3 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_3.xlsx")
# df_seito4 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_4.xlsx")
# df_seito5 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_5.xlsx")
# df_seito6 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_6.xlsx")
# df_seito7 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_7.xlsx")
# df_seito8 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_8.xlsx")
# df_seito9 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_9.xlsx")
# df_seito10 <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\data_10.xlsx")

read_gakkyuu <- function(file_name) {
  df <- readxl::read_xlsx(
    paste0("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\学級数\\", file_name))
  return(df)
}



list_dfs_gakkyuu <- purrr::map(list_file_gakkyuu, read_gakkyuu)





#生徒数読み込み
df_seito <- readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\生徒数\\生徒数.xlsx")

#変数名を適切な英語に変換(生徒数)
df_seito
df_seito <-
  df_seito |>
  rename(pref = "都道府県", year = "年度", student = "生徒数")

list_dfs_gakkyuu

#変数ラベルをつける（生徒数）
library("sjlabelled")
label_seito <- set_label(df_seito, c("都道府県", "年度", "生徒数"))
get_label(label_seito)

label_seito <- set_label(df_seito, c("都道府県", "年度", "生徒数"))
get_label(label_seito)


#変数名を適切な英語に変換（不登校生徒数）
#変数ラベルをつける（不登校生徒数）
# rename_futoukou <- function(file_name) {
#   paste0(list_dfs_futoukou, file_name) <- rename(pref = "都道府県", student = "生徒数")
#   return(df)
# }
#list_dfs_futoukou <- map(list_file_futoukou, rename_futoukou)


list_dfs_futoukou

list_dfs_futoukou_original <-
  list_dfs_futoukou |>
  map( \(df){
    
    df |>
      rename(
        pref = "都道府県",
        student = "不登校生徒数"
        
      ) |>
      var_labels(
        pref = "都道府県",
        student = "不登校生徒数"
      )
  })
list_dfs_futoukou_original

?"rename"
?"function"




saveRDS(list_dfs_futoukou_original, "list_dfs_futoukou_original.rds")
saveRDS(list_dfs_gakkyuu, "list_dfs_gakkyuu.rds")
saveRDS(df_seito, "df_seito.rds")
