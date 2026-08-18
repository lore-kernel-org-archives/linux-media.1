Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6700422E08;
	Tue, 18 Aug 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041219; cv=none; b=WsnT21t4N8T+lbnIOV6ByoQJ8l9GhR0Yl3eZJo1bqwcObN3WG+4+mZlAffA0FelX8o+XvlZah6K0qI4f7SRnYMI5SER+kxqAErPfb6AJBuPMImOYPzFX4Txq72l6eUjSjDybB2zJsE0UlECnCdjUqDlJXrid/TDqiWKf6wEABuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041219; c=relaxed/simple;
	bh=T/PUSjuzvOlvBBIfd/OsPlpjiNbkGNNDTW7lRBYUL4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIAwV2AqAIY1LRfZ3PYrCgsxZjgg9az5NKGNZDEZlqZ3M7NVaSlo9ol+AZ6Azyd1jtXUQZLTMJ605bYSikQYuGrmmCPMgod02FJpqMpTMS8Q47j0pXEbzXbeaUa6sYEKfhLCMHRwPtdWU9GsqyXscdqxm9bSP5iHwTZY1OblTBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K1Fj7mas; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VnWcO2+j; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K1Fj7mas";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VnWcO2+j"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BCC477A0159;
	Tue, 18 Aug 2026 04:20:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 18 Aug 2026 04:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787041216;
	 x=1787127616; bh=/X49oHlJF1ZAd9H9Xw2MlhSlZqO5feik+BsPdfcnEMU=; b=
	K1Fj7mas5OYaIly+vxaeRyB3lGTsFh3+Rz2v43Qy1yKehuEIGi0eZL/hw1mf9X4A
	Rqi9TQJ5CxzsVyUFdfYeCDDg1ZJPvRk3Yr3XK2FvSIXqmwEnHAyMxusFp6g93QA9
	32jE3GQNoSd9Ykgmcqf2kvsA2ICheKvV1FSlGwqc7PhHUZLnP1Tj6r73Zz0zLX8p
	kNJ+BQPG7IMPjN1QV7CGHsTfKwrO9OEU6Vm/o8kBKsdhNm3b1FaZJT8AvGPCUZOb
	TXsAK++E3GMdnojYgGRyw+Cn9oS3saE096BhSBV/+VQkPFh0IJXyN+DJQPUWt5BP
	SnEVhuwE2++Bhdkazta6IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787041216; x=
	1787127616; bh=/X49oHlJF1ZAd9H9Xw2MlhSlZqO5feik+BsPdfcnEMU=; b=V
	nWcO2+jMIobXm3ASbsaDb07c5nRZ4V6gckhiOxSEnda/+NHUbpe1CrElG0Pie0lj
	yh2dw2IynyHgVkwomME7YD0E6WP8tx2lTFpGbj0+89paAn5GSPORjo8bCiL/pWmv
	iO9dD3G6j0bj+dA8Z6zVo0y218k4ZFHfVuMT/SVuv7T6SMCcIBFvSIGBZYUaF+D4
	xx1QmKdvg4rhZfnHj5eS/XCDMferLBOTb7ZOFKrexFuh0Jp7rkHw3Zr1ZEsdLo8S
	UfXSYiMVMEW8IjTbixouMF3nEKJ4QJ80tEhc2f4oi0YGvChWPEbp6nnGijp60MK7
	N3keT3V6RICJjAJAhQApA==
X-ME-Sender: <xms:wBWEarHREhlpWVrsK4NHjUjPVp8WgYMm7qeIrz9bCCP9a1JoD6wJsw>
    <xme:wBWEakVMTENyzLkPwboeW2IU1_lyXjZRZG5hWXYYShzaBRH-mCt53xMIQFkXTey_8
    Xj9tibZ-aH-fggbFvLzy7Wm9hLlr3xjVEvzTCyDUxhhr6AzZKj259k>
