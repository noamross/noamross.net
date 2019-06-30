---
title: Great Moments in Logic

author: Greg Restall
published: true
type: published
status: Online only
citation: "&ldquo;Great Moments in Logic&rdquo; published online, 2004."
tag: logicians
subjects: history classical_logic intuitionistic_logic modal_logic
comments: yes
date: 2004-01-05
publishdate: 2004-01-05
filter:
  - erb
  - markdown
  - rubypants
---
<h3>Bernhard Bolzano (1781-1848)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Bolzano.jpg" alt="[Image of Bolzano]" />
Bolzano was a philosopher, mathematician and logician who had important things to contribute in each of these fields. He&#8217;s probably <em>best</em> known for what he has done in <a href="http://www.shu.edu/projects/reals/history/bolzano.html">mathematics</a>: the precise definition of continuity when it comes to real-valued functions. But for my money (and in my discipline) Bolzano was worth much more than this. He was the first philosopher to give a precise <em>analysis</em> of logical consequence in terms we would recognise today. </p>

<p>(This was important for his project of understanding mathematics, and making it clearer, because mathematicians were getting into knots considering <em>infinite</em> numbers, <em>infinitesimal</em> numbers, and many other seemingly paradoxical things. The 1800s involved mathematicians painstakingly going over old reasoning step-by-step to see if (and how) the reasoning worked, and to see where it might go wrong. You can really only do this if you have a good understanding of how reasoning works. This is what Bolzano was trying to supply.) </p>

<p>Anyway, he argued that you can tell that an argument from premises to a conclusion is logically <em>valid</em> if and only if it never proceeds from truth to falsity no matter how you change the non-logical vocabulary in the argument. So </p>

<blockquote>
	<p>Sally is coming to the party. <br />
	If Sally is coming to the party, Jim will be happy. <br />
	Therefore Jim will be happy. </p>
</blockquote>

<p>is <em>valid</em> because we will never step from truth to falsity no matter how we change the subject matter. For example </p>

<blockquote>
	<p>Sally is joining the army. <br />
	If Sally is joining the army, she is putting her life at risk.  </p>
</blockquote>

<p>Therefore Sally is putting her life at risk. </p>

<p>works too. In fact any argument with the shape </p>

<blockquote>
	<p>If <em>p</em> then <em>q</em> <br />
	<em>p</em> <br />
	Therefore <em>q</em></p>
</blockquote>

<p>works just as well. Note that the closely related shape </p>

<blockquote>
	<p>If <em>p</em> then <em>q</em> <br />
	<em>q</em> <br />
	Therefore <em>p</em></p>
</blockquote>

<p>doesn&#8217;t work, and we can see that it doesn&#8217;t work by looking at an example: </p>

<blockquote>
	<p>If it&#8217;s Thursday then it&#8217;s a weekday <br />
	It&#8217;s a weekday <br />
	Therefore it&#8217;s Thursday </p>
</blockquote>

<p>This works <em>sometimes</em> but not <em>all</em> the time. The premises are true but the conclusion is false on a <em>Friday</em> for example. </p>

<p>Now, it&#8217;s still very much an open question as to what you are allowed to change, and what you should keep fixed when you&#8217;re testing an argument. Bolzano is really interesting here, because he says that it&#8217;s entirely a matter of convention. Different rules will give you a different story when it comes to what&#8217;s valid and what&#8217;s not. And that is pretty <a href="http://pluralism.pitas.com">appealing to me</a>. </p>

<p>Anyway, Bolzano&#8217;s analysis of logical consequence is a great step in the direction of constructing modern formal logic. We&#8217;ll see more of where it leads soon. </p>

<p>Read some more about Bolzano at the <a href="http://www.shu.edu/projects/reals/history/bolzano.html">Interactive Real Analysis</a> website.</p>

<h3>George Boole (1815-1864)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Boole.jpg" alt="[Image of Boole]" />Boole&#8217;s book <em><a href="http://www.amazon.com/exec/obidos/ASIN/0486600289/consequentlyorg">The Laws of Thought</a></em> (1854) is a landmark in the <em>algebraic</em> treatment of logic. That is, he showed how treating propositions or statements like <em>quantities</em> results in a pleasing formal structure. </p>

<p>The ideas are simple. For every proposition <em>x</em> there is its negation (or denial) <em>~x</em>. The negation of a negation is the original statement (to deny <em>~x</em> is to say no more or no less than <em>x</em>) so <em>~~x</em> is identical to <em>x</em>. Negation acts sort-of like minus with regards to numbers. (Sort-of, anyway.) Similarly, for statements <em>x</em> and <em>y</em> we can form their <em>conjunction</em> <em>x and y</em> and their disjunction <em>x or y</em>. (To make the algebraic connection clear, Boole used <em>xy</em> for the conjunction of <em>x</em> and <em>y</em>, and <em>x+y</em> for the disjunction of <em>x</em> and <em>y</em>.) Then <em>x or y</em> is identical to <em>y or x</em> and <em>x or (y and z)</em> is identical to <em>(x or y) and (x or z)</em>. This makes <em>and</em> and <em>or</em> look a lot like multiplication and addition. But the analogy is at most an analogy, because unlike the case with multiplication and addition <em>x and x</em> and <em>x or x</em> are just <em>x</em>, and <em>~(x and y)</em> is <em>~x or ~y</em>. </p>

<p>Boole characterised laws that he thought <em>all</em> systems of propositions must satisfy, and the resulting structures are called <em>Boolean Algebras</em> in his honour. They&#8217;re important concepts to this day. </p>

<p>Here&#8217;s more on Boole: Entries in the <a href="http://www.xrefer.com/entry.jsp?xrefid=551472">Oxford Companion to Philosophy</a>, and the <a href="http://www.xrefer.com/entry.jsp?xrefid=494061">Oxford Dictionary of Scientists</a>. Then there&#8217;s <a href="http://www.amazon.com/exec/obidos/ASIN/0486684830/consequentlyorg">Boolean Algebra and its Applications</a> showing some hints of where his research has gone today, and Boole&#8217;s original book <em>Laws of Thought</em> is <a href="http://www.amazon.com/exec/obidos/ASIN/0486600289/consequentlyorg">still available today</a>!</p>

<h3>Georg Cantor (1845-1918)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Cantor.jpg" alt="[Image of Cantor]" />Georg Cantor conquered the <em>infinite</em>. Well, maybe he didn&#8217;t <em>conquer</em> it, but at least gave us a new way of conceptualising infinite quantities, and this is an amazing feat however you look at it. </p>

<p>Everyone agrees that some collections are infinite and some are not. The collection {1,2,3} of the first three counting numbers is <em>finite</em>, it&#8217;s <em>bounded</em>. But the collection {1,2,3,4,5,&#8230;} of <em>all</em> the counting numbers is not finite. It&#8217;s <em>infinite</em> or <em>unbounded</em>, it never comes to an end. Cantor showed that this is not the end of the story at all. He showed that there are <em>bigger</em> and <em>bigger</em> infinite numbers. </p>

<p>Hold on, you might say, how can things be bigger than <em>infinite</em>? Isn&#8217;t an infinite collection as big as you can get? Cantor&#8217;s answer is a surprising (qualified) <em>no</em>. It&#8217;s qualified because if by &#8220;infinite&#8221; you simply mean &#8220;not finite&#8221; then there&#8217;s nothing bigger than <em>infinite</em>. However, if you mean to say that there are no collections of things bigger than the collection {1,2,3,4,5,&#8230;} of all counting numbers, then Cantor can show that you&#8217;re wrong. But to do this, he needs to explain a little more about what we mean by &#8220;bigger than&#8221; and &#8220;smaller than&#8221; and &#8220;same size as&#8221; when it comes to collections. </p>

<p>This is pretty straightforward when it comes down to it. Two collections are the <em>same size</em> when you can correlate things from one collection with things from the other collection. So, {1, 2, 3} is the same size as {Christine, Greg, Zachary}. These collections have the same size as we can pair them up: Christine (1), Greg (2), Zachary (3). </p>

<p>One collection is <em>at least as big as</em> another collection if you can pair the things in the second up with things in the first, and maybe have things in the first collection left over. So, for example {Christine, Greg, Zachary} is at least as big as {1,2} because we can pair up Christine (1), Zachary (2) and have me left over, uncounted. </p>

<p>One collection <em>A</em> is <em>smaller than</em> another collection <em>B</em> just when <em>A</em> is not at least as big as <em>B</em>. So, <em>A</em> is smaller than <em>B</em> if there&#8217;s no way of pairing things from <em>A</em> with things from <em>B</em> with some things from <em>A</em> (possibly) left over. We try to pair <em>A</em> things with <em>B</em> things, but we&#8217;ve not got enough <em>A</em> things to go around to match up the <em>B</em> things. </p>

