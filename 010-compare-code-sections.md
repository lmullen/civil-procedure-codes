# Test comparing sections of codes
Lincoln Mullen  
September 22, 2015  


```r
library("textreuse")
library("stringr")
library("dplyr")
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

Now we want to compare the sections of the codes to one another. Our hypothesis is that codes are borrowed section by section, so treating individual sections of codes as their own documents means that we should find higher similarities between two borrowed sections of a code than between codes as a whole. Since the sections will be of similar length, we can use the Jaccard similarity measure rather than the ratio-of-matches measure.

We will begin by figuring out the Jaccard similarity scores of a single section that we know to be borrowed, though we do not know all the borrowings. The section involves people who are disqualified from being witnesses, most notably "Indians, or persons having one fourth or more of Indian blood" or "Negroes, or persons having one half or more Negro blood," both "in an action or proceeding to which a white person is a party" (CA 1851). We have identified obvious borrowings by searching the sections. We will create a small corpus of those borrowings and do a pairwise measure of the Jaccard similarity to figure out a good threshold for borrowings. To be clear, all of these sections disallow witnesses, but several of them are clearly not direct borrowings.

## Comparing the sections

Load the sections.


```r
witness_files <- c("NV1861-00003640.txt", "WOOD1857-00004280.txt",
                   "CA1851-00004310.txt", "NV1861-00003900.txt", 
                   "MT1865-00003240.txt", "IN1843-00002520.txt",
                   "IL1866-00003330.txt", "CA1858-00000450.txt", 
                   "CA1850-00003110.txt", "AZ1865-00003640.txt")
witness_paths <- str_c("legal-codes-split/", witness_files)
```

We will load these as a corpus, tokenizing them with 4-grams.


```r
witness_corpus <- TextReuseCorpus(paths = witness_paths, 
                                  tokenizer = tokenize_ngrams, n = 4)
```

Now we will do a pairwise comparison with Jaccard similarity.


```r
witness_comparison <- pairwise_compare(witness_corpus, jaccard_similarity)
```

What are the mean and median values for comparison, as well as the range?


```r
mean(witness_comparison, na.rm = TRUE)
```

```
## [1] 0.05478815
```

```r
median(witness_comparison, na.rm = TRUE)
```

```
## [1] 0.005154639
```

```r
range(witness_comparison, na.rm = TRUE)
```

```
## [1] 0.0000000 0.4954128
```

## Matches

Let's examine the highest and lowest scores, starting with the highest.


```r
witness_candidates <- pairwise_candidates(witness_comparison) %>% 
  arrange(desc(score))
