Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420743;
	b=DK8Ks43dfPLHA4LsbmKE4XAYB3/7PdMfpSAUPI6+S/PbNQc2BcOfACKhjkqhgBDgcxQc
	 JNuvOjjBKO1+ok/XBTQUXz/cCaHwAAuXDhCOZf+fm/BkJ/x15NDu/PRzRHGb8FdKTeHIJ
	 TmtG91Zs0Zduph82KCXK+O4jyVHvLbpo3RXTmkzKZwGs1yYfn07CLeHoks7tgyVyVEeUG
	 2tLBwXD1alc31fujg0bc2iTovoQeS5IVKRJOLfb+/CCWpQXAndZfY9hBuydQlfNLWecWy
	 +kOykcNnlOoL2ac8x4XJqvuvIG4V2Uk9RQYOzxwUpzMo4ATKYGlyWzRRQeKMMOl38rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420743;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=WMnYn7CucJXMDmQQ72D/rwn1+Zu+vHLwv+7N9kcUGos=;
	b=hhpu8uSejf9ysVY82GMWnAKFas09QISN9s8T+bEq4jzuI26w1DMKhRnjxPm4GebU5St+
	 g15NieOe844IYY9fw2p9pZh3+Q44gxg0qCw+n+AAJ2PRwp0dPWKUD3GvAjoL/VxMmoehI
	 Guypu+8ACzfH9s8tKjNPijLNLf0exTkX03Bge9kMhP0bR5HwHO/cFkvTHSQcOJY3VYspJ
	 ruf1LBWmYRRojXiq2VBGrnmGVCwNhAmnvKFEFewgIJx7AsCApWMHfQLDtEvFDTkcSA23b
	 K3H0V7jMbqP5QONEz6g7VoGgEKvrew3W4JJeaRWrijTcD8ZyLwoogRcbtzxTumoyoww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=t4YODsgy;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UfnJXUqf;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F0606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135F0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=t4YODsgy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UfnJXUqf
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 1CD0BEC0B6C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:59:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 23 Nov 2026 02:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795420742;
	 x=1795507142; bh=WMnYn7CucJXMDmQQ72D/rwn1+Zu+vHLwv+7N9kcUGos=; b=
	t4YODsgyHRXK+aFaI1LP+tykKz+49m7uk+zmk3oIQ0d/UfzEjoy/BsVf4HgJdgA8
	r6TuPU/jjo0caX4q0mu5JzBu7HRC2/afRrB1fu2FdcTU0qj8vkNi1hzeZ5wU7bsS
	VrfVqVYsDsMtxSyQzHJtjWApcrrrOLa/tkOLOtve1E5kz4jME1cI4NBN7jWPal9i
	SV1Kd2UuSXEq43QBUmnxQbRal6qv6T69WVRIVOb/CT7ityhJhf3VY562Nq0H+hap
	XKly1z3d/1Qp17Xub5Z9nLb5m/97mL1cdza02wmB8yfXA85wdvVluqr3obl07ZDt
	TDc8teHHn8CuFOku/txViA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795420742; x=
	1795507142; bh=WMnYn7CucJXMDmQQ72D/rwn1+Zu+vHLwv+7N9kcUGos=; b=U
	fnJXUqf5Y+reeAJ8Pp372lyv1CYXbNoyUuyJPUXeNS32Kjvi7lcfhjK0cCOS4jC3
	cBnCSOV6wWaQCX4W7KG12fHqCWrKlhftJl8E6ebKk0q9KBTzsDN5gUS/t66Re5hO
	lGUNC9keyqWM/1tOsDn2DEoYPz0u5wDYi12TFiXdXrwh185ZRcWPtXuL4WXBiyhJ
	IgFFb/qtqpwXTVzz6f3lIeZYZyTYgcB7sMCSg29T4s8ZbX0sncSDU/u8wB4BMmPD
	yks20d1XXnZNdVOEToHUk0bpRqoQknf2JPE8NJlGq5cZmHIG8ZwVJa6ZvX+ncc1F
	h2LVjsv2gt+OTb4fu8RPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795420742; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:fsRFhuEveokDpksikdT3ClrGZ0JiOHSpCvVCbF2MZDswX1b
	+9sg083C6hhy8HgkPn28mKtBD2OZkM3Je0gljFVDjqqdwCRQJ1sbX5NuSRu2FdCq
	1wEgzMQCIcsFl0mm5fGw3JEH5niIvs3SOpscD9wbvHUhybO1mImUghHN3F7eQuaC
	SAr4w22PM2tWrhrOTIAdcRcbIns0nle86qbdgfPKi9coa/pq/jxnhTQi8Ckw1Axg
	AZWMylr02C3fJj/XX81nIA60r5rF3pHBhBRYfahdS1UYTixyh5jOUkcuDa+6tt5l
	5hFrd0JV6HxjurXkVckFKTHbnrQ/VxRShhRsjSg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L4esAuQCnTSY25CZFfklU+iOJAPKG6P5sVClUzxl7gY=:ihL0nNUMmVStnSP+bHrBDKTlqefKokarBHNZUYFOe4w=;
