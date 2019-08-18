---
Title: Reading: Time-Variant Models
Date: Feb 21, 2012
--- 

<div>


<p>As I’m trying to develop a time-variant model of the S-Map <span class="citation">(Sugihara 1994)</span>, Alan suggested I look into Stokes’ <span class="citation">(1988)</span> of a time-variant model of Nicholson’s <span class="citation">(1954)</span> blowfly data. My notes:</p>
<ol style="list-style-type: decimal">
<li>The data from Nicholson <span class="citation">(1957)</span> is actually longer.</li>
<li>It’s clear that the blowfly data emerge from a time-delayed process
<ul>
<li>How do S-Maps respond to time-delay processes? Should a time delay introduce another dimension to the data? Let’s try it with both segregated times – \(x = f(x_{t-2})\) – and mixed – \(x= f(x_{t-1}, x_{t-2})\).</li>
</ul></li>
<li>Fluctuations become less periodic over time in the longer data set.</li>
<li>Nicholson speculated that this was due to natural selection</li>
<li><p>The model used to estimate the population is:</p>
<p>\[\begin{aligned} B &amp;= P e^{-f_0 / f} \\ f &amp;= \frac{\phi}{N} \\ N_0 &amp;= \frac{\phi}{f_0} \end{aligned}\]</p></li>
<li><p>The authors fit a model where the parameters change over time, as follows. First, since the protein supply rate \(\phi\) changes with time, fecundity \(B\) changes as follows</p>
<p>\[\begin{aligned} \frac{dN(t)}{dt} = R(t-\tau) - \delta N(t) \\ R(t) = PN(t) e^{N(t) / N_0} \end{aligned}\]</p>
\(P\), \(f_0\), and \(\delta\) all become time-variant. \(\tau\) is held constant, in the absence of any way to estimate it.</li>
<li>Estimating the change is done by breaking up the time series into 100-day blocks and measurin</li>
<li>The steady state value of the newly estimated model increases, as does the mean of the experimental data.</li>
<li><p>Simulations qualitatively show the same changes in time as the real data. They include noise with spectra estimated from the data – \(S_B = 0.36 \text{ days}^{-1}\), and \(S_{\delta} = 0.00625 \text{ days}^{-1}\)</p></li>
</ol>
<p>OK, so this is a data set that has a plausible and characterizable change over time. I could use the real data or simulate it. It could also potentially be fit without breaking up the blocks, using a Bayesian framework.</p>
<p>Moe et al. <span class="citation">(2002)</span> Uses a non-parametric approach to examining the data from a similar experimental set-up to Nicholson’s. There is no time-variant component, though.</p>
<h1 id="references">References</h1>
<p>Moe, S. J., N. C. Stenseth, and R. H. Smith. 2002. Density dependence in blowfly populations: experimental evaluation of non-parametric time-series modelling. Oikos 98:523–533. doi: 10.1034/j.1600-0706.2002.980317.x.</p>
<p>Nicholson, A. J. 1954. An outline of the dynamics of animal populations.. Australian Journal of Zoology 2:9–65. Retrieved from <a href="http://www.publish.csiro.au/?paper=ZO9540009" title="http://www.publish.csiro.au/?paper=ZO9540009">http://www.publish.csiro.au/?paper=ZO9540009</a>.</p>
<p>Nicholson, A. J. 1957. The self-adjustment of populations to change. Pages 153–173 <em>in</em> Cold Spring Harbor Symposia on Quantitative Biology. Cold Spring Harbor Laboratory Press. Retrieved from <a href="http://symposium.cshlp.org/content/22/153.short" title="http://symposium.cshlp.org/content/22/153.short">http://symposium.cshlp.org/content/22/153.short</a>.</p>
<p>Stokes, T. K., W. S. C. Gurney, R. M. Nisbet, and S. P. Blythe. 1988. Parameter evolution in a laboratory insect population. Theoretical Population Biology 34:248–265. Retrieved from <a href="http://www.sciencedirect.com/science/article/pii/0040580988900238" title="http://www.sciencedirect.com/science/article/pii/0040580988900238">http://www.sciencedirect.com/science/article/pii/0040580988900238</a>.</p>
<p>Sugihara, G. 1994. Nonlinear forecasting for the classification of natural time series. the Royal Society of London. Series 348:477–495. Retrieved from <a href="http://rsta.royalsocietypublishing.org/content/348/1688/477.short" title="http://rsta.royalsocietypublishing.org/content/348/1688/477.short">http://rsta.royalsocietypublishing.org/content/348/1688/477.short</a>.</p>
</div>