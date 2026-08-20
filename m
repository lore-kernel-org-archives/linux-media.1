Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD32233954
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260591; cv=none; b=g7vAMaIDNG/AIZJ20Ije+Kh4mvb8ADX1/MNX7hzaC9GLxx8C+NRz930/R7vj5KHIwkJI7rECuTSaWVlxYf4Fg7zCaCh8h6RyOgTmeo6PXI/gL8BbTB1+fcJ0mOmvofZzv8dxhpU99zKZpgSSGLU0NB+RWc5Y/22J9wJxtB30AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260591; c=relaxed/simple;
	bh=bNlpXExtscX3EVAUDj60TJoAef6WcFdlDXt5knFXUcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg4IX4lpAotM9uQLz3CRJcQXMblRrAD06U1AAiOSjm5NEYsyGbOKmzG76aVeuFmwVE1y5j0hlLSv2Vduzhe4d4M3RfMxwPxqZh4vl4ZZF+j8UWb1kMKCBEnpyfl4YjPzZ54NBdzmUXdVFCH89rlvCDSTHetfoYiX1y+9Pu7qikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW/qInFV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW/qInFV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so751071a12.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 14:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260586; x=1787865386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kA3ZZhBTSElNS8aKZBmn/3V+poXJbKTYV5bqqaHIws=;
        b=EW/qInFVBjh030FsiTCLgejtHJ9IH7wUXb+VmCOcS/9Fe+V9e6/LAjbVsncVjZNJHF
         PHloD5VEQ5LVZBiAtidNVQkMwbfXSmEpojW9sRlYrOTGgCWLdQM8Q69eKkK4PEd8zlbE
         rORzoQIaoDv1gJyEq7dkiuIx7IafZHUhO/j5JUUUQIG69UDfaUDXfmEXrm1PEbRe1Ix+
         Jn4vwhSG1D/X44sZc6dQq/TReKuNGUcCPlHFf+JM7WTs6EmOAN5YKduTfG6FxgKYl++2
         jhxv9QmxR2Sg2CbVxIYwujI8qzYSsjYLFUmFAgglvqkBaHtgMIvaGePafeZptDpynSXH
         OPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260586; x=1787865386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kA3ZZhBTSElNS8aKZBmn/3V+poXJbKTYV5bqqaHIws=;
        b=WMVJiiZJcuCGA/ibT/RT6LlKQDWauAmQW3xQ4N4xheJE+lyK2eXUJk8QIP0qrx+NcS
         JTB4mO7KHQ7I9N4u8CpuRCTP1La/XQE/Z5jd59uzYRlw1o+6VlCw/pIvYhW66sATu4By
         XtTIytEabw1tw8D4l7rlmMwnsQ3lxY/GoK+G/BZCzlaozSUruTPyotUwbK3Gm0etLpL5
         uenTSPI1amLlEwYQX4WNTmwOns997HoX8CGiEN91o/iC/MMxfd2xgo8v8YLUr2CVRNCA
         Mw4LGlvMyP/Jx9/+aoRtxMytwW9B7jZbi9LqByvdgVc0yuSdDCbb50Ily9kk8n2Eh0+i
         ygZw==
X-Forwarded-Encrypted: i=1; AHgh+RpFVEtJXShp+N41KWAFpxJA1JK4Iouq68YVWfGDou6uPjYiWgg+FuQgR4x/nCsS8zSzHMSLNcOhPqxXmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybaiSzd1ZuseoGvWwk79X7tvFspSb1OPe8LSFwGvUsYp4TYPyf
	J++pWLK0O/I/YPHBwNmLz4f+uAfhYifWyxjXO+6CQ26PwesJuDyrSzI6
X-Gm-Gg: AR+sD11k9YK3BVTrNF1ZWboqPYHF73Tf5yPS1R48mKHxrdn1huvoUbSACwPK2kjPgyt
	p6YvvZSsOzOG7X1mYFdpcXyo03RLS2BfbRPxryIlextw44YJ27BnnJcB6Gz5qhS5lM1/hPNO86h
	iesQ4VzJvMgDZyvDfhfzJh1S84D1EIJDPUhFKqo3V99d7arsELTYEMVFDhdmchr1gqF05kwv6Kb
	CmYoX1+729hLxH1vOevYnSylraGuNIxcYQ8U0N2DIGANUc0OHN8TsR/q2m5JvjPNRj6mWkSWlpK
	C1VkG1U2V37lo72ee6pE0U6QNIMQbjLZvKPV1EIjt8HHDk6mZ0uZ9mXhR2miODtEiFVAfzutGQc
	oX9IbzMmlBJEiEbYtJtIpLV0G6WPxy1pm/vC439a+2I27JKPgZ+VHp+bwDZSx/1W37Q3g5GIS3u
	wZhUkuHIKzOYIiEudqfFWdoKY1PWiIfcR7lZPx/Lh+PXWNSc9BQ1dapCZIP32GE1KXSlshodmX9
	FQLIzO3iVjleOog/iXr+jng2wnmCkQNVdlp
X-Received: by 2002:a17:907:80e:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c246a6055bdmr133567066b.11.1787260585986;
        Thu, 20 Aug 2026 14:16:25 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b07504sm148630566b.15.2026.08.20.14.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:16:25 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:16:23 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aodup3TleCfdxcF3@michalis-linux>
References: <aoV3LLy5hSoKL4QP@michalis-linux>
 <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoXgSKnkbWZVKRui@lizhi-Precision-Tower-5810>

On Wed, Aug 19, 2026 at 12:56:40PM -0400, Frank Li wrote:
> On Wed, Aug 19, 2026 at 12:28:12PM +0300, Michail Tatas wrote:
> > if one of the dma_alloc_coherent in the init fucntion fails then
> > the previously allocated ones leak.
> >
> > Fix by freeing them in the error path.
> >
> > Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> > Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> > ---
> >  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
> >  1 file changed, 55 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > index e4e21ad37323..fa77fd402412 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > @@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
> >
> >  int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> >  {
> > +	int ret = 0;
> >  	struct hantro_dev *vpu = ctx->dev;
> >  	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> >
> > @@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
> >  	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
> >  						       &av1_dec->global_model.dma,
> >  						       GFP_KERNEL);
> > -	if (!av1_dec->global_model.cpu)
> > -		return -ENOMEM;
> > +	if (!av1_dec->global_model.cpu) {
> > +		ret = -ENOMEM;
> > +		goto global_model_cpu_err;
> > +	}
> > +
> >  	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
> >
> >  	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
> >  						    &av1_dec->tile_info.dma,
> >  						    GFP_KERNEL);
> > -	if (!av1_dec->tile_info.cpu)
> > -		return -ENOMEM;
> > +	if (!av1_dec->tile_info.cpu) {
> > +		ret = -ENOMEM;
> > +		goto tile_info_cpu_err;
> > +	}
> > +
> 
> This function is called by hantro_probe() if I am correct
> 
> there are dmam_alloc_coherent(), use dmam_alloc_coherent() will simple
> error handle and tear down.
> 
> Frank

Hello Frank,

I did not know about the dmam* functions thanks for letting me know.
I read some of the docs about them and they seem to not apply to
this particular case since this code is not called from the probe
function but rather the hantro_start_streaming function. Since
dmam_alloc_coherent() only releases memory at device removal,
it wouldn't free them when the stream ends and a new stream would
re-allocate while the old buffers lingered until detach.
So I think manual dma_free_coherent() error path is the correct
fit here.

Best regards,
Michail
