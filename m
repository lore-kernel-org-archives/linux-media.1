Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458929;
	b=QBEZ6jg907t0b1q5Axx5dCzw2nsf/uaXDR8eluXMmhJyXbh9tzjkIOE7Qqe+rM86iaOn
	 wLE2AngGoMFxt4i+vcBS0g4VA3D2NKMA43jaDmPt3T9HYjsL3zkFTmFaxcu9aE1ImQySs
	 x+tFKFHq59bQVR934Cwq2QiXuty4NXhKBFLTwSDL1sgodiYPrFcjfPA5NqB83IsRIMfdr
	 FlxKk5OWTyrytM6B9kTzAPxQxRFsGVySUGgxDuO5kZ1KnayeNKG3gPi6PXbW7+vrXpdGD
	 UzX1Sjk5Owcaxrg67T80rxE/uVzGsJKudOameuztlShJgB6MwBohppp4fB/84eH+KNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458929;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=sGyO6zCOF9qPt4b+sfkYsjNTyAW6+jH2b3V4HYUfhgk=;
	b=V5ozk+yI+aCqHE2oCRHriDqhSaU8U4gszvHZ0Q9xmm8GuTGo0F/Nzcz2E24H3oqGjDS7
	 B9V+SFVEX6BXeRMoYMWjrUoEcu4yDF9yWtbHuKxwx7aL42CNoOrtLbr4z2W8x762b92UC
	 xT4hZtAuz8v1rW22GmPTd80TVqbtzULopx0phXi9D1MwV6YF2dABK47qzMEkWDV1P+i4g
	 6P5yxN2/DzYgzYH3iIsVqGJcBfJDWglwwdbTchgVR7TBcqI+8AsEP4vKqPW2Leu90HCar
	 0CF4K3OL/b51gxmbFT8EdFY84IVeypM8USIDv3SsOeRDTUUgwJEg+5QEEG+zIFGcyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=X4xxiMBE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0CB606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 18:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=X4xxiMBE
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A20F32E9;
	Mon, 23 Nov 2026 19:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795458774;
	bh=GK0OYzNTN5gtZyS6ZtSq8Av4SX3vBBzqtNVYSnseHj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4xxiMBE+aQ7z7jJ8ZrxtrOFkSYCSIU/Cvw4EFSv121tRiVf9V3untZd1Y9vOiK7+
	 ja5JmpZU9ueGPU7m2hfu6sdVJj0iIjYgypQXuzn8GU6SZMPJ82s1D5gnFpRj4qkZqY
	 Lzg7VCrE5+5l5xG//auHCF798eJT7WJgPSuVMNK0=
Date: Mon, 23 Nov 2026 20:35:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] Various CCS fixes
Message-ID: <20261123183525.GF2959742@killaraus.ideasonboard.com>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123165549.GE2959742@killaraus.ideasonboard.com>
 <dc8bcacc-d743-4108-87e7-3c6715b23f4a@ixit.cz>
 <20261123180203.GC3050935@killaraus.ideasonboard.com>
 <775a6f72-d138-4ff2-9328-1c0c9c865d07@ixit.cz>
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
In-Reply-To: <775a6f72-d138-4ff2-9328-1c0c9c865d07@ixit.cz>

