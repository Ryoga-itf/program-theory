#import "../template.typ": *
#import "../proof.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第4回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 8 月 6 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 解答

#v(1em)

/ ループ不変表明: $forall i (0 <= i <= z supset y[i] = i!)$

#v(7em)

#{
  set align(center)
  set text(size: 0.65em)
  let goal = $angle.l.double forall i ( 0 <= i <= x supset y [i] = 1 ) and z = 0 angle.r.double "while z ≠ x { z=z+1; y[z]=y[z-1] * z }" angle.l.double forall i (0 <= i <= x supset y[i] = i!) angle.r.double$

  proof(
    (goal,
      ($angle.l.double forall i ( 0 <= i <= z supset y [i] = i! ) and z = 0 angle.r.double "while z ≠ x { z=z+1; y[z]=y[z-1] * z }" angle.l.double z = x and forall i (0 <= i <= z supset y[i] = i!) angle.r.double$,
        ($angle.l.double forall i ( 0 <= i <= z supset y [i] = i! ) and z != x angle.r.double "z=z+1; y[z]=y[z-1] * z" angle.l.double  forall i (0 <= i <= z supset y[i] = i!) angle.r.double$,
          ($angle.l.double forall i ( 0 <= i <= z supset y [i] = i! ) angle.r.double "z=z+1;" angle.l.double  forall i (0 <= i <= z - 1 supset y[i] = i!) angle.r.double$),
          $$,
          $$,
          ($angle.l.double forall i ( 0 <= i <= z - 1 supset y [i] = i! ) angle.r.double "y[z]=y[z-1] * z" angle.l.double forall i (0 <= i <= z supset y[i] = i!) angle.r.double$,
            ($angle.l.double forall i ( 0 <= i <= z - 1 supset y [i] = i! and y[z-1] times z = z!) angle.r.double "y[z]=y[z-1] * z" angle.l.double forall i (0 <= i <= z supset y[i] = i!) angle.r.double$)
          ),
        ),
      )
    )
  )
}
