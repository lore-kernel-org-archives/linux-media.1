Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D632ED27;
	Thu, 30 Apr 2026 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569690; cv=none; b=nLETFJ0oUPSRZUsetX29W4Lk5yYq3MLNtMlEyb2+gCi420IH7XapyJ0tPPQ9/aGzBdIRwJcqd7tFizCcJnEoQS5UA9ezTmzNAALQmyVD4otQYW43JPKApoPr/PDyXfcfRnkkWYZu6uby8GcT2j6HnNH3/fq+4tLsfWeL9VVFyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569690; c=relaxed/simple;
	bh=j1J47PKAXIXQQHEpFPmfPqNEDrpcawM9VnOsVpKes8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZvk8ARTWLOymlqMFmoRt6Zw0gauqYZ6DXvrWUJMXfFZsjeSPlHIprtILNaMEylf7klhJ8WIJypx3Xs6R90df79gg8ZXMamKddU1/HvPBaDf+pA98fzH261P/VOhTWMGljHf8rA6lPfQBtIr6MUcRRqv8Bil4EhtNcdW0xSQkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Rh7PJJt6; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Rh7PJJt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1777569205; bh=j1J47PKAXIXQQHEpFPmfPqNEDrpcawM9VnOsVpKes8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rh7PJJt6wK60QIaMjVGDt3Rv5uY52WIwGW1tBeL515uLPHPdnUGGzMXdOOWGniRsq
	 diDbS1axCteSqTupgCGcy8oTXBs3x7fzoIqx1J9mpc5a0y7Ir9Vd5b+d1TfimFAMzi
	 ylUwLkFHOLPykTcUDiyFcjKQpMCQJKEveATqh9ztXG0vVaK+Fut8Es2AK1mvp57Ahf
	 TG41HpKnv6ZtxFF00cmDgvKnhofzum807qRbJ/R2W7z0VvmAsjF1sMl3acJJBkOJh7
	 hBjStcDuTQoM2LJO91fBSNz1YaK4J8752UWCR9ZjWb5KGlDnXY6NmQaGwP37CL++/B
	 5qEq3TGZvr9vg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 688F140176; Thu, 30 Apr 2026 18:13:25 +0100 (BST)
Date: Thu, 30 Apr 2026 18:13:25 +0100
From: sean@mess.org
To: Johan Hovold <johan@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] media: refactor USB endpoint lookups
Message-ID: <afONtYdCheG4WHvt@extorris.mess.org>
References: <20260330101141.1664143-1-johan@kernel.org>
 <afMVh6cPZ1_tff9T@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afMVh6cPZ1_tff9T@hovoldconsulting.com>

On Thu, Apr 30, 2026 at 10:40:39AM +0200, Johan Hovold wrote:
> On Mon, Mar 30, 2026 at 12:11:35PM +0200, Johan Hovold wrote:
> > Use the common USB helpers for looking up bulk and interrupt endpoints
> > instead of open coding.
> 
> > Johan Hovold (6):
> >   media: imon_raw: refactor endpoint lookup
> >   media: irtoy: refactor endpoint lookup

These two are in my queue - they look good, just need some testing. Sorry
they should've been included for 7.1.

Thanks

Sean

> >   media: gspca: refactor endpoint lookup
> >   media: si470x-usb: refactor endpoint lookup
> >   media: hdpvr: refactor endpoint lookup
> >   media: s2255: refactor endpoint lookup
> 
> Can these be picked up now?
> 
> There was some complaint from the media CI robot which did not look
> valid so I'm hoping these have not been silently rejected.
> 
> Johan
