Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450235;
	b=fu2hDz0UdxZ2TGHBxt4yyPN1r58ZCFx0ZFt+wAxiTrFqRbyUA/WifG1/ykrM7AX4VLlL
	 1pWS7ASHpJKU8nsGWOsqVxmv7e7GF1YzAzb8lQZMkd2CM7G2tXerlylXb4hcCEHNJIcNg
	 5AxNHCzN9cbnbjuFQ1gXmlfBMbyVuzmNwmbuDrCoqfTOZmPDegBwOrbhvvJ1S1/ChAfDD
	 J+wmElxpmGqOAkBkH3UTHZzTHj6IcHChOdL2bHbpw87nPDkioLKNUBKkJDyDe+WwS3t5z
	 sCoKTSXHB2AHjUb9pzpexuMtZaJDFeAxb6kyvqmeFoorTG6YUG0Z07eDiNS5xDbqZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450235;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eN4RE3/m1h3mgVmBBk7jObzbiQECQCiTMIyu3w3jzDE=;
	b=Oq/hSrzSH1uAP3Jk5lfBdQyfeVtgU7fHbOKnBHC1SYPJxUIP7DUcqHQBwZXC1VWn0Mfy
	 Q5lnpdeBjlxq0btoNzwvilJ9zvdgI6rpY/cMZ4AclTVrdz0rLhUJvq6E6FCC+6cxg3DA3
	 ucerokUgDCYiRkQZaOXEizbfoOhhHFuTFYUA3pn0SqXCj8VpUapUZ+wZcMrnWHn4wBdW4
	 zJxRV313ZGeQ33pINsb+oK1X3w7j1Zi2/leAsw9zpK9YLf+oI7FDbjdmDm+pxs/Eb+1eg
	 kujr8anLxdp/sHvWDiJRhVlra6fMWu1yj1jLAjC9NhD2ezHVTNBhZPbLg3gU294x4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=BJ68Yavj;
	arc=none smtp.remote-ip=109.224.244.28
Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCAF606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=BJ68Yavj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450232; x=1793709432;
	bh=eN4RE3/m1h3mgVmBBk7jObzbiQECQCiTMIyu3w3jzDE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BJ68YavjZ8BeGcToNdIEVR4Ucb0+qBrULLWdBHyof+G1ymgWG+8H61wACOfxteqU4
	 muEuS6L1zphydFvRn6R+9vq8p1Q7VwiBsMUqIduTl+wH3Ye1S0D2jPvfYGtz4L/sWd
	 K1k1wTg5bFjrRpyZD7XiGuDXceH3Xfp4PlqUnllvCumV0Pl/cdcML7PXMVXMwBofqv
	 wKrTOO9jteBPJyw5vJHYpVc7QUNW6vM+fd7m/MGdRZ87Mk58IQzcymJKUJUN1hhbia
	 KXnRSLMJPqz6/4USdaYJStyK8OwyFj4ho1JGp9koEv+XAc8JSxX4s3hUxGpnQQCDL3
	 wMQILHY2jf3AA==
Date: Sat, 31 Oct 2026 12:37:06 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 09/12] media: ipu6: Add IPU4P ISYS ISR handling
Message-ID: <jOEzBw2ECU9AA_KzYm_zUSZQxW7zz8tdnehLqJjbfgdIUcEzq887D0k-YktMFFcVrXH54foWpSzUPcjmK1nSbSDN03m_8wUh_xTBrhNXJ4w=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 584d370fb18897810a84882ed9d06e61e54a1b6d
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
Content-Transfer-Encoding: quoted-printable

Handle IPU4P ISYS software and CSI interrupts, dispatch firmware
responses, and report CSI receiver errors through the common ISYS code.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c  | 116 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h  |   1 +
 .../pci/intel/ipu6/ipu4p-isys-csi2-regs.h     |  43 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  74 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   2 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  14 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   3 +
 drivers/media/pci/intel/ipu6/ipu6.c           |   1 +
 8 files changed, 252 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.c
