Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBF4EA39D
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 20:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627393; cv=none; b=G4WPR1ipy6RV1bzbT2pspjGE0PsDLQZIxYFkKoqnfmrpxHUhKN+KvhUfrgYG5thkhBdBp1M1+jJlZ1NlJQwjyKUxpuDxx38lj8TXc+NpwT/YsYi1yKTqfRonR1otS8Tw4wOdYD3dmwX88XrSaDcdvMsI5dL0wyVUZ5vabJMH+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627393; c=relaxed/simple;
	bh=nRwEQ14uZZPAUgx5Bl2KDlMFoCuMYGwVQ4SzPFFaWh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIFTdhofUFC+naP2OeI9rNpI3RSzD8FO5MImOwYC8D/sYhvvKb2pTz2FuQipQjetQEqosaVsNoJ5i8iS4CJiuwomG1awoCPaL0s+xna5TeKw5FPnvAijxac6iD2rA/heCVHkxH7KPAM42enKoZovAOdfKe25wzDOfDcFr2mNIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N1tpi6im; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N1tpi6im"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 073F4B07;
	Mon, 28 Sep 2026 22:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790627279;
	bh=nRwEQ14uZZPAUgx5Bl2KDlMFoCuMYGwVQ4SzPFFaWh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1tpi6im0KFct8Gj9nBadjwT/Tpb3+YeoEmHaey8YCxidcLOou9xeAipiLXZURdq5
	 ZBvk37UFdsZ8gBv0nleoQrfxIg4hh8aOvFnHZfMjA+n428Eu739ChcEmtECoJSM8jg
	 MxoHfiUddCFC3BCAZdcrUmuRLCnfeRHO3f3j8djs=
Date: Mon, 28 Sep 2026 23:29:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: drop useless assignment in
 uvc_parse_format()
Message-ID: <20260928202948.GI4406@killaraus.ideasonboard.com>
References: <20260820201128.35669-1-s.shtylyov@auroraos.dev>
 <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuWc8oUhFgqVMH+4+nzStuPfA5b2Vz+2woXqEu6ob1yOA@mail.gmail.com>

On Thu, Aug 27, 2026 at 11:24:33AM +0200, Ricardo Ribalda wrote:
> Hi Sergey
> 
> On Thu, 20 Aug 2026 at 22:12, Sergey Shtylyov <s.shtylyov@auroraos.dev> wrote:
> >
> > Close to the end of uvc_parse_format(), the parameter buflen is decremented
> > (again) but that statement seems pointless as buflen isn't used afterwards.
> > Drop the useless assignment (gcc doesn't generate any code for it anyways).
> 
> The patch is correct, although I do not see a great benefit in
> removing it. As you say, the compiler will remove it anyway. If we
> modify the function to add logging or continue parsing the left over
> buffer, it is going to come back to haunt us....
> 
> I leave it to Laurent or HansG to decide if they want to merge it.

I'd rather keep the buflen update in place for the reasons explained by
Ricardo.

/me wishes for std::span<> in C

> > Found by Linux Verification Center (linuxtesting.org) with the Svace static
> > analysis tool.
> >
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..0e78e8bcd320 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -520,7 +520,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> >                 format->xfer_func = uvc_xfer_func(buffer[4]);
> >                 format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
> >
> > -               buflen -= buffer[0];
> >                 buffer += buffer[0];
> >         } else {
> >                 format->colorspace = V4L2_COLORSPACE_SRGB;

-- 
Regards,

Laurent Pinchart
