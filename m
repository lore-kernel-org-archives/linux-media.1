Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93138E8B8;
	Tue, 18 Aug 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042474; cv=none; b=WjxCnrQnSdCyu4TZen+yVF9biNiETKGEP/2K+TpvoADXb1dN/XukAP/IebqIh5It+DhcLakifGL8qwOFcmaEaZSHnbVtuCWr5p3miYsOJcI0CRde41oca2DXafQmcm7rVSsrCT5C67SBFEHVmd8+H92Kq9P60QI9W5qTAZ0uQVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042474; c=relaxed/simple;
	bh=I93tudbF7h5aoNk7NXJxBnRq8Am72XxcOhohNvylMZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuGiK3YRjX2K1GT+xRf6TyOvJ50Cqf5508WwLT6ugGzOezg5x/QNOcmCFfA8m9NWPIGPAZHjJ8aYjbqC86ysbH3nrE53epKv5rKBQ/f6o4RG/gmunDRxiOIWwM650efxYfaIqfcUTpw4+98o+4JGAdl2MWVq9XbYmyNyKdqARWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BmjsGOQ8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BmjsGOQ8"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296218FD;
	Tue, 18 Aug 2026 10:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787042390;
	bh=I93tudbF7h5aoNk7NXJxBnRq8Am72XxcOhohNvylMZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmjsGOQ8bsUkdFI+pe18EFiP7PGN3EHvLb8IUDbrLnnRlqwjC2fS2mijAr7yVfu1+
	 k3TrraBbWzRcp6r+skk4uHKzMx8dMOPUyIomHTOMX3gmcvpXbBeTeK7F+a6zR7lS1P
	 v531ctjTH4xB+EVwpBEWm6bOJjZquk5egyovlxaw=
Date: Tue, 18 Aug 2026 10:41:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linmao Li <lilinmao@kylinos.cn>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rppx1: bls: read the raw pattern from the
 PRE2 acquisition module
Message-ID: <aoQaAasxzGSBLZKv@zed>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-3-lilinmao@kylinos.cn>
 <20260817171412.GJ2757863@ragnatech.se>
 <aoP5qI43R1lwanPR@zed>
 <20260818082014.GL2757863@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818082014.GL2757863@ragnatech.se>

Hi Niklas,

On Tue, Aug 18, 2026 at 10:20:14AM +0200, Niklas Söderlund wrote:
> On 2026-08-18 08:25:29 +0200, Jacopo Mondi wrote:
> > Hi Niklas
> >
> > On Mon, Aug 17, 2026 at 07:14:12PM +0200, Niklas Söderlund wrote:
> > > Hello Linmao,
> > >
> > > Thanks for your work.
> > >
> > > On 2026-08-17 18:45:29 +0800, Linmao Li wrote:
> > > > rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
> > > > module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
> > > > pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
> > > > read zero (RGGB) and map fixed black levels to the wrong colour
> > > > registers.
> > > >
> > > > PRE2 is not started or dispatched yet, so the bug is currently
> > > > latent. Read the pattern from pre2.acq, as the PRE1 path does.
> > > >
> > > > Fixes: 3f8a2a883655 ("media: rppx1: bls: Add support for black level compensation")
> > > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > > ---
> > > >  drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > index 01a61db279bf7..71c5561457d52 100644
> > > > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > @@ -70,7 +70,7 @@ rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
> > > >
> > > >  	/* Swap to pattern used in our path, PRE1 or PRE2. */
> > > >  	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
> > > > -		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
> > > > +		&mod->rpp->pre1.acq : &mod->rpp->pre2.acq;
> > >
> > > As pointed out elsewhere in this series, PRE2 is not enabled yet.
> > >
> >
> > Isn't this however a bug worth fixing anyway ?
>
> We could. I was under the impression we did not want to enable stuff
> that did not have a user. If you are OK with this so am I.

Unless I'm missing something obvious this is not about enabling the
module, but rather making sure that the raw_pattern information will
be accessed from the right place (pre2.acq) rather than from pre2.bls
where they are not initialized.

True, at the moment this path is not exercized, but I would rather fix
it right away rather than waiting for the pre2 pipe to be enabled and
finding out it is broken :)

As a bonus point, if we fix it right away, it might end up in 7.3
along with the driver itself.

>
> >
> > The raw_pattern is initialized for the 'acq' module, not the bls one
> >
> > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_BGGR;
> > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GBRG;
> > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GRBG;
> > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_RGGB;
> >
> >
> > > >  	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
> > > >
> > > >  	for (unsigned int i = 0; i < 4; ++i)
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Kind Regards,
> > > Niklas Söderlund
>
> --
> Kind Regards,
> Niklas Söderlund
>
