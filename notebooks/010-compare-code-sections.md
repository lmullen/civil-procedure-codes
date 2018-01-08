    library("textreuse")
    library("stringr")
    library("dplyr")

Now we want to compare the sections of the codes to one another. Our
hypothesis is that codes are borrowed section by section, so treating
individual sections of codes as their own documents means that we should
find higher similarities between two borrowed sections of a code than
between codes as a whole. Since the sections will be of similar length,
we can use the Jaccard similarity measure rather than the
ratio-of-matches measure.

We will begin by figuring out the Jaccard similarity scores of a single
section that we know to be borrowed, though we do not know all the
borrowings. The section involves people who are disqualified from being
witnesses, most notably "Indians, or persons having one fourth or more
of Indian blood" or "Negroes, or persons having one half or more Negro
blood," both "in an action or proceeding to which a white person is a
party" (CA 1851). We have identified obvious borrowings by searching the
sections. We will create a small corpus of those borrowings and do a
pairwise measure of the Jaccard similarity to figure out a good
threshold for borrowings. To be clear, all of these sections disallow
witnesses, but several of them are clearly not direct borrowings.

Comparing the sections
----------------------

Load the sections.

    witness_files <- c("NV1861-00003640.txt", "WOOD1857-00004280.txt",
                       "CA1851-00004310.txt", "NV1861-00003900.txt", 
                       "MT1865-00003240.txt", "IN1843-00002520.txt",
                       "IL1866-00003330.txt", "CA1858-00000450.txt", 
                       "CA1850-00003110.txt", "AZ1865-00003640.txt")
    witness_paths <- str_c("legal-codes-split/", witness_files)

We will load these as a corpus, tokenizing them with 4-grams.

    witness_corpus <- TextReuseCorpus(paths = witness_paths, 
                                      tokenizer = tokenize_ngrams, n = 4)

Now we will do a pairwise comparison with Jaccard similarity.

    witness_comparison <- pairwise_compare(witness_corpus, jaccard_similarity)

What are the mean and median values for comparison, as well as the
range?

    mean(witness_comparison, na.rm = TRUE)

    ## [1] 0.0001084745

    median(witness_comparison, na.rm = TRUE)

    ## [1] 0

    range(witness_comparison, na.rm = TRUE)

    ## [1] 0.000000000 0.002702703

Matches
-------

Let's examine the highest and lowest scores, starting with the highest.

    witness_candidates <- pairwise_candidates(witness_comparison) %>% 
      arrange(desc(score))
    head(witness_candidates, 10)

    ## Source: local data frame [10 x 3]
    ## 
    ##                  a                 b       score
    ##              (chr)             (chr)       (dbl)
    ## 1  IL1866-00003330   IN1843-00002520 0.002702703
    ## 2  CA1858-00000450 WOOD1857-00004280 0.002178649
    ## 3  AZ1865-00003640   CA1850-00003110 0.000000000
    ## 4  AZ1865-00003640   CA1851-00004310 0.000000000
    ## 5  AZ1865-00003640   CA1858-00000450 0.000000000
    ## 6  AZ1865-00003640   IL1866-00003330 0.000000000
    ## 7  AZ1865-00003640   IN1843-00002520 0.000000000
    ## 8  AZ1865-00003640   MT1865-00003240 0.000000000
    ## 9  AZ1865-00003640   NV1861-00003640 0.000000000
    ## 10 AZ1865-00003640   NV1861-00003900 0.000000000