X-ME-Sender: <xms:RfIDa8dKEhGOw1EiMe_KYyxo-uAqlkuqYfhCly2Nm4wUsVAhH6nraQ>
    <xme:RfIDa4QAuof50N9GZoYtUm_tTcwC-RMcXv06My05H6J2g7k_zfFGh2D_Wnudn5JO2
    J9dUtqCa6_5GkQMGyCmr28IPY1n23qMp0dxPkSfIsupioNdrMk3I2U>
X-ME-Received: <xmr:RfIDa9YrM0yzmuVZNhyHme5dsk0Epm9kZmrchuPZUboBAVfGdov9ch1cECKuSTRRO9Ocx5Rc6u-Ime5Feu9-P2e09Bj3QPc>
X-ME-Proxy-Cause: dmFkZTEz23yIZFbrLpej6KDJnuyetGUSWYqss4FSPTmGioW63uhDAvs0G/o8ZM/eJXJMkm
    WGahkttIm9ACTcOpwqGgPwyFaoR/BXTJzvGvmfM4xEjLk9jgpKilZnXHGKnPnQhDRx+CEy
    5WzjBNsIyWHVffflg1tZ8xUQRU+g1sBESdc3qfx89ZRdiwAhMPikFWzp/kHHbOE9XpTE8o
    CkYBWWJvEQb23e/TWAusFt70ooDpXsdYL+I/amZULkL5ZsuKFLU4L2awkRvL0UyZVKI0u/
    yHYkAzIQaL7cxbYFdB1sHSFL6hlvu5iW5C53Zk2iVzHdU6WmXTl3PlSi6MPl02FSwXU7io
    Ekuob3r0Q4HRGJblmuGYFlTG82TT7dCCVQV+jktz+zwWPA0dABFeBcVndDJeiAWcq8Lk+i
    ciRPffL1V9bRBKqYwo42gZgkwLlR6XxgX12ojdiFgGa60oL5EWP7zvLwt711/1fmwjmD8k
    M22GFpJ6T7LrqUZVdAsnZipkt+M3DK6FO+75727oHPKTkICsFTS/11JVwyt7XSmuh1A/E9
    TbmoPc8uIbJ08cELSWNUNXpp3jw2Hd/MigbYy1ZTFzgb4Me28AfzJ8Cv1ehAkSXxdTcJAp
    s0OYohUIgA1GPpt6lsoCy/cuxxTCW3/MDYpo8Cb9HVggOL0oUFZoV7e1+zfg
X-ME-Proxy: <xmx:RfIDazfp3PaTKyhLAQ8FS5EzTkjmuw8unZVdx99rXrrNwAEQqE2TYA>
    <xmx:RfIDa2J019lPWFSmsEqYAxX7_tzmFSKRIJkflc7RgiuDgmI8ATsmEQ>
    <xmx:RfIDa4K3jQ5KXr_IgqYf4DBYxAyJS41KS7nd8N43wF-XWcJoz66Zdg>
    <xmx:RfIDa9V8TJW7B0-DNiWO3bJ_kfwnqfBPSud8CQh4lfD-r8d6NTrmdA>
    <xmx:RvIDa2Im8It-ecrvLWXNCxmy_17QdeEIee0CbA_jMy8BP9TD518mQu5Z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 02:59:01 -0500 (EST)
Date: Mon, 23 Nov 2026 08:58:58 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rcar-vin: Return unused buffers correctly
Message-ID: <20261123075858.GE3898744@ragnatech.se>
References: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
 <awMzb15zjEf3n3XU@zed>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awMzb15zjEf3n3XU@zed>

Hi Jacopo,

On 2026-11-22 19:25:56 +0100, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Sat, Nov 21, 2026 at 12:54:59PM +0100, Niklas Söderlund wrote:
> > Unused VB2 buffers should be returned with state DONE not ERROR when
> > stopping.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> I'll take it as you don't consider a Fixes required.

Thanks.

> This however
> count as a bug to me as it doesn't respect the expected API behaviour.
> Am I too concerned ?

I think so, but I'm not against adding a fixes tag if you feel strongly 
about it. If we do want it I think it needs to be to the commit which 
first added the driver.

Fixes: f00add9655e1 ("[media] rcar-vin: add Renesas R-Car VIN driver")

Please let me know if you want me to spin a v3 with this tag added.

> 
> > ---
> > Changes in v2:
> > - Link to v1: https://patch.msgid.link/20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se
> > ---
> > * Changes since v1
> > - Fix unused buffers returned in rvin_stop_streaming() too.
> > ---
> >  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index 5e515d16c164..d3d1af47f8b1 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -1434,7 +1434,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
> >  	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> >  		if (vin->buf_hw[i].buffer)
> >  			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> > -					VB2_BUF_STATE_ERROR);
> > +					VB2_BUF_STATE_DONE);
> >  	}
> >
> >  }
> > @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> >  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> >  			  vin->scratch_phys);
> >
> > -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> > +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
> >  }
> >
> >  static const struct vb2_ops rvin_qops = {
> >
> > ---
> > base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> > change-id: 20260828-vin-fix-vb2-28e1bb24a618
> >
> > Best regards,
> > --
> > Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >

-- 
Kind Regards,
Niklas Söderlund
