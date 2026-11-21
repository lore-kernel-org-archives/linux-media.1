Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250293;
	b=C1B+lu+Usbww7Tsf4qY1w1jsCc53TEl0TMq+FLPwjgfMxOIwVpQc8hRRax4EZgDzuwKf
	 U4LD7A7sTf6HeEVnYlynM132mnd947Nko1NV4l6NGS4I7/nmYHCXvEXgJGstvcKhwW5ir
	 aPU+2kvSYvyCCQOg+dTSBP4V+8KynZ97UAq2XSSOW0udmROQDhpagD6QIxj+O2CKbQWwr
	 19Q9vtI8vwik1mzOqKIzdzxkCRasyK+Kju6o3yCBfMy3Fl2JTZNG6X+a3OVolcQEtQI/4
	 BvuFKd6MWCA1sTzTKVyeCgcjvSAwYth7G6COPRlzIl5mo935DvtXvbNDf8o+t4Lkg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250293;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ONyMxX9vSJ8SY7VeS7y2lP74kEkT78GR7xzJRBQz01k=;
	b=S803gDqooFaIyvWLLbTSeD63rhYVXZw4zFhfNHnja+/BkozC9K5cZyduVGsb5AYohfw9
	 uuYn5HWFaJSdqnzyQbFUTTBEabehRWv7PINzG7ZkPzu8PhFQpk4K3pC7Ph+pfBggDkCiH
	 jscIRMmYOLHmMfnpvDFBosV6NbcEj17QeqnWBl2FlrMOVwkPfBEJw2cWLwlQ9Oktwr+1A
	 uYuDFfQoyzxfMf79vwwdyDQAXAn6Bz26IefUkhl9VgFc3/lwnkrx8SRtu7aCxM28yoRPL
	 tz99ufGezabtYbATCVr20dvPNGSW+MTgdPq/LAh6wmuJCDrviKwILBvrDDTyPH7Hj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=yTBIcL0O;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BPlKKHo3;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D618606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 08:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D618606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=yTBIcL0O;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BPlKKHo3
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 9379DEC0BE9
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:38:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 21 Nov 2026 03:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795250291;
	 x=1795336691; bh=ONyMxX9vSJ8SY7VeS7y2lP74kEkT78GR7xzJRBQz01k=; b=
	yTBIcL0OVTfkwK1O+Ziuw6by7/1he7UynoUnsw0zhUxa4dpS/XSkkT+7x8RfiSxl
	GsG6KqO8zDf8Onr13YPeEiG7QA6jZw3CkJa0MwM3CBVqx611Htn+tIwfVMQXCXkQ
	dHjCEUtdWtwmwbc5Mgodsk5j6Ic4hxW4Rzmq6pwBxENRFqCH+1b/SW2glfyw/8Q1
	jpJl8e83Sq9BMq44sLgwK4x0cr7lJ40m+Md6W133DuB7UI7IfnIal0SYgVzVByEP
	qSoNcbyG6K6hz+UVZbIZ0RXFNDjQurtNTS1b1TSoXx0FLSPitMYoFGJeIjm8BnMV
	AvXfdoGWVBdJSsB2MIKpGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795250291; x=
	1795336691; bh=ONyMxX9vSJ8SY7VeS7y2lP74kEkT78GR7xzJRBQz01k=; b=B
	PlKKHo3f5e5IjsPU/UoboA3FH9gfpeG7XJbV4SWe7YQ27QAsPWDoekoeoUjESBlm
	Nx6x8f9wpAECBufTaZAgcDG/CjcjTzOKmCcq9nEqeQu2FWJuUMjMC1mOArwDt2fz
	dOvZXSf8M5yVipaay0N6fJ1RaZFP3CcpmzvYdZZMG0bD9NkNjHlsSDo34B1p2Xwu
	hq3SzKUfb0QcyH+oDVMjpR9+qzts/OYUWkrUAhjvGYHSmjs2SXZIEb82UVdXwYXX
	mepOGynMti+K+c2QtQ6rGxQkwiAHcea7mNfv5FdGdX7HmqrtnoGKQhZptQaoNUdj
	X2ErabDko1zLO6XpBR+6Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795250291; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:uv/2LeRHvFI6MoK9Yu9yUk3/70c/AwOhhxkN2pVLhxiJ/dL
	4mUtgH5fZazftXXFXF50rHHMxma+Zzy6UXAJz0kp6KNQ176ZVS7xPB+Mq503084O
	pMg6XFIOm4/DqnvF6L12E+68MVHjmpiwd+Svmv6DXzdXmU15OuQ9FBXkfmPcmfeL
	0x46TqraqldaILi0ai1VrdRTtVvb2QxCyZ759FV+MtrdYnUkKu0uQvWwsnNjMmEu
	XD8xweC0E0j/vdRAYeMtUBibIlRsHb5xE/0z6Mp2Y4Bm7KaV/CHfR0+iyuc6NEP5
	Ss1Lg1V5luZoj6GuSUONjPCwqmRM2IY5lI58Tqw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:stQRC3wf2Mt1GCbs6g+MLavBHIPa6uwL6IZoF+DXH9o=:MfXNwx8swPnJ27cLVRpyGi5OnQwysva2fosK1YGKONg=;