We can check the text of some of these codes to see that they are in
fact matches.

    content(witness_corpus[["CA1851-00004310"]])

    ## The award shall be in writing, signed by the arbitrators, or a
    ## majority of them, and delivered to the parties. When the submission
    ## is made an order of the Court, the award shall be filed with the Clerk,
    ## and a note thereof made in his register. After the expiration of five
    ## days from the filing of the award, upon the application of a party, and
    ## on filing an allidavit, showing that notice of filing the award has been
    ## served on the adverse party or his Attorney, at least four days prior to
    ## such application, and that no order staying the entry of judgment has
    ## been served, the award shall be entered by the Clerk in the Judgment
    ## Book, and shall thereupon have the effect of a judgment.

    content(witness_corpus[["AZ1865-00003640"]])

    ## Appeals to the district courts, as provided in this chapter, shall
    ## be heard at any terms of those courts, and shall be brought on to a hearing
    ## at the earliest period practicable.

    content(witness_corpus[["NV1861-00003640"]])

    ## III.—S'ubmz°tting a Controversy without Action.

    content(witness_corpus[["WOOD1857-00004280"]])

    ## , Sec. 391. All persons, without exception, otherwise than as specified 
    ## in thi& chal)t.er,(2) may be witnesses in any action or proceeding.(3) 
    ## See. 392. ~o person offered as a witness shall be excluded on account of his
    ## opinions on matters of religious belief, nor shall any person he excluded on account
    ## of bis interest in the event of the action or proceedings, except in the following 
    ## cases: 1. When be is a party to the action or proceeding, or the action or proceeding is prosecuted or defended for his immediate benefit. 2. When his inter
    ## est is a present, certain, and vested interest.-[Am. May 15, 1854; R.S.St.1851,
    ## 113; c, L. 590.( 4) 
    ## AaT. 1127., Sec. 393. The true test of the interest of a person, which shall
    ## render him incompetent as a witness, shall be that he will gain or Jose by the 
    ## direct legal operation and effect of the judgment, or that the record of the judgmeot will be legal evidence for or against him in some other action, but nothing 
    ## in this, or in the last section, shall prevent a party calling as a witness the adverse 
    ## party to the action, or a person whose interest is adverae, nor a party being a
    ## witness in the case mentioned in section four hundred and twenty-three.-[Am. 
    ## May 15, 1854; R. S. St. 1851, 113; C. L. 590.
    ## A.B.T. 1128, Sec. 394. 'fhe following persons shall not be witnesses: I. Those 
    ## who are of unsound mind at the .time of their production for examination. 2. Children under ten years of age who, in the opinion of the court, appear 
    ## incapable of receiving just impressions or the facts respeding wl!ich they are
    ## examined, or of relating them truly. 3. Indians or persons having one-half or
    ## more of Indian blo an n or persons having one-half or more of negro
    ## blood, in an action r r n which a white pt!rM>n is a party.(1) 4. Persons against whom jud h been rendered upon a conviction for a felony,
    ## unless pardoned by the governor or such judgment has been reversed on appeal.
    ## [Am. )lay 15, 1854; R. S. SL 1851, 114; C. L. 591.

    content(witness_corpus[["CA1858-00000450"]])

    ## The defendant may demur to the complaint within the time required in the summons to answer, when it appears upon the face thereof, either:
    ## 1st. That the court has no jurisdiction of the person fo the defendant, or the subject of the action; or,
    ## 2d. That the plaintifff has not legal capacity to sue; or,
    ## 3d. That there is another action pending between the same parties for the same cause; or,
    ## 4th. THat there is a defect of parties, plaintifff or defendant; or,
    ## 5th. THat several causes of action have been improperly united; or,
    ## 6th. That the complaint does not state facs sufficient to constitute a cause of action.

    content(witness_corpus[["MT1865-00003240"]])

    ## The issue found may be tried as in other cases, but.
    ## when the defendant denies in his answer any liability on the obligation upon which the judgment was rendered, if a verdict be»found against him, it shall be for the amount remaining unsatisfied»
    ## on such original judgment, with interest thereon.

These are all valid matches, despite the presence in some cases of
extraneous texts, such as tables of contents. Ideally this extra text
would be removed by sectioning the codes, but since sectioning is an
inexact process, it is good that we can detect matches even with OCR and
sectioning problems.

Mismatches
----------

