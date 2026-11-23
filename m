Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456927;
	b=Tx6H5gj7OB5wFr3AOVDEM8OOA3idVSKX3cnsDjrqqnMBRggkfe6YkGFc8i7ImWZZI48G
	 RoJdlEmQ/afYKJ2wT0egT463wwcGs6pT+c1G8zhxB9RqJ81/oA2jsLEM1Sf04ayYklxT1
	 K35FlZBw9wpdp8ZbKVHhyeqcGFyd0bbWhAi9sCEBchxu+icNF/yl0s4OIN+UGpRT4y9Td
	 HWg7xl+f7fkexFj/rBoH2YnMl3Vq7my6H4m9p6wi/5UXSBQUZffZJf6o/c3Rq01vvx1z5
	 JW/2DD9cneAkBfKr5tkIeJiYsF23jMG2mNMI+6d70yQB6Acl/+Xoe2f63N5EPcPBoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456927;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pKlXgOewf+o3UFmngDas4t6V3A9twRqQfDsEtlYDJok=;
	b=m/7mH8Uq9o/8HA6OEP8emLlrZTrVsox5ni6IX79sysKqDgRqXg/kIc6NjCi5YjhoLNm0
	 dZ9rpvQFQl0rTWoLlB8GFIywNFhMQL7NTKEyL/crapFSrQOfCoyk/C867PwXzKmv/5Ccj
	 DkuvxRuqdu9XUEILqF0ljIl+BAjdhqt9FLGxAZw0PqXVQ/mdCl0tDC731x6mKvjlS7SXk
	 LbN5T67lO+5mAV+7d3uqBrzrg70Bg8w7bvpsK+kW1iXEWMeaIHEH0h80Ov1tzRt2yWEkG
	 uGjmD9mUbQ1d8J3ST60azdfbF9Yj7YX5VDAfOcqGRkxRjMKv6S0HOa3kxPCanZSV5Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Jpq2nYuD;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA6606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 18:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Jpq2nYuD
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24E1E228;
	Mon, 23 Nov 2026 18:59:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795456772;
	bh=CUaGrrg4kpz+zuGVm/MSF6QOabC0gJXC5hLQSE+daSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jpq2nYuDzHuy8t80O+h+0jgbY9GzBCZAnuIChvBl824KXJ1UK8YcUc5o2dDb8p2pz
	 A55C7J/MVckggx8ox0oGmJmx0Y0WyF4XtaOaA/HAJTXlNhWsfk5Tcf0xvTzUOfvK5p
	 u/ODx1ONo3Il2Lj0odVghymCEEhp9z6HnD/IS91Q=
Date: Mon, 23 Nov 2026 20:02:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] Various CCS fixes
Message-ID: <20261123180203.GC3050935@killaraus.ideasonboard.com>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123165549.GE2959742@killaraus.ideasonboard.com>
 <dc8bcacc-d743-4108-87e7-3c6715b23f4a@ixit.cz>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc8bcacc-d743-4108-87e7-3c6715b23f4a@ixit.cz>

On Mon, Nov 23, 2026 at 06:55:53PM +0100, David Heidelberg wrote:
> On 23/11/2026 17:55, Laurent Pinchart wrote:
> > On Mon, Nov 23, 2026 at 01:02:38PM +0100, David Heidelberg via B4 Relay wrote:
> >> First two seems to be no-brainers. Next two seems to be correct too.
> > 
> > What exactly do you mean by "seems to be correct" ? Are you sending
> > LLM-generated patches that you're not even sure about ? That's a
> > complete no-go.
> 
> Hello Laurent.
> 
> While I'm aware of your antipathy against LLM models, current situations doesn't 
> look like there are lining people to fix it and make sensors work with the MIPI 
> CCS drivers (introduced 2012).
> This leads to endless forks of imxXXX sensors across hundreds of trees + people 
> clanking this stuff over and over. Let's establish that first.
> 
> When I see opportunity to improve the generic driver, I'm taking it.
> 
> change-id: 20261123-ccs-clanked-fixes-609bb0754028
> 
> As you can see the change-id, I didn't make it somehow hidden. I reviewed the 
> changes which LLM found when helping me figuring out why I have black/white 
> output from the sensor which sequences seemed to be correct to me.
> 
> My logical thinking would be evaluate quality and review the code, which leads 
> to my brain marked:
> 
> patch 1 + 2 as pretty confident it's correct and
> patch 3 + 4 as looking reasonable to me.
> patch 5 + 6 I haven't send because of unnecessary complexity and likely wrong 
> approach (still in the backlog to analyze)
> 
> I would believe it's better to at least report in this form, thus my comment 
> inside the cover, that last two patches may be useful. And yes, I understand 
> there is infinite amount of randomly clanked patches coming in your direction 
> and I understand it's huge time-waster and pain.
> 
> For v2 I'll drop patch 3 and 4. Hopefully that makes more sense to you, because 
> as I'm working on getting Linux mobile phones in a good shape, I have not 
> ability to split myself into developer highly specialized in every field 
> (subsystem).

Sakari maintains the CCS driver, so it's his call.

I find it very rude to throw LLM-generated patches to reviewers and
maintainers if you can't have full confidence yourself that they're
correct. If you don't want to invest *your* time and energy into
properly understanding what a series does, why should maintainers spend
any time helping you for free ?

> >> Signed-off-by: David Heidelberg <david@ixit.cz>
> >> ---
> >> David Heidelberg (4):
> >>        media: ccs: Use dev_dbg() instead of dev_err() in ccs_enum_mbus_code()
> >>        media: ccs: Fix sub-device index in ccs_cleanup()
> >>        media: ccs: Update PLL and blanking limits when pixel_array crop changes
> >>        media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip controls
> >>
> >>   drivers/media/i2c/ccs/ccs-core.c | 14 +++++++++++---
> >>   1 file changed, 11 insertions(+), 3 deletions(-)
> >> ---
> >> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> >> change-id: 20261123-ccs-clanked-fixes-609bb0754028

-- 
Regards,

Laurent Pinchart
