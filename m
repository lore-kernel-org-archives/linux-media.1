Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE44334C8;
	Tue, 18 Aug 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042767; cv=none; b=u6tPyEfVOly+rcruAptWHQL0rK00jSzgw2feREZIc2xzrgaObI1OF5H2eq+V4pJVeI23J68tV0U52yXGpGeyu/Ab0VI+5JVxiipR5EZNZsHnG5PC7/A3+Yq7xsa9KmV5g1y14fcriAykVTXy1zHdvnR4SfnCoskTNK/cXPFQRC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042767; c=relaxed/simple;
	bh=BnmJRmNnKejWPBtj8KtqT0HtlJ7r8fbYZKxpbqdi0pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaYQKRZhN8ISJboNjY+W3XHvqu6P7eCOqRkQ6F2IrqIMJ8YcZadMvgnPxqCBJf5IBC4Se3c7v8t7Kr9iU0zqtoByQHzqsIkjZXKKa8ww9p2BnwMSTJvdWxyuOAJOKXTlcZv+Wid4ESbITBY2ffcTR1t/pY7trIVMgifqL6V2+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Gci2EKh4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gXOT2VWf; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Gci2EKh4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gXOT2VWf"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 599B11D0005A;
	Tue, 18 Aug 2026 04:46:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 18 Aug 2026 04:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787042764;
	 x=1787129164; bh=V+LU+K+dUqF2BP5LdBFGej1B2VYg0WZDnG1+elONoco=; b=
	Gci2EKh4S2jXnXV9tV6qeBOL6Ic9DRA+ewpyF+qPa0wmUrfnwZajO9midI9yJibq
	/zuQ5YUhEIzKGgIEdOFdI2Sx0gXX3DSL+MroIQajfl3Nvb5oILIF++UYB8yfw24E
	2nELyDhpL8Kb7PIsStjzGpbTVHITG/IXT1jGymWFNmJ3x7sQ1pP2ynFm9TedJJPs
	umS0Bb1Sb51eHnQB+RMxvt0HqEoTy7FXxQ5cTAnhsRkckXvGdjHhORNTjkzAxE/f
	4mJYtRfpWSM7HNm29Ca6rIuPmXFFOYw9Is+uYSMwfeECq0pOoeu2kR8i2k1Z7AW9
	SYQlXVG7prviL4GdSdqNDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787042764; x=
	1787129164; bh=V+LU+K+dUqF2BP5LdBFGej1B2VYg0WZDnG1+elONoco=; b=g
	XOT2VWfk7CD1jnqA+nrJdXLzU9KP+uShgFuq+G9D4r9VvaJoNPLk11CQOmal7hHx
	CxDxJXOOy36E8HDiieWHoi+i4MOiWmGHT4bFU/WEdDpZwbzKrMAcFqf4PeJIx/V0
	MYDmZlxZ8zjIZHd6Hv/zv4cmcPQsKs15ls5JHYcmf8AbXPUPNolseWBL29RQ3tBP
	6CKHnMrtgRfPH3/Ge3GyF15Ni1fSSK23dOOnN/4tGB5PPATzsx/lJqPMskcgUJSA
	pV/M9mc4UTTFJVX4PM5armJt1OpGuMnjNSYTB17DjZYhSXMZtn1x875TX+FMoHfV
	1qXkyiVfL4G25eiQTP0yQ==
X-ME-Sender: <xms:yxuEapBLMBmLdCu4u0Q7qmGjLB4mmHFNrKfacoTBYqJEIOMWdwInew>
    <xme:yxuEajiK64bLenpEzMHZ0v_Yx_Jctmp4EEWL6F8_7Z1MoXi6QRY2a0q69-3UVeKWJ
    8KohNpyQtRHdILsdUI25yd73RpaZVcyWRjdCO-CtimAe8shepgeCP2Q>
X-ME-Received: <xmr:yxuEamx62473lZdRzih7mkT4jV7fAYyVGLQBkq_LXardXLEaSQuQfwFMGlEks5S_jYM7wubK7TabMg2kQjy4An1Z6LnB1II>
X-ME-Proxy-Cause: dmFkZTGNsxiBHTkdGbgnFeiWts1EOMm4N3XubdPZfzB44y9o6WMeLecwoskVS+V2LLAWaG
    74gVnkwlRRFW3jWnLRbI/glqtD0LrXMjM6elwvMbXBDGWbbjL14PCuQIgYRmO4QTtMZ17F
    qdC5f7hTazHuYBsAjlihKBXgZrvmT1EusLdi3jzFHSrVkqIgQgZOnt5G0ldVI3rdaG+Fhb
    GFzkSUImM8uedDnmYG9T/Aod1DRX42e1iWFraV+J37UFKo1RLGix8HojHaBU8/0aGVSlUw
    h8D2MBJYh5JrUMUjdAiIYdLiGojcSovOB+GZd9CHzErybB9heP2rSd3QwyxFf69q/+Pypx
    ehaYyCdTvedrymtVHvW2lwQ+IazXwMsL2WHp81FeuoMzUKpZChSV2HwIwT4vUlaw/pemfn
    NEZbQII3VYr94arrzI4j9S0CW3FaJCOl20QbnUNLtBA4mjCXsxZETmNMWvkia7gUsLSbmA
    49pdcnCqGwKkW33XQlTwOb7RsTKbtps217Ykmy75lGTljyRdytbl7ShYVnG7RxvbOvAX/e
    Zafam4CKZRIfH3rSFkJp1IJRIaVGBLQBf4BDXU8eD3tDJrSZudrm3j4wJ+LXrkM99QalVM
    C4H06+8LK31onyLB97UzjMM+gEDOZE4DHdIT9E402mnkHVHgze/o+MTxfnMg
