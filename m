Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D83E49C8
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651258; cv=none; b=AMXtUtQ+BJVb2jy6I7xxwuQcO4+EO4l/gCsjiZqNzInprwoPDu2Dn/YniRB5M5hAtSJxS3OKOTNrU7rVPGdkKFqj6JgImLOo6T3pSwvRF6s8H2dRdDNHblAzY3f95suXOsT27R2aqQ6SbG5S6cNVNyTccvXKD6OZe0MNL+f8Uxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651258; c=relaxed/simple;
	bh=qcD6bhoaOMzHm21mbXbogBuQH5C1wugfnM5svaUrPh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHnmwvZi93u8stQC23S2lnyH/Rx3s3KwIIc5F+AwEPWcRu9n6PqWPpljUq4BPqJ+WzBqlQZFrIIZNBfHVRWBMeofAK/4Xd45PL7u/NnDbePelkQGU3OeR1JWVg6so46ZUxQCDXpYyKETyAu4rlYugIq27X2FBvHEzhc7LtiL2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eu7XEn3g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eu7XEn3g"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9F5517;
	Tue, 21 Jul 2026 18:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784651195;
	bh=qcD6bhoaOMzHm21mbXbogBuQH5C1wugfnM5svaUrPh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu7XEn3gvdJhn8ilhi/oIqppIDvl+FgWir3ibh+4ilN2xBsktqBdvOJENMECdGUv1
	 hEbC+Hlspd7tGjivVLDgvy6NXdPb4AOL4DfgJSpzI33Ay8Bq75ONuu3U/J2es8IS3I
	 sdJsO+qbszaM5qg4Zzm/KuVV1abnsqe39CEoOiYY=
Date: Tue, 21 Jul 2026 19:27:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Theodore Tso <tytso@mit.edu>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Derek Barbosa <debarbos@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Steven Rostedt <rostedt@goodmis.org>, users@kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260721162733.GE536385@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <alc3gAJfAkG5DULJ@zed>
 <alfBvhZkAelq5RVf@mit.edu>
 <aliMsSH373RJ31Mq@zed>
 <aloZ9hqSgzN3beqH@mit.edu>
 <2c31712c1062798d76a9e4272f7f49e007f53cd7.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c31712c1062798d76a9e4272f7f49e007f53cd7.camel@ndufresne.ca>

On Fri, Jul 17, 2026 at 11:22:17AM -0400, Nicolas Dufresne wrote:
> Hi Ted,
> 
> Le vendredi 17 juillet 2026 à 08:20 -0400, Theodore Tso a écrit :
> > I think the other difference is that in the media subsystem, you can
> > rely on the userspace code being "nice"
> 
> just wanted to clarify, said this way, it sounds terribly bad and quite off to
> me. Relying on userspace being nice is not what we want to do, or aim to do.
> Linux Media is framework based, meaning there is framework sitting in front of
> drivers that filters bad ioctl calls.

I can't speak for all contributors, but I'm certainly not aware of
anyone in the media subsystem considering that issues on the kernel side
are fine because userspace will not normally exercise the API in certain
ways. I hope that no kernel subsystem handle security by relying on
userspace to never be adversarial.

> This is where Sashiko analyses isn't
> always profond enough, or where Sashiko will propose driver changes rather then
> framework changes. I'm quite convince this has a lot to do in the model choice,
> and some compromise between precision / speed (or cost).

-- 
Regards,

Laurent Pinchart
