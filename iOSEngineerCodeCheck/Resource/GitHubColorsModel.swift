// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - GitHubColors
struct GitHubColors: Codable {
    let mercury, typeScript, pureBasic, welcomeObjectiveC: String
    let welcomeSelf, edn, newLISP, jupyterNotebook: String
    let rebol, frege, dart, aspectJ: String
    let shell, webOntologyLanguage, xBase, eiffel: String
    let nix, raml, mtml, racket: String
    let elixir, sas, agda, wisp: String
    let d, kotlin, opal, crystal: String
    let objectiveC, coldFusionCFC, oz, mirah: String
    let objectiveJ, gosu, freeMarker, ruby: String
    let componentPascal, arc, brainfuck, nit: String
    let apl, go, visualBasic, php: String
    let cirru, sqf, glyph, java: String
    let maxScript, scala, makefile, coldFusion: String
    let perl, lua, vue, verilog: String
    let factor, haxe, pureData, forth: String
    let red, hy, volt, lsl: String
    let eC, coffeeScript, html, lex: String
    let apiBlueprint, swift, c, autoHotkey: String
    let isabelle, metal, clarion, jsoNiq: String
    let boo, autoIt, clojure, rust: String
    let prolog, sourcePawn: String
    let ampl, fortran, antlr, harbour: String
    let tcl, blitzMax, pigLatin, lasso: String
    let ecl, vhdl, elm, propellerSpin: String
    let x10, idl, ats, ada: String
    let unity3DAsset, nu, lfe, superCollider: String
    let oxygene, asp, assembly, gnuplot: String
    let jFlex, netLinx, turing, vala: String
    let processing, arduino, flux, netLogo: String
    let cSharp, css, emacsLISP, stan: String
    let saltStack, qml, pike, lolcode: String
    let ooc: String
    let handlebars, j, mask, emberScript: String
    let teX, nemerle, krl, renPy: String
    let unifiedParallelC, golo, fancy, oCaml: String
    let shen, pascal, f, puppet: String
    let actionScript, diff, ragelInRubyHost, fantom: String
    let zephir, click, smalltalk, dm: String
    let ioke, pogoScript, liveScript, javaScript: String
    let vimL, pureScript, abap, matlab: String
    let slash, r, erlang, pan: String
    let lookML, eagle, scheme, plsql: String
    let python, max: String
    let commonLISP, latte, xQuery, omgrofl: String
    let xc, nimrod, systemVerilog, chapel: String
    let groovy, dylan, e, parrot: String
    let grammaticalFramework, gameMakerLanguage, papyrus, netLinxERB: String
    let clean, alloy, squirrel, pawn: String
    let unrealScript, standardML, slim, perl6: String
    let julia, haskell, ncl, io: String
    let rouge, cpp, agsScript, dogescript: String
    let nesC: String

