// ============================================================
// template.typ — Main template function (show: template)
// Terinspirasi dari pola abmas-palo-alto/drpm
// ============================================================

#import "lib.typ": *

#let template(appendices: none, body) = {
  // Page setup
  set page(
    paper: "a4",
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2.5cm),
    footer: context {
      let fmt = here().page-numbering()
      if fmt != none {
        let pnum = counter(page).display(fmt)
        if calc.odd(here().page()) { align(right, pnum) }
        else { align(left, pnum) }
      }
    },
  )

  // Typography
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "id",
    hyphenate: false,
  )

  set par(
    justify: true,
    leading: 0.65em,
    spacing: 1.5em,
    first-line-indent: 1.25cm,
    linebreaks: "optimized",
  )

  // List & enum
  set enum(indent: 1.25cm, body-indent: 0.5em)
  set list(indent: 1.25cm, body-indent: 0.5em)

  // Figure numbering: Gambar 1.1 per bab
  set figure(
    numbering: (..n) => {
      let h = counter(heading).get()
      let bab = if h.len() > 0 { h.at(0) } else { 0 }
      numbering("1.1", bab, n.pos().at(0))
    },
    gap: 0.65em,
  )
  show figure.caption: set text(size: 11pt)
  show figure.where(kind: table): set figure.caption(position: top)

  // Table styling
  show table: set text(size: 11pt)
  show table: set par(justify: false, first-line-indent: 0pt)
  set table(stroke: 0.5pt, inset: 6pt)

  // Heading setup + figure counter reset per bab
  set heading(numbering: "1.1.1.")

  show heading.where(level: 1): it => {
    // Reset counter gambar/tabel/kode setiap bab baru
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: "kode")).update(0)

    // Bab bernomor: mulai di halaman ganjil (cetak bolak-balik)
    // Jika bab sebelumnya habis di halaman ganjil, sisipkan blank page genap
    if it.numbering != none {
      pagebreak(weak: true)
      context if calc.even(here().page()) {
        align(center + horizon)[
          text(style: "italic")[Halaman ini sengaja dikosongkan.]
        ]
        pagebreak()
      }
    } else {
      pagebreak(weak: true)
    }

    v(0.5cm)
    align(center)[
      #block(above: 0pt, below: 0pt,
        text(size: 14pt, weight: "bold")[
          #if it.numbering != none [
            BAB #counter(heading).display("1") \
          ]
          #upper(it.body)
        ]
      )
    ]
    v(0.8cm)
  }

  show heading.where(level: 2): it => {
    v(0.5em, weak: true)
    block(above: 1em, below: 0.5em,
      text(size: 12pt, weight: "bold")[
        #counter(heading).display("1.1") #h(0.4em) #it.body
      ]
    )
  }

  show heading.where(level: 3): it => {
    v(0.3em, weak: true)
    block(above: 0.8em, below: 0.4em,
      text(size: 12pt, weight: "bold")[
        #counter(heading).display("1.1.1") #h(0.4em) #it.body
      ]
    )
  }

  // Outline (TOC) entries — spacing antar entri
  show outline.entry: set block(above: 0.5em)

  // Body
  body

  // Lampiran (appendices)
  if appendices != none {
    pagebreak(weak: true)
    counter(heading).update(0)

    set heading(
      supplement: [Lampiran],
      numbering: (..nums) => {
        let arr = nums.pos()
        if arr.len() == 1 {
          "LAMPIRAN " + numbering("A", arr.at(0)) + "."
        } else {
          numbering("A.1", ..arr.slice(0))
        }
      },
    )

    show heading.where(level: 1): it => {
      // Lampiran bernomor: mulai di halaman ganjil (cetak bolak-balik)
      if it.numbering != none {
        pagebreak(weak: true)
        context if calc.even(here().page()) {
          align(center + horizon)[
            text(style: "italic")[Halaman ini sengaja dikosongkan.]
          ]
          pagebreak()
        }
      } else {
        pagebreak(weak: true)
      }

      v(0.5cm)
      align(center)[
        #block(above: 0pt, below: 0pt,
          text(size: 14pt, weight: "bold")[
            #if it.numbering != none {
              counter(heading).display("A")
              [. ]
            }
            #upper(it.body)
          ]
        )
      ]
      v(0.8cm)
    }

    appendices
  }
}
