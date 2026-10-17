Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2803FADFD
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792228143; cv=none; b=Q5ssWsryUr9Fiw/nKFUE0xMMpeQH6UsDXHTf2+q0JbloGPzQlykaOpOEjC3rZATAMSByiKoPKMx2BgYYW6o3KitgJRk1Nvv4JGrJyhDe6RzFM6TW/ozRoL5D9H/xc7cQlGFpqMrRTYQGdpvoulCxAUEQw++gIijWN/+dGlyiOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792228143; c=relaxed/simple;
	bh=sIylypAE2TvAm5ETdvUGdODZZNgc25uP0PBK6TNeGwY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wm+MHRFHXXeizhnZOHhrojBXhYxutI+IXchDRDwmRtckYD4XuPCqTpwL7NKFQFQQhzKEBYct9CSJFAqeWtZJqujO9wb083V28L9V0rcSljNs+hQCQodxBMSvvlG5qPHHcrf002T6NRnX2RQvn+jPvvJCV0+keEy3Ugd7ILIqZ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ub64S5Gy; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ub64S5Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=vntdqqhkabfddd3vtgab6gclze.protonmail2; t=1792228133;
	x=1792487333; bh=kMnMtpGkTY2gXeLxoqcASXb3sykoHMURMqXoWC99pQs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ub64S5GyXhZsH8Wb/LJKIcThiSjz/bAA31rjrmeg9L/f/LiOv0cvgjqWYbXhqF25h
	 Dy49X0qlJVLgamLni6jhHpIzVtmMyJL+bRtmSqCwWPVNEnH00ejTu/iR+gm9W4OyHX
	 i3pjaOR6uhUYNIx87DzNtAFG5KdI9daNRU4LA3tnjLkAdKGF6/hYHhPJ/mMw6Vy2NZ
	 SqZnYO8hmVxj47KFRJ4Isep92rHOlqVF7mqkR0IRahux/mvfCMOoO5gJc9SaZaBOEz
	 RNkZFAJ2HMFya67NRqOWO5/zUSV+zzURQA1okkNHvK4ILlH4P2Uoo+RsZQFKK89k7W
	 lsgXtTCKud6WA==
Date: Sat, 17 Oct 2026 09:08:46 +0000
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 09/12] media: ipu6: Add IPU4P ISYS ISR handling
Message-ID: <w0W-21CiPaJVwN-cDqufcdBdL0Gd6wGXmBbkraZqbbSQj6srKI55cmfYsvg2q1h485sIc7cwFpS973UhDBbK4X_GnUI-ormcR_hJnRMhd8c=@proton.me>
In-Reply-To: <asy2X7Xz8uMTbXrn@kekkonen.localdomain>
References: <IjwPOnBdNsWTsYf7NDlmfUuA5tZHup4NghQDillGZMDTGjBqLo-kW3mUX-FSA71Gh_ZxtpS9hiyzBMGt3lqRWKsAn7ecN6zMmvSOTGqJpsA=@proton.me> <asy2X7Xz8uMTbXrn@kekkonen.localdomain>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 6b81c0f04d9974947444f1d40bf2621ecf1119bf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Monday, October 12th, 2026 at 12:29 PM, sakari.ailus@linux.intel.com <sa=
kari.ailus@linux.intel.com> wrote:

> Hi Ruslan,
>=20
> On Sun, Oct 11, 2026 at 02:41:16PM +0000, Ruslan Bay wrote:
> > Handle IPU4P ISYS software and CSI interrupts and dispatch firmware
> > responses and CSI receiver errors to the appropriate handlers.
> >
> > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 90 +++++++++++++++++++
> >  .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     | 38 ++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 74 +++++++++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  2 +
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 14 ++-
> >  drivers/media/pci/intel/ipu6/ipu6.c           |  1 +
> >  6 files changed, 217 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/med=
ia/pci/intel/ipu6/ipu4p-fw-isys.c
> > index dfab6e570e51..6fbbe6376ef7 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
> > @@ -4,8 +4,10 @@
> >   */
> >
> >  #include <linux/cacheflush.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > +#include <linux/io.h>
> >  #include <linux/slab.h>
> >
> >  #include "ipu6.h"
> > @@ -17,6 +19,7 @@
> >  #include "ipu6-isys-video.h"
> >  #include "ipu6-platform-regs.h"
> >  #include "ipu4p-fw-isys.h"
> > +#include "ipu4p-isys-csi2-regs.h"
> >
> >  static void start_sp(struct ipu6_bus_device *adev)
> >  {
> > @@ -596,3 +599,90 @@ const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops =
=3D {
> >  =09.dump_stream_cfg =3D ipu4p_dump_stream_cfg,
> >  =09.dump_frame_buf_set =3D ipu4p_dump_frame_buf_set,
> >  };
> > +
> > +void ipu4p_isys_irq_setup(struct ipu6_isys *isys)
> > +{
> > +=09static const u32 irq_offsets[] =3D {
> > +=09=090x00, IPU4P_ISYS_IRQ_MASK_OFFSET,
> > +=09=09IPU4P_ISYS_IRQ_ENABLE_OFFSET,
> > +=09=09IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET,
> > +=09};
> > +=09const u32 isys_irq_mask =3D IPU4P_ISYS_UNISPART_IRQ_SW |
> > +=09=09IPU4P_ISYS_UNISPART_IRQ_CSI2(0) |
> > +=09=09IPU4P_ISYS_UNISPART_IRQ_CSI2(1);
> > +=09const struct {
>=20
> static const for all these?
>=20

Agree, I'll fix this in the next version of the patchset.

> > +=09=09u32 base;
> > +=09=09u32 mask;
> > +=09} irq_config[] =3D {
> > +=09=09{ IPU4P_ISYS_UNISPART_IRQ_EDGE, isys_irq_mask },
> > +=09=09{ IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE, 0 },
> > +=09=09{ IPU4P_ISYS_A_IRQ_CTRL_BASE, 0 },
> > +=09=09{ IPU4P_ISYS_SIP0_IRQ_CTRL_BASE, IPU4P_ISYS_SIP0_CSI2_IRQ },
> > +=09=09{ IPU4P_ISYS_SIP1_IRQ_CTRL_BASE, IPU4P_ISYS_SIP1_CSI2_IRQ_MASK }=
,
> > +=09};
> > +=09void __iomem *base =3D isys->pdata->base;
> > +
> > +=09for (unsigned int i =3D 0; i < ARRAY_SIZE(irq_config); i++) {
> > +=09=09for (unsigned int j =3D 0; j < ARRAY_SIZE(irq_offsets); j++)
> > +=09=09=09writel(irq_config[i].mask,
> > +=09=09=09       base + irq_config[i].base + irq_offsets[j]);
> > +
> > +=09=09writel(0xffffffff,
> > +=09=09       base + irq_config[i].base + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
> > +=09}
> > +
> > +=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
> > +=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG);
> > +}
> > +
> > +irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev)
> > +{
> > +=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
> > +=09void __iomem *base =3D isys->pdata->base;
> > +=09u32 status, sip0_status, sip1_status;
> > +
> > +=09guard(spinlock)(&isys->power_lock);
>=20
> Note that the power_lock went away recently. Please rebase.
>=20

Thanks! I'll base the next version of the patchset
on top of the media-committers.git tree.

> > +
> > +=09if (!isys->power)
> > +=09=09return IRQ_NONE;
> > +
> > +=09status =3D readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
> > +=09sip0_status =3D readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
> > +=09sip1_status =3D readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
> > +=09if (!status && !sip0_status && !sip1_status)
> > +=09=09return IRQ_NONE;
> > +
> > +=09do {
> > +=09=09writel(status, base + IPU4P_ISYS_UNISPART_IRQ_CLEAR);
> > +
> > +=09=09writel(sip0_status, base + IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR);
> > +=09=09writel(sip1_status, base + IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR);
> > +
> > +=09=09for (unsigned int i =3D 0;
> > +=09=09     i < isys->pdata->ipdata->csi2.nports; i++) {
> > +=09=09=09bool port_irq =3D i ?
> > +=09=09=09=09(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ(i)) :
> > +=09=09=09=09(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ);
> > +
> > +=09=09=09if (port_irq && isys->csi2[i].base)
> > +=09=09=09=09ipu4p_isys_csi2_isr(&isys->csi2[i]);
> > +=09=09}
> > +
> > +=09=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
> > +
> > +=09=09if ((status & IPU4P_ISYS_UNISPART_IRQ_SW) &&
> > +=09=09    !adev->auxdrv_data->fw_ops->isr_one(adev))
> > +=09=09=09status =3D IPU4P_ISYS_UNISPART_IRQ_SW;
> > +=09=09else
> > +=09=09=09status =3D 0;
> > +
> > +=09=09status |=3D readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
> > +=09=09sip0_status =3D readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
> > +=09=09sip1_status =3D readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
> > +=09} while ((status & (isys->isr_csi2_bits |
> > +=09=09=09    IPU4P_ISYS_UNISPART_IRQ_SW)) ||
> > +=09=09 (sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ) ||
> > +=09=09 (sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK));
> > +
> > +=09return IRQ_HANDLED;
> > +}
> > diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/driv=
ers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> > index 7f41bdb4150a..1e1423869e21 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
> > @@ -4,6 +4,44 @@
> >
> >  #include <linux/bits.h>
> >
> > +/* ISYS UNISPART and SIP interrupt registers */
> > +#define IPU4P_ISYS_UNISPART_IRQ_EDGE=09=09=090x7c000
> > +#define IPU4P_ISYS_UNISPART_IRQ_STATUS=09=09=090x7c008
> > +#define IPU4P_ISYS_UNISPART_IRQ_CLEAR=09=09=090x7c00c
> > +#define IPU4P_ISYS_UNISPART_SW_IRQ_REG=09=09=090x7c414
> > +#define IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG=09=090x7c418
> > +#define IPU4P_ISYS_UNISPART_IRQ_SW=09=09=09BIT(22)
> > +#define IPU4P_ISYS_UNISPART_IRQ_CSI2(port)=09=09((port) ? BIT(4) : BIT=
(3))
> > +#define IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE=09=090xb0c00
> > +#define IPU4P_ISYS_A_IRQ_CTRL_BASE=09=09=090xbe200
> > +#define IPU4P_ISYS_SIP0_IRQ_CTRL_BASE=09=09=090x66d00
> > +#define IPU4P_ISYS_SIP1_IRQ_CTRL_BASE=09=09=090x6ed00
> > +#define IPU4P_ISYS_IRQ_MASK_OFFSET=09=09=090x04
> > +#define IPU4P_ISYS_IRQ_CLEAR_OFFSET=09=09=090x0c
> > +#define IPU4P_ISYS_IRQ_ENABLE_OFFSET=09=09=090x10
> > +#define IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET=09=090x14
> > +#define IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS=09=09=090x66d08
> > +#define IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR=09=09=090x66d0c
> > +#define IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS=09=09=090x6ed08
> > +#define IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR=09=09=090x6ed0c
> > +#define IPU4P_ISYS_SIP0_CSI2_IRQ=09=09=09BIT(3)
> > +#define IPU4P_ISYS_SIP1_CSI2_IRQ(port)=09=09=09BIT((port) - 1)
> > +#define IPU4P_ISYS_SIP1_CSI2_IRQ_MASK=09=09=09GENMASK(6, 0)
> > +
> > +/* ISYS per-port CSI interrupt controls */
> > +#define IPU4P_ISYS_CSI_IRQ_CTRL_BASE(port)=09=09\
> > +=09({ typeof(port) __port =3D (port); \
> > +=09   __port ? (0x6cb00 + 0x800 * (__port - 1)) : 0x66300; })
>=20
> You don't need this trickery to avoid a checkpatch.pl warning. Same
> elsewhere.
>=20