<p>This round-about-way of defining things is important, because Cantor wants to say that the collection {1,2,3,4,5,&#8230;} of all counting numbers is <em>the same size as</em> {2,4,6,8,&#8230;} of all <em>even</em> numbers, even though the even numbers are inside the counting numbers with some left over. You&#8217;d think that this means that the even numbers are fewer in number than the counting numbers, but this contradicts our first definition that two collections are the <em>same</em> size if they can be paired up. We can pair up all the numbers with the even numbers like this: 1 with 2, 2 with 4, 3 with 6, &#8230; <em>n</em> with 2 times <em>n</em>. </p>

<p>This is all good fun stuff (and it&#8217;s <em>mind-bending</em> when you <a href="http://ubertas.infosys.utas.edu.au/mathemagicians&#95;circle/table3.html">think about what you can do with these infinite collections</a>) but it&#8217;s not even the start of Cantor&#8217;s real discovery. Cantor&#8217;s best work was in showing that there had to be collections <em>bigger than</em> the collection {1,2,3,&#8230;}. This is a truly tricky piece of reasoning, but I think I can explain it. Remember how you can represent <em>real numbers</em> between 0 and 1 as <em>decimals</em>, numbers like 0.5, or 0.32, or infinite repeating ones like 0.333333&#8230; (that&#8217;s 1/3) or even infinite non-repeating ones like 0.14159&#8230; (that&#8217;s pi minus 3). Now Cantor showed that the collection of all real numbers between 0 and 1 is <em>truly bigger than</em> the collection of counting numbers. Here&#8217;s how he did it. He said, suppose that you <em>did</em> have a list of all of these numbers: then this list would contain <em>all</em> the numbers between 0 and 1. It would look something like this: </p>

<blockquote>
	<p>0.12345145&#8230;</p>
	<p>0.11111111&#8230;</p>
	<p>0.34989901&#8230;</p>
    <p>0.31415926&#8230;</p>
    <p>0.88888888&#8230;</p>
    <p> . </p>
    <p> . </p>
    <p> . </p>
</blockquote>

<p>but now, I&#8217;ll show you a number that <em>can&#8217;t</em> be on the list. Take the first digit (after the decimal point) in the first number, the second in the second number, the third in the third number and so on. You should be focussing on <em>these</em> digits </p>

<blockquote>
	<p>0.<strong>1</strong>2345145&#8230;</p>
	<p>0.1<strong>1</strong>111111&#8230;</p>
	<p>0.34<strong>9</strong>89901&#8230;</p>
	<p>0.314<strong>1</strong>5926&#8230;</p>
	<p>0.8888<strong>8</strong>888&#8230;</p>
	<p> .</p>
	<p> .</p>
	<p> .</p>
</blockquote>

<p>Now, make a new number out of these digits, changing each one by adding one (and if a digit is 9, go back to zero). So the number we get is </p>

<blockquote>
	<p>0.22029&#8230;</p>
</blockquote>

<p>and <em>this</em> number could not be in our original list of numbers, because it is not the same as any number on the list. (The <em>n</em>th number on the list differs from this number in the <em>n</em>th place.) So, the list you <em>said</em> was exhaustive, numbering all of the numbers, isn&#8217;t. </p>

<p>That is Cantor&#8217;s <em>diagonalisation argument</em>, and it&#8217;s a truly creative piece of work, showing that there are different infinite sizes of collections. The argument can be made more general, to show that for <em>any</em> collection there is one bigger, and that&#8217;s a mindboggling fact which we still haven&#8217;t truly come to understand. (If you <em>think</em> you understand it, ask yourself this: what happens when you apply it to the collection of <em>everything that there is</em>?) </p>

<p>Here&#8217;s more about Cantor at <a href="http://www-maths.mcs.st-andrews.ac.uk/history/Mathematicians/Cantor.html">The St. Andrews History of Mathematics Site</a> and the <a href="http://www.shu.edu/projects/reals/history/cantor.html">Interactive Real Analysis</a> site.</p>

<h3>Gottlob Frege (1848-1925)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Frege.jpg" alt="[Image of Frege]" />Gottlob Frege is rightly called the <em>father of modern logic</em>. He helped set the tone and direction for the way we study logic to this day. Like many people who made their mark in logic, by training he was a mathematician, but his interests were also philosophical. He realised that the formal techniques of mathematics were good for representing things precisely, but that there were still many more gains to be made. In particular he thought that languages like German (his native language) and English and any other language we actually speak, is filled with ambiguities, inconsistencies and features which lead us astray. In particular, the similar structures of claims like </p>

<ul>
<li>Socrates is mortal. </li>
<li>A human is mortal. (Or &#8220;Humans are mortal&#8221;, if you prefer.) </li>
<li>No-one is mortal. </li>
</ul>

<p>lead us to think that the same kinds of things are being said in each case: we predicate mortality of Socrates, humanity and no-one in the three statements. Frege thought this was simply crazy, and that the <em>real</em> structure of what you&#8217;re saying in each case is rather different. In the first case, we indeed predicate mortality of the person Socrates. In the second case we&#8217;re not predicating <em>mortality</em> of anything in particular (or anything in general). According to Frege what we&#8217;re doing is very different: we&#8217;re saying that another statement is <em>universally satisfied</em>. What statement is this? It&#8217;s the statement <em>if x is human, x is mortal</em>. In saying that humans are mortal, I&#8217;m saying that <em>if x is human, x is mortal</em> is true for any <em>x</em> I choose. Or more swiftly <em>for all x: if x is human, x is mortal</em>. And <em>this</em> is nothing like the claim that Socrates is mortal. It has a very different structure. </p>

<p>The claim that no-one is mortal has a similar feature. It says not that a particular thing (that is, <em>no-one</em>) is mortal, but rather that the claim <em>x is someone who is mortal</em> is <em>not</em> satisfied. If you like <em>for some x: x is someone who is mortal</em> is <em>not</em> true. </p>

<p>Frege thought that this new way of analysing expressions gets closer to the real structure of the concepts involved. The new way of writing expressions &#8212;- making the form you write closer to the forms the concepts actually have &#8212;- is Frege&#8217;s <em>Begriffschrift</em>, his &#8220;Concept Script&#8221;. This notation looks very weird (there&#8217;s lots of lines going all over the place, and funny letters in different places) but it&#8217;s almost identical in content to the language we now call First-Order Logic, or <em>Predicate Logic</em>, and which we teach to our introductory logic students. Frege&#8217;s insights have stayed with us to this day. </p>

<p>There&#8217;s an entry on Frege in the <a href="http://www.xrefer.com/entry/552123">Oxford Companion to Philosophy</a>. You can get Anthony Kenny&#8217;s clear introduction <a href="http://www.amazon.com/exec/obidos/ASIN/0631222316/consequentlyorg/">Frege</a> at Amazon. Both are worth reading. </p>


<h3>Alexius Meinong (1853-1920)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Meinong.jpg" alt="[Image of Meinong]" />Frege&#8217;s analysis of expressions helps deal with <em>some</em> of the weird confusions you can get into with language: when you know that a expressions like &#8220;Socrates&#8221;, &#8220;somebody&#8221;, &#8220;everybody&#8221; and &#8220;nobody&#8221; work very differently, you won&#8217;t get so confused wondering whether the word &#8220;somebody&#8221; refers to a person, and if so, what kind of person he or she is (male, female, tall, short, logician, whatever). No, you&#8217;ll realise that terms like &#8220;somebody&#8221;, &#8220;everybody&#8221; and &#8220;nobody&#8221; don&#8217;t contribute to expressions by <em>referring</em> to things, but by doing something else: they <em>quantify</em> over things. </p>

<p>Meinong agreed with all of that, but he thought that sometimes there are expressions which genuinely <em>do</em> refer to things, and what they refer to tells us something important about what there <em>is</em>. He was one of those philosophers who thought that language, when properly understood, is a guide to <em>ontology</em>. One place where Meinong disagreed with many other philosophers was in the kind of ontology he was prepared to admit on the basis of language. For Meinong, a claim like &#8220;I&#8217;m thinking of a golden mountain&#8221; might be true, and it&#8217;s true because there&#8217;s something I&#8217;m thinking of. What is it I&#8217;m thinking of? It&#8217;s a golden mountain. So, there&#8217;s a golden mountain that I&#8217;m thinking about. Now, <em>are</em> there any golden mountains? Do any of them <em>exist</em>? I don&#8217;t think so. It follows that (for Meinong) there are two grades of being. There&#8217;s the kind of being that absolutely everything has, golden mountains, square circles, fictional characters, tables, chairs, you and me. And then there&#8217;s the kind of being that fewer things have: <em>genuine existence</em>. You and I exist (that is, if you&#8217;re not a fictional character reading this) but fictional characters, square circles and golden mountains don&#8217;t <em>exist</em>. We can think <em>about</em> them, and they have some properties, says Meinong, but <em>existence</em> is not one of them. </p>

<p>This is a bold claim, and it&#8217;s easy to see why some people don&#8217;t follow Meinong in this view. Why should language guide ontology in this way? (Of course, this is a general technique used by many analytic philosophers to this day. &#8220;For our speech about <em>x</em> to make any sense, we need to posit the existence of things such as <em>y</em>&#8230;&#8221;) But I think there&#8217;s much more of a problem with the view as stated. For Meinong, the golden mountain is golden, and it&#8217;s a mountain, because that&#8217;s how I&#8217;ve characterised it. But it doesn&#8217;t exist (there aren&#8217;t any golden mountains). Now, what if I try to characterise the <em>existing</em> golden mountain. It&#8217;s golden, it&#8217;s a mountain, but does it <em>exist</em>? No. So some ways of characterising things work, and others don&#8217;t. What&#8217;s the difference? It&#8217;s a tricky question, and it&#8217;s one that Meinong never really answered. </p>

<p>There&#8217;s an entry on Meinong in the <a href="http://www.xrefer.com/entry/552771">Oxford Companion to Philosophy</a>, and it&#8217;s a real shame that both Karel Lambert&#8217;s <a href="http://www.amazon.com/exec/obidos/ASIN/0521250854/consequentlyorg">Meinong and the Principle of Independence</a> and Richard Routley&#8217;s <a href="http://www.amazon.com/exec/obidos/ASIN/0909596360/">Exploring Meinong&#8217;s Jungle</a>, the two best books on Meinong&#8217;s ontology, are pretty hard to get. You&#8217;ll have to steal them from me, I suppose. </p>


<h3>Giuseppe Peano (1858-1932)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Peano.jpg" alt="[Image of Peano]" />Guiseppe Peano was an Italian mathematician, remembered for what are called &#8216;Peano&#8217;s Axioms&#8217;, giving the properties of the numbers 0, 1, 2, 3,&#8230; and the operations of successor (going to the next number), addition and multiplication. The axioms group into sections. The first few govern zero and successor: </p>

<ul>
<li>0 is a number which is not the successor of any number </li>
<li>every number has just one successor which is a number </li>
<li>and that no two numbers have the same successor. </li>
</ul>

<p>Then for <em>addition</em> we have two axioms: </p>

<ul>
<li>x added to 0 is x. </li>
<li>x added to the successor of y is the successor of (x added to y) </li>
</ul>

<p>And for <em>multiplication</em> we have two more axioms: </p>

<ul>
<li>x multiplied by 0 is 0 </li>
<li>x multiplied by the successor of y is (x multiplied by y) added to x </li>
</ul>

<p>Both batches of axioms tell you how the operation works by showing how it works at the <em>bottom</em> of the scale (how to add zero or multiply by zero), and then it shows you how to do it higher up the scale (adding the successor of a number, or multiplying by the successor of a number) in terms of how it works lower down the scale. </p>

<p>Let&#8217;s see one example. Here&#8217;s how the axioms tell you what you get when you add 2 and 3. 2 is the successor of the successor of zero, so let&#8217;s write that &#8220;ss0&#8221;, and 3 is the successor of the successor of the successor of zero, so let&#8217;s write that &#8220;sss0&#8221;. In general, if x is some number, let&#8217;s write &#8220;sx&#8221; for the successor of x. </p>

<p>So, to get ss0 + sss0, the rules say that this is the same number as s(ss0 + ss0), because we&#8217;re adding sss0 (which is the successor of ss0) to ss0, so the result is the successor of the smaller addition (ss0+ss0). Let&#8217;s display this so that we can see it: </p>

<blockquote>
	<p>ss0+sss0 = s(ss0+ss0) </p>
</blockquote>

<p>Now, what&#8217;s ss0 + ss0? The process is the same: ss0+ss0 = s(ss0+s0). The rules say we can trade an &#8220;s&#8221; on the right of an addition sign in for one outside the whole addition. So, we get </p>

<blockquote>
	<p>ss0+sss0 = s(ss0+ss0) = ss(ss0+s0) </p>
</blockquote>

<p>But we can do this one more time. ss0+s0 = s(ss0+0), so </p>

<blockquote>
	<p>ss0+sss0 = s(ss0+ss0) = ss(ss0+s0) = sss(ss0+0) </p>
</blockquote>

<p>But now, we know that ss0 + 0 = ss0, since adding zero gets you <em>nowhere new</em>. So, </p>

<blockquote>
	<p>ss0+sss0 = s(ss0+ss0) = ss(ss0+s0) = sss(ss0+0)= sssss0 </p>
</blockquote>

<p>But sssss0 is how we write <em>5</em>, and indeed we&#8217;ve shown that 2+3=5. </p>

<p>You can show lots more things with these axioms, but they don&#8217;t do everything Peano wanted to think about. In particular, for any numbers x and y at all, you can show that x + y = y + x. However, with these axioms as they stand, you <em>can&#8217;t</em> show that for every number x and y, x + y = y + x. Do you get the difference here? The first says I&#8217;ve got a proof for every instance. The second says that I&#8217;ve got a proof for the general rule. That&#8217;s a different thing completely. To show that you&#8217;ve got a proof for the general rule we need something to say that whatever we can prove for the instances of numbers we can pick (0, s0, ss0, etc) goes for all of the numbers. A rule which does this is the rule of <em>induction</em>. </p>

<ul>
<li>If something holds of 0, and if whenever it holds of a number it also holds of the successor of that number, then it holds of all the numbers. </li>
</ul>

<p>This rule assures us that we can prove statements about <em>all</em> the numbers, like the statement that the order of addition doesn&#8217;t matter. </p>

<p>Now, proofs of facts using Peano&#8217;s rules are <em>extremely longwinded</em>, and you might be wondering what this is good for. After all, I already <em>knew</em> that 2+3=5, and I think you did too. Peano&#8217;s rules don&#8217;t explain what we <em>do</em> when we count or add or multiply. They&#8217;re intened to distill to their essence the postulates which govern the counting, adding and multiplying process, even if they&#8217;re not the rules we actually follow when we do things. (There are many different ways of learning to multiply. But if you don&#8217;t agree with Peano&#8217;s rules and get the same results as Peano does for his answers, then you&#8217;re either making a mistake, or you&#8217;re doing something other than counting.) Peano&#8217;s work was essential in clarifying and codifying what counting, adding and multiplying actually involves, and it is another great moment in the work of logicians in the 19th and 20th Centuries. </p>

<p>Peano&#8217;s axioms for arithmetic weren&#8217;t actually <em>first</em> invented by Peano: The great mathematician Dedekind was responsible for the axioms which Peano took up, clarified, detailed and explained, and it was through Peano that the work was disseminated to Russell and Whitehead and their magnificent <em>Principia Mathematica</em> which shaped a lot of work in the 20th Century. </p>

<p>I find it charming that Peano didn&#8217;t just do lots of mathematics and logic. The <a href="http://www.xrefer.com/entry/494994">Oxford Dictionary of Scientists entry on Peano</a> tells us that &#8220;among his extramathematical interests he was a keen propagandist for a proposed international language, Interlingua, which he had developed from Volapuk.&#8221; Quaint. </p>

<p>Here&#8217;s more on Peano from <a href="http://www.xrefer.com/entry.jsp?xrefid=553105">Oxford Companion to Philosophy</a>, and the <a href="http://www.xrefer.com/entry/494994">Oxford Dictionary of Scientists</a>. The hard core among my readers might like to read <a href="http://www.mat.bham.ac.uk/R.W.Kaye/">Richard Kaye</a>&#8217;s wonderful <a href="http://www.amazon.com/exec/obidos/ASIN/019853213X/consequentlyorg">Models of Peano Arithmetic</a>. </p>


<h3>Edmund Husserl (1859-1938)</h3>
<p><img class="logician" src="http://consequently.org/images/logicians/Husserl.jpg" alt="[Image of Husserl]" />What? Husserl wasn&#8217;t a logician, he was a phenomenologist! That&#8217;s the cry of my dedicated analytic philosopher readers. But a response like this is to presume that things in the turn of the 19th/20th Century looked to their inhabitants rather like <em>we</em> think they should, looking back from beyond the great divide between so-called-analytic and so-called-continental philosophy. Husserl couldn&#8217;t have conceived of such a division, and as far as I can tell, he&#8217;s pretty much an <em>analytic</em> philosopher along with Russell, Wittgenstein, and the rest of the gang. (And hey, didn&#8217;t Frege live on the continent? And didn&#8217;t half of the rest of them? It&#8217;s a crazy distinction, the analytic/continental one when you think of it.) </p>

<p>But why does Husserl warrant a place on my list of great moments in logic? For two reasons. The first is to mourn what might have been. The so-called split which means that people interested in <em>phenomenology</em> (a detailed analysis of phenomena, the structure of appearance, bracketing out questions of existence) can&#8217;t talk to people interested in <em>logic</em> is a very sad one. Looking back to Husserl who was active before such a split occured makes me wistful for <em>what might have been</em> and hopeful for <em>what could yet be</em>. Husserl, the great phenomenologist and the one who inspired Heidegger, Sartre and many others, was a student and assistant of the great mathematician Karl Weierstrass, and for fifteen years he was a colleague and close friend of Georg Cantor. </p>

<p>But Husserl is important too for what he has achieved and what we can learn from him. For Husserl, along with Frege and others helped get logic out of the quagmire of <em>psychologism</em> (I&#8217;m showing my cards here by the way I describe this, aren&#8217;t I?). You can see the confusion even in someone as great as Boole. He calls the laws of logic the <em>Laws of Thought</em>. And that is confusing because it could mean at least two very different things. Either you mean the laws governing how people reason (like laws of physics, which are intended to describe how objects move and interact) or the laws governing how people <em>ought to reason</em>. Only the latter kind of analysis gets the connection between logic and thought right, only it gives logic it&#8217;s kind of <em>normative</em> edge, and only this gets the phenomena of teaching first-year logic correct. (If logic is how people actually think, then why do so many of my students find logic hard to learn?) Husserl&#8217;s <em>Philosophy of Arithmetic</em> explores this and related themes. </p>

<p>More about Husserl can be found in the <a href="http://www.xrefer.com/entry/552350">Oxford Companion to Philosophy</a></p>

<h3>David Hilbert (1862-1943)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Hilbert.jpg" alt="[Image of Hilbert]" />David Hilbert not only had great style in headwear, he was pretty influential when it came to setting the agenda in mathematics and logic too. He&#8217;s famous for many of different things, including his work in real analysis (Hilbert spaces) and on the <a href="http://www.amazon.com/exec/obidos/ASIN/0875481647/consequentlyorg">Foundations of Geometry</a>, but he&#8217;s most remembered for his 23 <em><a href="http://aleph0.clarku.edu/~djoyce/hilbert/toc.html">problems</a></em> he set the mathematical community at an international congress in 1900. The <em>great moment</em> for me in this work is the spirit in which the enterprise was offered to the community. These new techniques of proof and rigour and clarity have helped us see these problems and issues anew. These are clearly stated problem with answers to be found. We have the technqiues to solve these problems in the affirmative or the negative. For Hilbert, proof and consistency was at the heart of mathematical technique. Proof, in clear logical steps, was the guarantee of truth. Consistency (the absence of any contradictions or other clashes in your assumptions or axioms) is the guarantee of existence. In both cases, logic is placed at the heart of the discipline of mathematics. </p>

<p>Hilbert&#8217;s scene setting was effective: the techniques of Godel and Cohen used to give an answer to Hilbert&#8217;s first problem on the cardinality of the collection of real numbers, and Gentzen&#8217;s proof of the consistency of arithmetic (dealing with Hilbert&#8217;s second problem) both used new and fruitful logical techniques. Not only was logic at the heart of mathematics in a way it never really had been before, but new logical techniques and results were being developed so that it could fill that role. The place of logic in the heart of mainstream mathematical practice, and not merely in foundational studies, is in part, due to Hilbert&#8217;s conception of the subject. </p>

<p>Here&#8217;s information about Hilbert in the <a href="http://www.xrefer.com/entry/494577">Oxford Dictionary of Scientists</a>. </p>


<h3>Ernst Zermelo (1871-1953)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Zermelo.jpg" alt="[Image of Zermelo]" />Zermelo did for <em>set theory</em>, the mathematical theory of collections or sets, what Dedekind and Peano did for arithmetic. He was the first to have a bash at working out principles which governed the mathematical practice of set-formation. The theory of sets mathematicians most often appeal to is a direct descendent of Zermelo&#8217;s original work. ZF set theory is named after Zermelo and <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/HistTopics/Beginnings&#95;of&#95;set&#95;theory.html">Fraenkel</a> who revised and extended his work. </p>

<p>A nice <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/HistTopics/Beginnings&#95;of&#95;set&#95;theory.html">historical account of Zermelo&#8217;s contribution to set theory</a> can be found at the St. Andrews History of Mathematics site. More information about Zermelo himself can be found <a href="http://www-history.mcs.st-andrews.ac.uk/history/Mathematicians/Zermelo.html">there too</a>. </p>

<h3>Jan Lukasiewicz (1878-1956)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Lukasiewicz.jpg" alt="[Image of Lukasiewicz]" />Lukasiewicz is the first <em>beardless</em> logician on our journey, since Boole, and similarly, he&#8217;s the first <em>algebraist</em> since Boole too. Lukasiewicz is important for many reasons. For one, he was one of the leading lights on logic in Poland for many years (until his emigration to Ireland before the Second World War), responsible for the Logic group in Warsaw, along with <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Leshniewski.html">Lesniewski</a>, and Tarski (who we&#8217;ll learn about later) was educated in this school. </p>

<p>For another, though, Lukasiewicz was the first truly non-classical logician to gain a foothold for alternative views of logic. The guiding principle behind both Boole&#8217;s and Frege&#8217;s approach to logic was the statements were either true or false. Lukasiewicz investigated logical structures where this condition was violated. In particular, he looked at three-valued logical systems which kept a way open for things which were undetermined. After all, if our statements are about the future, then some might be made true by present facts, some might be made false by these circumstances, and some might neither be made true nor ruled out &#8212; at least if the future is genuinely open. Lukasiewicz&#8217;s &#8220;three-valued logic&#8221; is one way of modelling such phenomena. He also considered a more radical algebraic system where statements can have one of <em>infinitely many values</em>, one for each number between 0 and 1, representing <em>degrees</em> of truth between complete falsity and complete truth. This has now reached some popularity under the name &#8220;<a href="http://www.abo.fi/~rfuller/fuzs.html">fuzzy</a> <a href="http://www.austinlinks.com/Fuzzy/">logic</a>&#8221;. This just goes to show that if you want to be popular, you ought to get a marketer to run his or her eyes over the papers you write before you submit for publication. &#8220;Fuzzy logic&#8221; will sell much better than &#8220;Lukasiewicz&#8217;s Infinely Valued Logic&#8221;. </p>

<p>A little on Lukasiewicz can be found in the <a href="http://www.xrefer.com/entry.jsp?xrefid=552680">Oxford Companion to Philosophy</a>. </p>

<h3>Bertrand Russell (1872-1970)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Russell.jpg" alt="[Image of Russell]" />Bertrand Russell is the first <em>philosopher</em> on this list from an English-speaking background, and he is probably best considered as the one person who played the crucial role in founding the Anglo/American analytic tradition in philosophy. </p>

<p>Russell&#8217;s <em>magnum opus</em> (written with Alfred North Whitehead) is <a href="http://www.amazon.com/exec/obidos/ASIN/052106791X/consequentlyorg">Principia Mathematica</a> (don&#8217;t buy the full thing unless you have lots of disposable wealth &#8212;- the <a href="http://www.amazon.com/exec/obidos/ASIN/0521626064/consequentlyorg">lite version</a> is enough of the good stuff to give you the flavour of the work). What&#8217;s <em>PM</em> all about? It&#8217;s the first and greatest attempt in the research programme of <em>logicism</em>, the reduction of mathematics to logic. Now, this is an immensely creative work, because it played a very important part in helping define the notion of <em>logic</em> for the 20th Century. As Alberto Coffa has <a href="http://www.amazon.com/exec/obidos/ASIN/0521447070/consequentlyorg">taught me</a>, I know that logicism wasn&#8217;t a matter of taking a predefined notion of &#8220;logic&#8221; and showing how mathematics could be reduced to it. Rather, it was a matter of expanding the notion of logic so as to make a reduction of mathematics to logic more feasible. In Kant&#8217;s time, logic was a matter of the analysis of concepts into their constituents. By the time Russell and Whitehead got their hands on it (after it had passed through the work of Frege) it became so much more. </p>

<p>One thing Russell can be thanked for, above and beyond PM, is a miniature example of logicism and analytic philosophy at work. It&#8217;s his little vignette on <em>definite descriptions</em>, which stands to this day as a gem in analytic philosophy. The analysis concerns the difference between claims like </p>

<blockquote>
	<p>George Bush is articulate.</p>
	
	<p>The present U.S. President is articulate. </p>
</blockquote>

<p>They look like they have the same form. In the old-style Aristotelian analysis, they&#8217;re both of subject-predicate form, with the subject (George Bush, or the present U.S. President) on the one hand and the predicate <em>being articulate</em> being applied to him. But there is an important difference between these claims: The first uses a <em>name</em> and the second uses a <em>description</em>. The description in the second claim is a <em>definite</em> description because it refers to <em>the</em> present U.S. President, not simply <em>a</em> present U.S. President. (That would be an <em>indefinite</em> description.) Definite descriptions seem to have a number of important properties. For them to <em>work</em>, for that claim <em>the present U.S. President is articulate</em> to be <em>true</em>, you need <em>three</em> critieria to be satisfied. First, there needs to <em>be</em> a U.S. President &#8212;- if not, your claim fails because there&#8217;s no U.S. President to <em>be</em> articulate. Second, there has to be at most <em>one</em> U.S. President. If there are more than one, then it&#8217;s unclear which I was talking about, and (according to Russell at least) my claim fails too. Third, if there is exactly one U.S. President then my claim is true if and only if that person is, indeed, articulate. </p>

<p>So, to sum up the analysis, Russell says that a claim of the form &#8220;the <em>F</em> is a <em>G</em>&#8221; is not really of subject-predicate form at its base. Rather, it has the following form </p>

<blockquote>
	<p>There is a thing which is <em>F</em>, it is the <em>only F</em>, and it is a <em>G</em> as well </p>
</blockquote>

<p>This is a typical example of an &#8220;analysis&#8221;, in analytic philosophy. The surface form of an expression may be deceptive. Different logical work may be involved in the claim, and you might need to expend effort to see what is actually being said. </p>

<p>Russell himself appears to have been rather confused about the significance of what he was doing. Sometimes he described his work as replacing objects with logical constructions. But this is not what&#8217;s going on here. The logical construction does not replace any object at all &#8212;- the present President of the U.S. is still a flesh and blood human being and not a &#8220;construction&#8221;. The analysis and reduction occurs at the level of <em>semantics</em>. The meaning of a definite description claim is reduced to being a construction of more primitive kinds of claims, involving predicates and quantification. Analytic philosophy of this kind made the way open for a new kind of reductionism, which didn&#8217;t explain away <em>objects</em> or construct them out of more simpler entities, but rather, it explains different kinds of <em>statements</em> by giving their significance in terms of other, simpler statements. You don&#8217;t need to refer to special kinds of objects as the referents of definite descriptions, for example, if you have an analysis of definite descriptions which doesn&#8217;t appeal to reference at all. </p>

<p>Bertrand Russell is <a href="http://www.google.com/search?q=bertrand+russell">all over the net</a>. The <a href="http://plato.stanford.edu/entries/russell/">Stanford Encyclopedia of Philosophy</a> entry on him is especially good, and the <a href="http://www.mcmaster.ca/russdocs/russell.htm">Russell Archives</a> at McMaster University in Canada are also worth a visit.</p>

<h3>L. E. J. Brouwer (1881-1966)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Brouwer.jpg" alt="[Image of Brouwer]" />Brouwer was a Dutch mathematician who founded the school of <em>intuitionism</em>, a radical tradition in mathematics. Intuitionism is <em>radical</em> because it takes much of contemporary mathematics to be simply mistaken, that mathematicians took a wrong turn when following Cantor&#8217;s direction in set theory, and the classical tradition in analysis (the theory of real-valued functions). Mathematics has gone bad when dealing with the <em>infinite</em>, because traditional mathematical practice does not do justice to what mathematics is actually <em>about</em>, according to Brouwer. </p>

<p>For Brouwer, mathematics is primarily governed by the <em>intuition</em> of the knowing and proving &#8220;mathematical subject&#8221;. Now, <em>intuition</em> doesn&#8217;t mean &#8220;gut instinct&#8221; like it does in contemporary language. The term is a piece of art looking back at least to Kant and his <em>Critique of Pure Reason</em>. Intuition, for Brouwer, just means a mental faculty. The important features of the intuition relevant to mathematics is that they are <em>pure</em> intuitions of space and time. These intuitions aren&#8217;t given by experience, but rather, they structure experience. We put our experiences together in a &#8220;manifold&#8221; of moments and locations: we don&#8217;t extrapolate the idea of time or space from our experiences (for Kant, and for Brouwer). Anyway, the details are irrelevant for us, the fact that the mental ability to <em>count</em>, to go to the <em>next thing</em>, an intuition of <em>duality</em> or <em>two</em>-ness is what is important in mathematics. The content of mathematical judgement is not some correspondence with an external world of mathematical objects, but rather, the contents of mathematical judgements (like the claim that 2+2=4, or that the area of a circle is proportional to the square of the radius, or that real-valued functions which are somewhere positive and somewhere negative are also zero somewhere) are to be found in the possible <em>verifications</em> or <em>constructions</em> involved. </p>

<p>Now, this approach is both conservative (it&#8217;s <em>Kantian</em>, not the radical approach of logicism stemming from Frege and Russell) and radical. It&#8217;s radical because it motivates a rejection of traditional mathematical claims, like the law of the excluded middle &#8212;- the thesis that every proposition is either true or not true. Brouwer takes this to be mistaken because of the nature of mathematical judgement and proof. Consider this simple example: suppose I give you a series of numbers, one by one. 1, 1/2, 1/4, 1/8, &#8230; I ask you if this series converges to zero or doesn&#8217;t. If this series is truly <em>infinite</em> (I&#8217;ll just keep giving you numbers as long as you keep asking for them) you&#8217;ll never know if the series is converging to zero, or that it&#8217;s not going to zero. (If I just give you the numbers one-by-one, and I do not give you a <em>rule</em> which generates the list: there&#8217;s always a chance the series will stop shrinking, and I go 1/8, 1/8, 1/8, &#8230;, or that I start going up instead of going down.) Browuer takes this to be a reason to reject the law of the excluded middle. We oughtn&#8217;t say that the series is converging or not. Once you make <em>this</em> change to mathematical practice, a lot else looks <em>very</em> different. Intuitionistic mathematics is alive and well to this day as a minority tradition. </p>

<p>More information about Brouwer can be found at the <a href="http://www.xrefer.com/entry/551494">Oxford Companion to Philosophy</a>. </p>

<h3>Thoralf Skolem (1887-1963)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Skolem.jpg" alt="[Image of Skolem]" />Thoralf Skolem was a Norwegian logician and mathematician who continued the development of set theory along the lines started by Cantor and Zermelo. Skolem&#8217;s name is associated with one of the most interesting results in metalogic (that is, it&#8217;s a result <em>about</em> logic, not a result <em>in</em> logic), which we now call the <a href="http://cheng.ececs.uc.edu/cs543/4-29.html">Lowenheim Skolem Theorem</a>. This states that if a statement (or set of statements) in Frege&#8217;s predicate logic can be satisfied by a model with infinitely many things in the domain, it can also be satisfied by a model with only <em>countably</em> many things. So, predicate logic, in an important sense, cannot tell the difference between the countably infinite and the uncountable infinite. </p>

<p>The most stunning and problematic consequence of this is <a href="http://www.nd.edu/~tbays/professional/abstract.html">Skolem&#8217;s Paradox</a>. Take the theory of sets. In this theory you can distinguish between countably infinite sets and uncountably infinite sets (a countably infinite set is one which can be put into a one-to-one correspondence with the numbers {1,2,3,&#8230;}), and furthermore, you can prove that there <em>are</em> uncountably infinite sets (Cantor&#8217;s construction can be carried out). This theory, if it is consistent, has a model. This model must be <em>infinite</em> (it contains elements for each of the numbers 1, 2, 3, at least!) so by the downward Lowenheim-Skolem theorem, it also has a countable model. But what of the sets that the <em>theory</em> takes to be uncountably infinite. From <em>inside</em> the model, they are uncountable. But from outside, we see that they are not. What is the story? </p>

<p>Well, that&#8217;s a real problem. Skolem&#8217;s enticing response was to say that the difference between the countable and the uncountable was <em>relative</em> and not <em>absolute</em>. Another response would be to say that the predicate logic theory of sets is incomplete, and it must be extended somehow. </p>

<p>Interesting information about Skolem and the application of his ideas can be found in the <a href="http://www.hf.uio.no/filosofi/njpl/vol1no2/contents.html">Nordic Journal of Philosophical Logic&#8217;s special issue on Skolem</a>.</p>

<h3>Ludwig Wittgenstein (1889-1951)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Wittgenstein.jpg" alt="[Image of Wittgenstein]" />The next entry on our tour simply <em>has</em> to be the inimitable LW. Wittgenstein is an incredibly fertile philosopher: his work has inspired philosophers from all traditions. His <em>Tractatus Logico Philosophicus</em> (written in 1918, after Wittgenstein served in the German army) is an enigmatic tract, which starts (in one translation) like this. </p>

<blockquote>
	<p><strong>1</strong> The world is everything that is the case.</p>
	
	<p><strong>1.1</strong> The world is the totality of facts, not of things.</p>
	
	<p><strong>1.11</strong> The world is determined by the facts, and by these begin <em>all</em> the facts.</p>
	
	<p><strong>1.12</strong> For the totality of facts determines both what is the case, and also all that is not the case.</p>
	
	<p><strong>1.13</strong> The facts in logical space are the world. </p>
</blockquote>

<p>And it continues in this vein. It is a work in <em>logical atomism</em>, the doctrine that the world is made up of atomic facts, the primary bearers of information, and it motivates the logical techniques of truth tables and other interesting formal things as consequences of this picture. </p>

<p>Much more important for Wittgenstein was the boundary between the <em>sense</em> and <em>nonsense</em>, or what could be <em>said</em> and what could not be said and what could only be <em>shown</em>. The closing words in the Tractatus are </p>

<blockquote>
	<p><strong>7</strong> Whereof one cannot speak, thereof one must be silent. </p>
</blockquote>

<p>What is most interesting to me is that Wittgenstein explicitly acknowledges that his own book is, by his own lights, expressing what cannot be said. The entire book is an act of <em>showing</em> and not of <em>saying</em>. It&#8217;s a peculiar kind of showing, using German (or English) words, which the audience reads in the traditional manner. (Wittgenstein himself was later unsatisfied with his own approach and he attempted to paint a very different picture about how language works.) </p>

<p>More information about Wittgenstein can be found at the <a href="http://www.xrefer.com/entry/553892">Oxford Companion to Philosophy</a>. There are online editions of both the the <a href="http://www.kfs.org/~jonathan/witt/tlph.html">Ogden-Ramsey</a> and the <a href="http://guava.phil.lehigh.edu/tlp/">Pears-McGuinness</a> translations of the <em>Tractatus</em>. <a href="http://www.helsinki.fi/~tuschano/">T. P. Uschanov</a> has a <a href="http://www.helsinki.fi/~tuschano/lw/links/">comprehensive collection</a> of links of online resources on Wittgenstein. </p>

<p>It is the mark of LW&#8217;s distinction that he is the only person on this page to have a [<em>musical</em> written about him. Unfortunately, I have not seen it. The Tractatus has also been <a href="http://www.guardian.co.uk/Print/0,3858,4269937,00.html">set to music, more than once</a>, unfortunately, I have not heard any of it. </p>

<h3>Rudolf Carnap (1891-1970)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Carnap.jpg" alt="[Image of Carnap]" />Rudolf Carnap was a German philosopher, educated in the dominant Kantian tradition, interested in science and epistemology (the theory of knowledge). Carnap had one of the &#8220;conversion experiences&#8221; common to great evangelists. While sick one day he read some of the knew &#8220;formal&#8221; philosophy of Bertrand Russell, and the scales fell from his eyes. The combination of rigour and philosophical applicability convinced Carnap that from this day henceforth, he wanted to do philosophy like <em>that</em>. </p>

<p>And so, Rudolf Carnap worked in the tradition started by Russell, of the application of formal techniques to philosophical problems. But in Carnap&#8217;s hands, these techniques had very different outcomes. Carnap&#8217;s masterworks, the <em>Aufbau</em> and the <em>Logical Syntax of Language</em> indeed use techniques rather like Russell&#8217;s in <em>Principia Mathematica</em> and <em>The Principles of Logical Atomism</em> but the resulting philosophical picture cannot be more different. While Russell was an atomist and foundationalist for many of his years (though what these <em>atoms</em> might be was ever elusive for Russell), Carnap was temperamentally very different. He was, by nature, a kind of accommodating pluralist. He thought that the new logical techniques would help us see what was genuinely being <em>said</em> by different philosophical positions, and that we might see the things on which different philosophers agree, and those on which they have genuine disagreements, and those upon which the disagreement is a purely verbal matter. An example from the philosophy of mathematics might give you an idea of how this works. In mathematics, we have rules for adjudicating disagreement in many cases: if I say that 37+56=83, then you can show me where I went wrong by explaining how the addition actually works: 37+56 is <em>93</em> (perhaps I forgot to carry the 10 from the addition of 7 and 6). Similarly, if I deny that there is a prime number between 11 and 17, you can point out that 13 is a prime number between them. The <em>meanings</em> of the mathematical terms dictate how they should be used, and they give us answers in these cases. They <em>don&#8217;t</em> help in the argument between the platonist (who thinks that numbers <em>really</em> exist) and the formalist (who thinks that numbers <em>really don&#8217;t</em> exist). If either attempts to get into a discussion with Carnap about whether or not there <em>really</em> is a prime number between 11 and 17, he&#8217;ll simply say, &#8220;yes, there is a prime number between 11 and 17 &#8212; it&#8217;s 13 &#8212; but I don&#8217;t know what you mean by saying &#8220;really&#8221; in the question.&#8221; No sense has been given to the question of the existence of numbers, over and above the sense that has been given by virtue of the meanings of mathematical terminology. It&#8217;s the job of techniques from <em>logic</em> to clarify what can be said, and what cannot. In this sense, Carnap is quite close to the Wittgenstein of the Tractatus. </p>

<p>More information about Carnap can be found at the <a href="http://www.xrefer.com/entry/551537">Oxford Companion to Philosophy</a>.</p>

<h3>Arend Heyting (1898-1980)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Heyting.jpg" alt="[Image of Heyting]" />Arend Heyting was a brilliant Dutch logician: beardless, as you can see &#8212;- the <em>Return of the Beards</em> will be quite some decades to come. Heyting&#8217;s claim to fame was to do something quite against the spirit of the intuitionist enterprise, but which made intuitionism a respectable and living (if <em>minority</em>) tradition in logic. </p>

<p>Heyting <em>formalised</em> intuitionistic logic. That is, he codified the kinds of inferences which are warranted by the lights of an intuitionist. This made &#8220;intuitionistic logic&#8221; an object of study, amenable to many of the same techniques that Frege and others had developed for the dominant tradition in logic, which we now call &#8220;classical&#8221; logic. </p>

<p>More information about Heyting can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Heyting.html">St. Andrews&#8217; History of Mathematics Entry</a> on him. </p>

<h3>Haskell Curry (1900-1982)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Curry.jpg" alt="[Image of Curry]" />Haskell Curry was an American student of Hilbert. His greatest innovative contributions to logic are in the odd area of <em>combinatory logic</em>. Combinators are strange beasts: they&#8217;re like functions which operate on other functions. Combinatory logic is a formal system like other kinds of logic: you have a collection of objects with different rules indicating allowable transformations from objects to other objects. But these combinators do not necessarily express <em>statements</em>, as the formulas in a traditional logic do. They&#8217;re <em>functions</em>. </p>

<p>The frame of mind required to think in this way (to see everything as a function) is important in many fields today, and the debt to Curry is sometimes acknowledged and sometimes not. For example, in computer science, the transformation required to move from thinking of a function as giving you an output given a <em>pair</em> of inputs (for example, addition as a function sending <em>x</em> and <em>y</em> to <em>x + y</em>) to thinking of it as giving a <em>function</em> as output when given a single input (so given <em>x</em> the output is the function which sends <em>y</em> to <em>x + y</em>: the <em>adding x</em> function) is called <em>currying</em> in Curry&#8217;s honour. This kind of transformation, which involves thinking of functions as first-class entities, is important in many disciplines, such as <a href="http://plato.stanford.edu/entries/category-theory">category theory</a> and <em>functional programming</em>. In fact, my favourite functional programming language <a href="http://haskell.org">Haskell</a> is named after Curry. </p>

<p>Curry made another very important contribution to the tradition: his textbook <a href="http://www.amazon.com/exec/obidos/ASIN/0486634620/consequentlyorg">Foundations of Mathematical Logic</a> is still <em>rich</em> with insight, and it rewards reading and rereading today. It is the first textbook in mathematical logic which takes a synoptic view of different logical systems and which encourages the reader to think philosophically and creatively about the different kinds of formal systems which might be used to model different logical phenomena. </p>

<p>More information about Curry can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Curry.html">St Andrews&#8217; History of Mathematics Entry</a> on him. </p>

<h3>Alfred Tarski (1902-1983)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Tarski.jpg" alt="[Image of Tarski]" />Alfred Tarski&#8217;s shadow looms large over 20th Century Logic, and it extends into the 21st Century too. An emigre from Poland, educated in the great Warsaw school of logicians, Tarski brought a new degree of conceptual clarification to a great number of issues in logic. I will sketch two here. </p>

<p><em>First</em>, Tarski gave the first rigorous definition of what it was for a structure to be a <em>model</em> or an <em>interpretation</em> of the language of predicate logic. He gave precise clauses indicating for each kind of sentence (atomic sentence, conjunction, disjunction, negation, universally quantified, existentially quantified, etc) what it is for this sentence to be <em>true in</em> a model. To do this, he noticed that you need to do something tricky when it comes to <em>quantified</em> sentences like for all <em>x</em>(if F<em>x</em> then G<em>x</em>). For this to be given a sensible truth condition, we want its truth to depend on the truth of the part inside the quantifier. But if F<em>x</em> then G<em>x</em> is not a sentence: it&#8217;s got a variable in it unbound. (It&#8217;s like the term <em>x</em> + 2: you only know what number it is when I tell you the <em>value</em> of the variable <em>x</em>.) So, Tarski solved the problem this way. You don&#8217;t define what it is for a sentence to be <em>true in</em> a model. You define what it is for a formula (possibly including free variables) together with an <em>assignment of values to each of the variables</em> to be <em>satisfied by</em> a model. So, for all <em>x</em>(if F<em>x</em> then G<em>x</em>) together with the assignment A is satisfied by my model just when the inside bit if F<em>x</em> then G<em>x</em> together with any <em>variant</em> assignment A&#8217; which assigns exactly the same values as A does to any variable other than <em>x</em>, but possibly assigns <em>x</em> any value it chooses. This gets the result exactly right. And it gives a clear (well, after you get used to it, anyway!), rigorous and recursive definition of satisfaction, and truth in a model. </p>

<p>The <em>Second</em> insight is related. It&#8217;s also on the topic of truth. Here, the idea is not truth in a <em>model</em>, but genuine truth. The kind of truth we attempt to express when we make assertions. Many philosophers have said deep and mystical things about the Nature of Truth. Some have said that truth is a matter of Correspondence to Reality (after all, propositions are designed to reflect the Way the World Is). Others have said that truth is a matter of the Coherence of an overall body of propositions (after all, we test propositions only against other propositions). Still others have said that truth is a matter of What Gets Things Done (after all, in describing things we always aim to Do something, and this governs the kinds of concepts we have). Tarski thought that all accounts like this are misguided. For given a language which doesn&#8217;t say anything about truth, it is easy to <em>define</em> the notion of truth in that language, without appealing to Correspondence, Coherence, or Pragmatic concerns. Suppose we&#8217;ve got a sentence in our language, like &#8220;snow is white&#8221;. (This is a favourite in discussions of truth, for some reason.) We know very well what the sentence <em>means</em>. We want to know whether or not the sentence is <em>true</em>. Well, given that we know what it means, we can say exactly the conditions under which this sentence is true: </p>

<blockquote>
	<p>&#8220;Snow is white&#8221; is true if and only if snow is white </p>
</blockquote>

<p>Now this tells us exactly the circumstances under which &#8220;snow is white&#8221; is true. And it doesn&#8217;t say anything about Correspondence to Reality, Coherence, or Pragmatic concerns. It is Tarski&#8217;s <em>definition</em> of the concept of truth, and it&#8217;s become an important benchmark in any discussion of the topic to this day. </p>

<p>More information about Tarski can be found at the <a href="http://www.xrefer.com/entry/553669">Oxford Companion to Philosophy</a>. </p>

<h3>Frank Ramsey (1903-1930)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Ramsey.jpg" alt="[Image of Ramsey]" />If I&#8217;d done as much as Frank Ramsey had achieved by the time <em>I</em> was 27, I&#8217;d be glad. Of course, I&#8217;m very glad to have made it past 27. </p>

<p>Ramsey not only did amazing work in the philosophy of logic and probability. His insight into how <em>theoretical terms</em> work has earned his surname a place in the <a href="http://www.google.com/search?q=ramsification">lexicon</a>. Yes, Frank Ramsey is responsible for the technique we now delightedly call <em>Ramsification</em>. </p>

<p>Ramsification is a straightforward notion when you get your head around it. It&#8217;s a theoretical application to <em>concepts</em> of Russell&#8217;s account of definite descriptions. It&#8217;s always been a bit of a mystery how theoretical terms like <em>neutrino</em> actually work. People started talking about neutrinos (I love the name by the way: <em>little neutral one</em> is a perfect name for a pet, at least if he/she is placid) before they&#8217;d ever found conclusive evidence of their existence. It&#8217;s not like they&#8217;d <em>laid eyes</em> on them and said &#8220;I will call this a <em>neutrino</em>&#8221;. No, what happened instead is that the scientists endorsed a body which included the predicate &#8220;is a neutrino&#8221;. The theory will contain things like &#8220;Neutrinos have no charge&#8221;, &#8220;Neutrinos have negligible mass&#8221; and other things like this. Now this theory can have sense, and can <em>assign</em> a kind of meaning to the term &#8220;neutrino&#8221; in just the same way as Russell&#8217;s analysis of definite descriptions shows how sense is assigned to definite descriptions. The theoretical term &#8220;neutrino&#8221; doesn&#8217;t really refer, but you can treat the terms as a predicate <em>variable</em>, and the theory really says something like </p>

<blockquote>
	<p>(for some X)(X has no charge, and X has negligible mass, and &#8230;)</p>
</blockquote>

<p>And in this way, theoretical terms are introduced into the language. </p>

<p>This technique has seen a <em>lot</em> of use in contemporary work coming out of <a href="http://web.syr.edu/%7Edpnolan/philosophy/Credo.html">Canberra</a>. </p>

<p>More information about Ramsey can be found at the <a href="http://www.xrefer.com/entry/553336">Oxford Companion to Philosophy</a>. </p>

<h3>Alonzo Church (1903-1994)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Church.jpg" alt="[Image of Church]" />Alonzo Church&#8217;s influence over logic is long-lived, as he was. I&#8217;ll focus on just two ways he has left his mark on the field. First, and most obvious, was his invention of the <em>lambda calculus</em>. This is a notion for representing functions, immensely suited to the same body of theory as Curry&#8217;s <em>combinatory logic</em>. In fact, Church&#8217;s notation for functional abstraction (using a <em>lambda</em>, which I&#8217;ll write here with a backslash &#8220;&#34;) is a uniform technique which, when combined with functional application, gives you exactly the same theory as Curry&#8217;s combinators. The notation is simple. The addition function can be represented like this: </p>

<blockquote>
	<p>\x\y(x+y)</p>
</blockquote>

<p>It&#8217;s a function, which when applied to a number (say 2) gives you the result \y(2+y). You figure out how it works by taking the first lambda abstraction out the front, removing it, and replacing the variables inside the rest which were bound by that abstraction, by the value you chose. The result is still a function. If you apply this to another number (say 3) you get the result 2+3. So addition here is a function which takes two values, and returns a number. </p>

<p>More can be said about the lambda calculus, and its use as a language for representing functional abstraction. I want to go on to consider what might have been Church&#8217;s greatest achievement. He founded, in 1936, the <a href="http://www.aslonline.org/asl/JSL/JSL.html">Journal of Symbolic Logic</a> in 1936, along with its parent body, the <a href="http://www.aslonline.org/">Association for Symbolic Logic</a>. The <em>JSL</em> is the most prestigious journal in formal logic, and it has played (especially in its early years) a crucial pivotal role in helping define the community of logicians, by giving a focal point for research and a means for disseminating results broadly. Logicians did not have to resort to scanning over a wide body of mathematics and philosophy journals to find articles of importance to logic. Now they could concentrate in the one place. </p>

<p>More information about Church can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Church.html">St Andrews&#8217; History of Mathematics Entry</a> on him. </p>

<h3>Kurt G&ouml;del (1906-1978)</h3>
<p><img class="logician" src="http://consequently.org/images/logicians/Godel.jpg" alt="[Image of G&ouml;del]" />G&ouml;del&#8217;s <em>incompleteness theorem</em> is great in two ways. First, it&#8217;s the technical result in logic most cited outside its field. Second, it&#8217;s a stunning piece of reasoning which genuinely broke open a new field and closed off other areas of inquiry. </p>

<p>G&ouml;del&#8217;s incompleteness theorem shows that Peano&#8217;s theory of arithmetic is essentially <em>incomplete</em>. For some sentences in the language of arithmetic, it cannot decide between that sentence and its negation. G&ouml;del shows that this is not an accidental feature of Peano&#8217;s theory, to be fixed with a little patch here or there. No, <em>any</em> theory of arithmetic which is such that you can tell (by means of a recursive function: look to <em>Turing&#8217;s entry</em> coming on up) whether or not something is an <em>axiom</em> of the theory, then exactly the same incompleteness phenomenon will hold. Why is this? It&#8217;s because an arithmetic theory is rich enough to <em>represent</em> in some sense, it&#8217;s own facts about <em>provability</em>. That is, it can simulate provability in its own claims about numbers. G&ouml;del showed how claims about sentences and proofs can be &#8220;encoded&#8221; into claims about numbers, in such a way that if there <em>is</em> a proof of some claim, then there is a proof in arithmetic which represents that proof. Once you&#8217;ve pulled this trick (it&#8217;s the trick of <em>G&ouml;del numbering</em>), you then need to pull another trick (called <em>diagonalisation</em>, it&#8217;s close in spirit to Cantor&#8217;s diagonal argument) to construct a sentence which, in effect says </p>

<blockquote>
	<p>I am not provable in Peano&#8217;s Arithmetic </p>
</blockquote>

<p>If this sentence <em>is</em> provable in Peano&#8217;s arithmetic, then since provability in this arithmetic implies truth, it is not provable in Peano&#8217;s arithmetic, and as a result the arithmetic is inconsistent. On the other hand, if it&#8217;s not provable in Peano&#8217;s arithmetic, then it itself is an example of a sentence which is true but is not provable: and as a result, the arithmetic is incomplete. </p>

<p>Now, there&#8217;s a <em>lot</em> that can be said about this result. And there&#8217;s a lot of garbage that has been said about this result too (so called &#8220;applications&#8221; range from theories of the mind, of culture, of value, of art, of this that and the other). It think it&#8217;s stunning enough in its original form. And working out its implications for logical theories, and knowing when (and on what basis) we can claim consistency or completeness, is plenty interesting enough. </p>

<p>More information about G&ouml;del can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/G&ouml;del.html">St. Andrews&#8217; History of Mathematics Entry</a> on him.</p>

<h3>W. V. O. Quine (1908-2000)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Quine.jpg" alt="[Image of Quine]" />Quine is not famous for his <em>logic</em> so much as for the mark he made on philosophy in the english-speaking world in the second half of the twentieth century. However, he was a formidable logician, with contributions in set theory (his <em>New Foundations</em> is an alternative view of the set-theoretic universe, radically at odds with the Zermelo-Fraenkel picture inspired by Cantor) and other areas of logic. However, it was his imprint on <em>philosophy as a whole</em> for which Quine is rightly remembered. </p>

<p>The centre of Quine&#8217;s contribution can be seen in his work on <em>meaning</em> and the <em>holist</em> picture radically at odds with Carnap&#8217;s view of how language works. For Carnap, the <em>meaning postulates</em> governing a discourse show us how the language works, and once you have the meaning postulates (the <em>analytic</em> truths) the &#8220;world&#8221; contributes the rest, the (the <em>synthetic</em> truths). The analytic truths don&#8217;t tell us anything <em>about the world</em> but the synthetic truths do. This is a compelling picture, and it&#8217;s one that has basically been the received doctrine in understanding language and concepts, from the British Empiricists, through Kant, and up to the middle 20th Century. Of course, the picture has not been a uniform one. Kant argued that some synthetic truths were knowable <em>a priori</em>, and the work in logic in the early 19th and 20th Centuries greatly expanded our understanding of what might count as &#8220;analytic&#8221;. However, everyone agreed that there was a sensible distinction to be drawn between the analytic and the synthetic. </p>

<p>Quine changed all of that. With novel arguments and though experiments (in particular, the problem of <em>radical translation</em>: see <a href="http://www.amazon.com/exec/obidos/ASIN/0262670011/consequentlyorg">Word and Object</a> and the famous article &#8220;Two Dogmas of Empiricism&#8221;) Quine set about to dismantle the analytic/synthetic distinction. For Quine, any body of theory cannot be unambiguously split into analytic and synthetic components, where the synthetic is prone to revision and the analytic immune from revision. The body of theory is to be considered as a whole, and judged in this way. Quine was the first explicit empiricist <em>holist</em>. </p>

<p>To this day, anyone who takes the analytic/synthetic distinction seriously owes a debt to explain how it is to be understood, in the face of Quine&#8217;s arguments. For bringing this important issue to light, Quine is to be praised! </p>

<p>More information about Quine can be found at the <a href="http://www.wvquine.org/">Quine Home Page</a>. </p>

<h3>Gerhard Gentzen (1909-1945)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Gentzen.jpg" alt="[Image of Gentzen]" />Gerhard Gentzen brought the study of logic to a completely new level with his work on the theory of <em>proofs</em>. Logicians, since Aristotle, have been interested not only in what you can prove, but also in proof itself. But somewhat suprisingly, up until Gentzen&#8217;s time, no-one had a coherent story to tell about what a proof actually <em>is</em> and what logical properties proofs might have. Gentzen&#8217;s work changed this, and he is now seen as the archetypal <em>proof theorist</em>. </p>

<p>Gentzen&#8217;s innovation was to introduce proof as an object of study. He formalised two different kinds of proofs, which we now call <em>Natural Deduction</em> and <em>Gentzen Systems</em> in his honour. A Gentzen system is an interesting kind of way of proving things, because unlike other kinds of proof, a Gentzen proof is not a series of statements, each of which follows from earlier statements in the series. (A Natural deduction proof is like this, except that statements may be <em>assumed</em> and assumptions may also be <em>discharged</em> at different points in the proof.) A Gentzen proof is very different: at each stage of a Gentzen proof, you prove not <em>statements</em> but <em>sequents</em>. A sequent is not an individual statement, but rather, a claim saying that one statement follows from other statements. One way of thinking about it (and this was Gentzen&#8217;s own way of thinking about it) is that a Gentzen proof is a proof <em>about</em> other proofs. The steps don&#8217;t say things like &#8220;this follows from that&#8221; but &#8220;if there&#8217;s a proof of <em>B</em> from <em>A</em> then there&#8217;s a proof of <em>C</em> from <em>A</em> too&#8221;. </p>

<p>Gentzen systems are beautiful because they give you a deeper understanding of what can be done with proofs. One of Gentzen&#8217;s own applications was to use a Gentzen system for Peano Arithmetic to show that arithmetic was indeed consistent. Gentzen&#8217;s argument is quite clever. He shows that there is no way that you could get a proof of an inconsistency from the axioms because any such proof could be transformed into a <em>smaller</em> proof of an inconsistency from the axioms, and there&#8217;s no one-step proof of an inconsistency. (Actually, the proof is a bit trickier than this, as it&#8217;s a corollary of Gentzen&#8217;s famous <em>Cut Elimination Theorem</em>, but this is the core of the way that the result is proved, if you think about it for a bit!) </p>

<p>This result might be seen to be in conflict with G&ouml;del&#8217;s incompleteness result, which has a corollary that Peano&#8217;s arithmetic can&#8217;t prove its own consistency. However, there&#8217;s no conflict, as Gentzen&#8217;s techniques, though straightforward, actually presume something <em>more</em> that arithmetic itself. These techniques use a form of mathematical induction stronger than that supplied in ordinary arithmetic. This result has spawned many more like it, and the study of the relative proof-theoretical strength of different theories is now a well-understood discipline in logic. </p>

<p>More information about Gentzen can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Gentzen.html">St. Andrews&#8217; History of Mathematics Entry</a> on him. </p>

<h3>Alan Turing (1912-1954)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Turing.jpg" alt="[Image of Turing]" />Alan Turing is famous for the <em>Turing Test</em> (a claim about what it would take for something to count as <em>intelligent</em>: get it to communicate with you in conversation over a network connection) for <em>Turing Machines</em>, and for half of the name of the <em><a href="http://plato.stanford.edu/entries/church-turing/">Church-Turing Thesis</a></em>. I think that the latter two are more interesting from the point of view of logic than the first one. </p>

<p>Turing Machines are not really <em>machines</em> at all. The idea of a Turing machine is that of a characterisation of a <em>kind of</em> computing device, and it&#8217;s the kind of computational device stripped down to its limit. All it involves is a long tape divided into segments (picture a roll of toilet paper unrolled). The tape is <em>long</em> in the sense that if you ever get to an end, you can go out to the shop and get some more to add on. So, you never run out of tape. Then, you have a marker where you can write a sign on a square of the tape. (You can overwrite an existing sign with a new sign too: the new sign replaces the old one.) You have a finite collection of possible signs, including the blank sign for a square which has no other sign written on it. You also have a finite set of <em>states</em> which you can think of as points on a flowchart. The <em>instructions</em> are the arrows on a flow chart which say things like this: If you&#8217;re in this state, and you&#8217;re looking at a square with <em>this</em> symbol on it, then follow <em>this</em> instruction, and go to <em>this</em> state. What&#8217;s an instruction? It can be one of three things. It&#8217;s either to write a sign in the square you&#8217;re looking at, or move left one square and look at this new square, or move right one square. That&#8217;s it. If you&#8217;re in a state looking at a symbol on a square and you have <em>no</em> instruction to follow, your computation simply stops. </p>

<p>That&#8217;s it. That&#8217;s all there is to a Turing machine. It&#8217;s not exactly the kind of computer you can use for word-processing, or playing <a href="http://www.idsoftware.com">games</a> with. However, the kinds of computations you can do on this kind of machine (especially when you think of representing numbers on the machine using some code) are a really natural class of functions. They&#8217;re the <em>recursive</em> functions, independently characterised by Church. And the Church-Turing thesis is the claim that this class of functions is exactly the class of functions which could be <em>computed</em> using any computational device. </p>

<p>More information about Turing can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Turing.html">St Andrews&#8217; History of Mathematics Entry</a> on him. </p>

<h3>Arthur Prior (1914-1969)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Prior.jpg" alt="[Image of Prior]" />Arthur Prior is the first (and only) <em>antipodean</em> logician on this list. Educated in New Zealand, he had academic positions both in New Zealand (at Otago and Canterbury) and in England (at Manchester, and Oxford). Prior invented the field of <em>tense logic</em>, the logic of &#8220;earlier&#8221; and &#8220;later&#8221;, &#8220;past&#8221; and &#8220;future&#8221;. He was the arch <em>intensionalist</em>, bringing to the philosophical fore these <em>modalities</em> which are not truth-functional, not obviously amenable to Tarski&#8217;s analysis of truth-in-a-model. Remember that in Tarki&#8217;s world, the truth or otherwise of a complex expression depends on the truth or otherwise of its components. The <em>temporal</em> operators don&#8217;t work like this at all. &#8220;it&#8217;s raining&#8221; and &#8220;it&#8217;s Thursday&#8221; might both be true, but &#8220;yesterday it rained&#8221; and &#8220;yesterday it was Thursday&#8221; might differ in truth value. The truth or falsity of temporal operators is <em>intensional</em> and not <em>extensional</em>. It depends on more than just the truth value of the components. </p>

<p>There is a tradition in logic to attempt to erase the intensional by making it genuinely <em>extensional</em> (replacing talk of &#8220;it rained&#8221; by &#8220;it rained on day <em>x</em>&#8221; and explicitly quantifying over days or times) &#8212; Quine&#8217;s work is a very good example of this &#8212; but Prior resisted this move strongly. For Prior, there was nothing wrong with irreducable intensionality, provided that you could be clear about the logical properties these intensional creatures satisfied. Prior&#8217;s work did a great deal to rehabilitate the intensional and to put it on an equal footing with the extensional tradition in logic. This work would explode onto the scene with some developments of Kripke and what is now known as &#8220;possible worlds semantics&#8221;, but it was Prior&#8217;s work which set the scene and showed the enormous range of philosophical applicability of these ideas. </p>

<p>Excellent information about Prior can be found in <a href="http://www.phil.canterbury.ac.nz/jack&#95;copeland/">Jack Copeland</a>&#8217;s <a href="http://plato.stanford.edu/entries/prior/">entry on Prior in the Stanford Encyclopedia of Philosophy</a>. </p>

<h3>Helena Rasiowa (1917-1994)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Rasiowa.jpg" alt="[Image of Rasiowa]" />At <em>last</em>, a woman! The month is nearly at an end, and at last, I have found a female logician to join our list of stars. Helena Rasiowa was an incredible logician from Poland, who helped place the study of <em>logics</em> on a mathematical footing. Continuing on the work of Boole and Lukasiewicz, she showed, in her groundbreaking book <a href="http://www.amazon.com/exec/obidos/ASIN/0720422647/consequentlyorg">An Algebraic Approach to Non-Classical Logics</a> showed how contemporary techniques in <em>algebra</em> may be used to study the structures of propositions arising out of different conceptions of logic. This book is rich in ideas and treatments of Boolean algebras, Heyting algebras (models of intuitionistic logic), the many valued logics of Lukasiewicz, and others. This is one of the first books to give a unified treatment of <em>logics</em> rather than a partisan development of this system or that system. </p>

<p>Rasiowa&#8217;s work also encouraged me as a budding mathematics student, to go into logic. Browsing through <a href="http://library.uq.edu.au/search/arasiowa+helena/arasiowa+helena/1,1,4,B/frameset&amp;F=arasiowa+helena&amp;1,,4">its pages</a> in the old University of Queensland Mathematics Library, I saw that the things I was learning in algebra could be used to illuminate my growing interests in logic. </p>

<p>More information about Rasiowa can be found at the <a href="http://www-groups.dcs.st-andrews.ac.uk/~history/Mathematicians/Rasiowa.html">St. Andrews&#8217; History of Mathematics Entry</a> on her. </p>

<h3>Ruth Barcan Marcus (1921-)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Marcus.jpg" alt="[Image of Marcus]" />Ruth Barcan Marcus is another <em>intensionalist</em> like Prior. She was a proponent of modal logic who in a series of papers from 1946, defended the coherence of quantified modal logics against criticism, and helped ensure that modal logic gained a hearing, but eventually, became a part of the <em>lingua franca</em> of many working philosophers.  This was an amazing feat, since her opponents in this included none other than the eminent W.&nbsp;V.&nbsp;O.&nbsp;Quine.  Quine was an ardent and trenchant critic of intensional logic, but Ruth Barcan (later Ruth Barcan Marcus) was central in ensuring that philosophical interest in modality did not wither under Quinean criticism.  
	
Ruth Barcan Marcus has lent her name to what is now called the <em>Barcan Formula</em>.  She showed  that on a plausible conception of how <em>possibility</em> worked, the following thesis turns out to be true: </p>

<blockquote>
	<p>If it is <em>possible</em> that something has property <em>F</em>, then there is something such that <em>it</em> possibly has poperty <em>F</em>. </p>
</blockquote>

<p>Now, this might be a problem. After all, if we think it is <em>possible</em> that there be an object with atomic number 150, does it follow that we should think that there <em>is</em> some stuff such that it <em>could be</em> matter with atomic number 150? It&#8217;s kind-of odd to think that this must be so, but on a straightforward understanding of how modality and possibility works (that every &#8220;world&#8221; has the same &#8220;domain&#8221;: more on this later) this is how things turn out. </p>

<p>The <a href="http://plato.stanford.edu/entries/actualism/index.html">debates arising out of the combination of modality and quantification</a> are by no means over. Ruth Barcan Marcus&#8217; sharp analysis has focussed the discussion of these topics for decades. </p>

<p>More information about Marcus can be found at her <a href="href="http://www.yale.edu/philos/people/marcus&#95;ruth.html">web page</a>.  For a good collection of Prof. Marcus&rsquo; work on modal logic, her collection <em><a href="http://www.amazon.com/Modalities-Philosophical-Ruth-Barcan-Marcus/dp/0195096576/consequentlyorg">Modalities: Philosphical Essays</a></em> is the place to start.</p>

<h3>Saul Kripke (1940-)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Kripke.jpg" alt="[Image of Kripke]" />Saul Kripke was a precocious teenager when his work revolutionised intensional logic. For many years people had known that the logic of <em>possibly</em> and <em>necessarily</em> had a coherence all of its own, and many people had strived to give it a plausible and satisfying formal <em>semantics</em>. This was to change in the work of a teenaged Kripke, published in 1959 (&#8220;A completeness theorem in modal logic&#8221;, published in the <em>Journal of Symbolic Logic</em>, pages 1 to 15 of volume 24). In this paper, Kripke exploited the well-worn notion of a possible world, and introduced the notion of &#8220;relative possibility&#8221; as a relationship between &#8220;possible worlds&#8221;. Then we could say that a formula &#8220;necessarily <em>A</em>&#8221; is true at a world if and only if <em>A</em> is true at all worlds which are possible relative to the original world, and &#8220;possibly <em>A</em>&#8221; is true at a world if and only if <em>A</em> is true at some worlds which are possible relative to the original world. </p>

<p>The notion of possible worlds is not original with Kripke. Neither, in fact, is the use of something like a relative possibility (or &#8220;accessibility&#8221;) relation. However, putting these things together in a neat bundle, and showing how a number of studied modal systems can be understood in this light, <em>was</em> new, and this generated a whole new field of study: the possible worlds semantics for modal and other intensional logics. </p>

<p>Kripke went on to work in many different areas in philosophy, including some influential <a href="http://www.amazon.com/exec/obidos/ASIN/0674954017/consequentlyorg">work on Wittegenstein</a> and other areas of metaphysics and the philosophy of language. His mark on logic, however, was already made in that paper written as a teenager. </p>

<p>More information about Kripke&#8217;s work in <em>philosophy</em> can be found at the <a href="http://www.xrefer.com/entry/552540">Oxford Companion to Philosophy</a> on him. </p>

<h3>David Lewis (1941-2001)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Lewis.jpg" alt="[Image of Lewis]" />David Lewis is famous not only for his great impact on analytic philosophy (perhaps this impact is felt most keenly in Australia, a country he loved and visited regularly) but also on the reaction that his philosophical views provoked. Lewis&#8217; <em>modal realism</em>, the view that other possible worlds are just as real, and just as real in exactly the same way as this world we live in, famously and regularly provokes an <em>incredulous stare</em> from people when they hear that he believes it quite literally. </p>

<p>Lewis is a good example of a philosopher whose work is the consequence of the work of others. This is not to deny his creative output or originality in any way: it is a creative work to spell out the consequences of a view, and no body of work in this area is richer or more well developed than Lewis&#8217;. David Lewis&#8217; view, I think, can be seen as what you get when you cross Quine&#8217;s ontological views (his extensionalism) with the intensionalism you find in Kripke&#8217;s and others&#8217; work on modal logic. Lewis acknowledges that modal notions (possibility and necessity and the like) are important, meaningful, and to be found in any theory we take seriously. From Quine, he takes the ontological commitment of a theory to be read off what the theory <em>quantifies over</em> (Quine&#8217;s dictum is &#8220;<a href="http://www.jcu.edu/philosophy/gensler/ap/quine-00.htm">to be is to be the value of a variable</a>&#8221;.) Modality is important and it makes sense. Our way of understanding modality is to quantify over possible worlds in semantics in the tradition of Kripke. Voila: modal realism. </p>

<p>Lewis&#8217; work on this topic, especially in the book <a href="http://www.amazon.com/exec/obidos/ASIN/0631224262/consequentlyorg">On the Plurality of Worlds</a> is a compendium of what follows from taking this metaphysical picture seriously, and the kinds of philosophical applications the notions of possible worlds might have. </p>

<p>More information about Lewis can be found at the <a href="http://www.xrefer.com/entry/552612">Oxford Companion to Philosophy</a>. </p>

<h3>Jon Barwise (1942-2000)</h3>

<p><img class="logician" src="http://consequently.org/images/logicians/Barwise.jpg" alt="[Image of Barwise]" />Jon Barwise was a <em>renaissance logician</em>. He didn&#8217;t know <em>everything</em> but his contributions ranged so widely that he approximated omniscience quite well. His work <a href="http://www-vil.cs.indiana.edu/kjbpubls.html">ranges from</a> infinitary logic (an extension of Frege-style predicate logic to deal with infinitely long sentences, and infinitary quantifiers), the model theory of first-order logic (continuing on from Tarski&#8217;s work), generalsed quantifiers (quantifiers other than &#8220;for all&#8221; and &#8220;for some&#8221;), admissible sets and generalised recursion theory (the connections between sets and computation), situation semantics and the philosophy of language (using <em>situations</em>, restricted parts of the world as bearers of information, rather than just entire possible worlds), information theory (an account of how information flows and is transmitted), and the logic of <em>diagrams</em> (examining visual representation and inference, as well as linguistic representation).</p>

<p>Barwise&#8217;s work, in all of 35 years, has covered a <em>huge</em> range of disciplines, and it gives you some idea of the breadth of work available in contemporary logic. Barwise&#8217;s approach of regularly moving into new fields, to keep fresh and active, is a helpful antidote in the current age of increasing specialisation and narrowing. If work like this is possible at the end of the 20th Century, it will be our job to see what might be done in the 21st.</p>

<p>More information about Barwise can be found at the <a href="http://www-vil.cs.indiana.edu/barwise.html">Barwise Memorial Pages</a> at Indiana.</p>