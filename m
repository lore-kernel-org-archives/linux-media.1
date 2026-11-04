Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787467;
	b=Ygfw1WCO8LMXSXgPbZPzl5hEZsQ4hro47NhPgYAqYkNnlo5Tal3qpgaK17T20v3Xui1X
	 OeprIbtk/nflmwYoPBbJCQYEd+LwKoBMLvtLOmbfn9os+WKca+tG9zEETLv5mu1hGdwpc
	 D8Abh8rwMUCDkuqcLnXo3Odyq7H6+vVJo70PmiXD6bGuKeEgb5m+r8pKTFNWEneyOBuSt
	 dUb0FAzsExvx7O/R7BKlZs4G4an7nLS94E1SHAm08fwdq1CYNvO+sIToZrxKn6r8Ks1w9
	 pGxonc2tsde+FtkzpeRhYNaEd9agJdCnSgSV6PfbcRD31gcdiYQN1kbmPRb7jRCvwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787467;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=1XGxknx38iita4aBuirFY7cY1mNxkLKIbhA7esm2VOI=;
	b=PloC4LfA6W0lO9PmtVdCe1z9Gfxy5rFohjrXbIGF2m1YSNXQ7CxwlOm3wuoFPjFydd1o
	 ZDz/qNosRMdGeKD9OnzBaNzfShlHtBE1XSxoyTMlmzxJCyEkb0CDS9goacV7Cawpbm9RY
	 CLm5d1HQKy84SIS7uh0a0N8VSK7w+E25U1e1Z7zgUphj9geljYZxhl4d2PU1ajSkurdZb
	 h9Ty5KndVBHfUBq7tRLHC+Bx1APxzj0OBA+igX6bNBy2zlgzk8XvFq9EQF7PnNGnk4WPK
	 qpCQN59V63qjcCOB9ruBKp7PelwJl8xnr6U9w7KPGfNN2t6k5LL0yUetI3gBoOLga+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=dtGvfkq1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rloca6vs;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96902606A334
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 10:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96902606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=dtGvfkq1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rloca6vs
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D0477EC0242
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 05:17:45 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 04 Nov 2026 05:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793787465;
	 x=1793873865; bh=1XGxknx38iita4aBuirFY7cY1mNxkLKIbhA7esm2VOI=; b=
	dtGvfkq14t6Jyae47FPeup11jSOx2R8vG5ciclGpn3TDA3pYvCf5tLVkipk4y6D+
	9s09Zs1+/bY6zYjLTth1c0igMdhzT1v1v4imueZvq2GHHF+nzEm1KFuXcMiS7DuI
	4qZSEKju0FL+44yq/UYe+4mFhkhAGVMATTVKiSY1/YEOWtwlflSgat34+LPjgNgI
	XnpMhC2lHSqkfhimuvr49Ez8ywpfBQN7EBPlDy/xN/g20G0rwyREp8JMkvZxT2IB
	CGhPcAGES/zAPleSU3O/CwS8CwgqwGM5KfcZ17TlsV+aPNve86ni45H/1fHuYlUo
	vOBSGpMwH/js8bmDjjAnWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793787465; x=
	1793873865; bh=1XGxknx38iita4aBuirFY7cY1mNxkLKIbhA7esm2VOI=; b=r
	loca6vsIyobcFXkCyJESlDxZSBEyZwVTHdL1EVYveyzSk5j3K6T6PXrz2yUjgl8p
	cbXBbFQRLWt9wefyarmhC1v9zs675zhQHxI9BQUZtNQMncfs+RtwajzTO40yFEC/
	/elxaqGArwK/uLnt8t3/KbEoqN4Reotv8BAWuQ/fq7KFoTvKeDeyQjboPMOJXUM0
	ZZDQ3HSFozCj1G3W1Nf/pT5vPykp2udHyHDn9fS2k2vckw2nXJGdqOHacGgb5p6w
	+mERucQ+/YoKYxhCSlzPTrFxJEXyE3tFqcoNFk8HbmCdP+Y99TkyOCBnFX5c3xab
	UO1swtGasDctANuBJpc8Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793787465; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:VqDiswVrrAl3eAd17Ug+Mbue4A/lL4Q6hUE3FecAHvly7E9
	9QX8UBtx22AUjnFvRLy9PoHW2YaXCDKr7/mggkHNEdqojHYDljvvt2oe87baKv9e
	x9yPsFEp7IWxEmYNvz3Bd7YNlvL9ZZBhrxbhvLLlo2WC8acforafhYaikvUlnA26
	TGMclrzltW9SH8znPCKpSbvGlFHq7ZnWF0jG3Jp1PgDMul9On6oZxddNQt7h/6VL
	e+pWJU65QW8fWFWvdGJI9HmaPDwe/Vu7/xEBU7337aTVWqZ6JXCVS8HbZ288MGcG
	5bpiRJpVR0uhTigwp/ffsRQkywTkFr2LY5Fc6AQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tt/DLq1Auh3JBvYHYHfmKYS59MBl5mGxCRZ9q1vWP/4=:gk/MiHGm+xWFv64u3rGl0I56A6sXbFfljZw7K7+QOkM=;