X-ME-Received: <xmr:wBWEavXHYdyv1WbB5Okuidxnr-RY83kWgr9kE5FBgdhBl7TYLCR8jIEtmOyvgLrRfjj1Rk2YvydSmtOoaOF4jxPlVMNDgts>
X-ME-Proxy-Cause: dmFkZTEvQbRrwjJEBZXXSeZgC10SY3qptrvBbeeQp9W3odH4MolBe+hZPAcIH8fYFfne7B
    VL1bETgxnauZhoFADxj9DacftQ8ISUNuLNK3DH72HQnJAer0ImejKbbgmfVt9B7rMh3rNv
    w3bFn8sW2H3ovuGyp5ZCJIsZA6mrhZpRRmssskGJvzjZjZZQQgQTJ29FCxwT3CwJC0AKdO
    oajS2URcfTEnTZ/3ZQ2LKt2+NzDl6AX2H0MTjWai5bmGrtzWUItDiIvDXAAudZKS2oJ35f
    +uXEty2XDt0lGX2+XybffYihLFgmv5NVtOPyMCiYVIIWU3+nHvwUvmbumk9az6E9cwD0ex
    HyVQkoSVPUguSgr/0+KxfUsmWiUgeG7Kovs/sykyNwKQAlGlgSCdI5SCUpDJfkB4CKXYy1
    10c6/BoKM7KQQg/6XlNEmtDWJmgeMgNEr/TbwkKJ5D6asbafwaMF2Q1Rlk5iXc/4yf8ISv
    rFoRkPge955bMOmKVAhl0nftCWztCbidS3ijbKvekj1qhdz4+W2xK1M6c6+g85hE7U8Tn3
    zTGymLzoZ/JUsbCrtniNh9fm3KevNR1hRI66JIY9x9mjD/iFJBLqTvzyI6J0pOlH2ZdKH2
    0BCHcUmq8KDw85aHqcCMZkyH4/L4ph9epY3eI1d3aj4rQIRzRxeqUy4nHw0Q
X-ME-Proxy: <xmx:wBWEaqIh2K0mfn11uixnsWqW-ZMR9K-c5vCn56RNCGZQg_9iAzaTxQ>
    <xmx:wBWEavCyszfvbwvHnq-DI0p-l8nL4BL8MOuqRiQu5i8vb4e8kSP8MA>
    <xmx:wBWEaqeFE03F-MjE-QqUSkPS8rLgZ1OCl4rbY0f4gLzS5DMYIJ4cvQ>
    <xmx:wBWEau0h2OSLQd9QweHTUki_F7p5sluWNsKb13BX4uPUvzs5gLo9jg>
    <xmx:wBWEamLuA-j0MKSP3kWsowPhB83q_fBmnJEGHYJ9Q72HV7e9hB-z7oTJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:20:15 -0400 (EDT)
Date: Tue, 18 Aug 2026 10:20:14 +0200
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
Message-ID: <20260818082014.GL2757863@ragnatech.se>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-3-lilinmao@kylinos.cn>
 <20260817171412.GJ2757863@ragnatech.se>
 <aoP5qI43R1lwanPR@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoP5qI43R1lwanPR@zed>

On 2026-08-18 08:25:29 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Mon, Aug 17, 2026 at 07:14:12PM +0200, Niklas Söderlund wrote:
> > Hello Linmao,
> >
> > Thanks for your work.
> >
> > On 2026-08-17 18:45:29 +0800, Linmao Li wrote:
> > > rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
> > > module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
> > > pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
> > > read zero (RGGB) and map fixed black levels to the wrong colour
> > > registers.
> > >
> > > PRE2 is not started or dispatched yet, so the bug is currently
> > > latent. Read the pattern from pre2.acq, as the PRE1 path does.
> > >
> > > Fixes: 3f8a2a883655 ("media: rppx1: bls: Add support for black level compensation")
> > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > ---
> > >  drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > index 01a61db279bf7..71c5561457d52 100644
> > > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> > > @@ -70,7 +70,7 @@ rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
> > >
> > >  	/* Swap to pattern used in our path, PRE1 or PRE2. */
> > >  	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
> > > -		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
> > > +		&mod->rpp->pre1.acq : &mod->rpp->pre2.acq;
> >
> > As pointed out elsewhere in this series, PRE2 is not enabled yet.
> >
> 
> Isn't this however a bug worth fixing anyway ?

We could. I was under the impression we did not want to enable stuff 
that did not have a user. If you are OK with this so am I.

> 
> The raw_pattern is initialized for the 'acq' module, not the bls one
> 
> rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_BGGR;
> rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GBRG;
> rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_GRBG;
> rppx1/rppx1_acq.c:             mod->info.acq.raw_pattern = RPP_RGGB;
> 
> 
> > >  	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
> > >
> > >  	for (unsigned int i = 0; i < 4; ++i)
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Kind Regards,
> > Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund
