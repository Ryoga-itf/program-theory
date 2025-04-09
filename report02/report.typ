#import "../template.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第2回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 7 月 23 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1


$M, rho tack.r.double x = x_0 and x_0 >= 0$ を満たす $rho$ すなわち $rho(x) = x_0 and rho(x) >= 0$ なる $rho$ を考える。

$
"Exec"_M ("y = 1; z = 0; while (z != x) { z = z + 1; y = y * z }", rho, rho') 
$

$
"Exec"_M ("z = 0; while (z != x) { z = z + 1; y = y * z }", rho', rho'') 
$

$
"Exec"_M ("while (z != x) { z = z + 1; y = y * z }", rho'', rho''') 
$

このとき、$rho''(y) = 1 and rho''(z) = 0$ である。また、$y = z!$ を満たす。
このとき、$rho'''$ を考えると、$rho'''(y) = rho''(y) * (rho''(z) + 1) = rho'''(y) = rho'''(z) !$ を満たす。

また、$rho''''(z) = x$ を満たす $rho''''$ は

$
"Exec"_M ("while (z != x) { z = z + 1; y = y * z }", rho''', rho'''') 
$

を真にする。ループの前後で $y = z!$ の関係は変わらないから、$y = z! = x! = x_0 !$

よって、

$
tack.r.double_("tot") angle.l.double x = x_0 and x_0 >= 0 angle.r.double "Fac"_1 angle.l.double y = x_0 ! angle.r.double
$

が示された。