On Mon, Nov 23, 2026 at 07:27:10PM +0100, David Heidelberg wrote:
> On 23/11/2026 19:02, Laurent Pinchart wrote:
> > On Mon, Nov 23, 2026 at 06:55:53PM +0100, David Heidelberg wrote:
> >> On 23/11/2026 17:55, Laurent Pinchart wrote:
> >>> On Mon, Nov 23, 2026 at 01:02:38PM +0100, David Heidelberg via B4 Relay wrote:
> >>>> First two seems to be no-brainers. Next two seems to be correct too.
> >>>
> >>> What exactly do you mean by "seems to be correct" ? Are you sending
> >>> LLM-generated patches that you're not even sure about ? That's a
> >>> complete no-go.
> >>
> >> Hello Laurent.
> >>
> >> While I'm aware of your antipathy against LLM models, current situations doesn't
> >> look like there are lining people to fix it and make sensors work with the MIPI
> >> CCS drivers (introduced 2012).
> >> This leads to endless forks of imxXXX sensors across hundreds of trees + people
> >> clanking this stuff over and over. Let's establish that first.
> >>
> >> When I see opportunity to improve the generic driver, I'm taking it.
> >>
> >> change-id: 20261123-ccs-clanked-fixes-609bb0754028
> >>
> >> As you can see the change-id, I didn't make it somehow hidden. I reviewed the
> >> changes which LLM found when helping me figuring out why I have black/white
> >> output from the sensor which sequences seemed to be correct to me.
> >>
> >> My logical thinking would be evaluate quality and review the code, which leads
> >> to my brain marked:
> >>
> >> patch 1 + 2 as pretty confident it's correct and
> >> patch 3 + 4 as looking reasonable to me.
> >> patch 5 + 6 I haven't send because of unnecessary complexity and likely wrong
> >> approach (still in the backlog to analyze)
> >>
> >> I would believe it's better to at least report in this form, thus my comment
> >> inside the cover, that last two patches may be useful. And yes, I understand
> >> there is infinite amount of randomly clanked patches coming in your direction
> >> and I understand it's huge time-waster and pain.
> >>
> >> For v2 I'll drop patch 3 and 4. Hopefully that makes more sense to you, because
> >> as I'm working on getting Linux mobile phones in a good shape, I have not
> >> ability to split myself into developer highly specialized in every field
> >> (subsystem).
> > 
> > Sakari maintains the CCS driver, so it's his call.
> > 
> > I find it very rude to throw LLM-generated patches to reviewers and
> 
> Take generated slop and just throw it maintainer - definitely rude.
> 
> Do a review myself with non-maintainer level of skills and partial 
> understanding? Hard to say.
> 
> It's rude to send patch when I'm fixing something in the kernel, but maybe my 
> understanding isn't that brilliant as the maintainer one?
> 
> > maintainers if you can't have full confidence yourself that they're
> > correct. If you don't want to invest *your* time and energy into
> > properly understanding what a series does, 
> 
> That's fair argument. Again not B/W, I invest my time. I have partial knowledge 
> of media subsystem, sent fixes before (even without LLMs).

The social contract is that maintainers get something in return for help
contributors. They expect contributors to learn, improve their
contributions over time, and occasionally some of those contributors
will help with development and maintenance in the long term.
LLM-generated contributions break that contract completely when they're
just thrown over the fence with nothing more than a cursory glance.
There's no learning any more, no improvements, just increased maintainer
burden.

Nobody expects you, or any other contributor, to be an expert, but if
you decide not to spend time learning and improving, I won't want to
spend my time reviewing your patches.

> > why should maintainers spend
> > any time helping you for free ?
> 
> That's good point. I could ask myself too - why am I sending fixes for free (not 
> paid by contract or company - community work)?
> 
> Maybe you're right. Maybe I should just patch the local imxXXX.c file in few 
> minutes and ignore it for year until it breaks again.
> 
> >>>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>>> ---
> >>>> David Heidelberg (4):
> >>>>         media: ccs: Use dev_dbg() instead of dev_err() in ccs_enum_mbus_code()
> >>>>         media: ccs: Fix sub-device index in ccs_cleanup()
> >>>>         media: ccs: Update PLL and blanking limits when pixel_array crop changes
> >>>>         media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip controls
> >>>>
> >>>>    drivers/media/i2c/ccs/ccs-core.c | 14 +++++++++++---
> >>>>    1 file changed, 11 insertions(+), 3 deletions(-)
> >>>> ---
> >>>> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> >>>> change-id: 20261123-ccs-clanked-fixes-609bb0754028

-- 
Regards,

Laurent Pinchart