X-ME-Sender: <xms:SQbranxYoXKALuGVMgcOSckJO0uQhO91yT6RcNRRXnSInPc7zfkcXg>
    <xme:SQbraomEb8JySX5jt8Pyl8a57xvwnfHRL8Px4bKr0q_pUwDZPZa9ojV_HHRLFIPvN
    wgrjo7w4e26dB0DX1QpSuCWNKJY1o6ZqGqfhipK--otfo9r7XgJ6nc>
X-ME-Received: <xmr:SQbraolTUF3Cmwd5qFFN8a99r0kbaYJ_TW97PmpoNNjJyPRhmEuKX_Ev8002SbpfIivx51TPNVprm_-3Ojdb82rjNmgKvmY>
X-ME-Proxy-Cause: dmFkZTFfm/RC6/6LU9GkNORhYSSmMT3EckT7JuaOFqfDQ1/yLI3YXgEgonEql4M3a2BcaU
    WxbThdnRZ/ZMQDBurAa0vmp9QukznxvoFlRefxakUqPBswYCe3AFYaxwLds0bhMOJ9fq+1
    QfeWyUHd02BQWbEzGnkg5HnI88w9QLV2SyyNXOWESABBoMP7PJ0W7IL0TJRptSt0qwvU3x
    2bTHEylJp1h015pk9q+EHDcdI9KkDsZySIT8wupNWgQXEOOeskGRxWNva/ESy92q/JDFeg
    hg5vHQCLSKq1SrmyOqAjoxuJJKZxdOQeK/gysQiPhhc+WG74mspG6p19bCq2eszJHCK8La
    RT3xWqpaGLwQjWAuR3i6CuTlQsr2jcfkH77icaCmKzog0A3RqiSp/PKldmHRvomEmfl8c8
    bSzpfB4z1/1H52IuJiAX7XL0o7BG+QSIeboOkA6bYwZNnWidtXUA3hOfS9GTd64IsKw+xh
    MVVlH5rph5W8exzB5/gPqyoiUQVl2DAwenuifV+a3pVQa/VxG7wv3Oqzy4zF6/lsJ6fCUG
    vFwnNiSAS+s7g62//WvBTlo7XZrlLdKNZjz8VDFjnRUKK/DcFrWdw3rv0KgrwWUfcfWOvM
    R4i9h9RRrWjmeqAmVclfgKCM4ZVp1LF3r/LG8tW20U4TqGSNFCAIbU4Rfahg
X-ME-Proxy: <xmx:SQbraizGvEX5pEdzvO-jel2qfPVEeqHYKgGuMSNyNXooPQ1_ON9uSA>
    <xmx:SQbralpfBDLLv57N9Fw1OpwUDvDsdqAz2MpdQrc0zAAnGpqFocuhWQ>
    <xmx:SQbrap55TSttyiTf6LGmplFTgbN_Cdzt7eLwH-qU4sOkD0hXNrbzNA>
    <xmx:SQbrakeYLBgdagy6xB2YKEB_oo7Gz8fjzC-FPdDJtGOHIdl_kGTE2Q>
    <xmx:SQbravBidOoEfZjKmy7l8_JpGaUMYKixvm8tIr2SzoPUM5U1AgZvvHLv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 05:17:45 -0500 (EST)
