#import "../template.typ": *
#import "../proof.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第3回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 7 月 30 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 解答

#v(1em)

/ ループ不変表明: $y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2$
/ 検証条件:
  - $y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 and x != 0 supset y + x = (x_0 (x_0 + 1)) / 2 - (x (x - 1) ) / 2$
  - $x = x_0 and y = 0 supset y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2$
  - $x = 0 and y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 supset y = (x_0 (x_0 + 1)) / 2$

#v(7em)

#{
  set align(center)
  set text(size: 0.8em)
  let goal = $angle.l.double y = 0 and x = x_0 angle.r.double "while (x>0) { y=y+x; x=x-1 }" angle.l.double y = (x_0 (x_0 + 1)) / 2 angle.r.double$

  proof(
    (goal,
      ($angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 angle.r.double "while (x>0) { y=y+x; x=x-1 }" angle.l.double x = 0 and y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 angle.r.double$,
        ($angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 and x != 0angle.r.double "y=y+x; x=x-1" angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 angle.r.double$,
          ($angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 and x != 0 angle.r.double "y=y+x;" angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x - 1) ) / 2 angle.r.double$,
            ($angle.l.double y + x = (x_0 (x_0 + 1)) / 2 - (x (x = 1) ) / 2 + x angle.r.double "y=y+x;" angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x - 1) ) / 2 angle.r.double$)
          ),
          $$,
          $$,
          ($angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x - 1) ) / 2 angle.r.double "x=x-1" angle.l.double y = (x_0 (x_0 + 1)) / 2 - (x (x + 1) ) / 2 angle.r.double$),
        )
      )
    )
  )
}
