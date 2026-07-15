Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5E4248AA
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142747; cv=none; b=prSracl9tpmrtHr4sKaULYkh9IG4uwAeRBr3HBk0H1s0kd207M2dqdl7WOZW8v/JQKnFbK9TEeVGO1B4Y1gNgLLk9goxt3NBKq9Vkkkf05fm9LtBRNezgTy4vVIvLz+ngHZQ7u6s+II8v8InU6XUnOA7/Rd4NDD+dFl4eLOL8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142747; c=relaxed/simple;
	bh=OzWTjCaevKfC9wmXHd3PIHD/JiI579dbo5M5Z/pL7eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfMRBlOuJgdlOs8XRtAom+0wY1oqOsWrbMt/GimOfySESw1CHxgQxVsMUzleWynGZe56QJJP8um/e4iPq6AAMYXxJ6xklxIitTa7aMyPmoxwgQGEGDDrWVkv2S1Mo+h53fHHzNrlwFo/usiznxEv2cVaZCcZc9EKHWd9m0EHDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g1J8gLsa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g1J8gLsa"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3BE0104C;
	Wed, 15 Jul 2026 21:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784142683;
	bh=OzWTjCaevKfC9wmXHd3PIHD/JiI579dbo5M5Z/pL7eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1J8gLsaFJqLLzxi0lPYhs0+JYaDZyF8qnbdxUzKbnlpKXIQ7ASUvhwoaPukUmGbG
	 rwZ9E3XweMhhzmV76SvCS0/55OA+W06Rl/x43vBTEN4L8D45u+QrqdvbFs+IwCtHRc
	 zeUS0c151w0u9MtA0Mnd25JVEruJVpPuH9+cTlNc=
Date: Wed, 15 Jul 2026 22:12:16 +0300
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
Message-ID: <20260715191216.GM1778116@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
 <aldx9KiAHM4CRI0m@lt-jori.localdomain>
 <e536800d8a84b99f34a79c590f57cd68cdb50e57.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e536800d8a84b99f34a79c590f57cd68cdb50e57.camel@ndufresne.ca>

On Wed, Jul 15, 2026 at 02:13:12PM -0400, Nicolas Dufresne wrote:
> Le mercredi 15 juillet 2026 à 14:21 +0200, Jori Koolstra a écrit :
> > While there is some truly ridiculous anti-LLM brigading in some open
> > source projects, I feel like saying it is just another tool does not do
> > justice to some of the harm that is done by that industry. Also,
> > precisely because of the usefulness of LLMs, I worry about creating an
> > uneven playing field, where new contributors can't keep up if they can't
> > afford the needed tools (something that is not as much the case with
> > compilers.)
> 
> So "fairness" is likely one of the numerous ethical concerns that can drive
> activist against LLM (in the sense of people actively avoiding it, boycotting
> for the real extreme one, but I want to include mild cases too) in contrast to
> luddite, that just don't accept the technology to provide any meaningful result.
> I'm personally interested in learning more about each and every ethical
> concerns, as this is needed to either fixi or mitigate the social issues this
> technology is creating.
> 
> On this aspect specifically, Sashiko is provided equally to the Linux community.
> This is very unlike coding agent, which capabilities and performance are highly
> tailored to your capability to pay. In that sense, fairness is minimally
> mitigated. I say mitigated considering someone have to pay for the compute and
> because its currently running off proprietary owned models, also require paying
> for extra royalties (which is an interesting ethical discussion in itself I
> suppose). Smaller projects may not have that level of donation or budget.

Or will to pay money to companies with dubious ethics (a strong
understatement).

-- 
Regards,

Laurent Pinchart
