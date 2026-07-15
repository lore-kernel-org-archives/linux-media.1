Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA14A2E1D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145804; cv=none; b=rFvAx5xL+9vWK0EJNub0xJdtR+G4JnCfx0oQtKs+3BXQe+V5JXXzpwk7ypso05QT7bt9nLq2oT5mH1aTRUupez/x3+oa1Z/prDCFe+cswZInIkwxUCEbfT2GPfqNjRzxi4Dm/TwzgmtFHsVwlb2q3cBP+6uUVbWI33fbsc1Mklc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145804; c=relaxed/simple;
	bh=mInBdVU9ed6bCPUw/1XXaBt97nOIzKTykxNqFR5oMfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW1M6mdNnSRVHSUURw95QXBVc3mw4SbPxGIF2XPD3/duGngXkGR7bzPsnKTPugn+oFfhMD4POFcWyA3cIohT38GSs0NthxqXfQ5b5ZzvM/sSo607EBimez7Fm689rsXZ+ANB5t+YfrJekEfsaeC4cczw5JJFw6eupD77QFl/IaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d8v/SFEA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d8v/SFEA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82FAE267;
	Wed, 15 Jul 2026 22:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784145743;
	bh=mInBdVU9ed6bCPUw/1XXaBt97nOIzKTykxNqFR5oMfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8v/SFEAhMmVM4WxT7bhfyUyUhnIkxm9SL7MeyBolFSzmOtgPtyPdAJgkU2nngnHO
	 d8wEmu1/6gVrf208bKVeNCxZM4QnDKBfxUn1uRTmDAh5nBL8GgUyDvJXFfSGG0zoex
	 NwcdyPsd4ipLUWeC6nuRpdn420T1Hhh+F1PylDX4=
Date: Wed, 15 Jul 2026 23:03:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
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
Message-ID: <20260715200317.GA1824265@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
 <aldx9KiAHM4CRI0m@lt-jori.localdomain>
 <e536800d8a84b99f34a79c590f57cd68cdb50e57.camel@ndufresne.ca>
 <20260715191216.GM1778116@killaraus.ideasonboard.com>
 <8061fd3d27432ba0b42fb398d70f56fabc2ee586.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8061fd3d27432ba0b42fb398d70f56fabc2ee586.camel@ndufresne.ca>

On Wed, Jul 15, 2026 at 03:27:46PM -0400, Nicolas Dufresne wrote:
> Le mercredi 15 juillet 2026 à 22:12 +0300, Laurent Pinchart a écrit :
> > On Wed, Jul 15, 2026 at 02:13:12PM -0400, Nicolas Dufresne wrote:
> > > Le mercredi 15 juillet 2026 à 14:21 +0200, Jori Koolstra a écrit :
> > > > While there is some truly ridiculous anti-LLM brigading in some open
> > > > source projects, I feel like saying it is just another tool does not do
> > > > justice to some of the harm that is done by that industry. Also,
> > > > precisely because of the usefulness of LLMs, I worry about creating an
> > > > uneven playing field, where new contributors can't keep up if they can't
> > > > afford the needed tools (something that is not as much the case with
> > > > compilers.)
> > > 
> > > So "fairness" is likely one of the numerous ethical concerns that can drive
> > > activist against LLM (in the sense of people actively avoiding it, boycotting
> > > for the real extreme one, but I want to include mild cases too) in contrast to
> > > luddite, that just don't accept the technology to provide any meaningful result.
> > > I'm personally interested in learning more about each and every ethical
> > > concerns, as this is needed to either fixi or mitigate the social issues this
> > > technology is creating.
> > > 
> > > On this aspect specifically, Sashiko is provided equally to the Linux community.
> > > This is very unlike coding agent, which capabilities and performance are highly
> > > tailored to your capability to pay. In that sense, fairness is minimally
> > > mitigated. I say mitigated considering someone have to pay for the compute and
> > > because its currently running off proprietary owned models, also require paying
> > > for extra royalties (which is an interesting ethical discussion in itself I
> > > suppose). Smaller projects may not have that level of donation or budget.
> > 
> > Or will to pay money to companies with dubious ethics (a strong
> > understatement).
> 
> Though, let's accept to cut this sub-thread here,

Sure.

> since we got off the
> "technical merit", meaning we are off-topic now.

I haven't argued much, if at all, about the technical merit in this mail
thread though.

-- 
Regards,

Laurent Pinchart
