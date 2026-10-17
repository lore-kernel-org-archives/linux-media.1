Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAF3CBE8F
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792229474; cv=none; b=qRqlsdmFlk6IhNOXueIlav5Qf7dkf/mxI2EviKk9wRh4OlLK0mdXJHSSAYNptd56X00MoFEmWl7hCOZpmM1YqANetwVhFD92H9i7Y6vs5Pj0vXs0eTRcI5T2MpDf16f8PQuoHhlEYufHANmEKoeQBM7dqeK+rh5h0mCBkk1S7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792229474; c=relaxed/simple;
	bh=rSOVYeiosgh98xkd2La8Vpy5VyLBe5QougvsM4ILQpg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlxAinn0mE1OoaPKowiTKlBX5KQ73SstXG6fwvEp2GR8tmk11aidzHZ3baw6y/wQTlDW0l1QyjZyMwV4/0id6cElFxvePOWE9NkCZg626UJp2H2apoPLeJ7aJVtUun7DPdJ8HUlUH/HVoocIJoMP/j5UUWNHllHP/x+o5xK5KFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=uvbhNRhN; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="uvbhNRhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792229469; x=1792488669;
	bh=EpNijV29Dex1JZrSMvv8ssZOUKLetfwNGZRMKg5BQw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uvbhNRhNpnOzFhhDZrwQD14rBftUuH2B6orLzDcie/QvzzzdhufE4t4ThM5OUL7qK
	 zYfld7nTnzH3RCH2mxC8RvIEPs6l8HzR8GOrTtlYa1u7y8pzY98rBzepGFPH84lGzP
	 Bpy3h3ve8tafxvGUMtTppTpKFU0aLp3kLlMvC5jf2AqaGRb4/cdfBDhDpJvWA1SSy3
	 rLczUM23m5NgjzA3BmGlY/YnuWPN8n0GOkLcN+Ot1+8ymJLSKdtP3VvIFQjGcvk1fL
	 90aIJEu3/2Xw2jAtBS8jfOrgyVBUDC7qIIKBIX7F8i0RbLcVbiNqwgoKwteXpHxIue
	 WnK+4qxMjz7Qw==
Date: Sat, 17 Oct 2026 09:31:05 +0000
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 11/12] media: ipu6: Work around IPU4P CSI-2 port 2 timing
Message-ID: <QRC9CMV5ZtFN4ecemQeDhu_1R4rIZsYvxpTVNfvR7R5HfD2JPJHXpPBCbELUy-SeDi8gcGtc4JzUj4iGmi4c0rlmozRfn2eVk9nQFToqbzQ=@proton.me>
In-Reply-To: <asy4k-Muh1acgU6s@kekkonen.localdomain>
References: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me> <asy4k-Muh1acgU6s@kekkonen.localdomain>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: c8f39170593562b06bb61eaee39aa7508fdceddd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Monday, October 12th, 2026 at 12:38 PM, sakari.ailus@linux.intel.com <sa=
kari.ailus@linux.intel.com> wrote:

