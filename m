Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450027;
	b=I582vU8z9Ssp8vApZjPzhNAKP53Tfa1f/XtyL7hsghsim/bDXuYdGbndXgK0QjrFyeLX
	 s/Gzbjj4yY3TFkPvQC1nVQODlJtL9J6YJUMGuYvo8pM7ElzCuiJPzn2PVuxHot4CJp+5a
	 rQOdHBUsmGKGVwksR4Ce0ACs1UpB/oGgTBZ6xDHxK0dvMtZubjOZzJk/L6Ev/A7Mp52iH
	 m3/6Lp9EGcPKJ5XhY1vmL91gG1h2//qZoqU9QMrI32VZjklS8kgp+01Lv7CupYWIVFZss
	 Hd6SV9nW+BWBd2KHtgQTuFcFEmEKyax60PHL747OliAdKfg3m3o8bkWazhaZxWboTog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450027;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gsFbRadoKrkTlBY8sbE/fAKh1z1QR7W31Gsgi8c1nhU=;
	b=T90Q1M46q7JKyLWdcUGsPV87/2OIziKqnwAHaEvYNXf8sEx+QMsZkUGUi6co+1ETfO8p
	 KA9VUgdToB0WioGLlQcvwANNH6+3moYbKE6bzqWuW99HxBd4qXSHdKYOpR8e1Kz/XHuCb
	 wc/jI0jlMjdkpp/s//JoyndMGnM5YLTlhGrAJLfjFbd7pPaYHlcXS4UowvLPGSKzIEz6v
	 ZIkGpzkLHDE1+C389U0kHJnxE1YGeN3pI3sioNamajopRBAGtcXY7meerRZ03a638iyOE
	 3j9QUPuc8aMpCtSRE5UDJyBKJbKSBL6NOrogg9zPX3Ysq/F9Yg0Nrl205K7AfaOOOpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jdjJ5Fwz;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86D606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF86D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jdjJ5Fwz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450023; x=1793709223;
	bh=gsFbRadoKrkTlBY8sbE/fAKh1z1QR7W31Gsgi8c1nhU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jdjJ5FwzVlodafdtflustvd8AqbjL38M062Dl9dZ6RkaLzRR+teslP41ZrNwbLnAf
	 UvKGrgZcqAzSvEesUczGgqUlGRzENWtlXkEcwYeN3jApUPxwlFPPYJOWaxawazR0m2
	 E1bMgFYFBUW8kHl/05Lg5KNu08d/M44KKiJLOrLjFg0ENj4sOCd9xMXryWOQovJ2yB
	 0aayfi2iBT/BylHbj1KqUQyCzkt9VNhGv+ZIjkqw7zBSsQpOhjfBM5keva+Eu8gOV6
	 2ebZQNWgfPMSOuAnjTgxQcPB+SWeAOb9ucmqrJya2P9DRcaBoez9d8EPA0ksJBQFdX
	 OVJcEQb5SiSjA==
Date: Sat, 31 Oct 2026 12:33:37 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 05/12] media: ipu6: Support DMEM-based SysCom in ipu6-fw-com
Message-ID: <jUdugxrdRdjEf-_lonYLmWWCkan5e4Hfw4LvQ9PpUUUUO_AfsiEgeflzPyJKmgHqHlKaTZLR34WY88THVl5v4TSRDNkjmuECXD0szLi5p3I=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: bd39dcf567811d568ec2815d91f14a2695315cb3
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

IPU4P uses DMEM for SysCom control registers instead of the buttress
boot-parameter area used by IPU6.

Handle the IPU4P register layout during queue setup and firmware
initialization, shutdown and readiness checks.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 48 ++++++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  3 ++
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci=
/intel/ipu6/ipu6-fw-com.c
index 51567c5fc13..fc2fe6f3f3f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
@@ -97,6 +97,7 @@ struct ipu6_fw_com_context {
=20
 =09unsigned int buttress_boot_offset;
 =09void __iomem *base_addr;
+=09bool dmem_syscom;
 };
=20
 #define FW_COM_WR_REG 0
