Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A73B71D1
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729423; cv=none; b=HfX2SVLRC7hi2dAf8/cbii0cZiMpDmNDks1/YDAg5HQ7vgaz+aJn60/j7kgtk2kzmtNzUs1xNnF8lFat+9Epgu3Rdu9ATyg4+en5x/IKxl0spxIGhyhiMZKao8h84ivyqftoxL3clMOm4r1dDQT+J0KPwjPrRfuXtFAdi95+tTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729423; c=relaxed/simple;
	bh=se6fKeRhgXXcELW4RDZMsrYG17JUun+8tLaBFLla7vk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eMHQ6vCelGMLn0WnAye8GHUhQE96+IZO4OZIPWhlukR3ZDFXA/I4xJIcTfV5Hs2Gdy2ESPX81Il1ohp+6W04LQW05ZgrX+B9qIkxydT0fLR/veVGHDJxnExFEveMPspyDn2CB5QGqD7UPA7Z/PWbbicqA6OoTLwW3ve+51XXdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bbA61uFw; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bbA61uFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5udre3qyy5blbj4uczpsetrpfi.protonmail2; t=1791729410;
	x=1791988610; bh=nAbC89YIYioeHNTle/BEEPAY7+rybWu+m1Jk+hucJsg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bbA61uFwrccIJ3uQRFl7cuTd4/6zZyjEUVY49Po0lcCyFHPenCBoqITE6egPsRJtQ
	 1K4Q1HcMj4ipzei5WcckPRPSMxIinat/stVCHGi8bWAM5YpY0iEw7C1c0AitoOVWP7
	 w2fnglNtP++AlbwVK7+j0ZxFv6B/lyeZ14D2/j90JuWFB7Ue8fW4Pat9y4yo00QcvG
	 aF5IdSwXT7uXzom7CY/ymk/68x9PTq0376YVhjPaZzio4H+8i6uya5AvZX93asmoX5
	 e7BoyjeMeYGR2WIbq94NSr2Vbxoq5iLls0vTF5mYtD7sxrFWNqmJX80LQdCXOMia2y
	 qQttZ5uH30IiA==
Date: Sun, 11 Oct 2026 14:36:45 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 05/12] media: ipu6: Support DMEM-based SysCom in ipu6-fw-com
Message-ID: <D98zVcRARn0XXtZcVi6dXIENC8N8r72pzCQc66b1D5Uu9kzeCoRde-LXLTYyzf80C89KnvzmjnkM-VXs7CMkjOZivins9P1Vgly8l_ytmtE=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 71d54fa1a3224c7336d6c7ac175029f6ee554694
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Handle the IPU4P DMEM-based SysCom register layout and lifecycle in the
existing firmware communication layer.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 51 ++++++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h |  1 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci=
/intel/ipu6/ipu6-fw-com.c
index 51567c5fc139..e1bc047bdbdf 100644
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
@@ -118,6 +119,17 @@ enum regmem_id {
 =09SYSCOM_QPR_BASE_REG =3D 4
 };
=20
+enum ipu4p_regmem_id {
+=09IPU4P_PKG_DIR_ADDR_REG =3D 0,
+=09IPU4P_SYSCOM_CONFIG_REG =3D 1,
+=09IPU4P_SYSCOM_STATE_REG =3D 2,
+=09IPU4P_SYSCOM_COMMAND_REG =3D 3,
+=09IPU4P_SYSCOM_IRQ_REG =3D 4,
+=09IPU4P_SYSCOM_VTL0_ADDR_MASK =3D 5,
+=09/* CNL B0 ISYS firmware reserves registers 6-7 for dual contexts. */
+=09IPU4P_SYSCOM_QPR_BASE_REG =3D 8,
+};
+
 #define BUTTRESS_FW_BOOT_PARAMS_0 0x4000
 #define BUTTRESS_FW_BOOT_PARAM_REG(base, offset, id)=09=09=09\
 =09((base) + BUTTRESS_FW_BOOT_PARAMS_0 + ((offset) + (id)) * 4)
@@ -179,6 +191,7 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 =09ctx->cell_ready =3D cfg->cell_ready;
 =09ctx->buttress_boot_offset =3D cfg->buttress_boot_offset;
 =09ctx->base_addr  =3D base;
+=09ctx->dmem_syscom =3D cfg->dmem_syscom;
=20
 =09/*
 =09 * Allocate DMA mapped memory. Allocate one big chunk.
@@ -241,7 +254,8 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
=20
 =09/* initialize input queues */
 =09offset +=3D specific_size;
-=09res.reg =3D SYSCOM_QPR_BASE_REG;
+=09res.reg =3D ctx->dmem_syscom ? IPU4P_SYSCOM_QPR_BASE_REG :
+=09=09=09=09     SYSCOM_QPR_BASE_REG;
 =09res.host_address =3D (uintptr_t)(ctx->dma_buffer + offset);
 =09res.vied_address =3D ctx->dma_addr + offset;
 =09for (i =3D 0; i < cfg->num_input_queues; i++)
@@ -265,6 +279,21 @@ EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_prepare, "INTEL_IPU6"=
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
@@ -295,6 +324,17 @@ int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx)
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
@@ -326,9 +366,12 @@ bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx=
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
index b02285a3e43e..226a4713d6f2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.h
@@ -29,6 +29,7 @@ struct ipu6_fw_com_cfg {
 =09void (*cell_start)(struct ipu6_bus_device *adev);
=20
 =09unsigned int buttress_boot_offset;
+=09bool dmem_syscom;
 };
=20
 void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
--=20
2.55.0