X-ME-Sender: <xms:c1gBa25mAHuA-5P8jiK4dMfVRMlTVDF8k2RBAsAfkj1dK6Xe2FVvmg>
    <xme:c1gBa5_Q597HqvW3W__-NTjPFhcag3n51uUQ3JwLSFo6TJNs5FHa90TNRx0AohgAx
    X8HPIpKZkfFH8SA_DUI2_9nM1UtdnJiUkBhseIlyU8VsK0B0WVA6rE>
X-ME-Received: <xmr:c1gBa1UJkda1zCSdBHf9oMdyOJtG4l_NbUBPH_FqglhmXpRAYKuqUDV72vTF0viTorXIRc4Unk0yX74PVej5-CZyk2KXteQ>
X-ME-Proxy-Cause: dmFkZTGATlhUHJGPMjy89lofXANpd99TT9hI1Tn/BqkjoEhOT0ebjQ9D9s857XRffav92Q
    cCi2L188Pnbe1ErP6tuHv4sd2I7/aLAXkFZLu96lxVg+HmQVbGB37Imf0wk+mPV4aF4Syj
    et0/jHpxPdGhUxpxs1Ha097qsDLsy/pcAIp7tuDvc9WV4gjmDao8tzlWyhgmPmlF4aQwCE
    ZqemdzVvf0l8JQ1QANKTi/czpo8xMaRqVdGsK3/5sFGMxSRy6ZQ/sQCnZHRAyvIHfcPaO4
    uV/AGmayK+RCGAvivuHNKgFVnfoaU0IeXT8ql1E920dKtVFZ2QpnW5XQQJD/jdHYO7uVpY
    nhFNE9WEUU7bg2evZ72wn3n0u5U13DhlbCsMKGLHZ9bJ3XhPzqg8b8gz/OqMwf9R8VWBVW
    WQvhzmSOyS0YavFXl33/pv3M3gJ47CEREPHxsN1F0euqWQaPB0TPsIg1OEpCvj2XU9QbS0
    2s1jhPwAdG8f+c8WcEqtpmGw2QnpCtPXLjHyRq3lZWiOZVU6PSn6fVVWJ/XHTX9Qt9XDNx
    Gl0bqmDbfTVo8f6uOb/aVnELHjUYpolBW33+iLkaKgWQOlYkt4RPFWB14D8VOcwofl7ij6
    x62MfSOVjb8YirBEnqJrjrc/YJIOjPmm9SAbKSH21FXx/MdDChpjepWzrVSQ
X-ME-Proxy: <xmx:c1gBa0pS6IiAyvwRYIZZN7Lxo8BsnKOuubUlwC5R1yQhwz3Rpdvu-A>
    <xmx:c1gBa3lDnqAsKllzAD_alCo8DsSaYr75c8z0Q70Anj0f_nhzEhs7dg>
    <xmx:c1gBa02OdipLbLRh-wvwNatvk44Opl87k95I_47SFoweoezdKhYxyg>
    <xmx:c1gBa0RTjrX9Jp2_etaYAaiCvfXmJ9dfYpG30es40nru5lEqkQh7yA>
    <xmx:c1gBa4NNh4D-duesFV_z8gT5LFaMgOB4W10tS2gRmh2PBp7fSA0kSKMV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Nov 2026 03:38:10 -0500 (EST)
Date: Sat, 21 Nov 2026 09:38:08 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Return unused buffers correctly
Message-ID: <20261121083808.GC3363038@ragnatech.se>
References: <20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se>
 <avrXFz3LNGShIT1K@zed>
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
In-Reply-To: <avrXFz3LNGShIT1K@zed>

Hi Jacopo,

Thanks for your review.

On 2026-11-16 11:21:36 +0100, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Fri, Aug 28, 2026 at 12:37:44PM +0200, Niklas Söderlund wrote:
> > Unused VB2 buffers should be returned with state DONE not ERROR when
> > stopping.
> 
> Indeed
> 
> I think this is worth a fixes tag
> 
> I'll add, if you agree:
> 
> Fixes: 63a71dd813e2 ("media: rcar-vin: Break out hardware start and stop to new methods")
> Cc: stable@vger.kernel.org
> 
> Not 100% sure what commit to use in the Fixes tag as unused buffers
> were returned in ERROR state before that commit, possibily from the
> very first commit that introduced the driver

If a fixes tag is needed I indeed think it needs be be back to when the 
driver was added. But is it worth the churn? I will leave it out for 
now.

> 
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index 73cda0e2d45a..f3003dd61890 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> >  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> >  			  vin->scratch_phys);
> >
> > -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> > +	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
> 
> Does the same apply to buffers queued to the hardware and not
> processed released in rvin_stop_streaming() ?
> 
> 	/* Return unprocessed buffers from hardware. */
> 	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> 		if (vin->buf_hw[i].buffer)
> 			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> 					VB2_BUF_STATE_ERROR);
> 	}

Indeed it should.

> 
> (nit: there is a stray empty line after this loop, if this hunk needs
> to be patches as well, it might be a good occasion to remove it as
> well)

Nice catch, this in itself is worth a respin ;-)

> 
> Thanks
>    j
> 
> 
> >  }
> >
> >  static const struct vb2_ops rvin_qops = {
> >
> > ---
> > base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
> > change-id: 20260828-vin-fix-vb2-28e1bb24a618
> >
> > Best regards,
> > --
> > Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> >

-- 
Kind Regards,
Niklas Söderlund
