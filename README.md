# COBOLDocker

- [COBOLDocker](#coboldocker)
  - [Install](#install)
  - [How to use it](#how-to-use-it)
  - [Author](#author)

## Install

Just install Docker
## How to use it

I. Add the following to any shell script configuration file -- like `.bashrc`, `.zshrc` or alike:

```shell
alias cobc='docker run --rm --volume $(pwd):/usr/src --workdir /usr/src fazenda/cobol'
```

II. Then just run the following:

```shell
cobc --help
```

III. The following should be printed in your terminal:

```shell
GnuCOBOL compiler for most COBOL dialects with lots of extensions

Usage: cobc [options]... file...

Options:
  -h, -help             display this help and exit
  -V, -version          display compiler version and exit
  -i, -info             display compiler information (build/environment)
                        and exit
  -v, -verbose          display compiler version and the commands
                        invoked by the compiler
  -vv, -verbose=2       like -v but additional pass verbose option
                        to assembler/compiler
  -vvv, -verbose=3      like -vv but additional pass verbose option
                        to linker
  -q, -brief            reduced displays, commands invoked not shown
  -###                  like -v but commands not executed
  -x                    build an executable program
  -m                    build a dynamically loadable module (default)
  -j [<args>], -job[=<args>]    run program after build, passing <args>
  -std=<dialect>        warnings/features for a specific dialect
                        <dialect> can be one of:
                        default, cobol2014, cobol2002, cobol85, xopen,
                        ibm-strict, ibm, mvs-strict, mvs,
                        mf-strict, mf, bs2000-strict, bs2000,
                        acu-strict, acu, rm-strict, rm;
                        see configuration files in directory config
  -F, -free             use free source format
  -fixed                use fixed source format (default)
  -O, -O2, -O3, -Os     enable optimization
  -O0                   disable optimization
  -g                    enable C compiler debug and stack check
  -d, -debug            enable all run-time error checking,
                        equal to -fec=EC-ALL -fstack-check
  -fec=<exception-name> enable code generation for <exception-name>,
                        sets -fsource-location
  -fno-ec=<exception-name>      disable code generation for <exception-name>
  -d, -debug            enable all run-time error checking
  -d, -debug            enable all run-time error checking
  -o <file>             place the output into <file>
  -b                    combine all input files into a single
                        dynamically loadable module
  -E                    preprocess only; do not compile or link
  -C                    translation only; convert COBOL to C
  -S                    compile only; output assembly file
  -c                    compile and assemble, but do not link
  -T <file>             generate and place a wide program listing into <file>
  -t <file>             generate and place a program listing into <file>
  --tlines=<lines>      specify lines per page in listing, default = 55
  -P[=<dir or file>]    generate preprocessed program listing (.lst)
  -Xref                 generate cross reference through 'cobxref'
                        (V. Coen's 'cobxref' must be in path)
  -I <directory>        add <directory> to copy/include search path
  -L <directory>        add <directory> to library search path
  -l <lib>              link the library <lib>
  -A <options>          add <options> to the C compile phase
  -Q <options>          add <options> to the C link phase
  -D <define>           define <define> for COBOL compilation
  -K <entry>            generate CALL to <entry> as static
  -conf=<file>          user-defined dialect configuration; see -std
  -list-reserved        display reserved words
  -list-intrinsics      display intrinsic functions
  -list-mnemonics       display mnemonic names
  -list-system          display system routines
  -save-temps[=<dir>]   save intermediate files
                        * default: current directory
  -ext <extension>      add file extension for resolving COPY

Warning options:
  -Wall                 enable most warnings (all except as noted below)
  -Wextra               like -Wall but enable some extra warning flags
  -Wno-<warning>        disable warning enabled by default, -Wall or -Wextra
  -Wadditional          additional warnings only raised with -Wall
  -Wno-unfinished       do not warn if unfinished features are used
                        * ALWAYS active
  -Wno-pending          do not warn if pending features are mentioned
                        * ALWAYS active
  -Wobsolete            warn if obsolete features are used
  -Warchaic             warn if archaic features are used
  -Wredefinition        warn about incompatible redefinition of data items
  -Wtruncate            warn about field truncation from constant assignments
  -Wpossible-truncate   warn about possible field truncation
                        * NOT set with -Wall
  -Woverlap             warn about overlapping MOVE of items
  -Wpossible-overlap    warn about MOVE of items that may overlap depending on variables
                        * NOT set with -Wall
  -Wparentheses         warn about lack of parentheses around AND within OR
  -Wstrict-typing       warn strictly about type mismatch
  -Wimplicit-define     warn about implicitly defined data items
  -Wcorresponding       warn about CORRESPONDING with no matching items
  -Winitial-value       warn if initial VALUE clause is ignored
  -Wprototypes          warn about missing FUNCTION prototypes/definitions
  -Warithmetic-osvs     warn if arithmetic expression precision has changed
  -Wcall-params         warn about non 01/77 items for CALL parameters
                        * NOT set with -Wall
  -Wconstant-expression  warn about expressions that always resolve to true/false
  -Wcolumn-overflow     warn about text after program-text area, FIXED format
                        * NOT set with -Wall
  -Wterminator          warn about lack of scope terminator END-XXX
                        * NOT set with -Wall
  -Wlinkage             warn about dangling LINKAGE items
                        * NOT set with -Wall
  -Wunreachable         warn about likely unreachable statements
                        * NOT set with -Wall
  -Wno-dialect          do not warn about dialect specific issues
                        * ALWAYS active
  -Wothers              do not warn about different issues
                        * ALWAYS active
  -Werror               treat all warnings as errors
  -Wno-error            don't treat warnings as errors
  -Werror=<warning>     treat specified <warning> as error
  -Wno-error=<warning>  don't treat specified <warning> as error

Compiler options:
  -fsign=[ASCII|EBCDIC] define display sign representation
                        * default: machine native
  -ffold-copy=[UPPER|LOWER]     fold COPY subject to value
                        * default: no transformation
  -ffold-call=[UPPER|LOWER]     fold PROGRAM-ID, CALL, CANCEL subject to value
                        * default: no transformation
  -fdefaultbyte=<value> initialize fields without VALUE to value
                        * decimal 0..255 or any quoted character
                        * default: initialize to picture
  -fmax-errors=<number> maximum number of errors to report before
                        compilation is aborted
                        * default: 128
  -fdump=<scope>        dump data fields on abort, <scope> may be
                        a combination of: ALL, WS, LS, RD, FD, SC
  -fcallfh=<function>   use external provided EXTFH interface module
                        <function> for I/O
  -fintrinsics=[ALL|intrinsic function name(,name,...)]
                        intrinsics to be used without FUNCTION keyword

  -fno-recursive-check  disable check of recursive program call;
                        effectively compiling as RECURSIVE program
  -fgen-c-line-directives       generate source location directives in C code;
                        useful for source-level debugging
  -fgen-c-labels        generate extra labels in C sources;
                        useful for source-level debugging
  -fno-remove-unreachable       disable remove of unreachable code
                        * turned off by -g
  -ftrace               generate trace code
                        * scope: executed SECTION/PARAGRAPH
  -ftraceall            generate trace code
                        * scope: executed SECTION/PARAGRAPH/STATEMENTS
  -fsyntax-only         syntax error checking only; don't emit any output
  -fdebugging-line      enable debugging lines
                        * 'D' in indicator column or floating >>D
  -fsource-location     generate source location code
                        * turned on by -debug/-g/-ftraceall/-fec
  -fimplicit-init       automatic initialization of the COBOL runtime system
  -fstack-check         PERFORM stack checking
                        * turned on by -debug or -g
  -fwrite-after         use AFTER 1 for WRITE of LINE SEQUENTIAL
                        * default: BEFORE 1
  -fmfcomment           '*' or '/' in column 1 treated as comment
                        * FIXED format only
  -facucomment          '$' in indicator area treated as '*',
                        '|' treated as floating comment
  -fnotrunc             allow numeric field overflow
                        * non-ANSI behaviour
  -fodoslide            adjust items following OCCURS DEPENDING
                        * implies -fcomplex-odo
  -fsingle-quote        use a single quote (apostrophe) for QUOTE
                        * default: double quote
  -foptional-file       treat all files as OPTIONAL
                        * unless NOT OPTIONAL specified
  -fstatic-call         output static function calls for the CALL statement
  -fno-gen-c-decl-static-call   disable generation of C function declations
                        for subroutines with static CALL
  -fno-theaders         suppress all headers and output of compilation
                        options from listing while keeping page breaks
  -fno-tsource          suppress source from listing
  -fno-tmessages        suppress warning and error summary from listing
  -ftsymbols            specify symbols in listing

Compiler dialect configuration options:
  -freserved-words=<value>      use of complete/fixed reserved words
  -ftab-width=1..12      set number of spaces that are assumed for tabs
  -ftext-column=72..255  set right margin for source (fixed format only)
  -fpic-length=<number>  maximum number of characters allowed in the PICTURE character-string
  -fword-length=1..63    maximum word-length for COBOL (= programmer defined) words
  -fliteral-length=<number>     maximum literal size in general
  -fnumeric-literal-length=1..38        maximum numeric literal size
  -fbinary-size=<value>  binary byte size - defines the allocated bytes according to PIC, may be one of: 2-4-8, 1-2-4-8, 1--8
  -fbinary-byteorder=<value>    binary byte order, may be one of: native, big-endian
  -fassign-clause=<value>       how to interpret 'ASSIGN word': as 'ASSIGN EXTERNAL word' or 'ASSIGN DYNAMIC word'
  -fscreen-section-rules=<value>        which compiler's rules to apply to SCREEN SECTION item clauses
  -ffilename-mapping     resolve file names at run time using environment variables.
  -fpretty-display       alternate formatting of numeric fields
  -fbinary-truncate      numeric truncation according to ANSI
  -fcomplex-odo          allow complex OCCURS DEPENDING ON
  -findirect-redefines   allow REDEFINES to other than last equal level number
  -flarger-redefines-ok  allow larger REDEFINES items
  -frelax-syntax-checks  allow certain syntax variations (e.g. REDEFINES position)
  -frelax-level-hierarchy       allow non-matching level numbers
  -fselect-working       require ASSIGN USING items to be in WORKING-STORAGE
  -fsticky-linkage       LINKAGE-SECTION items remain allocated between invocations
  -fmove-ibm             MOVE operates as on IBM (left to right, byte by byte)
  -fperform-osvs         exit point of any currently executing perform is recognized if reached
  -farithmetic-osvs      limit precision in intermediate results to precision of final result (less accurate)
  -fconstant-folding     evaluate constant expressions at compile time
  -fhostsign             allow hexadecimal value 'F' for NUMERIC test of signed PACKED DECIMAL field
  -fprogram-name-redefinition   program names don't lead to a reserved identifier
  -faccept-update        set WITH UPDATE clause as default for ACCEPT dest-item, instead of WITH NO UPDATE
  -faccept-auto          set WITH AUTO clause as default for ACCEPT dest-item, instead of WITH TAB
  -fconsole-is-crt       assume CONSOLE IS CRT if not set otherwise
  -fno-echo-means-secure        NO-ECHO hides input with asterisks like SECURE
  -fline-col-zero-default       assume a field DISPLAY starts at LINE 0 COL 0 (i.e. at the cursor), not LINE 1 COL 1
  -fdisplay-special-fig-consts  special behaviour of DISPLAY SPACE/ALL X'01'/ALL X'02'/ALL X'07'
  -fbinary-comp-1        COMP-1 is a 16-bit signed integer
  -fnumeric-pointer      POINTER is a 64-bit unsigned integer
  -fmove-non-numeric-lit-to-numeric-is-zero     imply zero in move of non-numeric literal to numeric items
  -fimplicit-assign-dynamic-var implicitly define a variable if an ASSIGN DYNAMIC does not match any data item
  -fcomment-paragraphs=<support>        comment paragraphs in IDENTIFICATION DIVISION (AUTHOR, DATE-WRITTEN, ...)
  -fmemory-size-clause=<support>        MEMORY-SIZE clause
  -fmultiple-file-tape-clause=<support> MULTIPLE-FILE-TAPE clause
  -flabel-records-clause=<support>      LABEL-RECORDS clause
  -fvalue-of-clause=<support>   VALUE-OF clause
  -fdata-records-clause=<support>       DATA-RECORDS clause
  -ftop-level-occurs-clause=<support>   OCCURS clause on top-level
  -fsame-as-clause=<support>    SAME AS clause
  -ftype-to-clause=<support>    TYPE TO clause
  -fusage-type=<support>        USAGE type-name
  -fsynchronized-clause=<support>       SYNCHRONIZED clause
  -fspecial-names-clause=<support>      SPECIAL-NAMES clause
  -fgoto-statement-without-name=<support>       GOTO statement without name
  -fstop-literal-statement=<support>    STOP-literal statement
  -fstop-identifier-statement=<support> STOP-identifier statement
  -fdebugging-mode=<support>    DEBUGGING MODE and debugging indicator
  -fuse-for-debugging=<support> USE FOR DEBUGGING
  -fpadding-character-clause=<support>  PADDING CHARACTER clause
  -fnext-sentence-phrase=<support>      NEXT SENTENCE phrase
  -flisting-statements=<support>        listing-directive statements EJECT, SKIP1, SKIP2, SKIP3
  -ftitle-statement=<support>   listing-directive statement TITLE
  -fentry-statement=<support>   ENTRY statement
  -fmove-noninteger-to-alphanumeric=<support>   move noninteger to alphanumeric
  -fmove-figurative-constant-to-numeric=<support>       move figurative constants to numeric
  -fmove-figurative-space-to-numeric=<support>  move figurative constant SPACE to numeric
  -fmove-figurative-quote-to-numeric=<support>  move figurative constant QUOTE to numeric
  -fodo-without-to=<support>    OCCURS DEPENDING ON without to
  -fsection-segments=<support>  section segments
  -falter-statement=<support>   ALTER statement
  -fcall-overflow=<support>     OVERFLOW clause for CALL
  -fnumeric-boolean=<support>   boolean literals (B'1010')
  -fhexadecimal-boolean=<support>       hexadecimal-boolean literals (BX'A')
  -fnational-literals=<support> national literals (N'UTF-16 string')
  -fhexadecimal-national-literals=<support>     hexadecimal-national literals (NX'265E')
  -fnational-character-literals=<support>       non-standard national literals (NC'UTF-16 string')
  -fhp-octal-literals=<support> HP COBOL octal literals (%377)
  -facu-literals=<support>      ACUCOBOL-GT literals (#B #O #H #X)
  -fword-continuation=<support> continuation of COBOL words
  -fnot-exception-before-exception=<support>    NOT ON EXCEPTION before ON EXCEPTION
  -faccept-display-extensions=<support> extensions to ACCEPT and DISPLAY
  -frenames-uncommon-levels=<support>   RENAMES of 01-, 66- and 77-level items
  -fsymbolic-constant=<support> constants defined in SPECIAL-NAMES
  -fconstant-78=<support>       constant with level 78 item (note: has left to right precedence in expressions)
  -fconstant-01=<support>       constant with level 01 CONSTANT AS/FROM item
  -fperform-varying-without-by=<support>        PERFORM VARYING without BY phrase (implies BY 1)
  -freference-out-of-declaratives=<support>     references to sections not in DECLARATIVES from within DECLARATIVES
  -fprogram-prototypes=<support>        CALL/CANCEL with program-prototype-name
  -fcall-convention-mnemonic=<support>  specifying call-convention by mnemonic
  -fcall-convention-linkage=<support>   specifying call-convention by WITH ... LINKAGE
  -fnumeric-value-for-edited-item=<support>     numeric literals in VALUE clause of numeric-edited items
  -fincorrect-conf-sec-order=<support>  incorrect order of CONFIGURATION SECTION paragraphs
  -fdefine-constant-directive=<support> allow >> DEFINE CONSTANT var AS literal
  -ffree-redefines-position=<support>   REDEFINES clause not following entry-name in definition
  -frecords-mismatch-record-clause=<support>    record sizes does not match RECORD clause
  -frecord-delimiter=<support>  RECORD DELIMITER clause
  -fsequential-delimiters=<support>     BINARY-SEQUENTIAL and LINE-SEQUENTIAL phrases in RECORD DELIMITER
  -frecord-delim-with-fixed-recs=<support>      RECORD DELIMITER clause on file with fixed-length records
  -fmissing-statement=<support> missing statement (e.g. empty IF / PERFORM)
  -fzero-length-literals=<support>      zero-length literals, e.g. '' and ""
  -fxml-generate-extra-phrases=<support>        XML GENERATE's phrases other than COUNT IN
  -fcontinue-after=<support>    AFTER phrase in CONTINUE statement
  -fgoto-entry=<support>        ENTRY FOR GOTO and GOTO ENTRY statements
  -fassign-variable=<support>   ASSIGN [TO] variable in SELECT
  -fassign-using-variable=<support>     ASSIGN USING/VARYING variable in SELECT
  -fassign-ext-dyn=<support>    ASSIGN EXTERNAL/DYNAMIC in SELECT
  -fassign-disk-from=<support>  ASSIGN DISK FROM variable in SELECT
        where <support> is one of the following:
        'ok', 'warning', 'archaic', 'obsolete', 'skip', 'ignore', 'error', 'unconformable'
  -fnot-reserved=<word>  word to be taken out of the reserved words list
  -freserved=<word>      word to be added to reserved words list
  -freserved=<word>:<alias>     word to be added to reserved words list as alias
  -fnot-register=<word>  special register to disable
  -fregister=<word>      special register to enable


Report bugs to: bug-gnucobol@gnu.org
or (preferably) use the issue tracker via the home page.
GnuCOBOL home page: <https://www.gnu.org/software/gnucobol/>
General help using GNU software: <https://www.gnu.org/gethelp/>
```

## Author

- [Fazendaaa](https://github.com/Fazendaaa)
