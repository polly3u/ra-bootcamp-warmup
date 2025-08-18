library("tidyverse")

folder_path_absence <- "C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\不登校生徒数"

file_path_absence <- list.files(folder_path_absence, full.names = T)

file_name_absence <- 
  list.files(folder_path_absence, full.names = F) |>
  str_remove("_不登校生徒数.xlsx")

list_df_school_absence_raw <- 
  map(file_path_absence, \(path){
    readxl::read_xlsx(path)
  }) |>
  setNames(file_name_absence)

df_student_num_raw <-
  readxl::read_xlsx("C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\raw\\生徒数\\生徒数.xlsx")

library("sjlabelled")

list_dfs_school_absence_original <-
  list_df_school_absence_raw |>
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

df_student_num_original <-
  df_student_num_raw |>
      rename(
        pref = "都道府県",
        year = "年度",
        student = "生徒数"
        
      ) |>
      var_labels(
        pref = "都道府県",
        year = "年度",
        student = "生徒数"
      )
saveRDS(list_dfs_school_absence_original,
        "C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\original\\list_dfs_school_absence_original.rds")
saveRDS(df_student_num_original,
        "C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\original\\df_student_num_original.rds")
