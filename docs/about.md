---
layout: page
title: About CLARA
---

{: style="font-size: 1.3em" }
> *We become what we love and who we love shapes what we become*

## Why CLARA?
![Figure 1. Santa Clara]({{ site.baseurl }}/assets/images/clara.png){: .saint-clara}

Compared to commercial data processing frameworks, such as Apache Spark,
Storm or other Hadoop based data engines, CLARA was designed specifically
for scientific data processing needs. Even though tools are of paramount
importance in science, we think that one's focus should not be on the tool
itself, but what you build with that tool.

During the past decades, we
witnessed innovations in software and hardware technologies that improve,
and the same time confuse our research. In fact, software tools and technologies
are developing at a pace that will minimize overall scientific results if
we adopt new technologies every time they become available. So, we throw
dice at the very beginning of a research process and choose a technology
to aid our research. From that point on we are attached at the hip to the
technology of our choice.

Note that a research projects can last for a very
long time, for example high energy and nuclear physics experiments can run
for years and data can be analyzed and re-analyzed long after experiment is
over. However, new technologies that appear during this time period can offer
a substantial productivity boost, thus increasing scientific outcomes.
Often adoption of new technologies is stopped by the roadblock of recoding
a legacy code base (for example, Spark suggests Scala as a programming
language, when we still have software components written in Fortran).


So, how CLARA is different?

* CLARA offers a micro-services environment
  where an existing data processing application decomposition
  will help gradual transition to a new technology
  (new and old technology based micro-services can coexist in a single application).

* CLARA allows tools to wrap legacy code in a micro-service.
  It can present Fortran, C++, Python, or Java legacy code segments
  as a CLARA micro-services.


## CLARA related publications

{: style="text-align: left" }
* *CLARA: A Contemporary Approach to Physics Data Processing*, 2011,
  [J. Phys.: Conf. Ser. 331 032013 doi:10.1088/1742-6596/331/3/032013](http://iopscience.iop.org/article/10.1088/1742-6596/331/3/032013/pdf)

* *Development of A Clara Service for Neutron Reconstruction*, 2011,
  [APS: 2011APS..DNP.EA024C](http://adsabs.harvard.edu/abs/2011APS..DNP.EA024C)

* *Component Based Dataflow Processing Framework*, 2015,
  [IEEE DOI: 10.1109/BigData.2015.7363971, ISBN: 978 1-4799-9926-2](http://ieeexplore.ieee.org/document/7363971/)

* *Earth Science Data Fusion with Event Building Approach*, 2015,
  [IEEE DOI: 10.1109/BigData.2015.7363972, ISBN: 978 1-4799-9926-2](http://ieeexplore.ieee.org/document/7363972/)

* *CLARA: The CLAS12 Reconstruction and Analysis framework*, 2016,
  [J. Phys.: Conf. Ser. 762 012009 doi:10.1088/1742-6596/762/1/012009](http://iopscience.iop.org/article/10.1088/1742-6596/762/1/012009/pdf)


## License

CLARA is released with the following license:

```
Copyright (C) 2016. Jefferson Lab (JLAB). All Rights Reserved.
Permission to use, copy, modify, and distribute this software and its
documentation for governmental use, educational, research, and not-for-profit
purposes, without fee and without a signed licensing agreement.

IN NO EVENT SHALL JLAB BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF
THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF JLAB HAS BEEN ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.

JLAB SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE CLARA SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
HEREUNDER IS PROVIDED "AS IS". JLAB HAS NO OBLIGATION TO PROVIDE MAINTENANCE,
SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

This software was developed under the United States Government License.
For more information contact author at gurjyan@jlab.org
Department of Experimental Nuclear Physics, Jefferson Lab.
```
