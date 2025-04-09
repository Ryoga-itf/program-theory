#import "../template.typ": *
#import "../proof.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "最終",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 8 月 18 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題 1

状態 $rho'$ が満たすべき条件
- $rho$ では $a[i]$ が元の値を持っており、$rho'$ では $a[i]$ が $t$ に変更されている
- $rho$ と $rho'$ の間で、配列 $a$ の他の要素は変更されない、つまり $a[j] = a[j] "for" j != i$

== 問題 2

$B: "twop" + "threep" = 1$ を考える。

$"twp"(P, B)$ を計算する。

#v(1em)

#block[
$
"twp"(P, B) &= exists n K_n (P, B) \
K_0 (P, B) &= "twop" + "threep" = 1 and not (x mod 2 = 0 and x mod 3 = 0) \
           &= "twop" + "threep" = 1 and x mod 2 != 0 and x mod 3 != 0 \
$
]

ここで、$alpha = "twop" + "threep" = 1 and x mod 2 != 0 and x mod 3 != 0$ とすると、

#block[
$
K_1 (P, B) &= "twp"("IF", K_0(P, B)) or K_0 (P, B) \
           &= "twp"("IF", alpha) or alpha
$
]

#block[
$
"twp"("IF", alpha) &= (x mod 2 = 0 or x mod 3 = 0) \
                   &and (x mod 2 = 0 supset "twp"(x := x "div" 2; "twop" := "twop" + 1, alpha)) \
                   &and (x mod 3 = 0 supset "twp"(x := x "div" 3; "threep" := "threep" + 1, alpha))
$
]

#block[
$
"twp"&(x := x "div" 2; "twop" := "twop" + 1, alpha) \
  &= "twp"(x := x "div" 2, "twp"("twop" := "twop" + 1, alpha)) \
  &= "twp"(x := x "div" 2, "twop" + "threep" + 1 = 2 and x mod 2 != 0 and x mod 3 != 0) \
  &= "twop" + "threep" = 0 and (x "div" 2) mod 2 != 0 and (x "div" 2) mod 3 != 0
$
]

#block[
$
"twp"&(x := x "div" 3; "threep" := "threep" + 1, alpha) \
  &= "twp"(x := x "div" 3, "twp"("threep" := "threep" + 1, alpha)) \
  &= "twp"(x := x "div" 3, "twop" + "threep" + 1 = 2 and x mod 2 != 0 and x mod 3 != 0) \
  &= "twop" + "threep" = 0 and (x "div" 3) mod 2 != 0 and (x "div" 3) mod 3 != 0
$
]

#block[
$
therefore "twp"("IF", alpha) 
  &= (x mod 2 = 0 or x mod 3 = 0) \
  &space.quad and (x mod 2 = 0 supset "twop" + "threep" = 0 and (x "div" 2) mod 2 != 0 and (x "div" 2) mod 3 != 0) \
  &space.quad and (x mod 3 = 0 supset "twop" + "threep" = 0 and (x "div" 3) mod 2 != 0 and (x "div" 3) mod 3 != 0) \
  &= "twop" + "threep" = 0 \
  &space.quad and (x mod 2 = 0 and (x "div" 2) mod 2 != 0 and (x "div" 2) mod 3 != 0) \
  &space.quad or (x mod 3 = 0 and (x "div" 3) mod 2 != 0 and (x "div" 3) mod 3 != 0) \
$
]

ここで、$beta_2 = (x mod 2 = 0 and (x "div" 2) mod 2 != 0 and (x "div" 2) mod 3 != 0), beta_3 = (x mod 3 = 0 and (x "div" 3) mod 2 != 0 and (x "div" 3) mod 3 != 0)$ とおくと、

#block[
$
therefore K_1 (P, B) &= "twop" + "threep" = 0 and (beta_2 or beta_3) or alpha
$
]

したがって、

$
"twp"(P, B) &= ("twop" + "threep" = 1 and x mod 2 != 0 and x mod 3 != 0) \
            &or ("twop" + "threep" = 0 and (x mod 2 = 0 and (x "div" 2) mod 2 != 0 and (x "div" 2) mod 3 != 0 \
            &and (x mod 3 = 0 and (x "div" 3) mod 2 != 0 and (x "div" 3) mod 3 != 0)) 
$

ここで、$"twop", "threep"$ は自然数であり、$x mod a = 0$ のとき、$x / a = x "div" a$ であるから、

$
"twp"(P, B) &= ("twop" = 1 or "threep" = 1) and x mod 2 != 0 and x mod 3 != 0 \
            &or ("twop" = "threep" = 0 and (x mod 2 = 0 and (x / 2) mod 2 != 0 and (x / 2) mod 3 != 0 \
            &and (x mod 3 = 0 and (x / 3) mod 2 != 0 and (x / 3) mod 3 != 0)) 
$
