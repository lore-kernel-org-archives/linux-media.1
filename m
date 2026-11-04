Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787414;
	b=0Ra34nPoz9Vqza8z9y20aHo1qvlVXPG02gpfpfu3Wn2VSGVMvREE4WLwWorKzAactCM7
	 hS+5I/KwFWVnpZd85KlYG8Hx2k8GLRsW+e145KgCqmRVSkYgE5CPGQ7T9x8XS18UfMSG8
	 NSNq/Qh5bIlvjQimZ2+6rwI95tdHlgvMWzj8dbv+sjpJiR7j8kOk2hBACxQWQEpB/CKOw
	 viB+S7cLt7Zyhfp04jbil6zCCuckhgUxfXhAO7RxF7Jnxe8+fhc86ldieA/Uwj9rKmKVy
	 ZGvv/Abno1ZQWWUJ5+V5Pblj9ZDb6X9ISmriVBoFtBIjKuPRcwz4Jt3hrhxd6CWL7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787414;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MO9dn/rUlk47gF3Nf/n7DAOpGwajqFtl3TFgElSqhts=;
	b=1jPvKtSKdbXyPCCuZpk8Nm+hD+OGlOqdale6vIDxdiDurawXLw9BCNApVUZ8rQZmKQiC
	 0HyeN/JkWBpd8Mwt6AQ24NmQwBGlwqLfbIfAQncuBr/7x/Idr8LSWCPLqksm63bxtXbfH
	 02oAv7XmLQHlKrGNctF5HFlktsjY7KuZSGoQi6bDEdm0WbtPbUBj7pug5u/EQQT7RfhQP
	 +TG7ZjkfoowwM0OqbS2mGVCaRKm1lnFNtsCS3qTt+42un25Z5RP7O7GtAI2MbCzS4TVqI
	 4mmnCY4OrkncoCbnKU+UrJBEo0cFRiLZBxzjuSRuc5HuAHqbodWRYI3wJf8p52Itx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=FJnh91su;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="dF/nXN9j";
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E1606A32E
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328E1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=FJnh91su;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dF/nXN9j
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5BC80EC024A
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 05:16:52 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 05:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793787412;
	 x=1793873812; bh=MO9dn/rUlk47gF3Nf/n7DAOpGwajqFtl3TFgElSqhts=; b=
	FJnh91suDiJmhOJmQSc3/OEnW6fHhJb0vw2PfnzQQBczxKLdlS+wgYRVKCRaQ/pF
	WRHPDDJaRIZqw+d7PLkb5XQWuFD08MiHLZKrUUWt+nypgBj+aTtO4r2ssDIeIKUs
	lB3tI0ihG0P2nuCpeyXz/KsHOfDU5whYb/zOx7q4ThEBmz6+j+6skjo4Qhhi+XAk
	LEdHCPDRHTrJza5kALtS1Ne2pdDplth91yPnEVZu7u4qScWjh56QSaO3DUpZRhzc
	KCmtkzfS4po38Ugl8OqV3WfP9RcXmvZMTj5gQymMR/RLwsmRnROeH1QtzjWQcdeO
	jTd1SLH33TuvUr5zck8p4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793787412; x=
	1793873812; bh=MO9dn/rUlk47gF3Nf/n7DAOpGwajqFtl3TFgElSqhts=; b=d
	F/nXN9jCLxkwU81hXH9v8FMHt0IpvJ+pRZuSImozus0r9bpo3gBnRulyOMc+4YSV
	13kIIRoCzF3/9xrKLBPEEbN7CNQPM4u/bdQPpL4yxgiR2HJ9/45gKmSr88HqXWMe
	ay0EaT5v9mIA6GVDRPv3RJHHPCDMHShYl5WxiWhDmDW2ORz1ASPqWNvFszE1yNig
	eoRalOc3B2T7sK3VNypvAqcCQF5Tz+pVCpWe45Je74QjH4UcIF2Jvs7iQRoZQ3yR
	uayD8qLenN3xenD/aC4VtLGGb3V8Uru1dv0X1SdY7jUV2fXBwmVv1RKdn+tWERAl
	DTJJmTwDRhb8c4q9fAnbA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793787412; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:KGDMuppSk9Djmk2BDDMLMZPgwn9dLi2UOUmVnx6a7a1wSS1
	UhzEYXK89qrEN86HJiglXrD9Jozwpb5fVVTws1wplcJPXu3s7HCfL/0JwEb7AUNb
	X9BPxNnh5f9grEPu0nBsz46/OZSGUwPqaUiSAQTqSkQFHhfD5+B8y62P3V0HIBrl
	v5jKBmAocr8kJkCmwcVdJtASenJhzeisqJ1D3d2kJ3AyoTzeM5Z5xhfI727mKaXN
	PFJr9032Vob51Sz+31Qws6xm5eE/UMeHTn0VqBiGBBrTaQnPbnh9vmLNpR1uO3QC
	8NsogO7apgOUxmrleSL9eIGwpAZAi1U46m0qdGQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3LPYuJLsUoS91hAT9vk34McE1bJaeBU0GjedpB3nOk8=:L5AIcWmMt3Gsmkh3kQe+DL+Z66pgue3rpXSc0DDW9NI=;