> Hi Ruslan,
>=20
> On Sun, Oct 11, 2026 at 02:43:16PM +0000, Ruslan Bay wrote:
> > Use fixed timing values for the verified Surface Pro 7 front-camera
> > configuration (CSI-2 port 2, firmware source 7, two lanes), including
> > the lane-count programming order observed in Windows. Retain calculated
> > timings and the existing initialization order for other configurations.
> >
> > Tested on the Surface Pro 7 front camera; other IPU4P systems need test=
ing.
> >
> > Co-developed-by: supermepsipax <supermepsipax@github>
> > Co-developed-by: thisiscamk <thisiscamk@github>
> > Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> > Co-developed-by: georgemihaila <georgemihaila@github>
>=20
> Signed-off-by: is also required for these. But this isn't just about addi=
ng
> the tag; please see Documentation/process/submitting-patches.rst on what =
it
> means. A proper e-mail address is also required here.
>=20
> >
> > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > ---
> >  .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 50 ++++++++++++++++---
> >  1 file changed, 42 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/driver=
s/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > index ec0a36069b01..ffa7d80cd5f2 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > @@ -69,6 +69,22 @@ void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
> >  =09=09ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
> >  }
> >
> > +/*
> > + * Use fixed timing observed in Windows for the SP7 front camera:
> > + * IPU4P CSI-2 port 2, firmware source 7, two-lane D-PHY.
> > + */
> > +static void ipu4p_isys_apply_fixed_2lane_timing(struct ipu6_isys_csi2 =
*csi2)
> > +{
> > +=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > +=09writel(1155, csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(0));
> > +
> > +=09for (unsigned int i =3D 0; i < 8; i++) {
> > +=09=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(i));
> > +=09=09writel(1269,
> > +=09=09       csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(i + 1));
> > +=09}
> > +}
> > +
> >  static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
> >  =09=09=09=09      unsigned int port)
> >  {
> > @@ -118,6 +134,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys=
,
> >  =09struct ipu6_isys_csi2 *csi2;
> >  =09void __iomem *base;
> >  =09u32 value;
> > +=09bool fixed_timing;
> >
> >  =09if (!cfg || cfg->port >=3D isys->pdata->ipdata->csi2.nports)
> >  =09=09return -EINVAL;
> > @@ -146,14 +163,30 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *is=
ys,
> >  =09if (!timing)
> >  =09=09return -EINVAL;
> >
> > -=09writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> > -=09writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > -
> > -=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
> > -=09=09writel(timing->dtermen,
> > -=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > -=09=09writel(timing->dsettle,
> > -=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > +=09writel(timing->ctermen,
> > +=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> > +
> > +=09fixed_timing =3D csi2->port =3D=3D 2 && cfg->nlanes =3D=3D 2 &&
> > +=09=09       csi2->asd.source =3D=3D
> > +=09=09       IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + 7;
> > +=09if (fixed_timing) {
> > +=09=09ipu4p_isys_apply_fixed_2lane_timing(csi2);
> > +=09=09dev_dbg(&isys->adev->auxdev.dev,
> > +=09=09=09"using fixed SP7 timing for CSI-2 port %u, source 7, two lane=
s\n",
> > +=09=09=09csi2->port);
> > +
> > +=09=09/* Windows configures the lane count before RX_CONFIG. */
> > +=09=09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
>=20
> Doesn't Surface Pro 7 work without these?
>=20
> I can't recall if I commented this issue already, but I think this
> information should be passed to the driver in form of endpoint properties=
,
> stuffed in ipu-bridge based on DMI information.
>=20
> The bindings for this should also be specified for DT, but perhaps that's
> out of scope of the set -- as there remain a kernel interface only, chang=
es
> later on will be possible and fairly trivial.
>=20

Understood, I'll verify each part of the workaround and keep only what's ne=
cessary.

> > +=09} else {
> > +=09=09writel(timing->csettle,
> > +=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > +
> > +=09=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
> > +=09=09=09writel(timing->dtermen,
> > +=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > +=09=09=09writel(timing->dsettle,
> > +=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > +=09=09}
> >  =09}
> >
> >  =09value =3D readl(base + IPU4P_CSI2_RX_CONFIG);
> > @@ -162,6 +195,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *isys=
,
> >  =09writel(value, base + IPU4P_CSI2_RX_CONFIG);
> >
> >  =09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> > +
>=20
> Unrelated change. You could place it in the patch adding the adjacent
> linest.
>=20

Agree. Sorry, I forgot to drop this one.

> >  =09writel(0, base + IPU4P_CSI2_RX_ENABLE);
> >
> >  =09ipu4p_isys_csi_irq_enable(isys, cfg->port);
>=20
> --
> Regards,
>=20
> Sakari Ailus
> 