I'll simplify this.

> > +#define IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(port)=09=09\
> > +=09({ typeof(port) __port =3D (port); \
> > +=09   __port ? (0x6cc00 + 0x800 * (__port - 1)) : 0x66400; })
> > +#define IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET=09=090x08
> > +#define IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET=09=090x0c
> > +#define IPU4P_ISYS_CSI_IRQ_ACTIVE=09=09=09BIT(0)
> > +/* CSI-2 frame events occupy bits 16-31 in the shared ctrl0 status. */
> > +#define IPU4P_ISYS_CSI_ERROR_MASK=09=09=09GENMASK(15, 0)
> > +#define IPU4P_ISYS_CSI_ERROR_BITS=09=09=0916U
> > +
> >  /* CSI receiver registers */
> >  #define IPU4P_CSI2_RX_ENABLE=09=09=09=090x00
> >  #define IPU4P_CSI2_RX_ENABLE_ENABLE=09=09=09BIT(0)
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/me=
dia/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 9e87750269d0..ea3817ef8ac8 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -25,6 +25,7 @@
> >  #include "ipu4p-fw-isys.h"
> >  #include "ipu6-isys-subdev.h"
> >  #include "ipu6-platform-isys-csi2-reg.h"
> > +#include "ipu4p-isys-csi2-regs.h"
> >  #include "ipu7-isys-csi2-regs.h"
> >
> >  static const u32 csi2_supported_codes[] =3D {
> > @@ -83,6 +84,25 @@ static const struct ipu6_csi2_error dphy_rx_errors[]=
 =3D {
> >  =09{ "HSIDLE detected", false }
> >  };
> >
> > +static const struct ipu6_csi2_error ipu4p_csi2_errors[] =3D {
> > +=09{ "Single packet header error corrected", true },
> > +=09{ "Multiple packet header errors detected", true },
> > +=09{ "Payload checksum (CRC) error", true },
> > +=09{ "FIFO overflow", false },
> > +=09{ "Reserved short packet data type detected", true },
> > +=09{ "Reserved long packet data type detected", true },
> > +=09{ "Incomplete long packet detected", false },
> > +=09{ "Frame sync error", false },
> > +=09{ "Line sync error", false },
> > +=09{ "DPHY recoverable synchronization error", true },
> > +=09{ "DPHY non-recoverable synchronization error", false },
> > +=09{ "Escape mode error", true },
> > +=09{ "Escape mode trigger event", true },
> > +=09{ "Escape mode ultra-low power state for data lane(s)", true },
> > +=09{ "Escape mode ultra-low power state exit for clock lane", true },
> > +=09{ "Inter-frame short packet discarded", true },
> > +};
> > +
> >  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> >  {
> >  =09struct media_pad *src_pad;
> > @@ -210,6 +230,39 @@ void ipu6_isys_register_errors(struct ipu6_isys_cs=
i2 *csi2)
> >  =09csi2->receiver_errors |=3D irq & mask;
> >  }
> >
> > +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2)
> > +{
> > +=09void __iomem *base =3D csi2->isys->pdata->base;
> > +=09u32 offset =3D IPU4P_ISYS_CSI_IRQ_CTRL0_BASE(csi2->port);
> > +=09u32 status;
> > +
> > +=09status =3D readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
> > +=09writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
> > +=09csi2->receiver_errors |=3D status & IPU4P_ISYS_CSI_ERROR_MASK;
> > +}
> > +
> > +void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
> > +{
> > +=09void __iomem *base =3D csi2->isys->pdata->base;
> > +=09u32 offset =3D IPU4P_ISYS_CSI_IRQ_CTRL_BASE(csi2->port);
> > +=09u32 status;
> > +
> > +=09status =3D readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
> > +=09writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
> > +=09if (!(status & IPU4P_ISYS_CSI_IRQ_ACTIVE))
> > +=09=09return;
> > +
> > +=09/*
> > +=09 * Frame SOF/EOF notifications are delivered by IPU4P firmware.
> > +=09 * Do not also report the CSI frame-event interrupts here, as that
> > +=09 * would account every frame twice and corrupt vb2 sequence numbers=
.
> > +=09 *
> > +=09 * Keep the CSI IRQ path for receiver error collection; errors are
> > +=09 * consumed by ipu6_isys_csi2_error() when a firmware response arri=
ves.
> > +=09 */
> > +=09ipu4p_isys_register_errors(csi2);
> > +}
> > +
> >  void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
> >  {
> >  =09struct device *dev =3D &csi2->isys->adev->auxdev.dev;
> > @@ -217,6 +270,27 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *c=
si2)
> >  =09u32 status;
> >  =09u32 i;
> >
> > +=09if (IS_IPU4P(csi2->isys->adev->isp)) {
> > +=09=09ipu4p_isys_register_errors(csi2);
> > +=09=09status =3D csi2->receiver_errors;
> > +=09=09csi2->receiver_errors =3D 0;
> > +
> > +=09=09for (i =3D 0; i < IPU4P_ISYS_CSI_ERROR_BITS; i++) {
> > +=09=09=09if (!(status & BIT(i)))
> > +=09=09=09=09continue;
> > +
> > +=09=09=09if (ipu4p_csi2_errors[i].is_info_only)
> > +=09=09=09=09dev_dbg(dev, "csi2-%i info: %s\n", csi2->port,
> > +=09=09=09=09=09ipu4p_csi2_errors[i].error_string);
> > +=09=09=09else
> > +=09=09=09=09dev_err_ratelimited(dev, "csi2-%i error: %s\n",
> > +=09=09=09=09=09=09    csi2->port,
> > +=09=09=09=09=09=09    ipu4p_csi2_errors[i].error_string);
> > +=09=09}
> > +
> > +=09=09return;
> > +=09}
> > +
> >  =09/* register errors once more in case of interrupts are disabled */
> >  =09ipu6_isys_register_errors(csi2);
> >  =09status =3D csi2->receiver_errors;
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/me=
dia/pci/intel/ipu6/ipu6-isys-csi2.h
> > index dbaaf00af623..b3eb702f1996 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> > @@ -75,6 +75,8 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_i=
sys_stream *stream);
> >  void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *strea=
m);
> >  void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
> >  void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
> > +void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2);
> > +void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2);
> >  int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
> >  =09=09=09=09   struct ipu6_isys_csi2 *csi2,
> >  =09=09=09=09   struct media_entity *source_entity,
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/p=
ci/intel/ipu6/ipu6-isys.c
> > index 1f9809d1b138..6d10a427b4b6 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > @@ -41,6 +41,7 @@
> >  #include "ipu6-platform-buttress-regs.h"
> >  #include "ipu6-platform-isys-csi2-reg.h"
> >  #include "ipu6-platform-regs.h"
> > +#include "ipu4p-isys-csi2-regs.h"
> >  #include "ipu7-isys-csi-phy.h"
> >  #include "ipu7-isys-csi2-regs.h"
> >  #include "ipu7-platform-regs.h"
> > @@ -202,6 +203,10 @@ static void isys_csi2_unregister_subdevices(struct=
 ipu6_isys *isys)
