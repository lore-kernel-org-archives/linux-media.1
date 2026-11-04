Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787570;
	b=LfJ8Hw4hLt2wGwcf1PtFR7FWs+vnmVyMQyfMcEaV6tFrN4bG13gapSaReP5oAeppkZYO
	 Z7R3kf+9nizyvU83I382IC4LLbninW2B2LnuZOrzCmDODywL1JwAacKtVumCzI1QpJ7ff
	 CMhmnw3LcjouqHTgxry9+5eCrzPndDy6eX7oZB7rkL+tCY30MvWjY9DLVmuVxQ3+5qEcO
	 AvgcFOVsNwwh6Re6BksnT8VMOX6wzq71CQShG43GNo1tUg2sHOTz21tuBtCCz9rT+Twi2
	 Zh/pxNHo3pliVe7hTxtjbceJQf5243cqiSc49oSujfFiip/EUOM4OkT1f178HiHj+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787570;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=;
	b=d2bpjzgeG36oRIeKLMmHH2B/DcvKTbOQwiR/v1PRZCS2auV8pJxV9mTdw70vCdA8HeVV
	 I+aMNnO3xM3ibskbLmqp8ddp7c5SOllTZU/kkZ7+A1xVS3CFaYp2bsUjhwnZc01Y1d+e6
	 P09dQ5EgYDJ8TdCY/85GgVV7AJJ43L9lp/XVY4teoX8gMDYqEgxgXjZ0oanaHWQZSsMps
	 Yt0+vYDEIv0W2rmUXPAA0mayEgjnkHjsCibsh4suzSjJ9QBIviNtdoSGIlk9Avk128O8a
	 Fq2FFmO0GTfJPg2dWpPq2iX3ky5iSyRGzrazNmq0vXgCNvo9g1vLI+5wxgmH7SO5MMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KmUf3TwT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YpSZPlhU;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD8606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 10:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BD8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KmUf3TwT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YpSZPlhU
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 391A6EC0252
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 05:19:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 05:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793787569;
	 x=1793873969; bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=; b=
	KmUf3TwTU145VAutAsAGFFKsw4dsRPnjyCCKezJamzZyyneN6NEVTRdz/xKCuHgB
	O9mLcGaRrdRdWi5gMcZqZUpO4hGSxgBSoqOMnkEqdTe5JkJD3ZSBMuf/A69DJcuh
	EJknqxNBwcp8DFCaoKRF1y1iSsExE7AakCKpUecehdy7A8aybxwUccveSgapubQG
	WNb/ueDxbUbyi1OAVhT03q7MEwYEw6M4f43F6hxx1yFgdOKsb9ido2kAk36MoS38
	Y5RLCA/CeW3SroFG2xmGszJOEMF4TGO7STgCS4t6E3JsdAGN2FlUG4278rbYITUo
	oBaIz0n+sp2sBx4z6xoBNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793787569; x=
	1793873969; bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=; b=Y
	pSZPlhUbs87j+GAJgSNzf3v0WwriJzVT1AFM8riWNWS0dfY/MTmZO+8a3s1zOFrO
	5Fr+eeYI0GFTeiZvjpY2oSeaQeErPOO03VSKSrQ3weKTzKu5EN03aH9PQzYycAaD
	LhvrIoYjkC2q1+3i8c5k+phyveZfpi2mDa1GI9/IAipKj9xTBvb+I3wRVDV4ScJ5
	r95VYs1SYRlU65gX5NCbCG7nWB9vccKoiNwzcEYP1fxMxa6uVmtHSfsJ3H6X8TYD
	vt4/HkWylb+elHwyozJkqn+avLMHKpUyTd6JWrEUkx+hfNy7IBZOX/+6xv659cSq
	i2l9sAg+UwGWjkleVFK6A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793787569; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:FAKHLVO90msV057jxlnYUBuZTYmyu2+1EXD0R1B/ML+EHTA
	nNJUgI/Sq7RiQ5wnjUWiRJO5Y2JHs1JRjKbjtNJTpLA2Y+0KyIe9MSDXipQ5UcwL
	5SZj7QD50pUez3WX9pl5OKYtKVj5MvgkH+Bls6/r2OeD9iPrt7bay8YX+DP/Svmy
	T7h5OZLp79YTalxV09b6wnZ8ntOEFzVyx3tzqp4k1U295aO728hMj9/bh+b0HbQ0
	oXzNwC/SZzDBJrAP8YoHhJS1DrSAukqvVyp7deGv/RXiVTgsqrsU6P7Z4ByYqkA3
	ITV4yR6pA6ENBP96GXAI0AQ+unYFOBDNFIQq6dw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LbRTBXbfilP10S+efDESyPr/5ll5nQrh2EYPjkkyBBY=:hpj8Ab5Pcg/91wuX5zWer7gpJSrv9ZtvGWDD4YeDtfk=;
