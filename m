Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585739;
	b=bABibNDTmK6qzbXRyhmI4QEXtZsOamQgYBL9ifqvLB13l89iSFnvy5eFEbGgz9W5RsOX
	 ZsuU3M/fhsU9uW2ZAdxAVtbVKL8vFLE+Se5EC2/6na3x43e41/ZWHlh4UoYNxoEqysNa2
	 SdgNHcHSynFw9KcAN4aQPwiCl9rIF8GIDDFM2BnaIxwt/2Bnqol6TB0FIQLds1ZQzTbSC
	 8TrPvpMR7/Qcy40rMBjPW03dpQCMzNQnHZA4s1FaXL857O8xjGc7HIDBEZzfuU52qyRia
	 b3SbNJahWY8/4vgDTAs2XIRikxKqZmNFF2NenMVq/W7VSSR9/YJecaeTKgvRS8FLNgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
	b=Y8wUSanTsCDMWQfW968ELUy/Gn9F3Jnp6dd/K7jbLtUytLdXrxcpFpfjPRX0cFYbexvX
	 oyy986szxuBkLuS8v0qa2spZYswNcYvcu8ELGM6sEyGhn9QAjmC5NU9IFppzOdjy6E7zJ
	 zyLa1lvdys7Ls3Ups/y3sNQk0lFHD1vLrkS95APD1MwrYwDnmGXMqwGzx/lppBbPg5hpB
	 /WxYwyIVRo1hCFJ94QDq6IA/Ey27nDR0qY8yBPNKsuN/Z1CxxQBxQazTOX2wWuRVQtkXJ
	 hE6iK8JO/SgYUe7lFHEwsBGQLCUsjkPcgOAD2KyUGPBv9e0sViXS57fpnEcnWaQa+ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=iWHcQh1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A29A606A32A
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A29A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=iWHcQh1I
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so236661b6e.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585737; cv=none;
        d=google.com; s=arc-20260327;
        b=BX1Azfq2Xup2diYC2/u7RESAjHGFWxUNoxz8QmBoQlvqJ6AkYAS5fSEn/jKZutyS6l
         GYIu+PevvVfoiqS9YUNfwgIG1PI+ugc+BFUZ5nvtUGXf5IA1X+4fDRzVEcg2ifEnQPyk
         VHYpUgwltW2JDJZeqX/PCkr8nc7s7u1+AN7FtKSpDo5/jKe6TmGbQ4WlEW3uNdYsPq1p
         rG185ArDbEors3J2X9Zj3ZSzgyrpGDsrM2mr7/GTbwiJMhs5Xghwib1CdPHVf41AnJWZ
         EozwHC/5j02LOo0OL3plkZ29rsdbcvKhSpG/8mtSubfvhRRbLy858WmdYTu4rTc7BnKj
         OCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        fh=pOoTbsWDLO2UXhA1TY5K4rSIhAsdfKgM/di6DByIg/w=;
        b=dPilVPAC3uxY5/3bWj64op18ldkaKnIrYvSFyDFMj23yOymj3tWgvLr7tz98yQHkx6
         g0DOT8bOS/IurQQM77XD+DDlgcoEpMGE+L5aiBarvymk9qvdurFZf4ZVu+PmmtTf6nKV
         Du+JU0JIWMYaEEvRjeMDggkDR0dKQeccR4SDriPrCK0Exzd08OuGIMAo1TaupNAZB39q
         qTWjhFc5PWcsCDktK5met6Xb7JpLBledAAdEsTXrMGbkWnqRz9dlmO4BmeFTuhlQIcyB
         k5jik3SUnOGjCqKaWVbaWGXNoBZxGskRd4TQzDl7rUTJb56LLv6W09gj3uqgzsb0G81X
         bW5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792585737; x=1793190537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=iWHcQh1IkvrgBrClBwmWfgr3B+2jRDqd4IWd9LwEJb7K6SmshP2PV5Dtkw2GLp2RD+
         qTbDBnMJMqbsHCqqFkxeL7vW6geii9ppcHt9EJkuN9x5MSobo+B8s/EwhXIddAPdt2WV
         KWwJbtYMAZQOhR+FIwn+9bdedWylxmkzE8oOGmRaeFhFXzKH0tE2nqh7akNsDXWcuTxZ
         kn59h2zGgB+OCgK2stCKv3ItGkY8c9vQqi2mtF18p5r6oWawRhg0jL3Yeer3yoGNEITc
         CMgm5HRAmDhAwNULU2HsjXbMPbPZISDpQVFnGj4XekNiPJX3zJzcYMPKGPk1u+OaKJp2
         PIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585737; x=1793190537;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=PwbIwLAcBkepvjnMbhWnWRZe7wCN21t9o+046B5icA5APzGT+sUGBHsTt34Wt8Is9C
         RutxV3GacN7P/JuK0HONt+Fcmm/qGUr9JIETMjPk5WDMbgTUQu6ww9aWWinn/9R2EEH7
         RLGYlt/4GY1GpwPdkkq+KR8ekZmmF18MtoF/vyvqmJmQYyfN6nRcIRy/I3PTRv0nDwiy
         UgCJgAwxT9loKdx9DtulynP3IvDPLALxHO4hkNvUpH4NIgBKCKsiZ4Pn8dgDngJMGpSZ
         ZkIxeE3vdD+/7Ed9zfAoddvDg76dgxRiBTr4LukVjyVEtyWTqqiHSfF5E0cIqtDD8nLe
         U97g==
