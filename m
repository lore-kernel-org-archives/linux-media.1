Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB8C34E755;
	Fri, 27 Mar 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610853; cv=none; b=Jvd/Nm6pgdu6amARe30Pm2osXoC6GG+l3oCMj+4rTn4mmtJiI217TqvuM4LKj6dvm6Ee2faQsuQeyX9I0P4MVaI3K4N00Z5hJ26/kqNF5eTYRs6t0KClJzutMOWyIe0afz30FxMlZtcUNr2sxBsqBBsp2o7dr4KoxZRqkX+N7ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610853; c=relaxed/simple;
	bh=WmFJlNvZHGYXUq61O9RjDMuzddoHfNL+ByXwaPGC+Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoY/NH5mUjOczC7jh/OAAeC0TDllOGIncW1GkmfvxJbo4JOZT7XzNERtEKUoNhCqHWNzdbTDO6UgaWo7y6MDfEX+9YTTNFor2AuQP663ttbtpg53Y5s/S+1dV0c7wASWS1wBQJIjoeFnTK2K/lS82mAbWW5KmrhbZKYg0D3JTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrQuJqkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrQuJqkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F68C19423;
	Fri, 27 Mar 2026 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774610853;
	bh=WmFJlNvZHGYXUq61O9RjDMuzddoHfNL+ByXwaPGC+Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrQuJqkfL9Epgatks420ZueD2J++U90FxUczhyF1qsz1DrLqcHPnOX806Atq78AjL
	 aIrmN9JJK++VN34Gmzc7VXm2eO4Nv5dzI1LOYJfV4HQL1IhsTHHPJLkrzt2BjmdL0d
	 25+UdyqLpptCDbAyJ+cRO4AzG+FsjQC4vRsW/VWgZ+Rb6hysvNoDyOpJD4tZhy/02h
	 gtGcHnLX15sgwnYVYiztSOqEMrEbnfDM+SO2XocoFvTl+Y4NnyEJ7JAJ4CPbYbwU2F
	 Tdegm3LXeTsKsBNgvPmTwkcoJayAKrC8b8vp3ihotCqIbQUHKV4xfOV1wUeoaS7lSz
	 kKuFkWHGhwiNA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w65Le-00000005VcX-3Ddy;
	Fri, 27 Mar 2026 12:27:30 +0100
Date: Fri, 27 Mar 2026 12:27:30 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: cx231xx: fix devres lifetime
Message-ID: <acZpot3pM7_5xus8@hovoldconsulting.com>
References: <20260327104355.1310012-1-johan@kernel.org>
 <2026032742-sublet-wolverine-e88d@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032742-sublet-wolverine-e88d@gregkh>

On Fri, Mar 27, 2026 at 12:08:24PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 27, 2026 at 11:43:55AM +0100, Johan Hovold wrote:
> > USB drivers bind to USB interfaces and any device managed resources
> > should have their lifetime tied to the interface rather than parent USB
> > device. This avoids issues like memory leaks when drivers are unbound
> > without their devices being physically disconnected (e.g. on probe
> > deferral or configuration changes).
> > 
> > Fix the driver state lifetime so that it is released on driver unbind.
> 
> Wow, I bet we have a lot of these now, did you find this with a script
> or something that you can run over the whole tree?

I spotted one driver that got this wrong while fixing another bug and
grepped for similar issues tree wide.

I think I got most of them fixed now, but I'll do another pass in case
my grep patterns were too restrictive (e.g. I think they were limited to
probe functions).

Johan