The mismatches are either matches with a score of `0`, or very low
scores.

    tail(witness_candidates, 5)

    ## Source: local data frame [5 x 3]
    ## 
    ##                 a                 b score
    ##             (chr)             (chr) (dbl)
    ## 1 MT1865-00003240   NV1861-00003900     0
    ## 2 MT1865-00003240 WOOD1857-00004280     0
    ## 3 NV1861-00003640   NV1861-00003900     0
    ## 4 NV1861-00003640 WOOD1857-00004280     0
    ## 5 NV1861-00003900 WOOD1857-00004280     0

Are these documents with a score of zero actually different documents?

    content(witness_corpus[["IL1866-00003330"]])

    ## In actions upon contracts, express or implied, against
    ## two or more defendants, alleged to have been made or executed
    ## by such defendants, as partners or joint obligors or payors, proof
    ## of the joint liability or partnership of the defendants, or their
    ## christian or surnames, shall not, in the first instance, be required to
    ## entitle the plaintifff to judgment, unless such proof shall be rendered 
    ## necessary by pleading in nhatemcn{ or the filing of pleas denying
    ## the execution of such writing, verified by affidavit, as required 
    ## bylaw. - ~"' ~lt."'f'&p
    ## ( Competency of witnesse,s.) 
    ## [RM1. Stat. 1846, Clwp. XL., &c. 28.] 
    ## A nogro, mulatto or Indian shall not be a witness m any court,
    ## , hi A h 
    ## or m any case, agamst a w ite person. person aving onefourth part negro blood shall be adjudged a mulatto. 
    ## (.Depositions.) 
    ## [Rlffl. Stat. 1846, Chap. XL.]

    content(witness_corpus[["IN1843-00002520"]])

    ## A subpoena may be served by leaving a copy of
    ## the same at the usual place of residence of the witness, unless
    ## he shall have left the county, and his return before the term of
    ## the court is uncertain.
    ## 
    ## SEC'I‘- 250. Where a witness is subpoenaed by copy as alore‘
    ## said, and is attached for contempt in failing to obey such subpazna, the witness shall be purged of such alleged contempt by
    ## stating under oath that such copy did not come to his hands or
    ## knowledge.
    ## 
    ## 1: Snow. 25]. No negro, mulatto or Indian, shall be a witness,
    ## except In pleas of the state against negroes, mulattoes, or Indians, and in civil causes where negroes, mulattoes, or Indians
    ## alone are parties: every person other than a negro having
    ## one-fourth part of negro blood or more, or any one of whose
    ## grandfathers or grandmothers shall have been a negro, shall be
    ## deerried an incompetent witness, within the provisions of this
    ## artic e.
    ## 
    ## ll- Sac-r. 252. The usual mode of administering oaths now prim‘
    ## 
    ## '5; tised in this state, with the ceremony of holding up the hands.
    ## 
    ## shall be observed in all cases in which an oath is to be admm1Stered, except as hereinafter provided.
    ## 
    ## of Snow. 253. Every person who has conscientious scruples
    ## against taking any oath, shall be permitted, instead of swearlllgv
    ## 
    ## solemnly and sincerely to affirm, under the pains and penalties
    ## of perjury.

    content(witness_corpus[["NV1861-00003900"]])

    ## A public officer shall not be examined as a wit.ness to communications made to him in otIicial confidence,
    ## when the public interest would suffer by the disclosure.

    content(witness_corpus[["WOOD1857-00004280"]])

    ## , Sec. 391. All persons, without exception, otherwise than as specified 
    ## in thi& chal)t.er,(2) may be witnesses in any action or proceeding.(3) 
    ## See. 392. ~o person offered as a witness shall be excluded on account of his
    ## opinions on matters of religious belief, nor shall any person he excluded on account
    ## of bis interest in the event of the action or proceedings, except in the following 
    ## cases: 1. When be is a party to the action or proceeding, or the action or proceeding is prosecuted or defended for his immediate benefit. 2. When his inter
    ## est is a present, certain, and vested interest.-[Am. May 15, 1854; R.S.St.1851,
    ## 113; c, L. 590.( 4) 
    ## AaT. 1127., Sec. 393. The true test of the interest of a person, which shall
    ## render him incompetent as a witness, shall be that he will gain or Jose by the 
    ## direct legal operation and effect of the judgment, or that the record of the judgmeot will be legal evidence for or against him in some other action, but nothing 
    ## in this, or in the last section, shall prevent a party calling as a witness the adverse 
    ## party to the action, or a person whose interest is adverae, nor a party being a
    ## witness in the case mentioned in section four hundred and twenty-three.-[Am. 
    ## May 15, 1854; R. S. St. 1851, 113; C. L. 590.
    ## A.B.T. 1128, Sec. 394. 'fhe following persons shall not be witnesses: I. Those 
    ## who are of unsound mind at the .time of their production for examination. 2. Children under ten years of age who, in the opinion of the court, appear 
    ## incapable of receiving just impressions or the facts respeding wl!ich they are
    ## examined, or of relating them truly. 3. Indians or persons having one-half or
    ## more of Indian blo an n or persons having one-half or more of negro
    ## blood, in an action r r n which a white pt!rM>n is a party.(1) 4. Persons against whom jud h been rendered upon a conviction for a felony,
    ## unless pardoned by the governor or such judgment has been reversed on appeal.
    ## [Am. )lay 15, 1854; R. S. SL 1851, 114; C. L. 591.