head(witness_candidates, 10)
```

```
## Source: local data frame [10 x 3]
## 
##                  a                 b      score
##              (chr)             (chr)      (dbl)
## 1  AZ1865-00003640   CA1851-00004310 0.49541284
## 2  CA1851-00004310   NV1861-00003640 0.31972789
## 3  AZ1865-00003640   NV1861-00003640 0.31724138
## 4  NV1861-00003640 WOOD1857-00004280 0.15099010
## 5  CA1858-00000450 WOOD1857-00004280 0.15081967
## 6  MT1865-00003240   NV1861-00003640 0.12269939
## 7  CA1851-00004310   MT1865-00003240 0.11551155
## 8  CA1858-00000450   NV1861-00003640 0.11263736
## 9  AZ1865-00003640   MT1865-00003240 0.10197368
## 10 AZ1865-00003640 WOOD1857-00004280 0.08229426
```

We can check the text of some of these codes to see that they are in fact matches.


```r
content(witness_corpus[["CA1851-00004310"]])
```

```
## The following persons shall not be witnesses: ‘
## lst. Those who areof unsound mind at the time of their production for examination:
## 2d. Children under ten years of age, who appear incapable of
## receiving just impressions of the facts respecting which they are
## examined, or of relating them truly: and,
## 3d. Indians, or persons having one fourth or more of Indian
## blood, in an action or proceeding to which a white person is a party:
## 4th. Negroes, or persons having one half or more Negro blood,
## in an action or proceeding to which a white person is a party.
```

```r
content(witness_corpus[["AZ1865-00003640"]])
```

```
## The following persons. shall not. be witnesses:
## 
## 1. Those who are of unsound mind at the timeof their production for
## examination.
## 
## 2. Children under ten years of age, who appear incapable of receiving
## just impressions of the facts respecting which they are examined, or of
## relating them truly; and,
## 
## 3. Indiana or persons having one-half or more of Indian blood, in an
## action or proceeding to which a white person is a party.
## 
## 4. Negroes, or persons having one-half or more negro blood, in an action
## or, proceeding to which a white person is a party.
```

```r
content(witness_corpus[["NV1861-00003640"]])
```

```
## The following persons shall not be witnesses:
## First. Those who are of unsound mind at the time of their
## production for examination. Second. Children under ten
## years of age, who, in the opinion of the court, appear incapable
## of receiving just impressions of the facts respecting which they
## are examined, or of relating them truly. Third. Indians, or
## persons having one half or more of Indian blood, and negroes,
## or persons having one half or more of negro blood, in an action
## or proceeding to which a white erson is a party. Fourth.
## Persons against whom judgment as been rendered upon a
## conviction for a felony, unless ardoned by the governor, or
## such judgment has been reversed on appeal.
```

```r
content(witness_corpus[["WOOD1857-00004280"]])
```

```
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
```

```r
content(witness_corpus[["CA1858-00000450"]])
```

```
## I. .
## 
## OF WITNESSES.
## 
## 391. All persons, without exception, otherwise than as specified in
## in this chapter, may be witnesses in any action or proceeding.
## 
## 1. The court should decide upon the admissibility of a witness, and not refer the
## question to the jur_v.—Tabor v. Staniels, 2 Cal., 240. =
## 
## 2. A book-keeper, as a witness, has a right to refer to the books kept by him, to refresh his memory.—Treadwell v. Wells, 4 Cal., 260.
## 
## 3. Where evidence offered to be given as a defense to the action is excluded by the
## court on the ground that it is not warranted by the pleadings, the party should offer it
## 
## again in mitigation of damages, if he wishes to avail himself of it for that purpose.Travis v. Barger, 26 Barb., 615.
## 
## 392. [1854.] N 0 person offered as a witness shall be excluded on
## account of his opinions on matters of religious belief ; nor shall any
## person be excluded on account of his interest in the event of the action
## or proceedings, except in the following cases:
## 
## 1st. When he is a party to the action or proceeding, or the action
## or proceeding is prosecuted or defended for his immediate benefit.
## 
## 2d. When his interest is a present, certain, and vested interest.
## 
## 0
## 
## person whose interest is adverse, nor a party being a witness in the
## cases mentioned in section four hundred and twenty-three.
## 
## 1. A driver is not acompetent witness for his employer, in an action for negligently
## driving against one, without previously being released by his emp1oyer.—F’inn v. Vallejo
## Wharf 0a., 7 Cal., Jan. T.
## 
## 2. One who has indemnified the sheriff for taking property by virtue of an execution, is not a competent witness for the sherid‘ in defense to a suit against him.—How[and v. W7illetts, 5 Selden, 170.
## 
## 394. [1854.] The following persons shall not be witnesses :
## 
## 1st. Those who are of unsound mind at the time of their production
## for examination ; 9
## 
## 2d. Children under ten years of age, who, in the opinion of the
## court appear incapable of receiving just impressions of the facts respecting which they are examined, or of relating them truly;
## 
## 3d. Indians, orpersons having one-half or more of indian blood, and
## negroes, or persons having one-half or more of negro blood, in an action or proceeding to which a White person is a party ;
## 
## 4th. Persons against whom judgment has been rendered upon a
## conviction for a felony, unless pardoned by the Governor, or such judgment has been reversed on appeal.
## 
## 1. 3d. Held to apply to Chinese.—People v. Hall, 4 Cal., 399.
## 
## 395. A husband shall not be a witness for or against his Wife, nor
## a wife a witness for or against her husband ; nor can either, during the
## marriage, or afterwards, be, without the consent of the other, examined as to any communication made by one to the other during the
## marriage’. But this exception shall not apply to an action or proceeding by one against the other.
## 
## 396. An attorney or counselor, shall not, without the consent of
## his client, be examined as a witness as [to] any communication made by
## the client to him, or his advice given thereon, in the course of professional employment.
## 
## 1. Landsberger v. Gorham, 5 Cal., 450.
## 
## 397. A clergyman or priest shall not, without the consent of the
## person making the confession, be examined as a witness as to any confession made to him in his professional character, in the course of discipline enjoined by the church to which he belongs.
## 
## 398. A licensed physician or surgeon shall not, without the consent of his patient, be examined as a witness, as to any information
## acquired in attending the patient, which was necessary to enable him
## to prescribe or act for the patient.
## 
## 399. A public oiiicer shall not be examined as a witness as to communications made tohim in official confidence, when the public interest
## would suffer by the disclosure.
## 
## 400. The judge himself or any juror, may be called as a witness
## by either party ; but in such case it shall be in the discretion of the
## court or judge to order the trial to be postponed or suspended, and to
## take place before another judge or jury.
## 
## 401. When a witness does not understand and speak the English
## language, an interpreter shall be sworn to interpret for him.
```

```r
content(witness_corpus[["MT1865-00003240"]])
```

```
## The following persons shall be incompetent to testify:
## First, Persons who are of an unsound mind at the time of their
## production for examination. Second, Children under ten years of
## age who appear incapable‘ of receiving just impressions of the facts
## respecting which they are examined or of relating them truly, but
## the court in its discretion may allow such children to testify, and
## the facts herein enumerated shall go to their credibility. Third,
## Husband or wife for or against each other, or concerning any communication made by one to the other during the marriage, whether
## called as a witness while that relation existed or afterwards.
## Fourth, An attorney concerning any communication made to him
## by his client in that relation, or his advice thereon, without the
## client’s consent. Fifth, A clergyman or priest concerning any
## confession made to him, in his professional character, in the course
## of discipline enjoined by the church to which he belongs, without
## the consent of the person making the confession. Sixth, A negro,
## Indian, or Chinaman, where the parties to the action are white
## 
## persons, but if the parties to an action or either of the parties is
## an Indian, negro, or Chinaman, a negro may be introduced as a
## witness against such negro, an Indian against such Indian, or a
## Chinaman against such Chinaman. A negro within the meaning
## of this act is a person having one-eighth or more of negro blood,
## an Indian is a person having one-half or more of Indian blood, and
## a Chinaman is a person having one-half or more Chinese blood.
```

These are all valid matches, despite the presence in some cases of extraneous texts, such as tables of contents. Ideally this extra text would be removed by sectioning the codes, but since sectioning is an inexact process, it is good that we can detect matches even with OCR and sectioning problems.

## Mismatches

The mismatches are either matches with a score of `0`, or very low scores.


```r
tail(witness_candidates, 5)
```

```
## Source: local data frame [5 x 3]
## 
##                 a                 b score
##             (chr)             (chr) (dbl)
## 1 IL1866-00003330   NV1861-00003900     0
## 2 IL1866-00003330 WOOD1857-00004280     0
## 3 IN1843-00002520   MT1865-00003240     0
## 4 IN1843-00002520   NV1861-00003640     0
## 5 IN1843-00002520 WOOD1857-00004280     0
```

Are these documents with a score of zero actually different documents?


```r
content(witness_corpus[["IL1866-00003330"]])
```

```
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
```

```r
content(witness_corpus[["IN1843-00002520"]])
```

```
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
```

```r
content(witness_corpus[["NV1861-00003900"]])
```

```
## A person for whose immediate benefit the action ;
## is prosecuted, or defended, though not a party to the action, 1
## may be examined as a witness in the same manner, and subjecti
## to the same rules of examination as if he were named as a.
## party. And a party to an action or proceeding, may be examined as a witness in his own behalf, the same as any other
## witness; but such examination shall not be had, nor shall any
## other person for whose immediate benefit the same is prosecuted or defended, be so examined, unless the adve'rse party,
## or person in interest, is living, nor when the opposite party
## shall be the assignee, administrator, executor, or legal representative of a deceased person, nor unless ten days’ notice of
## such. intended examination of the party or person interested,
## 
## specifying the points upon which such party or person is
## intended to be examined, shall be given in writing to the
## adverse party, except that in special proceedings of a summary
## nature, such reasonable notice of such intended examination
## shall be given as shall be prescribed by the court or judge.
## And when notice of such intended examination shall be given
## in an action or proceeding, in which the opposite party shall
## reside out of the jurisdiction of the court, such party may be
## examined by commission issued and executed as now rovided
## by law; and whenever a party or person in interest, has been
## examined under the provisions of this section, the other party
## or person in interest, may offer himself as a witness in his own
## behalf, and shall be so received. When an assignor in a thing
## in action, or contract, is examined as a witness on behalf of any
## person deriving title through, or from him, the ad verse party
## may offer himself as a witness to the same matter in his own
## behalf, and shall be so received, and to any matter that will
## discharge him from any liability that the testimony of the
## assignor tends to render him liable for. But such assignor
## shall not be permitted to be examined on behalf of any person
## deriving title through, or from him, against an assignee, or an
## executor or administrator, unless the other party to such contract, or thing in action, whom the defendant or plaintifff represents, is living, and his testimony can be procured for such
## examination; nor at least ten days’ notice of such intended
## examination of the assignor, specifying the points upon which
## he is intended to be examined, shall be given in writing to the
## adverse party. This section shall not be held to impair, or in
## any way affect the existing provisions of law bv which persons
## of Indian, or negro blood, are excluded from being witnesses.
```

```r
content(witness_corpus[["WOOD1857-00004280"]])
```

```
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
```

While these sections do all disqualify witnesses on the basis of race, they are clearly not word-for-word borrowings. So we would not expect to detect them as borrowings.

What about borrowings with low scores?


```r
witness_candidates %>% 
  filter(score > 0) %>% 
  tail()
