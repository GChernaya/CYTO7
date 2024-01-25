Descriptive statistics
================
Polina Burmakina
2024-01-16

- Statistics for the outcomes

``` r
main_df %>%
  select(os2, os2time, 
         rel2, rel2time, 
         compete2, compete2time, 
         efs2, efs2time, 
         a_gvhd24, a_gvhd24time, 
         c_gvhd, c_gvh_dtime) %>%
  tbl_summary(statistic = list(
    all_continuous() ~ "{median} ({p25}, {p75})",
    all_categorical() ~ "{n} ({p}%)"),
    missing = "no")
```

<div id="delybewbnc" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#delybewbnc table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#delybewbnc thead, #delybewbnc tbody, #delybewbnc tfoot, #delybewbnc tr, #delybewbnc td, #delybewbnc th {
  border-style: none;
}
&#10;#delybewbnc p {
  margin: 0;
  padding: 0;
}
&#10;#delybewbnc .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#delybewbnc .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#delybewbnc .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#delybewbnc .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#delybewbnc .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#delybewbnc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#delybewbnc .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#delybewbnc .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#delybewbnc .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#delybewbnc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#delybewbnc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#delybewbnc .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#delybewbnc .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#delybewbnc .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#delybewbnc .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#delybewbnc .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#delybewbnc .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#delybewbnc .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#delybewbnc .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#delybewbnc .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#delybewbnc .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#delybewbnc .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#delybewbnc .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#delybewbnc .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#delybewbnc .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#delybewbnc .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#delybewbnc .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#delybewbnc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#delybewbnc .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#delybewbnc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#delybewbnc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#delybewbnc .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#delybewbnc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#delybewbnc .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#delybewbnc .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#delybewbnc .gt_left {
  text-align: left;
}
&#10;#delybewbnc .gt_center {
  text-align: center;
}
&#10;#delybewbnc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#delybewbnc .gt_font_normal {
  font-weight: normal;
}
&#10;#delybewbnc .gt_font_bold {
  font-weight: bold;
}
&#10;#delybewbnc .gt_font_italic {
  font-style: italic;
}
&#10;#delybewbnc .gt_super {
  font-size: 65%;
}
&#10;#delybewbnc .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#delybewbnc .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#delybewbnc .gt_indent_1 {
  text-indent: 5px;
}
&#10;#delybewbnc .gt_indent_2 {
  text-indent: 10px;
}
&#10;#delybewbnc .gt_indent_3 {
  text-indent: 15px;
}
&#10;#delybewbnc .gt_indent_4 {
  text-indent: 20px;
}
&#10;#delybewbnc .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 95&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 95</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left">Общая выживаемость</td>
<td headers="stat_0" class="gt_row gt_center">27 (28%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Общая выживаемость, время</td>
<td headers="stat_0" class="gt_row gt_center">476 (261, 730)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Рецидив</td>
<td headers="stat_0" class="gt_row gt_center">25 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Рецидив, время</td>
<td headers="stat_0" class="gt_row gt_center">376 (153, 730)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Анализ конкурирующих рисков (1 - смерть, 2 - рецидив)</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0</td>
<td headers="stat_0" class="gt_row gt_center">54 (57%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">16 (17%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">25 (26%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Анализ конкурирующих рисков, время</td>
<td headers="stat_0" class="gt_row gt_center">376 (153, 730)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Бессобытийная выживаемость</td>
<td headers="stat_0" class="gt_row gt_center">41 (43%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Бессобытийная выживаемость, время</td>
<td headers="stat_0" class="gt_row gt_center">376 (153, 730)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">острая реакция трансплантат против хозяина, 2-4ст</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0</td>
<td headers="stat_0" class="gt_row gt_center">61 (64%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">11 (12%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">23 (24%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">острая реакция трансплантат против хозяина 2-4, время</td>
<td headers="stat_0" class="gt_row gt_center">150 (83, 150)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">хроническая реакция трансплантат против хозяина</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    0</td>
<td headers="stat_0" class="gt_row gt_center">34 (44%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    1</td>
<td headers="stat_0" class="gt_row gt_center">27 (35%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    2</td>
<td headers="stat_0" class="gt_row gt_center">16 (21%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">хроническая реакция трансплантат против хозяина, время</td>
<td headers="stat_0" class="gt_row gt_center">169 (63, 487)</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> n (%); Median (IQR)</td>
    </tr>
  </tfoot>
</table>
</div>

- Statistics for predictors used in the 0-model

``` r
main_df %>%
  select(d_z, restadirovanie_na_moment_tkm_stadia_pred_tk_me,  
         vozrast_polnyh_let_na_moment_tkm, vozrastnaa_gruppa, 
         sovmestimost_donora_recipienta_ptkm_pred_tk_me, 
         rezim_kondicionirovania_pred_tk_me, 
         vid_tkm_nastoasej_ptkm_pred_tk_me_pditkm, 
         cd34_kg_x10_ptkm_pdi) %>%
  tbl_summary(statistic = list(
    all_continuous() ~ "{median} ({p25}, {p75})",
    all_categorical() ~ "{n} ({p}%)"), 
    missing = "no")
```

<div id="febcoyoeie" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#febcoyoeie table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#febcoyoeie thead, #febcoyoeie tbody, #febcoyoeie tfoot, #febcoyoeie tr, #febcoyoeie td, #febcoyoeie th {
  border-style: none;
}
&#10;#febcoyoeie p {
  margin: 0;
  padding: 0;
}
&#10;#febcoyoeie .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#febcoyoeie .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#febcoyoeie .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#febcoyoeie .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#febcoyoeie .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#febcoyoeie .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#febcoyoeie .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#febcoyoeie .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#febcoyoeie .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#febcoyoeie .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#febcoyoeie .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#febcoyoeie .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#febcoyoeie .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#febcoyoeie .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#febcoyoeie .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#febcoyoeie .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#febcoyoeie .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#febcoyoeie .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#febcoyoeie .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#febcoyoeie .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#febcoyoeie .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#febcoyoeie .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#febcoyoeie .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#febcoyoeie .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#febcoyoeie .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#febcoyoeie .gt_left {
  text-align: left;
}
&#10;#febcoyoeie .gt_center {
  text-align: center;
}
&#10;#febcoyoeie .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#febcoyoeie .gt_font_normal {
  font-weight: normal;
}
&#10;#febcoyoeie .gt_font_bold {
  font-weight: bold;
}
&#10;#febcoyoeie .gt_font_italic {
  font-style: italic;
}
&#10;#febcoyoeie .gt_super {
  font-size: 65%;
}
&#10;#febcoyoeie .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#febcoyoeie .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#febcoyoeie .gt_indent_1 {
  text-indent: 5px;
}
&#10;#febcoyoeie .gt_indent_2 {
  text-indent: 10px;
}
&#10;#febcoyoeie .gt_indent_3 {
  text-indent: 15px;
}
&#10;#febcoyoeie .gt_indent_4 {
  text-indent: 20px;
}
&#10;#febcoyoeie .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 95&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 95</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left">Диагноз пациента</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    ЛПЗ</td>
<td headers="stat_0" class="gt_row gt_center">7 (7.4%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    МПЗ</td>
<td headers="stat_0" class="gt_row gt_center">15 (16%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    ОЛ</td>
<td headers="stat_0" class="gt_row gt_center">73 (77%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Рестадирование на момент ТКМ (стадия)</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    ремиссия</td>
<td headers="stat_0" class="gt_row gt_center">85 (89%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    рецидив</td>
<td headers="stat_0" class="gt_row gt_center">10 (11%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Возраст пациента на момент ТКМ</td>
<td headers="stat_0" class="gt_row gt_center">36 (22, 48)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Возрастная группа пациента</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    &lt; 18</td>
<td headers="stat_0" class="gt_row gt_center">22 (23%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    18-50</td>
<td headers="stat_0" class="gt_row gt_center">52 (55%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    50+</td>
<td headers="stat_0" class="gt_row gt_center">21 (22%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Совместимость донора/реципиента</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    полностью совместимы</td>
<td headers="stat_0" class="gt_row gt_center">35 (37%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    частично совместимы</td>
<td headers="stat_0" class="gt_row gt_center">60 (63%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Режим кондиционирования</td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    миелоаблативный</td>
<td headers="stat_0" class="gt_row gt_center">47 (49%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    немиелоаблативный</td>
<td headers="stat_0" class="gt_row gt_center">48 (51%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Вид ТКМ настоящей </td>
<td headers="stat_0" class="gt_row gt_center"><br /></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    неродственная</td>
<td headers="stat_0" class="gt_row gt_center">41 (43%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    родственная</td>
<td headers="stat_0" class="gt_row gt_center">54 (57%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">CD34+/кг X10 </td>
<td headers="stat_0" class="gt_row gt_center">5.80 (4.07, 7.19)</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> n (%); Median (IQR)</td>
    </tr>
  </tfoot>
</table>
</div>

- Statistics for potential predictors

``` r
main_df %>% 
  select(matches("^cd.*_abs$")) %>% 
  
  
  tbl_summary(statistic = list(
    all_continuous() ~ "{median} ({p25}, {p75})",
    all_categorical() ~ "{n} ({p}%)"), 
    missing = "no")
```

<div id="nsgxyivfla" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#nsgxyivfla table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#nsgxyivfla thead, #nsgxyivfla tbody, #nsgxyivfla tfoot, #nsgxyivfla tr, #nsgxyivfla td, #nsgxyivfla th {
  border-style: none;
}
&#10;#nsgxyivfla p {
  margin: 0;
  padding: 0;
}
&#10;#nsgxyivfla .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#nsgxyivfla .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#nsgxyivfla .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#nsgxyivfla .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#nsgxyivfla .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#nsgxyivfla .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#nsgxyivfla .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#nsgxyivfla .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#nsgxyivfla .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#nsgxyivfla .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#nsgxyivfla .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#nsgxyivfla .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#nsgxyivfla .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#nsgxyivfla .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#nsgxyivfla .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nsgxyivfla .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#nsgxyivfla .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#nsgxyivfla .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#nsgxyivfla .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nsgxyivfla .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#nsgxyivfla .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nsgxyivfla .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#nsgxyivfla .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nsgxyivfla .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#nsgxyivfla .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#nsgxyivfla .gt_left {
  text-align: left;
}
&#10;#nsgxyivfla .gt_center {
  text-align: center;
}
&#10;#nsgxyivfla .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#nsgxyivfla .gt_font_normal {
  font-weight: normal;
}
&#10;#nsgxyivfla .gt_font_bold {
  font-weight: bold;
}
&#10;#nsgxyivfla .gt_font_italic {
  font-style: italic;
}
&#10;#nsgxyivfla .gt_super {
  font-size: 65%;
}
&#10;#nsgxyivfla .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#nsgxyivfla .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#nsgxyivfla .gt_indent_1 {
  text-indent: 5px;
}
&#10;#nsgxyivfla .gt_indent_2 {
  text-indent: 10px;
}
&#10;#nsgxyivfla .gt_indent_3 {
  text-indent: 15px;
}
&#10;#nsgxyivfla .gt_indent_4 {
  text-indent: 20px;
}
&#10;#nsgxyivfla .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 95&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 95</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left">Количество CD3+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">1.44 (1.16, 1.67)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD4+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.89 (0.71, 1.16)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD8+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.48 (0.36, 0.59)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD3+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.23 (0.18, 0.28)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD56+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.05 (0.01, 0.16)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD16+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.037 (0.027, 0.054)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD56CD16+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.23 (0.15, 0.32)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">КоличествоCD4CD8+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.006 (0.003, 0.011)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Количество CD3CD56+ клеток у донора</td>
<td headers="stat_0" class="gt_row gt_center">0.12 (0.07, 0.19)</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Median (IQR)</td>
    </tr>
  </tfoot>
</table>
</div>

## Do we have missing values in the data used to build the model?

- Missing values in potential predictors

``` r
main_df %>%
  select(matches("^cd.*_abs$")) %>% 
  vis_miss() 
```

![](/unnamed-chunk-5-1.png)<!-- -->

- Missing values in outcomes

``` r
main_df %>%
  select(os2, os2time, 
         rel2, rel2time, 
         compete2, compete2time, 
         efs2, efs2time, 
         a_gvhd24, a_gvhd24time, 
         c_gvhd, c_gvh_dtime) %>%
  vis_miss()
```

![](/unnamed-chunk-6-1.png)<!-- -->

Missing values about 3%