@@ -105,6 +106,14 @@ struct ipu6_fw_com_context {
 #define REGMEM_OFFSET 0
 #define TUNIT_MAGIC_PATTERN 0x5a5a5a5a
=20
+enum ipu4p_regmem_id {
+=09IPU4P_SYSCOM_CONFIG_REG =3D 1,
+=09IPU4P_SYSCOM_STATE_REG =3D 2,
+=09IPU4P_SYSCOM_COMMAND_REG =3D 3,
+=09/* Registers 6-7 reserved by ISYS firmware for dual contexts. */
+=09IPU4P_SYSCOM_QPR_BASE_REG =3D 8,
+};
+
 enum regmem_id {
 =09/* pass pkg_dir address to SPC in non-secure mode */
 =09PKG_DIR_ADDR_REG =3D 0,
@@ -179,6 +188,7 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 =09ctx->cell_ready =3D cfg->cell_ready;
 =09ctx->buttress_boot_offset =3D cfg->buttress_boot_offset;
 =09ctx->base_addr  =3D base;
+=09ctx->dmem_syscom =3D cfg->dmem_syscom;
=20
 =09/*
 =09 * Allocate DMA mapped memory. Allocate one big chunk.
@@ -241,7 +251,8 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
=20
 =09/* initialize input queues */
 =09offset +=3D specific_size;
-=09res.reg =3D SYSCOM_QPR_BASE_REG;
+=09res.reg =3D ctx->dmem_syscom ? IPU4P_SYSCOM_QPR_BASE_REG :
+=09=09=09=09     SYSCOM_QPR_BASE_REG;
 =09res.host_address =3D (uintptr_t)(ctx->dma_buffer + offset);
 =09res.vied_address =3D ctx->dma_addr + offset;
 =09for (i =3D 0; i < cfg->num_input_queues; i++)
@@ -265,6 +276,21 @@ EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_prepare, "INTEL_IPU6"=
);
=20
 int ipu6_fw_com_open(struct ipu6_fw_com_context *ctx)
 {
+=09if (ctx->dmem_syscom) {
+=09=09if (!ctx->cell_ready(ctx->adev))
+=09=09=09return -EIO;
+
+=09=09writel(SYSCOM_STATE_UNINIT,
+=09=09       ctx->dmem_addr + IPU4P_SYSCOM_STATE_REG * 4);
+=09=09writel(SYSCOM_COMMAND_UNINIT,
+=09=09       ctx->dmem_addr + IPU4P_SYSCOM_COMMAND_REG * 4);
+=09=09writel(ctx->config_vied_addr,
+=09=09       ctx->dmem_addr + IPU4P_SYSCOM_CONFIG_REG * 4);
+=09=09ctx->cell_start(ctx->adev);
+
+=09=09return 0;
+=09}
+
 =09/* write magic pattern to disable the tunit trace */
 =09writel(TUNIT_MAGIC_PATTERN, ctx->dmem_addr + TUNIT_CFG_DWR_REG * 4);
 =09/* Check if SP is in valid state */
@@ -295,6 +321,17 @@ int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx)
 {
 =09int state;
=20
+=09if (ctx->dmem_syscom) {
+=09=09state =3D readl(ctx->dmem_addr + IPU4P_SYSCOM_STATE_REG * 4);
+=09=09if (state !=3D SYSCOM_STATE_READY)
+=09=09=09return -EBUSY;
+
+=09=09writel(SYSCOM_COMMAND_INACTIVE,
+=09=09       ctx->dmem_addr + IPU4P_SYSCOM_COMMAND_REG * 4);
+
+=09=09return 0;
+=09}
+
 =09state =3D readl(BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
 =09=09=09=09=09=09 ctx->buttress_boot_offset,
 =09=09=09=09=09=09 SYSCOM_STATE_ID));
@@ -326,9 +363,12 @@ bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx=
)
 {
 =09int state;
=20
-=09state =3D readl(BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
-=09=09=09=09=09=09 ctx->buttress_boot_offset,
-=09=09=09=09=09=09 SYSCOM_STATE_ID));
+=09if (ctx->dmem_syscom)
+=09=09state =3D readl(ctx->dmem_addr + IPU4P_SYSCOM_STATE_REG * 4);
+=09else
+=09=09state =3D readl(BUTTRESS_FW_BOOT_PARAM_REG(ctx->base_addr,
+=09=09=09=09=09=09=09 ctx->buttress_boot_offset,
+=09=09=09=09=09=09=09 SYSCOM_STATE_ID));
=20
 =09return state =3D=3D SYSCOM_STATE_READY;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.h b/drivers/media/pci=
/intel/ipu6/ipu6-fw-com.h
index b02285a3e43..0323d8e4821 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
@@ -4,6 +4,8 @@
 #ifndef IPU6_FW_COM_H
 #define IPU6_FW_COM_H
=20
+#include <linux/types.h>
+
 struct ipu6_fw_com_context;
 struct ipu6_bus_device;
=20
@@ -29,6 +31,7 @@ struct ipu6_fw_com_cfg {
 =09void (*cell_start)(struct ipu6_bus_device *adev);
=20
 =09unsigned int buttress_boot_offset;
+=09bool dmem_syscom;
 };
=20
 void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
--=20
2.56.0