```

```
## Source: local data frame [6 x 3]
## 
##                 a               b       score
##             (chr)           (chr)       (dbl)
## 1 NV1861-00003640 NV1861-00003900 0.003937008
## 2 CA1850-00003110 IN1843-00002520 0.003484321
## 3 IL1866-00003330 IN1843-00002520 0.002702703
## 4 CA1858-00000450 IL1866-00003330 0.002392344
## 5 IN1843-00002520 NV1861-00003900 0.001587302
## 6 MT1865-00003240 NV1861-00003900 0.001531394
```


```r
content(witness_corpus[["NV1861-00003900"]])
```

```
## A person for whose immediate benefit the action ;
## is prosecuted, or defended, though not a party to the action, 1
## may be examined as a witness in the same manner, and subjecti
## to the same rules of examination as if he were named as a.
## party. And a party to an action or proceeding, may be examined as a witness in his own behalf, the same as any other
## witness; but such examination shall not be had, nor shall any
## other person for whose immediate benefit the same is prosecuted or defended, be so examined, unless the adve'rse party,
## or person in interest, is living, nor when the opposite party
## shall be the assignee, administrator, executor, or legal representative of a deceased person, nor unless ten days’ notice of
## such. intended examination of the party or person interested,
## 
## specifying the points upon which such party or person is
## intended to be examined, shall be given in writing to the
## adverse party, except that in special proceedings of a summary
## nature, such reasonable notice of such intended examination
## shall be given as shall be prescribed by the court or judge.
## And when notice of such intended examination shall be given
## in an action or proceeding, in which the opposite party shall
## reside out of the jurisdiction of the court, such party may be
## examined by commission issued and executed as now rovided
## by law; and whenever a party or person in interest, has been
## examined under the provisions of this section, the other party
## or person in interest, may offer himself as a witness in his own
## behalf, and shall be so received. When an assignor in a thing
## in action, or contract, is examined as a witness on behalf of any
## person deriving title through, or from him, the ad verse party
## may offer himself as a witness to the same matter in his own
## behalf, and shall be so received, and to any matter that will
## discharge him from any liability that the testimony of the
## assignor tends to render him liable for. But such assignor
## shall not be permitted to be examined on behalf of any person
## deriving title through, or from him, against an assignee, or an
## executor or administrator, unless the other party to such contract, or thing in action, whom the defendant or plaintifff represents, is living, and his testimony can be procured for such
## examination; nor at least ten days’ notice of such intended
## examination of the assignor, specifying the points upon which
## he is intended to be examined, shall be given in writing to the
## adverse party. This section shall not be held to impair, or in
## any way affect the existing provisions of law bv which persons
## of Indian, or negro blood, are excluded from being witnesses.
```

```r
content(witness_corpus[["MT1865-00003240"]])
```

```
## The following persons shall be incompetent to testify:
## First, Persons who are of an unsound mind at the time of their
## production for examination. Second, Children under ten years of
## age who appear incapable‘ of receiving just impressions of the facts
## respecting which they are examined or of relating them truly, but
## the court in its discretion may allow such children to testify, and
## the facts herein enumerated shall go to their credibility. Third,
## Husband or wife for or against each other, or concerning any communication made by one to the other during the marriage, whether
## called as a witness while that relation existed or afterwards.
## Fourth, An attorney concerning any communication made to him
## by his client in that relation, or his advice thereon, without the
## client’s consent. Fifth, A clergyman or priest concerning any
## confession made to him, in his professional character, in the course
## of discipline enjoined by the church to which he belongs, without
## the consent of the person making the confession. Sixth, A negro,
## Indian, or Chinaman, where the parties to the action are white
## 
## persons, but if the parties to an action or either of the parties is
## an Indian, negro, or Chinaman, a negro may be introduced as a
## witness against such negro, an Indian against such Indian, or a
## Chinaman against such Chinaman. A negro within the meaning
## of this act is a person having one-eighth or more of negro blood,
## an Indian is a person having one-half or more of Indian blood, and
## a Chinaman is a person having one-half or more Chinese blood.
```

```r
content(witness_corpus[["IN1843-00002520"]])
```

```
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
```

These are also not borrowings from one another, as expected.

## Conclusion

We can conclude that measures of Jaccard similarity do work for detecting actual borrowings. We will want to set the threshold for LSH detection relatively low, but above about `0.1`.
