// ============================================================
// AUTO — Page setup, tipografi, dan show rules heading. Jangan diubah.
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
    // Satu tempat untuk teks "Halaman ini sengaja dikosongkan." — dua sumber:
    // 1. halaman-kosong() eksplisit → marker <halaman-kosong>
    // 2. pagebreak(to:"odd") otomatis sebelum bab/lampiran → halaman genap
    //    yang halaman berikutnya adalah heading level-1 bernomor
    foreground: context {
      let cur = here().page()
      let explicit = query(<halaman-kosong>).any(m => m.location().page() == cur)
      let before-bab = calc.even(cur) and query(heading.where(level: 1)).any(h =>
        h.numbering != none and h.location().page() == cur + 1
      )
      if explicit or before-bab {
        place(top + center, dy: 3cm,
          text(style: "italic")[Halaman ini sengaja dikosongkan.]
        )
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

    // Bab bernomor: mulai di halaman ganjil (cetak bolak-balik).
    // pagebreak(to:"odd") stabil (tidak memicu convergence loop).
    // Teks blank page ditambahkan via foreground di set page di atas.
    if it.numbering != none {
      pagebreak(to: "odd")
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
      text(size: 13pt, weight: "bold")[
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

  show heading.where(level: 4): it => {
    v(0.2em, weak: true)
    block(above: 0.6em, below: 0.3em,
      text(size: 12pt, weight: "regular")[
        #counter(heading).display("1.1.1.1") #h(0.4em) #it.body
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
      // Lampiran bernomor: mulai di halaman ganjil (cetak bolak-balik).
      // Teks blank page ditambahkan via foreground (sama seperti bab).
      if it.numbering != none {
        pagebreak(to: "odd")
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