While these sections do all disqualify witnesses on the basis of race,
they are clearly not word-for-word borrowings. So we would not expect to
detect them as borrowings.

What about borrowings with low scores?

    witness_candidates %>% 
      filter(score > 0) %>% 
      tail()

    ## Source: local data frame [2 x 3]
    ## 
    ##                 a                 b       score
    ##             (chr)             (chr)       (dbl)
    ## 1 IL1866-00003330   IN1843-00002520 0.002702703
    ## 2 CA1858-00000450 WOOD1857-00004280 0.002178649

    content(witness_corpus[["NV1861-00003900"]])

    ## A public officer shall not be examined as a wit.ness to communications made to him in otIicial confidence,
    ## when the public interest would suffer by the disclosure.

    content(witness_corpus[["MT1865-00003240"]])

    ## The issue found may be tried as in other cases, but.
    ## when the defendant denies in his answer any liability on the obligation upon which the judgment was rendered, if a verdict be»found against him, it shall be for the amount remaining unsatisfied»
    ## on such original judgment, with interest thereon.

    content(witness_corpus[["IN1843-00002520"]])

    ## A subpoena may be served by leaving a copy of
    ## the same at the usual place of residence of the witness, unless
    ## he shall have left the county, and his return before the term of
    ## the court is uncertain.
    ## 
    ## SEC'I‘- 250. Where a witness is subpoenaed by copy as alore‘
    ## said, and is attached for contempt in failing to obey such subpazna, the witness shall be purged of such alleged contempt by
    ## stating under oath that such copy did not come to his hands or
    ## knowledge.
    ## 
    ## 1: Snow. 25]. No negro, mulatto or Indian, shall be a witness,
    ## except In pleas of the state against negroes, mulattoes, or Indians, and in civil causes where negroes, mulattoes, or Indians
    ## alone are parties: every person other than a negro having
    ## one-fourth part of negro blood or more, or any one of whose
    ## grandfathers or grandmothers shall have been a negro, shall be
    ## deerried an incompetent witness, within the provisions of this
    ## artic e.
    ## 
    ## ll- Sac-r. 252. The usual mode of administering oaths now prim‘
    ## 
    ## '5; tised in this state, with the ceremony of holding up the hands.
    ## 
    ## shall be observed in all cases in which an oath is to be admm1Stered, except as hereinafter provided.
    ## 
    ## of Snow. 253. Every person who has conscientious scruples
    ## against taking any oath, shall be permitted, instead of swearlllgv
    ## 
    ## solemnly and sincerely to affirm, under the pains and penalties
    ## of perjury.

These are also not borrowings from one another, as expected.

Conclusion
----------

We can conclude that measures of Jaccard similarity do work for
detecting actual borrowings. We will want to set the threshold for LSH
detection relatively low, but above about `0.1`.