X-ME-Sender: <xms:EwbramIWNDqLJ29m-QXIClUOPTBy7BouFNfw8fXsekazowNwdBaefA>
    <xme:EwbrancDjxYSKxcSjSj9MU6h-SxqOFwxDjScNc535bPETn_vM5HxtDKweIkJo6EjH
    RMJgHBCmF8formS4JbXaZrQgZi47GoA9sfb92G6cYvJARkAQ4goZnU>
X-ME-Received: <xmr:Ewbrat8yK-KprZDWgvtlJ6RZHpAMQXr9h6O_Z6PFk1AsRG9aXiiAmxRzgMCIp1YZjH4wymypZzA82qx9T9_63oDl4yFfxYI>
X-ME-Proxy-Cause: dmFkZTFfm/RC6/6LU9GkNORhYSSmMT3EckT7JuaOFqfDQ1/yLI3YXgEgonEql4M3a2BcaU
    WxbThdnRZ/ZMQDBurAa0vmp9QukznxvoFlRefxakUqPBswYCe3AFYaxwLds0bhMOJ9fq+1
    QfeWyUHd02BQWbEzGnkg5HnI88w9QLV2SyyNXOWESABBoMP7PJ0W7IL0TJRptSt0qwvU3x
    2bTHEylJp1h015pk9q+EHDcdI9KkDsZySIT8wupNWgQXEOOeskGRxWNva/ESy92q/JDFeg
    hg5vHQCLSKq1SrmyOqAjoxuJJKZxdOQeK/gysQiPhhc+WG74mspG6p19bCq2eszJHCK8UM
    L7M9ueS/PKyO2EJL6xxOgn67TCRg18p39SvePWTPEWHeER6lAXTVXfSRAeH6nOwe5CJPej
    9FEiMwUhM7kB77lt6dkKB+FooLBbIPFcP4REs2+lk7kZ+Pb/Hf9YtAxlyvAK+NzjztWYbJ
    NDZA3xU7ptx9+5H8sHV5HrqE3Jy2HiF6uJNZ7DOibkO4FibetQIU9nmTj+VQs/ExuiEAau
    Grrlxa1P0mcwJsN6xoldTcFVq4zOrZATTLK5O7caLef1QgUwl0Bpy9cF1Gw4ad8BuW7bgZ
    PNNbI80xBT+ZcaOELoNyYDFFeLoJ9LnNq0TCaJHcip021tIsoJtwbWITwlFQ
X-ME-Proxy: <xmx:Ewbrasoh3fL8B8x_vox8bcqWio1b6zDnfz-2RfiMIIC3DBN_oJP0-g>
    <xmx:EwbraqBVw3TFmLyXSuagzVcEUNCbtfqjZ2dIr1Oz9QmtGCi4EYw3Mg>
    <xmx:Ewbramw5Z-QRqhJ-Z8miebLzX9e8JMIkukcLYk47plI94uvgwzyV0w>
    <xmx:Ewbrav1WXoBcO4DYhDz68CSYSUZjNfNfuKMaKSo7Ob8G0qoNt4TDfg>
    <xmx:FAbralYRHt2m7ve3H_3rI0B90c4flHVL1MNt0QLjY-jt2DTs8SnN4lnv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 05:16:51 -0500 (EST)
Date: Wed, 4 Nov 2026 11:16:46 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: rppx1: hist: Adjust configured
 LAST_MEAS_LINE
Message-ID: <20261104101646.GG1959885@ragnatech.se>
References: <20261026145223.729289-1-barnabas.pocze+renesas@ideasonboard.com>
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
In-Reply-To: <20261026145223.729289-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your work.

On 2026-10-26 15:52:23 +0100, Barnabás Pőcze wrote:
> The `LAST_MEAS_LINE` parameter determines at the end of which line the
> interrupt is generated. The documentation states that it is usually
> configured to the last line of the measurement window.
> 
> Currently it is programmed such that there is a margin of 2 lines after
> the last measured line. This is more than what is required by the
> documentation. So change it to the documentation suggested value.
> 
> Note, that this is in contrast to the "exm" module, where the last line
> needs a margin of two lines on account of the division that is carried
> out when calculating the average.
> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> ---
> 
> While this has worked in my testing, I'm sending this as an RFC because I'm
> not sure if this is maybe a copy-paste issue from the "exm" module or if
> someone has noticed scenarios where reality contradicts the documentation.

I have re-checked the documentation and my notes, and most likely this 
is a copy-paste issue from the exm module. Thanks for fixing this. I 
have ran this thru my CI on SparrowHawk and no regressions detected.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
>  drivers/media/platform/dreamchip/rppx1/rppx1_hist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> index 8fe8cbbc85df7..af82f31e4c86c 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> @@ -128,7 +128,7 @@ static int rppx1_hist_fill_params(struct rpp_module *mod,
>  	 * Set last measurement line for ready interrupt. Ignore the value
>  	 * from the parameters as it is only useful for fast-channel switching.
>  	 */
> -	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
> +	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size - 1);
>  
>  	/* Set measurement window weights. */
>  	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
