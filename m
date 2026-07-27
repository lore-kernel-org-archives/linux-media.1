Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB23DEFF1;
	Mon, 27 Jul 2026 22:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192250; cv=none; b=RGbboQTd3xUV9AWPSRBWGmLmeLD3LUvQ0TbZLDJy3tWU9zIyZ52Uug4RzVjyRP7IluHatUKuz4tdQLavZyupROnJR2Dr9gm8lTqNUv11PLkd628NhkJNezTcwDyJYBtI125zuiHHLw0pPEaeDb+Abgc7EuPRnFeFfUw2Q9TvbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192250; c=relaxed/simple;
	bh=g+5QdmkvSzZFQABtXu3jh8YpSnez3GDq7hQNa6tWKaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USZYVboZFkPbxV9SboJAPJlmA5sDSjtOCC6mdes7gQmVaxPT5J7FpwEeX7mkDF1+IgJgg+i0yx2EIHT1/9DGRqMOCMfeulaQb5HZvDt0quP/h0EejscKqGZlLEiJpfPP0d1PXnlCBZv8WelJuImrpQOWdR4OphU5Ow1kesyXEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=bdl9z5Gt; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="bdl9z5Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785192237; bh=g+5QdmkvSzZFQABtXu3jh8YpSnez3GDq7hQNa6tWKaQ=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=bdl9z5Gtbgin1Q2A+qmvk3LMZ5VAFaRez5OmB6hYwxb3ENZEKDpk438IYOxQIshSy
	 z9SRnzFp+oXSEWInlfqjZymB+4AzW7aud/LcZkzVgCLtV29d7pzftXFnR95BbpwKi6
	 1L48kIypVkhbL1R74I4tAvsDi3crQP7W9kCvfa9I=
Date: Tue, 28 Jul 2026 00:43:57 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: ov5648: Fix order of a call to
 pm_runtime_set_suspended
Message-ID: <dd2wy6r7zdaiuovg7tf26h7r43sgevy5fsl2uomk4pcmo5yqlc@fiofwaaotjto>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725120556.2262456-1-megi@xff.cz>
 <amU2uzRmHEGcaoTZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amU2uzRmHEGcaoTZ@kekkonen.localdomain>

Hello Sakari,

On Sun, Jul 26, 2026 at 01:20:43AM +0300, Sakari Ailus wrote:
> Hi Ondřej,
> 
> Thanks for the patch.
> 
> On Sat, Jul 25, 2026 at 02:05:52PM +0200, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > It should be done when RPM is disabled.
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > ---
> >  drivers/media/i2c/ov5648.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> > index f0b839cd65f1..0643440a6f5d 100644
> > --- a/drivers/media/i2c/ov5648.c
> > +++ b/drivers/media/i2c/ov5648.c
> > @@ -2566,8 +2566,8 @@ static int ov5648_probe(struct i2c_client *client)
> >  
> >  	/* Runtime PM */
> >  
> > -	pm_runtime_enable(sensor->dev);
> >  	pm_runtime_set_suspended(sensor->dev);
> > +	pm_runtime_enable(sensor->dev);
> 
> Runtime PM API usage in this driver appears to be very broken. :-( I guess
> it got merged just before we started paying more attention to Runtime PM as
> a whole. Either way, feel free to fix this all, I could provide a patch as
> well (but can't test it).

Ok, I'll review this more thoroughly. :)

Best regards,
	o.

> >  
> >  	/* V4L2 subdev register */
> >  
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