Date: Wed, 4 Nov 2026 11:17:43 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: rppx1: Move register definitions to header
Message-ID: <20261104101743.GH1959885@ragnatech.se>
References: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
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
In-Reply-To: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your patch.

On 2026-10-27 18:40:13 +0100, Barnabás Pőcze wrote:
> Some definitions will be subsequently used outside of `rppx1.c`,
> so move the register definitions into `rppx1.h`.
> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/dreamchip/rppx1/rppx1.c    | 92 -------------------
>  .../media/platform/dreamchip/rppx1/rppx1.h    | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> index c502be7979146..c03dd061783a5 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> @@ -14,98 +14,6 @@
>  
>  #include "rppx1.h"
>  
> -/* RPP_HDR Base Addresses */
> -#define RPPX1_HDRREGS_BASE			0x0000
> -#define RPPX1_HDR_IRQ_BASE			0x0200
> -#define RPPX1_RPP_OUT_BASE			0x0800
> -#define RPPX1_RPP_RMAP_BASE			0x0c00
> -#define RPPX1_RPP_RMAP_MEAS_BASE		0x1000
> -#define RPPX1_RPP_MAIN_PRE1_BASE		0x2000
> -#define RPPX1_RPP_MAIN_PRE2_BASE		0x4000
> -#define RPPX1_RPP_MAIN_POST_BASE		0xa000
> -#define RPPX1_RPP_MVOUT_BASE			0xc000
> -#define RPPX1_RPP_FUSA_BASE			0xf000
> -
> -#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
> -
> -#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
> -#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
> -#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
> -
> -#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
> -
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
> -
> -#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
> -#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
> -
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
> -
> -#define RPPX1_RPP_ISM				(RPPX1_HDR_IRQ_BASE + 0x00)
> -#define RPPX1_RPP_RIS				(RPPX1_HDR_IRQ_BASE + 0x04)
> -#define RPPX1_RPP_MIS				(RPPX1_HDR_IRQ_BASE + 0x08)
> -#define RPPX1_RPP_ISC				(RPPX1_HDR_IRQ_BASE + 0x0c)
> -
> -/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
> -#define RPPX1_GAMMA_OUT_BASE			0x0000 /* HV, MV */
> -#define RPPX1_IS_BASE				0x00c0 /* HV, MV */
> -#define RPPX1_CSM_BASE				0x0100 /* HV, MV */
> -#define RPPX1_OUT_IF_BASE			0x0200 /* HV, MV */
> -#define RPPX1_RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
> -#define RPPX1_LUV_BASE				0x0300 /* MV */
> -
> -/* PRE1/PRE2/POST Pipelines - Base Addresses */
> -#define RPPX1_ACQ_BASE				0x0080 /* PRE1, PRE2 */
> -#define RPPX1_BLS_BASE				0x0100 /* PRE1, PRE2 */
> -#define RPPX1_GAMMA_IN_BASE			0x0200 /* PRE1, PRE2 */
> -#define RPPX1_LSC_BASE				0x0400 /* PRE1, PRE2 */
> -#define RPPX1_AWB_GAIN_BASE			0x0500 /* PRE1, PRE2, POST */
> -#define RPPX1_DPCC_BASE				0x0600 /* PRE1, PRE2 */
> -#define RPPX1_DPF_BASE				0x0700 /* PRE1, PRE2 */
> -#define RPPX1_FILT_BASE				0x0800 /* POST */
> -#define RPPX1_CAC_BASE				0x0880 /* POST */
> -#define RPPX1_CCOR_BASE				0x0900 /* POST */
> -#define RPPX1_HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
> -#define RPPX1_HIST256_BASE			0x0b00 /* PRE1 */
> -#define RPPX1_EXM_BASE				0x0c00 /* PRE1, PRE2 */
> -#define RPPX1_LTM_BASE				0x1000 /* POST */
> -#define RPPX1_LTM_MEAS_BASE			0x1200 /* POST */
> -#define RPPX1_WBMEAS_BASE			0x1700 /* POST */
> -#define RPPX1_BDRGB_BASE			0x1800 /* POST */
> -#define RPPX1_SHRP_BASE				0x1a00 /* POST */
> -
> -/* Functional Safety Module Base Addresses */
> -#define RPPX1_FMU_BASE				0x0100
> -
> -#define RPPX1_RPP_HDR_FMU_FSM_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x00)
> -#define RPPX1_RPP_HDR_FMU_FSM_FSM_IRQM_FAULT	BIT(23)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE2_SIZE_FAULT	BIT(20)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE2_TIME_FAULT	BIT(19)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE1_SIZE_FAULT	BIT(18)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE1_TIME_FAULT	BIT(17)
> -#define RPPX1_RPP_HDR_FMU_FSM_SIZE_FAULT	BIT(16)
> -#define RPPX1_RPP_HDR_FMU_FSM_TIME_FAULT	BIT(15)
> -#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_FAULT	BIT(14)
> -#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_TIME_FAULT	BIT(13)
> -#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_SIZE_FAULT	BIT(12)
> -#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_TIME_FAULT	BIT(11)
> -#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_ERR	BIT(10)
> -#define RPPX1_RPP_HDR_FMU_FSM_IS_OUT_SIZE_ERR	BIT(9)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW	BIT(7)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW	BIT(6)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE1_INFORM_SIZE	BIT(5)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE1_OUTFORM_SIZE	BIT(4)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE2_INFORM_SIZE	BIT(3)
> -#define RPPX1_RPP_HDR_FMU_FSM_PRE2_OUTFORM_SIZE	BIT(2)
> -
> -#define RPPX1_RPP_HDR_FMU_RFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x04)
> -#define RPPX1_RPP_HDR_FMU_MFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x08)
> -#define RPPX1_RPP_HDR_FMU_FSC_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x0c)
> -
>  void rppx1_write(struct rppx1 *rpp, u32 offset, u32 value)
>  {
>  	iowrite32(value, rpp->base + offset);
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> index 3bf3955afbaed..825499f8f709c 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> @@ -13,6 +13,98 @@
>  
>  #include "rpp_module.h"
>  
> +/* RPP_HDR Base Addresses */
> +#define RPPX1_HDRREGS_BASE			0x0000
> +#define RPPX1_HDR_IRQ_BASE			0x0200
> +#define RPPX1_RPP_OUT_BASE			0x0800
> +#define RPPX1_RPP_RMAP_BASE			0x0c00
> +#define RPPX1_RPP_RMAP_MEAS_BASE		0x1000
> +#define RPPX1_RPP_MAIN_PRE1_BASE		0x2000
> +#define RPPX1_RPP_MAIN_PRE2_BASE		0x4000
> +#define RPPX1_RPP_MAIN_POST_BASE		0xa000
> +#define RPPX1_RPP_MVOUT_BASE			0xc000
> +#define RPPX1_RPP_FUSA_BASE			0xf000
> +
> +#define RPPX1_RPP_HDRREGS_VERSION_REG          (RPPX1_HDRREGS_BASE + 0x0000)
> +
> +#define RPPX1_RPP_HDR_UPD_REG                  (RPPX1_HDRREGS_BASE + 0x0004)
> +#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD     BIT(1)
> +#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD         BIT(0)
> +
> +#define RPPX1_RESERVED_3_REG                   (RPPX1_HDRREGS_BASE + 0x0008)
> +
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_REG                (RPPX1_HDRREGS_BASE + 0x000c)
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE     1
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE    0
> +
> +#define RPPX1_RPP_HDR_OUT_IF_ON_REG            (RPPX1_HDRREGS_BASE + 0x0010)
> +#define RPPX1_RPP_HDR_OUT_IF_OFF_REG           (RPPX1_HDRREGS_BASE + 0x0014)
> +
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG     (RPPX1_HDRREGS_BASE + 0x0018)
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE  1
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE 0
> +
> +#define RPPX1_RPP_ISM                          (RPPX1_HDR_IRQ_BASE + 0x00)
> +#define RPPX1_RPP_RIS                          (RPPX1_HDR_IRQ_BASE + 0x04)
> +#define RPPX1_RPP_MIS                          (RPPX1_HDR_IRQ_BASE + 0x08)
> +#define RPPX1_RPP_ISC                          (RPPX1_HDR_IRQ_BASE + 0x0c)
> +
> +/* RPP_OUT/MV_OUT Pipelines - Base Addresses */
> +#define RPPX1_GAMMA_OUT_BASE			0x0000 /* HV, MV */
> +#define RPPX1_IS_BASE				0x00c0 /* HV, MV */
> +#define RPPX1_CSM_BASE				0x0100 /* HV, MV */
> +#define RPPX1_OUT_IF_BASE			0x0200 /* HV, MV */
> +#define RPPX1_RPP_OUTREGS_BASE			0x02c0 /* HV, MV */
> +#define RPPX1_LUV_BASE				0x0300 /* MV */
> +
> +/* PRE1/PRE2/POST Pipelines - Base Addresses */
> +#define RPPX1_ACQ_BASE				0x0080 /* PRE1, PRE2 */
> +#define RPPX1_BLS_BASE				0x0100 /* PRE1, PRE2 */
> +#define RPPX1_GAMMA_IN_BASE			0x0200 /* PRE1, PRE2 */
> +#define RPPX1_LSC_BASE				0x0400 /* PRE1, PRE2 */
> +#define RPPX1_AWB_GAIN_BASE			0x0500 /* PRE1, PRE2, POST */
> +#define RPPX1_DPCC_BASE				0x0600 /* PRE1, PRE2 */
> +#define RPPX1_DPF_BASE				0x0700 /* PRE1, PRE2 */
> +#define RPPX1_FILT_BASE				0x0800 /* POST */
> +#define RPPX1_CAC_BASE				0x0880 /* POST */
> +#define RPPX1_CCOR_BASE				0x0900 /* POST */
> +#define RPPX1_HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
> +#define RPPX1_HIST256_BASE			0x0b00 /* PRE1 */
> +#define RPPX1_EXM_BASE				0x0c00 /* PRE1, PRE2 */
> +#define RPPX1_LTM_BASE				0x1000 /* POST */
> +#define RPPX1_LTM_MEAS_BASE			0x1200 /* POST */
> +#define RPPX1_WBMEAS_BASE			0x1700 /* POST */
> +#define RPPX1_BDRGB_BASE			0x1800 /* POST */
> +#define RPPX1_SHRP_BASE				0x1a00 /* POST */
> +
> +/* Functional Safety Module Base Addresses */
> +#define RPPX1_FMU_BASE				0x0100
> +
> +#define RPPX1_RPP_HDR_FMU_FSM_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x00)
> +#define RPPX1_RPP_HDR_FMU_FSM_FSM_IRQM_FAULT	BIT(23)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_SIZE_FAULT	BIT(20)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_TIME_FAULT	BIT(19)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_SIZE_FAULT	BIT(18)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_TIME_FAULT	BIT(17)
> +#define RPPX1_RPP_HDR_FMU_FSM_SIZE_FAULT	BIT(16)
> +#define RPPX1_RPP_HDR_FMU_FSM_TIME_FAULT	BIT(15)
> +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_FAULT	BIT(14)
> +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_TIME_FAULT	BIT(13)
> +#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_SIZE_FAULT	BIT(12)
> +#define RPPX1_RPP_HDR_FMU_FSM_HV_OUT_TIME_FAULT	BIT(11)
> +#define RPPX1_RPP_HDR_FMU_FSM_MV_OUT_SIZE_ERR	BIT(10)
> +#define RPPX1_RPP_HDR_FMU_FSM_IS_OUT_SIZE_ERR	BIT(9)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_FIFO_OVFLW	BIT(7)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_FIFO_OVFLW	BIT(6)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_INFORM_SIZE	BIT(5)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE1_OUTFORM_SIZE	BIT(4)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_INFORM_SIZE	BIT(3)
> +#define RPPX1_RPP_HDR_FMU_FSM_PRE2_OUTFORM_SIZE	BIT(2)
> +
> +#define RPPX1_RPP_HDR_FMU_RFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x04)
> +#define RPPX1_RPP_HDR_FMU_MFS_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x08)
> +#define RPPX1_RPP_HDR_FMU_FSC_REG		(RPPX1_RPP_FUSA_BASE + RPPX1_FMU_BASE + 0x0c)
> +
>  #define RPPX1_IRQ_ID_256HIST			BIT(27)
>  #define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
>  #define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