index 2c0b08ecaf8..b82053f1545 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/minmax.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -25,6 +26,7 @@
 #include "ipu6-isys-queue.h"
 #include "ipu6-isys-subdev.h"
 #include "ipu4p-fw-isys.h"
+#include "ipu4p-isys-csi2-regs.h"
 #include "ipu6-platform-regs.h"
=20
 static const char send_msg_types[N_IPU4P_FW_ISYS_SEND_TYPE][32] =3D {
@@ -878,3 +880,117 @@ const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops =3D {
 =09.dump_stream_cfg =3D ipu4p_fw_isys_dump_stream_cfg,
 =09.dump_frame_buf_set =3D ipu4p_fw_isys_dump_frame_buf_set,
 };
+
+void ipu4p_isys_irq_setup(struct ipu6_isys *isys)
+{
+=09static const struct {
+=09=09u32 base;
+=09=09u32 mask;
+=09} irq_config[] =3D {
+=09=09{ IPU4P_ISYS_UNISPART_IRQ_EDGE,
+=09=09  IPU4P_ISYS_UNISPART_IRQ_SW |
+=09=09  IPU4P_ISYS_UNISPART_IRQ_CSI2(0) |
+=09=09  IPU4P_ISYS_UNISPART_IRQ_CSI2(1) },
+=09=09{ IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE, 0 },
+=09=09{ IPU4P_ISYS_A_IRQ_CTRL_BASE, 0 },
+=09=09{ IPU4P_ISYS_SIP0_IRQ_CTRL_BASE, IPU4P_ISYS_SIP0_CSI2_IRQ },
+=09=09{ IPU4P_ISYS_SIP1_IRQ_CTRL_BASE, IPU4P_ISYS_SIP1_CSI2_IRQ_MASK },
+=09};
+=09void __iomem *base =3D isys->pdata->base;
+=09unsigned int i;
+
+=09for (i =3D 0; i < ARRAY_SIZE(irq_config); i++) {
+=09=09const u32 irq_base =3D irq_config[i].base;
+
+=09=09writel(0, base + irq_base + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+=09=09writel(0, base + irq_base + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09}
+
+=09for (i =3D 0; i < ARRAY_SIZE(irq_config); i++) {
+=09=09const u32 irq_base =3D irq_config[i].base;
+=09=09const u32 mask =3D irq_config[i].mask;
+
+=09=09writel(mask, base + irq_base);
+=09=09writel(mask, base + irq_base +
+=09=09       IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET);
+=09=09writel(0xffffffff,
+=09=09       base + irq_base + IPU4P_ISYS_IRQ_CLEAR_OFFSET);
+=09}
+
+=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
+=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG);
+
+=09/* Keep the top-level source disabled until its child controllers are r=
eady. */
+=09for (i =3D ARRAY_SIZE(irq_config); i > 0; i--) {
+=09=09const u32 irq_base =3D irq_config[i - 1].base;
+=09=09const u32 mask =3D irq_config[i - 1].mask;
+
+=09=09writel(mask, base + irq_base + IPU4P_ISYS_IRQ_MASK_OFFSET);
+=09=09writel(mask, base + irq_base + IPU4P_ISYS_IRQ_ENABLE_OFFSET);
+=09}
+}
+
+irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09void __iomem *base =3D isys->pdata->base;
+=09u32 status, sip0_status, sip1_status;
+=09int pm_status;
+=09irqreturn_t ret =3D IRQ_HANDLED;
+
+=09pm_status =3D pm_runtime_get_if_active(&adev->auxdev.dev);
+=09if (!pm_status)
+=09=09return IRQ_NONE;
+
+=09status =3D readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
+=09sip0_status =3D readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
+=09sip1_status =3D readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
+
+=09if (!(status & (isys->isr_csi2_bits | IPU4P_ISYS_UNISPART_IRQ_SW)) &&
+=09    !(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ) &&
+=09    !(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK)) {
+=09=09ret =3D IRQ_NONE;
+=09=09goto out;
+=09}
+
+=09do {
+=09=09writel(status & (isys->isr_csi2_bits |
+=09=09=09=09IPU4P_ISYS_UNISPART_IRQ_SW),
+=09=09       base + IPU4P_ISYS_UNISPART_IRQ_CLEAR);
+=09=09writel(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ,
+=09=09       base + IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR);
+=09=09writel(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK,
+=09=09       base + IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR);
+
+=09=09for (unsigned int i =3D 0;
+=09=09     i < isys->pdata->ipdata->csi2.nports; i++) {
+=09=09=09bool port_irq =3D i ?
+=09=09=09=09(sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ(i)) :
+=09=09=09=09(sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ);
+
+=09=09=09if (port_irq && isys->csi2[i].base)
+=09=09=09=09ipu4p_isys_csi2_isr(&isys->csi2[i]);
+=09=09}
+
+=09=09writel(0, base + IPU4P_ISYS_UNISPART_SW_IRQ_REG);
+
+=09=09if ((status & IPU4P_ISYS_UNISPART_IRQ_SW) &&
+=09=09    !adev->auxdrv_data->fw_ops->isr_one(adev))
+=09=09=09status =3D IPU4P_ISYS_UNISPART_IRQ_SW;
+=09=09else
+=09=09=09status =3D 0;
+
+=09=09status |=3D readl(base + IPU4P_ISYS_UNISPART_IRQ_STATUS);
+=09=09sip0_status =3D readl(base + IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS);
+=09=09sip1_status =3D readl(base + IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS);
+=09} while ((status & (isys->isr_csi2_bits |
+=09=09=09    IPU4P_ISYS_UNISPART_IRQ_SW)) ||
+=09=09 (sip0_status & IPU4P_ISYS_SIP0_CSI2_IRQ) ||
+=09=09 (sip1_status & IPU4P_ISYS_SIP1_CSI2_IRQ_MASK));
+
+out:
+=09if (pm_status > 0)
+=09=09pm_runtime_put(&adev->auxdev.dev);
+
+=09return ret;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.h
index 15a5dc7c938..416a877a1c8 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
=20
 #define IPU4P_ISYS_MAX_STREAMS=09=09=098U
+#define IPU4P_ISYS_CSI2_NPORTS=09=09=098U
 #define IPU4P_MAX_IPINS=09=09=09=094U
 #define IPU4P_MAX_OPINS=09=09=09=096U
 #define IPU4P_NOF_SRAM_BLOCKS_MAX=09=098U
diff --git a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h b/drivers/=
media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
index 7f41bdb4150..4e2f31048ff 100644
--- a/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu4p-isys-csi2-regs.h
@@ -3,6 +3,49 @@
 #define IPU4P_ISYS_CSI2_REGS_H
=20
 #include <linux/bits.h>
+#include <linux/types.h>
+
+/* ISYS UNISPART and SIP interrupt registers */
+#define IPU4P_ISYS_UNISPART_IRQ_EDGE=09=09=090x7c000
+#define IPU4P_ISYS_UNISPART_IRQ_STATUS=09=09=090x7c008
+#define IPU4P_ISYS_UNISPART_IRQ_CLEAR=09=09=090x7c00c
+#define IPU4P_ISYS_UNISPART_SW_IRQ_REG=09=09=090x7c414
+#define IPU4P_ISYS_UNISPART_SW_IRQ_MUX_REG=09=090x7c418
+#define IPU4P_ISYS_UNISPART_IRQ_SW=09=09=09BIT(22)
+#define IPU4P_ISYS_UNISPART_IRQ_CSI2(port)=09=09((port) ? BIT(4) : BIT(3))
+#define IPU4P_ISYS_ISA_ACC_IRQ_CTRL_BASE=09=090xb0c00
+#define IPU4P_ISYS_A_IRQ_CTRL_BASE=09=09=090xbe200
+#define IPU4P_ISYS_SIP0_IRQ_CTRL_BASE=09=09=090x66d00
+#define IPU4P_ISYS_SIP1_IRQ_CTRL_BASE=09=09=090x6ed00
+#define IPU4P_ISYS_IRQ_MASK_OFFSET=09=09=090x04
+#define IPU4P_ISYS_IRQ_CLEAR_OFFSET=09=09=090x0c
+#define IPU4P_ISYS_IRQ_ENABLE_OFFSET=09=09=090x10
+#define IPU4P_ISYS_IRQ_LEVEL_NOT_PULSE_OFFSET=09=090x14
+#define IPU4P_ISYS_SIP0_IRQ_CTRL_STATUS=09=09=090x66d08
+#define IPU4P_ISYS_SIP0_IRQ_CTRL_CLEAR=09=09=090x66d0c
+#define IPU4P_ISYS_SIP1_IRQ_CTRL_STATUS=09=09=090x6ed08
+#define IPU4P_ISYS_SIP1_IRQ_CTRL_CLEAR=09=09=090x6ed0c
+#define IPU4P_ISYS_SIP0_CSI2_IRQ=09=09=09BIT(3)
+#define IPU4P_ISYS_SIP1_CSI2_IRQ(port)=09=09=09BIT((port) - 1)
+#define IPU4P_ISYS_SIP1_CSI2_IRQ_MASK=09=09=09GENMASK(6, 0)
+
+/* ISYS per-port CSI interrupt controls */
+static inline u32 ipu4p_isys_csi_irq_ctrl_base(unsigned int port)
+{
+=09return port ? (0x6cb00 + 0x800 * (port - 1)) : 0x66300;
+}
+
+static inline u32 ipu4p_isys_csi_irq_ctrl0_base(unsigned int port)
+{
+=09return port ? (0x6cc00 + 0x800 * (port - 1)) : 0x66400;
+}
+
+#define IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET=09=090x08
+#define IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET=09=090x0c
+#define IPU4P_ISYS_CSI_IRQ_ACTIVE=09=09=09BIT(0)
+/* CSI-2 frame events occupy bits 16-31 in the shared ctrl0 status. */
+#define IPU4P_ISYS_CSI_ERROR_MASK=09=09=09GENMASK(15, 0)
+#define IPU4P_ISYS_CSI_ERROR_BITS=09=09=0916U
=20
 /* CSI receiver registers */
 #define IPU4P_CSI2_RX_ENABLE=09=09=09=090x00
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index ea21ce9b814..b78e4b6af26 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -26,6 +26,7 @@
 #include "ipu6-bus.h"
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
+#include "ipu4p-isys-csi2-regs.h"
 #include "ipu6-isys-subdev.h"
 #include "ipu6-isys-video.h"
 #include "ipu6-platform-isys-csi2-reg.h"
@@ -87,6 +88,25 @@ static const struct ipu6_csi2_error dphy_rx_errors[] =3D=
 {
 =09{ "HSIDLE detected", false }
 };
=20
+static const struct ipu6_csi2_error ipu4p_csi2_errors[] =3D {
+=09{ "Single packet header error corrected", true },
+=09{ "Multiple packet header errors detected", true },
+=09{ "Payload checksum (CRC) error", true },
+=09{ "FIFO overflow", false },
+=09{ "Reserved short packet data type detected", true },
+=09{ "Reserved long packet data type detected", true },
+=09{ "Incomplete long packet detected", false },
+=09{ "Frame sync error", false },
+=09{ "Line sync error", false },
+=09{ "DPHY recoverable synchronization error", true },
+=09{ "DPHY non-recoverable synchronization error", false },
+=09{ "Escape mode error", true },
+=09{ "Escape mode trigger event", true },
+=09{ "Escape mode ultra-low power state for data lane(s)", true },
+=09{ "Escape mode ultra-low power state exit for clock lane", true },
+=09{ "Inter-frame short packet discarded", true },
+};
+
 s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 {
 =09struct media_pad *src_pad;
@@ -214,6 +234,39 @@ void ipu6_isys_register_errors(struct ipu6_isys_csi2 *=
csi2)
 =09csi2->receiver_errors |=3D irq & mask;
 }
=20
+void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2)
+{
+=09void __iomem *base =3D csi2->isys->pdata->base;
+=09u32 offset =3D ipu4p_isys_csi_irq_ctrl0_base(csi2->port);
+=09u32 status;
+
+=09status =3D readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
+=09writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
+=09csi2->receiver_errors |=3D status & IPU4P_ISYS_CSI_ERROR_MASK;
+}
+
+void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
+{
+=09void __iomem *base =3D csi2->isys->pdata->base;
+=09u32 offset =3D ipu4p_isys_csi_irq_ctrl_base(csi2->port);
+=09u32 status;
+
+=09status =3D readl(base + offset + IPU4P_ISYS_CSI_IRQ_STATUS_OFFSET);
+=09writel(status, base + offset + IPU4P_ISYS_CSI_IRQ_CLEAR_OFFSET);
+=09if (!(status & IPU4P_ISYS_CSI_IRQ_ACTIVE))
+=09=09return;
+
+=09/*
+=09 * Frame SOF/EOF notifications are delivered by IPU4P firmware.
+=09 * Do not also report the CSI frame-event interrupts here, as that
+=09 * would account every frame twice and corrupt vb2 sequence numbers.
+=09 *
+=09 * Keep the CSI IRQ path for receiver error collection; errors are
+=09 * consumed by ipu6_isys_csi2_error() when a firmware response arrives.
+=09 */
+=09ipu4p_isys_register_errors(csi2);
+}
+
 void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 {
 =09struct device *dev =3D &csi2->isys->adev->auxdev.dev;
@@ -221,6 +274,27 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 =09u32 status;
 =09u32 i;
=20
+=09if (IS_IPU4P(csi2->isys->adev->isp)) {
+=09=09ipu4p_isys_register_errors(csi2);
+=09=09status =3D csi2->receiver_errors;
+=09=09csi2->receiver_errors =3D 0;
+
+=09=09for (i =3D 0; i < IPU4P_ISYS_CSI_ERROR_BITS; i++) {
+=09=09=09if (!(status & BIT(i)))
+=09=09=09=09continue;
+
+=09=09=09if (ipu4p_csi2_errors[i].is_info_only)
+=09=09=09=09dev_dbg(dev, "csi2-%i info: %s\n", csi2->port,
+=09=09=09=09=09ipu4p_csi2_errors[i].error_string);
+=09=09=09else
+=09=09=09=09dev_err_ratelimited(dev, "csi2-%i error: %s\n",
+=09=09=09=09=09=09    csi2->port,
+=09=09=09=09=09=09    ipu4p_csi2_errors[i].error_string);
+=09=09}
+
+=09=09return;
+=09}
+
 =09/* register errors once more in case of interrupts are disabled */
 =09ipu6_isys_register_errors(csi2);
 =09status =3D csi2->receiver_errors;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.h
index 1620ac16f90..76c5d2cbbf9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -84,5 +84,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_=
stream *stream);
 void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
 void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
 void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
+void ipu4p_isys_register_errors(struct ipu6_isys_csi2 *csi2);
+void ipu4p_isys_csi2_isr(struct ipu6_isys_csi2 *csi2);
=20
 #endif /* IPU6_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.c
index 037eb0a52d4..12320ea2f49 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -41,6 +41,7 @@
 #include "ipu6-platform-buttress-regs.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 #include "ipu6-platform-regs.h"
+#include "ipu4p-isys-csi2-regs.h"
 #include "ipu7-isys-csi-phy.h"
 #include "ipu7-isys-csi2-regs.h"
 #include "ipu7-platform-regs.h"
@@ -201,6 +202,10 @@ static void isys_csi2_unregister_subdevices(struct ipu=
6_isys *isys)
=20
 static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
 {
+=09static const u32 ipu4p_port_offsets[IPU4P_ISYS_CSI2_NPORTS] =3D {
+=09=090x64300, 0x6c000, 0x6c100, 0x6c200,
+=09=090x6c300, 0x6c400, 0x6c500, 0x6c600,
+=09};
 =09const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =3D
 =09=09&isys->pdata->ipdata->csi2;
 =09unsigned int i;
@@ -216,6 +221,9 @@ static int isys_csi2_register_subdevices(struct ipu6_is=
ys *isys)
=20
 =09=09=09isys->isr_csi2_bits |=3D mask;
 =09=09=09isys->csi2[i].legacy_irq_mask =3D mask;
+=09=09} else if (IS_IPU4P(isys->adev->isp)) {
+=09=09=09base +=3D ipu4p_port_offsets[i];
+=09=09=09isys->isr_csi2_bits |=3D IPU4P_ISYS_UNISPART_IRQ_CSI2(i);
 =09=09} else {
 =09=09=09base +=3D CSI_REG_PORT_BASE(i);
 =09=09=09isys->isr_csi2_bits |=3D IPU6_ISYS_UNISPART_IRQ_CSI2(i);
@@ -823,7 +831,9 @@ static int isys_runtime_pm_resume(struct device *dev)
=20
 =09if (IS_IPU7(isp) || IS_IPU8(isp))
 =09=09ipu7_isys_setup_hw(isys);
-=09else if (!IS_IPU4P(isp))
+=09else if (IS_IPU4P(isp))
+=09=09ipu4p_isys_irq_setup(isys);
+=09else
 =09=09ipu6_isys_setup_hw(isys);
=20
 =09if (!IS_IPU7(isp) && !IS_IPU8(isp))
@@ -1127,7 +1137,7 @@ static void isys_remove(struct auxiliary_device *auxd=
ev)
 }
=20
 static const struct ipu6_auxdrv_data ipu4p_isys_auxdrv_data =3D {
-=09.isr =3D NULL,
+=09.isr =3D ipu4p_isys_isr,
 =09.isr_threaded =3D NULL,
 =09.wake_isr_thread =3D false,
 =09.fw_ops =3D &ipu4p_fw_isys_ops,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index 9f521fefef4..c15de43dccc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -247,4 +247,7 @@ int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys,
 =09=09=09=09struct ipu6_isys_csi2_config *cfg,
 =09=09=09=09const struct ipu6_isys_csi2_timing *timing,
 =09=09=09=09bool on);
+void ipu4p_isys_irq_setup(struct ipu6_isys *isys);
+irqreturn_t ipu4p_isys_isr(struct ipu6_bus_device *adev);
+
 #endif /* IPU6_ISYS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/=
ipu6/ipu6.c
index 10827ababfd..2e79b4a0078 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -370,6 +370,7 @@ static void ipu6_internal_pdata_init(struct ipu6_device=
 *isp)
 =09isys_ipdata.csi2.fw_access_port_ofs =3D CSI_REG_HUB_FW_ACCESS_PORT_OFS;
=20
 =09if (IS_IPU4P(isp)) {
+=09=09isys_ipdata.csi2.nports =3D IPU4P_ISYS_CSI2_NPORTS;
 =09=09isys_ipdata.num_parallel_streams =3D IPU4P_ISYS_MAX_STREAMS;
 =09=09isys_ipdata.max_streams =3D IPU4P_ISYS_MAX_STREAMS;
 =09=09isys_ipdata.sram_gran_shift =3D IPU4P_SRAM_GRANULARITY_SHIFT;
--=20
2.56.0


