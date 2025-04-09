#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第1回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 7 月 17 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1

$
M[ forall z exists w ( z = 2w + x or z = 2w + y ) ]_rho = "true" \
<=> M [ forall z exists w (z = 2w + 2 or z = 2w + 3)]_rho = "true" \
<=> M [ forall z exists w (z = 2w + 2)]_rho = "true" or M [ forall z exists w (z = 2w + 3)]_rho = "true" \
<=> M [ forall z (z = 2w + 2)]_rho[s \/ w] = "true" "となる" s "が存在する" or M [ forall z (z = 2w + 3)]_rho[t \/ w] = "true" "となる" t "が存在する" \
<=> = space^M (M[z]_rho[s \/ w], M[2w + 3]_rho[s \/ w]) = "true" "なる" s "が存在する、かつ" \
= space^M (M[z]_rho[t \/ w], M[2w + 2]_rho[t \/ w]) = "true" "なる" t "が存在する" \
<=> = space^M (rho[s \/ w](z), rho[s \/ w](2w + 3)) = "true" "なる" s "が存在する、かつ" \
= space^M (rho[t \/ w](z), rho[t \/ w](2w + 2)) = "true" "なる" t "が存在する"  \
<=> = space^M (0, 2s + 3) = "true" "なる" s "が存在する、かつ" \
= space^M (0, 2t + 2) = "true" "なる" t "が存在する" \
<=> "true"
$
