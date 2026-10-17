Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D638E8B4
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228390; cv=none; b=mIZbOm9QcDB3lPb9p17r9wjYMWGP2VJNYwL7DEIadlHI1J01b93A3C/fXk/u5KXPHS5t2jctDMqpORhc7xCkPluXP6emDbYQKHjtPnHxpPM36+4VdaaQ6oje6dv7se79JhutiPNpx1LAynNngiY8100O+kCk2Je2u9PY/a0fCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228390; c=relaxed/simple;
	bh=VLR1uARJaX4y0trQS9Y2KvCxPWIF2IX1d1VeqMPwdUk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFmX6AV2Dvb34LT/Q8QRd1heWRdOTx7FuXvKPC5UkuMMyw+bYiJx3iFgeuRo/Y+ad0Ijmp1F0Z4NtFPfJ56rjvzAk4F5/uUSvUV9r1PAUvFD5Js8RpKZ8UtjDoahPl95dBW2Gwo/PYAoB6x/jx6UxWQuniafZn2n3R89YLhFELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d6k3A+0Q; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d6k3A+0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792228378; x=1792487578;
	bh=78v4AS9QJJew3FdTOYl9xZeAZpfEJJJOkRbv6NThD0w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d6k3A+0QFsLN4NVcRWZ0yknh2GMWd9n/fwUkayr3q563mJAxal/viZXmX80RQZsGn
	 veisGMa0ofn5xXb/mu9GCIizgHM0nzl9RJOAoaAykipUJUrHVCo9EnWKNiye5tHsmT
	 l6uTkap4TnAemZWrv1tnlWHkdo9R93/PGZ3xeNTIjY3N6AHwTcNt/6c6fO4Jw/aFtQ
	 pq7zV5v86+AYEeI36ZA7njzzdAGrY55Y8WgpU7vRGKbsCuYOcI1u8hdIzxWJOm1j9q
	 N2T/AzYsOuXTvLRVkN/Y0Hf0KgvZHJYhMmY3VKb9i7LjzVafa3zeB02ubG4Kxxk8Lb
	 SERY0z/zqye8w==
Date: Sat, 17 Oct 2026 09:12:55 +0000
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 11/12] media: ipu6: Work around IPU4P CSI-2 port 2 timing
Message-ID: <4NXLsLkCyWYTs_K_NbQNHvX6cbKcFnGr3nBHKP3HZ36EOVLm_y3vmYFZ3FB8Al7C6L9jcDokBkQAnfIblNkYx_PVtiubCZ9_LmUMUTSVB7c=@proton.me>
In-Reply-To: <20261012141122.GB4214@killaraus.ideasonboard.com>
References: <wHlhg4wMna8LgQHoqgFJxsJ3dL0clAd63yzOzr-vjRpkqq6WSPuzlLeYRGYHKwdl17CXzPVLFCWD6CNkI-BTMTd33QepNGnNWJZX6yvPAV4=@proton.me> <asy4k-Muh1acgU6s@kekkonen.localdomain> <20261012141122.GB4214@killaraus.ideasonboard.com>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: c5fb0bb0a4f6a5dfe29ddc3af450df51463ff14f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari, Laurent,

On Monday, October 12th, 2026 at 4:11 PM, Laurent Pinchart <laurent.pinchar=
t@ideasonboard.com> wrote:

> On Mon, Oct 12, 2026 at 01:38:11PM +0300, Sakari Ailus wrote:
> > Hi Ruslan,
> >
> > On Sun, Oct 11, 2026 at 02:43:16PM +0000, Ruslan Bay wrote:
> > > Use fixed timing values for the verified Surface Pro 7 front-camera
> > > configuration (CSI-2 port 2, firmware source 7, two lanes), including
> > > the lane-count programming order observed in Windows. Retain calculat=
ed
> > > timings and the existing initialization order for other configuration=
s.
> > >
> > > Tested on the Surface Pro 7 front camera; other IPU4P systems need te=
sting.
> > >
> > > Co-developed-by: supermepsipax <supermepsipax@github>
> > > Co-developed-by: thisiscamk <thisiscamk@github>
> > > Co-developed-by: ConsultingFuture4200 <ConsultingFuture4200@github>
> > > Co-developed-by: georgemihaila <georgemihaila@github>
> >
> > Signed-off-by: is also required for these. But this isn't just about ad=
ding
> > the tag; please see Documentation/process/submitting-patches.rst on wha=
t it
> > means. A proper e-mail address is also required here.
>=20
> As well as a real name.
>=20

Understood, I'll ask each co-developer to provide their sign-off, real name=
, and email address.

> > > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > > ---
> > >  .../media/pci/intel/ipu6/ipu4p-isys-csi-phy.c | 50 ++++++++++++++++-=
--
> > >  1 file changed, 42 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c b/driv=
ers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > > index ec0a36069b01..ffa7d80cd5f2 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi-phy.c
> > > @@ -69,6 +69,22 @@ void ipu4p_isys_phy_setup(struct ipu6_isys *isys)
> > >  =09=09ipu4p_isys_configure_phy_bb(isp, &ipu4p_phy_bb_configs[i]);
> > >  }
> > >
> > > +/*
> > > + * Use fixed timing observed in Windows for the SP7 front camera:
> > > + * IPU4P CSI-2 port 2, firmware source 7, two-lane D-PHY.
> > > + */
> > > +static void ipu4p_isys_apply_fixed_2lane_timing(struct ipu6_isys_csi=
2 *csi2)
> > > +{
> > > +=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > > +=09writel(1155, csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(0));
> > > +
> > > +=09for (unsigned int i =3D 0; i < 8; i++) {
> > > +=09=09writel(0, csi2->base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(i));
> > > +=09=09writel(1269,
> > > +=09=09       csi2->base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(i + 1))=
;
> > > +=09}
> > > +}
> > > +
> > >  static void ipu4p_isys_csi_irq_enable(struct ipu6_isys *isys,
> > >  =09=09=09=09      unsigned int port)
> > >  {
> > > @@ -118,6 +134,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *is=
ys,
> > >  =09struct ipu6_isys_csi2 *csi2;
> > >  =09void __iomem *base;
> > >  =09u32 value;
> > > +=09bool fixed_timing;
> > >
> > >  =09if (!cfg || cfg->port >=3D isys->pdata->ipdata->csi2.nports)
> > >  =09=09return -EINVAL;
> > > @@ -146,14 +163,30 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *=
isys,
> > >  =09if (!timing)
> > >  =09=09return -EINVAL;
> > >
> > > -=09writel(timing->ctermen, base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE=
);
> > > -=09writel(timing->csettle, base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE=
);
> > > -
> > > -=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
> > > -=09=09writel(timing->dtermen,
> > > -=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > > -=09=09writel(timing->dsettle,
> > > -=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > > +=09writel(timing->ctermen,
> > > +=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_CLANE);
> > > +
> > > +=09fixed_timing =3D csi2->port =3D=3D 2 && cfg->nlanes =3D=3D 2 &&
> > > +=09=09       csi2->asd.source =3D=3D
> > > +=09=09       IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + 7;
> > > +=09if (fixed_timing) {
> > > +=09=09ipu4p_isys_apply_fixed_2lane_timing(csi2);
> > > +=09=09dev_dbg(&isys->adev->auxdev.dev,
> > > +=09=09=09"using fixed SP7 timing for CSI-2 port %u, source 7, two la=
nes\n",
> > > +=09=09=09csi2->port);
> > > +
> > > +=09=09/* Windows configures the lane count before RX_CONFIG. */
> > > +=09=09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> >
> > Doesn't Surface Pro 7 work without these?
> >
> > I can't recall if I commented this issue already, but I think this
> > information should be passed to the driver in form of endpoint properti=
es,
> > stuffed in ipu-bridge based on DMI information.
> >
> > The bindings for this should also be specified for DT, but perhaps that=
's
> > out of scope of the set -- as there remain a kernel interface only, cha=
nges
> > later on will be possible and fairly trivial.
> >
> > > +=09} else {
> > > +=09=09writel(timing->csettle,
> > > +=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_CLANE);
> > > +
> > > +=09=09for (unsigned int lane =3D 0; lane < cfg->nlanes; lane++) {
> > > +=09=09=09writel(timing->dtermen,
> > > +=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_TERMEN_DLANE(lane));
> > > +=09=09=09writel(timing->dsettle,
> > > +=09=09=09       base + IPU4P_CSI2_RX_DLY_CNT_SETTLE_DLANE(lane));
> > > +=09=09}
> > >  =09}
> > >
> > >  =09value =3D readl(base + IPU4P_CSI2_RX_CONFIG);
> > > @@ -162,6 +195,7 @@ int ipu4p_isys_phy_set_power(struct ipu6_isys *is=
ys,
> > >  =09writel(value, base + IPU4P_CSI2_RX_CONFIG);
> > >
> > >  =09writel(cfg->nlanes, base + IPU4P_CSI2_RX_NOF_ENABLED_LANES);
> > > +
> >
> > Unrelated change. You could place it in the patch adding the adjacent
> > linest.
> >
> > >  =09writel(0, base + IPU4P_CSI2_RX_ENABLE);
> > >
> > >  =09ipu4p_isys_csi_irq_enable(isys, cfg->port);
>=20
> --
> Regards,
>=20
> Laurent Pinchart
> 