X-ME-Sender: <xms:sAbraoFWx_DknU7_FChzoUQrNNDPDXkCgzXjynDdtKh67nS6qiFlwQ>
    <xme:sAbraqoqcR2Tnwxee94NrmaCPhIC3yn0ejXpD8TogcrgHM8ns1HBZ4ld9JJCUEWpR
    VluPOyIFWy6-PZawQhLmZaUayZoElb0_2ckp7waNGjBpoS39NJDHQ>
X-ME-Received: <xmr:sAbrapa1sVwSFPScE67aMDxPMiDvXEDR4jSEgVvhQUu-YoZK84u94imrxWwsDQkPz18sqZxbhy2abAzxZwj3TFVhzlkvhg4>
X-ME-Proxy-Cause: dmFkZTFd4Vrpjb6vo7D4/IUyjIi6AQ8ZKH6jR8IUydUpaF7oGZ2hRyYcnY1EPpvSVhoS+c
    Xw5yPXnDirq8kU7rhakUDLtPpO7qZryGfreitZHeLzxGlnPBep/VfEkOVV6G7FAA2C26jt
    vF03gyZu/s3hX18HUni2unBry6zLiJ4J5Vx5MeD9CidaSIKjRmvORfYJ7XMfbZksbPdRgo
    GqSaMMcS2LAgOyEl08dYqtguI/Q5B2dseeZ3WkFj84j3TrLLxfwr4IvfD63epMqL9Bk27g
    kJQykXZ4Gv90N7KQL5VVB8sh46xytwMm9Fx0WiNBVxMubio/1OR/8ZKlvzVOTgQ3A8JGDq
    zQUCdoWx1ev3fG+llFU45zaHUgD0mdeehxndjceIjJF0ijX+r7j4DV2Cti4CSwrnvf3DeO
    /dZim0Ui7DYiAkFm6OhueXd2ZpP3+ZWafqpOYEg9gv6iMisusxu9Yz35DS3FD1Ngosq+a2
    PgpttjLq3gNqX7Oh52aDXqa2ZmawN8djcBlpntrPJWkdiPBmt5dw3I3+c2zrpICLGnIPzD
    EHxDeR9tewKzeI9qfbyuIAcfRAUZe4CNCkQ7OiP1pdS5Tw8MbHMNgEzqxeEXE4FSCk/Wam
    Sx8216S5itL1ZEg9hBQgE8aMcTKgNSSCAKt8yZ6bPNvxy9YbeEIulYSsCg3g
X-ME-Proxy: <xmx:sAbrarUzRyru2rMsFs22TtkaMvZrxh065tFnQwxtK24axdsYKFLMeA>
    <xmx:sAbraq8YqqdCf_--fhOqbi4w2tdjxMjq9D20IrADalUMrt3jsa6wgA>
    <xmx:sAbras_Au7c0yKR6Esc1nI6xbhFYFGtyasrqVWDDaUPybB4ETjD1Dw>
    <xmx:sAbraiTuQha7rFHiEYQRsdWxslDJcKlEj9yoYSQ6qReN5AHLrzC2jw>
    <xmx:sQbrarXyuKCawD_yCQ9KY4GcfBqGbiMYMXPG_Vo8hYpD0ogzZaj3eQhL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 05:19:28 -0500 (EST)
Date: Wed, 4 Nov 2026 11:19:26 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rppx1: Update shadowed registers
Message-ID: <20261104101926.GI1959885@ragnatech.se>
References: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
 <20261027174014.315061-2-barnabas.pocze+renesas@ideasonboard.com>
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
In-Reply-To: <20261027174014.315061-2-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your work.

On 2026-10-27 18:40:14 +0100, Barnabás Pőcze wrote:
> Certain registers are shadowed and changes to those must be explicly
> applied. Updating the shadowed registers after a frame is complete can
> be done by writing `RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD` to the
> `RPPX1_RPP_HDR_UPD_REG` register.
> 
> This is already done in `rppx1_start()`, but this auto-update feature
> is documented as "self reset at picture end". Therefore setting it
> at start will only auto-update the registers once, after the first
> frame.
> 
> For example, this causes that the LSC module cannot be toggled after
> the first frame. This behaviour can be tested by reading the first
> bit of `LSC_STATUS_REG`, which will show the same value after the
> first frame regardless of what was last written to `LSC_CTRL_REG`.
> 
> Fix this by unconditionall triggering an auto-update when a parameter
> buffer is processed in `rppx1_params()`.
> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Looks good.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 3 +++
>  drivers/media/platform/dreamchip/rppx1/rppx1.c      | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a75a27a8afd09..cbc9847ba5be6 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -110,6 +110,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		}
>  	}
>  
> +	/* Trigger update of shadowed registers after frame is done. */
> +	write(priv, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rppx1_params);
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> index c03dd061783a5..a3c923a57d922 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> @@ -257,9 +257,6 @@ int rppx1_start(struct rppx1 *rpp,
>  	/* Immediate commit update for shadows. */
>  	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
>  
> -	/* Then for operation update shadows with picture synchronization. */
> -	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> -
>  	/* Clear any pending interrupts. */
>  	rppx1_interrupt(rpp, NULL);
>  
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