X-Forwarded-Encrypted: i=1; AKwUvByk+83Tv56sB7RyknQW2Ay3BPiwUt9f3KeRNR/PPdDgVqfgIc2paM4MkTCMwvW7zvP7JfrVYOh+ILC/kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKSNX9u0MYFHoqr0WDmpKAWII+m4senOo7je4QmiwRKy3jE2EOX
	PBtXsOkpWi2Sun8AQJPe8wMz1zXsNahNpTaJ2e/nBweomTQJdOVuDtdq+/j82oL7cNnk6H4G4L1
	MYgH5yd3DO9mfAHbpI6+8PwrV0VDpo5yFSQMnBK7d3w==
X-Gm-Gg: AYBFou1nxTPg7ILrVaF0JTdsYAdPqzk/GUuQjeMarnRA4n4YsVeT+jfKtANJAL6M3xT
	F1cLIr6cXmxRTZMjCD6EtnvEXsPnmtF0+Lf2oyfWXOUjMD3tCjztFDbz65g5z+7dRs52lD0y9Ke
	r6kmT6a2cP5pK+WuPtLM7TOkCS8IshJoXbe+rGimP7WVe1FjvyGCbX04VkDxlURkleEM66vjGGY
	OSM2T1c8ECFNrJGwOmA0JWlW9jA//QmEqnHw/uzbF8GNmZHLN+o9KOzYxHJrREutn82jQ7ugsZO
	qL5fBlGPXsNdK8KvI+O3EahuckfJOCOIVfmwTr9yf8HjYDH1tRA98HMNcRD9saXwc+tLDWSMa3o
	IZRHGQD72gRT4F2ZGOVnfGwtmtC7tLGpcd1mW5e/FOxBYh0lx6AE0gfvxA57Dyxt2emzXluUkJU
	4yKdEv9HyZasLCnwdxa9bKvn9vB1z6AWcSeCUTOP/TfUo583vmM/gOWg==
X-Received: by 2002:a05:6808:4482:b0:4d3:9029:5ab3 with SMTP id
 5614622812f47-553585760c1mr1050030b6e.35.1792585737133; Wed, 21 Oct 2026
 05:28:57 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com> <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com> <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
 <atiogo14sCFw4xlT@kekkonen.localdomain> <20261021120521.GA273922@killaraus.ideasonboard.com>
In-Reply-To: <20261021120521.GA273922@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Oct 2026 13:28:40 +0100
X-Gm-Features: AclHuK9hqxcMJ0HhysTs5L34pzu1OSW612PUOHHd1l1X6LjoVQ847rGG4xISb-Q
Message-ID: <CAPY8ntB6bbdX+3drOjubV4dNAxxKgNmHoE+uZ_1JmQ2-Y+ocbg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari (and Laurent)

On Wed, 21 Oct 2026 at 13:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 21, 2026 at 02:56:50PM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
> > > On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart wrote:
> > > > On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > > > > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > > > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > > > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > > > > exposure and analogue gain controls, image flipping, blanking controls
> > > > > > and test pattern generation.
> > > > >
> > > > > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > > > > 2, for which Dave (Cc'd) is working on a driver (see
> > > > > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > > > > The register defines in the two drivers appear to be quite well aligned.
> > >
> > > Asked and answered at v1
> > > https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/
> > >
> > > > The current version of the driver implements very few features of the
> > > > IMX908 sensor, as crop support has been removed pending the raw camera
> > > > sensor model, and Clear HDR3 is being developed. I expect more
> > > > differences to appear when those features will be merged, so I believe
> > > > it makes sense to have a separate driver here.
> > > >
> > > > In the future, I expect the raw camera sensor model to open the door to
> > > > more code sharing and more drivers supporting a wider variety of
> > > > devices. We can decide then if the imx908 should stay a standalone
> > > > driver, support other sensors as well, possibly across the Starvis 2 and
> > > > 3 families. I'm willing to help with the refactoring at that point if
> > > > needed, the maintenance burden won't be on you (and I'm sure that
> > > > Lachlan and his team will of course maintain the code base).
> > >
> > > Agreed.
> > > I have compared the datasheet for imx908 against the Starvis2 ones,
> > > and when we start looking at HDR modes they diverge a reasonable
> > > amount.
> > >
> > > Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
> > > to the earlier ones, so adding Starvis3 would need some care.
> >
> > There's quite a bit of this in the CCS driver, due to the variance it
> > allows for implementors. I don't see this being a problem as long as the
> > foundations are reasonably similar, albeit we can see whether this could be
> > further extended later on to other sensors.
> >
> > I'm fine with having a separate imx908 driver for now. Dave's driver also
> > exposes the variant information through the media entity name so that
> > should be done by the imx908, too (at least if there can be multiple ones).

No it doesn't. My driver passes .name from the variant to
v4l2_i2c_subdev_set_name, so the media entity name is common for both
mono and colour variants.
It's the same with the imx290 driver supporting the different variants
of 290/327/462.

libcamera uses the media bus codes to determine whether the sensor is
mono or colour, not the entity name.
Having different entity names would mean duplicate entries in
libcamera's sensor_properties, or otherwise manipulate the name.

  Dave

> As far as I understand, the IMX908 does not have a mono version.
> Lachlan, could you please confirm that ?
>
> > I'll review the driver properly soonish but I reckon it's in a pretty good
> > shape already.
>
> --
> Regards,
>
> Laurent Pinchart
