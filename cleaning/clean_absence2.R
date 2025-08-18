list_dfs_school_absence_original <-
  readRDS("list_dfs_school_absence_original.rds")
df_student_num_original <-
  readRDS("df_student_num_original.rds")

list_dfs_school_absence_cleaned <-
  list_dfs_school_absence_original |>
  map(\(df){
    
    df |>
      select(!blank) |>
      mutate(
        student = as.numeric(student),
        pref_index = row_number()
      )
  }) |>
  bind_rows(.id = "year") |>
  relocate(pref) |>
  mutate(year = as.numeric(str_remove(year, "年度"))) |>
  arrange(pref_index, year) |>
  select(!pref_index) |>
  var_labels(
    pref = "都道府県",
    year = "年度",
    student = "不登校生徒数"
  )

df_school_absence <-
  df_student_num_original |>
  left_join(list_dfs_school_absence_cleaned,
            by = c("pref", "year"))

df_school_absence <-
  df_school_absence |>
  mutate(absence_late = student.y / student.x) |>
  var_labels(absence_late = "不登校割合")

saveRDS(df_school_absence, 
        "C:\\Users\\81801\\OneDrive\\ブートキャンプ\\事前課題１\\data\\cleaned\\df_school_absence.rds")
