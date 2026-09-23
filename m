Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA537F726
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148867; cv=none; b=tG4HtMuqQrt+2b/fdum4Mrw41GO4nVlEsVJpuUFEOhZv6GFkdhDw5wj0I3g5jWgcJVu5dNZhKkwgefUvLdLAsuntP2UKNZlqrE3YQXGE6T53XYO0hCp2kAu7+pSeyPoTnTM+RcupXpBt/D2fCun0I0+oJak5GF98E8PD/poN+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148867; c=relaxed/simple;
	bh=3x+CTRJ5OoEkng7lmRHKFDHz0bGekGi3k9+xahJYKK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh4oSyavJsW5YTV1QbyEVHLtkYSX59UpGSLX5dMjTwon+2MVa4wPEfXNi52yiqVAcq1FOkIn7hU1ZPdt1cS7a8LfiiPvYXzEIvFJWEiHi+FpQC3bHBU+rLptoJDi8Hhg3QH5ndIFRO6OM2VUWr5RGQVXzLBmvHmX169GCpbwGDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nDBtFyXT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nDBtFyXT"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8AF1B46;
	Wed, 23 Sep 2026 09:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790148757;
	bh=3x+CTRJ5OoEkng7lmRHKFDHz0bGekGi3k9+xahJYKK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDBtFyXTrIm2tFam1699OU61Fjv3+mojjXaiZIz518OPTyHg1ui7WvQLVWOdzKFuJ
	 cERvpdmk3HdycizLNzFUmePT8bo+NyZA3OyTRLngm5LYpTQvpuIjRQ3/pWhAr7srbo
	 xtjLHI/5thQzcomrWVV3+/2Vk86GBTBUMfJqDNQE=
Date: Wed, 23 Sep 2026 10:34:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: RFC: Remove gspca and old ISA radio drivers
Message-ID: <20260923073421.GA3532@killaraus.ideasonboard.com>
References: <8d8203ba-a406-4730-9493-dbab8b3ec831@kernel.org>
 <20260922155509.GA2471124@killaraus.ideasonboard.com>
 <7be9601a-cd2e-43b8-abd3-96dd2cc8a38f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7be9601a-cd2e-43b8-abd3-96dd2cc8a38f@kernel.org>

On Wed, Sep 23, 2026 at 08:29:58AM +0200, Hans Verkuil wrote:
> On 22/09/2026 17:55, Laurent Pinchart wrote:
> > On Tue, Sep 22, 2026 at 05:37:03PM +0200, Hans Verkuil wrote:
> >> Hi all,
> >>
> >> Would there be any objection to removing the gspca driver for all those old
> >> webcams with horrible quality and that nobody should be using anyway, and
> >> for the old ISA radio drivers where I am pretty sure I'm the only one that
> >> can actually test them (and even that is questionable).
> >>
> >> I could move them to staging/deprecated for a kernel cycle, but to be honest
> >> I think we should just kick them out.
> > 
> > No objection from me. gspca doesn't bother me though, as it's quite
> > self-contained. I would be happier to see the em28xx driver go when it
> > will be time, as it's one of the few users of some legacy subdev APIs I
> > would like to drop. As far as I understand, that driver is however more
> > widely used.
> 
> That's still in use, and quite a lot too. I still get patches adding support
> for new em28xx products. If you want to get rid of legacy in that driver,
> then it is best to get em28xx based hardware and make patches. This driver
> won't go away any time soon.

Yes, I know. I was expressing a long term wish :-)

> >> It also allows me to throw away a lot of old hardware and make some room for
> >> new hardware :-)
> > 
> > I wonder if some computer science museums would have an interest in
> > those. I suppose they're not the most interesting devices.
> 
> Not old enough, and not special enough.
> 
> Now, I also have one of the first consumer webcams (Connectix QuickCam,
> parallel port, grayscale), that one might indeed be of interest for a museum.

At the very least for the section of the museum aimed at generating
reactions along the line of "PEOPLE DID THAT????" :-)

-- 
Regards,

Laurent Pinchart