    enum CodingKeys: String, CodingKey {
        case mercury = "Mercury"
        case typeScript = "TypeScript"
        case pureBasic = "PureBasic"
        case welcomeObjectiveC = "Objective-C++"
        case welcomeSelf = "Self"
        case edn
        case newLISP = "NewLisp"
        case jupyterNotebook = "Jupyter Notebook"
        case rebol = "Rebol"
        case frege = "Frege"
        case dart = "Dart"
        case aspectJ = "AspectJ"
        case shell = "Shell"
        case webOntologyLanguage = "Web Ontology Language"
        case xBase
        case eiffel = "Eiffel"
        case nix = "Nix"
        case raml = "RAML"
        case mtml = "MTML"
        case racket = "Racket"
        case elixir = "Elixir"
        case sas = "SAS"
        case agda = "Agda"
        case wisp
        case d = "D"
        case kotlin = "Kotlin"
        case opal = "Opal"
        case crystal = "Crystal"
        case objectiveC = "Objective-C"
        case coldFusionCFC = "ColdFusion CFC"
        case oz = "Oz"
        case mirah = "Mirah"
        case objectiveJ = "Objective-J"
        case gosu = "Gosu"
        case freeMarker = "FreeMarker"
        case ruby = "Ruby"
        case componentPascal = "Component Pascal"
        case arc = "Arc"
        case brainfuck = "Brainfuck"
        case nit = "Nit"
        case apl = "APL"
        case go = "Go"
        case visualBasic = "Visual Basic"
        case php = "PHP"
        case cirru = "Cirru"
        case sqf = "SQF"
        case glyph = "Glyph"
        case java = "Java"
        case maxScript = "MAXScript"
        case scala = "Scala"
        case makefile = "Makefile"
        case coldFusion = "ColdFusion"
        case perl = "Perl"
        case lua = "Lua"
        case vue = "Vue"
        case verilog = "Verilog"
        case factor = "Factor"
        case haxe = "Haxe"
        case pureData = "Pure Data"
        case forth = "Forth"
        case red = "Red"
        case hy = "Hy"
        case volt = "Volt"
        case lsl = "LSL"
        case eC
        case coffeeScript = "CoffeeScript"
        case html = "HTML"
        case lex = "Lex"
        case apiBlueprint = "API Blueprint"
        case swift = "Swift"
        case c = "C"
        case autoHotkey = "AutoHotkey"
        case isabelle = "Isabelle"
        case metal = "Metal"
        case clarion = "Clarion"
        case jsoNiq = "JSONiq"
        case boo = "Boo"
        case autoIt = "AutoIt"
        case clojure = "Clojure"
        case rust = "Rust"
        case prolog = "Prolog"
        case sourcePawn = "SourcePawn"
        case ampl = "AMPL"
        case fortran = "FORTRAN"
        case antlr = "ANTLR"
        case harbour = "Harbour"
        case tcl = "Tcl"
        case blitzMax = "BlitzMax"
        case pigLatin = "PigLatin"
        case lasso = "Lasso"
        case ecl = "ECL"
        case vhdl = "VHDL"
        case elm = "Elm"
        case propellerSpin = "Propeller Spin"
        case x10 = "X10"
        case idl = "IDL"
        case ats = "ATS"
        case ada = "Ada"
        case unity3DAsset = "Unity3D Asset"
        case nu = "Nu"
        case lfe = "LFE"
        case superCollider = "SuperCollider"
        case oxygene = "Oxygene"
        case asp = "ASP"
        case assembly = "Assembly"
        case gnuplot = "Gnuplot"
        case jFlex = "JFlex"
        case netLinx = "NetLinx"
        case turing = "Turing"
        case vala = "Vala"
        case processing = "Processing"
        case arduino = "Arduino"
        case flux = "FLUX"
        case netLogo = "NetLogo"
        case cSharp = "C Sharp"
        case css = "CSS"
        case emacsLISP = "Emacs Lisp"
        case stan = "Stan"
        case saltStack = "SaltStack"
        case qml = "QML"
        case pike = "Pike"
        case lolcode = "LOLCODE"
        case ooc
        case handlebars = "Handlebars"
        case j = "J"
        case mask = "Mask"
        case emberScript = "EmberScript"
        case teX = "TeX"
        case nemerle = "Nemerle"
        case krl = "KRL"
        case renPy = "Ren'Py"
        case unifiedParallelC = "Unified Parallel C"
        case golo = "Golo"
        case fancy = "Fancy"
        case oCaml = "OCaml"
        case shen = "Shen"
        case pascal = "Pascal"
        case f = "F#"
        case puppet = "Puppet"
        case actionScript = "ActionScript"
        case diff = "Diff"
        case ragelInRubyHost = "Ragel in Ruby Host"
        case fantom = "Fantom"
        case zephir = "Zephir"
        case click = "Click"
        case smalltalk = "Smalltalk"
        case dm = "DM"
        case ioke = "Ioke"
        case pogoScript = "PogoScript"
        case liveScript = "LiveScript"
        case javaScript = "JavaScript"
        case vimL = "VimL"
        case pureScript = "PureScript"
        case abap = "ABAP"
        case matlab = "Matlab"
        case slash = "Slash"
        case r = "R"
        case erlang = "Erlang"
        case pan = "Pan"
        case lookML = "LookML"
        case eagle = "Eagle"
        case scheme = "Scheme"
        case plsql = "PLSQL"
        case python = "Python"
        case max = "Max"
        case commonLISP = "Common Lisp"
        case latte = "Latte"
        case xQuery = "XQuery"
        case omgrofl = "Omgrofl"
        case xc = "XC"
        case nimrod = "Nimrod"
        case systemVerilog = "SystemVerilog"
        case chapel = "Chapel"
        case groovy = "Groovy"
        case dylan = "Dylan"
        case e = "E"
        case parrot = "Parrot"
        case grammaticalFramework = "Grammatical Framework"
        case gameMakerLanguage = "Game Maker Language"
        case papyrus = "Papyrus"
        case netLinxERB = "NetLinx+ERB"
        case clean = "Clean"
        case alloy = "Alloy"
        case squirrel = "Squirrel"
        case pawn = "PAWN"
        case unrealScript = "UnrealScript"
        case standardML = "Standard ML"
        case slim = "Slim"
        case perl6 = "Perl6"
        case julia = "Julia"
        case haskell = "Haskell"
        case ncl = "NCL"
        case io = "Io"
        case rouge = "Rouge"
        case cpp
        case agsScript = "AGS Script"
        case dogescript = "Dogescript"
        case nesC
    }
}
