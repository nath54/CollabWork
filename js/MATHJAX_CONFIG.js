MathJax = {
    tex: {
        inlineMath: [
            ['$', '$']
        ],
        displayMath: [
            ['$$', '$$']
        ],
        macros: {
            bb: ["\\mathbb{#1}", 1],
            cal: ["\\mathcal{#1}", 1],
            frak: ["\\mathfrak{#1}", 1],
            ol: ["\\overline{#1}", 1],
            N: "\\bb{N}",
            Z: "\\bb{Z}",
            D: "\\bb{D}",
            Q: "\\bb{Q}",
            C: "\\bb{C}",
            R: "\\bb{R}",
            K: "\\bb{K}",
            cR: "\\cal{R}",
            B: "\\cal{B}",
            bdot: ["\\dot{ \\raise{6pt}{} #1\\ } \\!", 1],
            bddot: ["\\ddot{ \\raise{6pt}{} #1\\ } \\!", 1],
            btilde: ["\\tilde{ \\raise{10pt}{} #1\\ } \\!", 1],
            mto: "\\longmapsto",
            lra: "\\longrightarrow",
            ra: "\\rightarrow",
            cC: "\\cal{C}",
            cD: "\\cal{D}",
            cV: "\\cal{V}",
            cP: "\\cal{P}",
            eq: "\\equiv",
            part: "\\partial",
            ve: "\\varepsilon",
            bs: "\\Large \\star \\normalsize",
            fa: "\\forall \\ ",
            "[": "[\\![",
            "]": "]\\!]"
        }
    }
};

// MathJax.Hub.Config({
//     "HTML-CSS": {
//         preferredFont: "STIX"
//     }
// });