X-ME-Proxy: <xmx:yxuEak0ItLlzdd0B6yoBuPdh9UQP9JPxfzTFJ6Liv1i2AdBue_XYDQ>
    <xmx:yxuEar-LNsXmWD-I9K8wm46cug-qissZHF8d648AkFO_emz2sFE_Jg>
    <xmx:yxuEasrPZ32dQgxZy8N6iy5EXEiOW2EUiuHY6ZQEYmrdE6zPuFmZUw>
    <xmx:yxuEatQkm-WIFW7SpB8m7dVFbLhekk7XKpQfskvbfdFMnpfzXF3YzQ>
    <xmx:zBuEamlW3QGLUDqgZSWXUcV2PruZG9dlx5vwx2JVErx-vWrwOKjQ-TtG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:46:02 -0400 (EDT)
Date: Tue, 18 Aug 2026 10:46:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linmao Li <lilinmao@kylinos.cn>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rppx1: bls: read the raw pattern from the
 PRE2 acquisition module
Message-ID: <20260818084601.GA2233300@ragnatech.se>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-3-lilinmao@kylinos.cn>
 <20260817171412.GJ2757863@ragnatech.se>
 <aoP5qI43R1lwanPR@zed>
 <20260818082014.GL2757863@ragnatech.se>
 <aoQaAasxzGSBLZKv@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoQaAasxzGSBLZKv@zed>

Hi Jacopo,

On 2026-08-18 10:41:06 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Aug 18, 2026 at 10:20:14AM +0200, Niklas Söderlund wrote:
> > On 2026-08-18 08:25:29 +0200, Jacopo Mondi wrote:
> > > Hi Niklas
> > >
> > > On Mon, Aug 17, 2026 at 07:14:12PM +0200, Niklas Söderlund wrote:
> > > > Hello Linmao,
> > > >
> > > > Thanks for your work.
> > > >
> > > > On 2026-08-17 18:45:29 +0800, Linmao Li wrote:
> > > > > rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
> > > > > module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
> > > > > pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
> > > > > read zero (RGGB) and map fixed black levels to the wrong colour
> > > > > registers.
> > > > >
> > > > > PRE2 is not started or dispatched yet, so the bug is currently
> > > > > latent. Read the pattern from pre2.acq, as the PRE1 path does.
> > > > >
> > > > > Fixes: 3f8a2a883655 ("media: rppx1: bls: Add support for black level compensation")
> > > > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > > > ---
> > > > >  drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > > index 01a61db279bf7..71c5561457d52 100644
> > > > > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > > > @@ -70,7 +70,7 @@ rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
> > > > >
> > > > >  	/* Swap to pattern used in our path, PRE1 or PRE2. */
> > > > >  	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
> > > > > -		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
> > > > > +		&mod->rpp->pre1.acq : &mod->rpp->pre2.acq;
> > > >
> > > > As pointed out elsewhere in this series, PRE2 is not enabled yet.
> > > >
> > >
> > > Isn't this however a bug worth fixing anyway ?
> >
> > We could. I was under the impression we did not want to enable stuff
> > that did not have a user. If you are OK with this so am I.
> 
> Unless I'm missing something obvious this is not about enabling the
> module, but rather making sure that the raw_pattern information will
> be accessed from the right place (pre2.acq) rather than from pre2.bls
> where they are not initialized.
> 
> True, at the moment this path is not exercized, but I would rather fix
> it right away rather than waiting for the pre2 pipe to be enabled and
> finding out it is broken :)
> 
> As a bonus point, if we fix it right away, it might end up in 7.3
> along with the driver itself.

Sounds good.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> >
> > >
> > > The raw_pattern is initialized for the 'acq' module, not the bls one
> > >
> > > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_BGGR;
> > > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GBRG;
> > > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GRBG;
> > > rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_RGGB;
> > >
> > >
> > > > >  	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
> > > > >
> > > > >  	for (unsigned int i = 0; i < 4; ++i)
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > --
> > > > Kind Regards,
> > > > Niklas Söderlund
> >
> > --
> > Kind Regards,
> > Niklas Söderlund
> >

-- 
Kind Regards,
Niklas Söderlund
