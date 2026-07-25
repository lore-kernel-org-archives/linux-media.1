Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED553B1B3;
	Sat, 25 Jul 2026 00:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784940447; cv=pass; b=Dfnv8TpeHLKSF7d7AEfq62P8bfFZW67f9uXp4b3q05CVtZ4UsgcvegKuDGZ45+9eFRqRiWDhXV4ENs+xOMVFKMGtUw3oVRRHf8YIy9ZYOEV6RQmA8gMBZC77mpSZ2BUKGduFvIEj1yB8CxniuV1hjbevkIwLM9m9Er6z9YDa4a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784940447; c=relaxed/simple;
	bh=5sLkJRzx/MNCSYtg/L1SWbLAtSUzvWTjTCGqTGYH8YI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=VUb4jGnNODkJ7+Ay06j5FUGOiWt+W9KGDj9jUJcHtbtBc9TrhHKVXXvU/bVVSBwie+t3jpoCgz0UrufyC2Xwra9t6X/DSYxXLZZs62VCbmo8FMRzg21To10lNZAddqYaQSb+PBlxKTSRHiMy/Y3rR6sE1R2rwOFwh25g+jJk1yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=fPCKQs5l; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="fPCKQs5l"
ARC-Seal: i=1; a=rsa-sha256; t=1784940423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fjRQ7pTb94Q9NU6sjGmboAazex4JJerHLAGHPuuXFNm3kTPUHMjb4oY3a9+RiEgUunrHvJPaHzyzhGVijEw/HzaClT5vA2Ul/WVuF5Y73tfzaoty8afit3gGvwVTsiXsNR+40SdYnjCJmtt+rZI4BHG4QwQyt5FaD3nVS0+Y5Lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784940423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5sLkJRzx/MNCSYtg/L1SWbLAtSUzvWTjTCGqTGYH8YI=; 
	b=UY3R9wWaa8893wEeqIdJStSySV5ICQlAmTZBAhpJAt8vHaMnfPL3rEPKC6pbfnRD2VrwJEsxk10cYeMQqMzQ56LyKoqhEU7v2IzK0NWHEE6yTDcFSlSipkpWOeOyq/wz/42Cb2TfCmeCPH/rueZJRP48FrjNndBx2a1pXFYtTYM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784940423;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:Reply-To;
	bh=5sLkJRzx/MNCSYtg/L1SWbLAtSUzvWTjTCGqTGYH8YI=;
	b=fPCKQs5lUdZLr0tdleiMAnzb1gvM/bgmnuZDXD2rwBBrUQu/Wgruh5bTDf4VY0NV
	PETsDvDAQ5ADmuDvWZiTmypbMfTpokMWCqVlVdq/flIa/5txTJf/YoFwtIRF1d6ZLbL
	koDw+5eyNPx2it8CHHY62BQRu2jiDvMlQ4T2Mo1I=
Received: by mx.zohomail.com with SMTPS id 1784940420926600.2210516222842;
	Fri, 24 Jul 2026 17:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 20:46:56 -0400
Message-Id: <DK78KJA4LEAN.2H4O5BZN6H8LK@ritovision.com>
Subject: Re: [PATCH 0/2] docs: make tables responsive with content-aware
 column widths
Cc: "Daniel Lundberg Pedersen" <dlp@qtec.com>, "Randy Dunlap"
 <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260724214249.23830-1-rito@ritovision.com>
 <87ik646lfc.fsf@trenco.lwn.net>
In-Reply-To: <87ik646lfc.fsf@trenco.lwn.net>
X-ZohoMailClient: External

> So I will look at this in more detail in the coming days.

Thank you, I look forward to the review.

> this is the injection of a bunch of complexity to solve a problem that
> nobody has complained about.

I don't believe that aligns with the reality, Jon.

In the "bad wrapping in some tables" thread, after I characterized the
responsive tables as foundationally pathological throughout the docs
site, Hans came in, not to rebut that, but to acknowledge the problems
he's seen:

> We're well aware that the tables in the media subsystem do not work
> well on small screens. The only workable solution would be to move
> away from tables and format it differently. And that's not going to
> happen as that would be a massive job.

That is not an absence of a problem. It is a maintainer living with a
known pain point because he believed nothing feasible could be done
without a massive overhaul.

I believe this series resolves that class of problem without requiring
such an overhaul.

My table characterization was also followed immediately by Mauro taking
action to foundationally improve how tables render across different
viewport sizes (which you then approved).

> On media, I guess the more complex tables with long widths are the
> pixfmt ones like those:
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-rgb=
.html
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-pac=
ked-yuv.html
>
> It is a good place to check for issues like that.
>
> Please see the patch I submitted:
>
> https://lore.kernel.org/linux-doc/1950557405f1150acb1de50de1801f2413223b8=
7.1783673996.git.mchehab+huawei@kernel.org/
>
> It moves width support at the html output from previous millennium
> SVGA-resolutions era to modern age.

Mauro's fix actually opened the gate for my solution here to work
properly, allowing contained horizontal scrolling without causing
a desktop clipping regression under the previous 800px body constraint.

> Your last attempt here led to regressions that took a while to turn up

I own that oversight.

The original fix was targeted at body-text overflow. I did review tables
containing inline literals, but I missed the specific case where a
column consists only of inline literals, with no other content to
preserve a readable width, while surrounding columns compete for space
and collapse it. That is a narrow structural edge case, but apparently
one with a broad enough surface area here to matter.

I understand this docs system better, and the problem has more eyes on
it now.

I'm here to finish the job.

This series addresses that missed case as part of a systemic solution
rather than another isolated patch.

Rito