> >
> >  static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
> >  {
> > +=09static const u32 ipu4p_port_offsets[IPU4P_ISYS_CSI2_NPORTS] =3D {
> > +=09=090x64300, 0x6c000, 0x6c100, 0x6c200,
> > +=09=090x6c300, 0x6c400, 0x6c500, 0x6c600,
> > +=09};
> >  =09const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =3D
> >  =09=09&isys->pdata->ipdata->csi2;
> >  =09unsigned int i;
> > @@ -217,6 +222,9 @@ static int isys_csi2_register_subdevices(struct ipu=
6_isys *isys)
> >
> >  =09=09=09isys->isr_csi2_bits |=3D mask;
> >  =09=09=09isys->csi2[i].legacy_irq_mask =3D mask;
> > +=09=09} else if (IS_IPU4P(isys->adev->isp)) {
> > +=09=09=09base +=3D ipu4p_port_offsets[i];
> > +=09=09=09isys->isr_csi2_bits |=3D IPU4P_ISYS_UNISPART_IRQ_CSI2(i);
> >  =09=09} else {
> >  =09=09=09base +=3D CSI_REG_PORT_BASE(i);
> >  =09=09=09isys->isr_csi2_bits |=3D IPU6_ISYS_UNISPART_IRQ_CSI2(i);
> > @@ -892,6 +900,8 @@ static int isys_runtime_pm_resume(struct device *de=
v)
> >
> >  =09if (IS_IPU7(isp)) {
> >  =09=09ipu7_isys_setup_hw(isys);
> > +=09} else if (IS_IPU4P(isp)) {
> > +=09=09ipu4p_isys_irq_setup(isys);
> >  =09} else {
> >  =09=09ipu6_isys_setup_hw(isys);
> >  =09=09set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
> > @@ -918,7 +928,7 @@ static int isys_runtime_pm_suspend(struct device *d=
ev)
> >  =09isys->phy_termcal_val =3D 0;
> >  =09cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE)=
;
> >
> > -=09if (!IS_IPU7(isp))
> > +=09if (!IS_IPU7(isp) && !IS_IPU4P(isp))
>=20
> I think we should add IS_IPU6() macro that matches with all IPU6s.
>=20
> >  =09=09set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
> >
> >  =09ipu6_mmu_hw_cleanup(adev->mmu);
> > @@ -1177,7 +1187,7 @@ static const struct ipu6_auxdrv_data ipu6_isys_au=
xdrv_data =3D {
> >  };
> >
> >  static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data =3D {
> > -=09.isr =3D ipu6_isys_isr,
>=20
> I don't think this should have been added in the first place by the earli=
er
> patches. As you don't have the IPU4* PCI IDs listed for the driver yet,
> this won't end up used yet in any case.
>=20

Will fix in the next patchset.

> > +=09.isr =3D ipu4p_isys_isr,
> >  =09.isr_threaded =3D NULL,
> >  =09.wake_isr_thread =3D false,
> >  =09.fw_ops =3D &ipu4p_fw_isys_ops,
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/in=
tel/ipu6/ipu6.c
> > index 417978bef3f7..3ebf2ff76200 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> > @@ -399,6 +399,7 @@ static void ipu6_internal_pdata_init(struct ipu6_de=
vice *isp)
> >  =09}
> >
> >  =09if (IS_IPU4P(isp)) {
> > +=09=09isys_ipdata.csi2.nports =3D IPU4P_ISYS_CSI2_NPORTS;
> >  =09=09isys_ipdata.num_parallel_streams =3D IPU4P_ISYS_MAX_STREAMS;
> >  =09=09isys_ipdata.max_streams =3D IPU4P_ISYS_MAX_STREAMS;
> >  =09=09isys_ipdata.sram_gran_shift =3D IPU4P_SRAM_GRANULARITY_SHIFT;
>=20
> --
> Regards,
>=20
> Sakari Ailus
> 
