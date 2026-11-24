Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540102;
	b=u7OSAH8jD0TxG2bcnDHBBTog8i7KUxiZn65aeRL5CHxiDpVWCym4vuiIQaUXCtaCIEzp
	 RBMELxKpiu7fvn0gettX3i7Wf9nzLDiUEQJfjScAqsY8ncMvlp4sSfjxsz6brxOWVxCZ3
	 cFnqP8ykhPLduuwJKbL8TYXuZZiM+7Pu3ogLJHmKGMi/NJxB9xXPl6M00/7caM2OnjOX5
	 t+RYAQn92zA16MBfsh0pbeF139+9TbZHQ08nUdF5E9DElckqWX4aK+qZ6BXeCVQdB/K4K
	 DKcoL7vvCmVppn1XOJHkIm/4XukvvydofqCGt/Qq3gp/PFYlK/XF4noG5Ihuwa8eo3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540102;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9pmOQdUXxeqpS7wKiA21ejTwSSfBYfWNjqKekXL+2hM=;
	b=4TsBhlgLSTkpr015QvJZXc+9wRwXJxm5a8CnnyX9V+k+NIS18j6yLWmPDU/ec4fPx1vc
	 /Bozi0jtJk3xxZkuKgKm57pxb0TRvbYz16ZDLRtZrdEDm0i0n45XG3+oCUct7kmGUa0+i
	 TvO9Pe7iO9lfvrnSrJ72u35T37OxAi3a0uOBWLv7Yhr4X1knn/vql7PQIB91WWMLLgJF+
	 lqtFGFVXEJgS8PeR8Gh16hOEhMT6BQ1APaFpZZeNVyCR+mkjobOFrsq8kWltbX0l5zDY6
	 0xM8CbNfIgTPARZ7hFoEysjm00CyPk5H9M4fzQuB01qxrPMVIAmkErIq4DC6dApWH0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lxw0oUy0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6421606A688;
	Tue, 24 Nov 2026 17:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6421606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lxw0oUy0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D7B21762;
	Tue, 24 Nov 2026 09:08:18 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E913F763;
	Tue, 24 Nov 2026 09:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540101; bh=vnR5vYi4yPiKzgs3i+YxzPzqQ/WvZmW18JO4t05gnJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lxw0oUy0KAiIt8RIdMT+s2OEDRRsoGEWuuVbtyk41+hLU7F3SnyvUfCyjw4qZhLYJ
	 pffE+wgsHjCAc/uV3rpHGnhbxdaup38EOLUgr4PLAmqMF0wUoPJdivYcCzmk4CrBXV
	 Lz2ENDD7NIFXCVZyQJ9wG1huZ+GYa9I5QyiSI0p0=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:34 +0000
Subject: [PATCH 06/24] media: mali-c720: Add format handling
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-6-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=19047;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=QGJazcA9ntEWFug/aIlBtH3Ud97UjO1jwBvTaLIk4zI=;
 b=VPqoXeWDmVHK2egX8EGlT5Se8NGl+7he7z4mIgCYogwx56SoSBYNvdf18GTIwGWEFVHKIVbDu
 OADZ1s+hIoCA1kTWIgvLI4OPX23Q373Rp8v9EmpzYwUxi3M7x1x1v0r
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Define the supported media bus and capture formats, their bit depths
and hardware buffer layouts. Add helpers to select formats and check
which capture outputs support them.

A future series may extend format enumeration to expose different sets
of supported formats depending on the hardware version.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |   8 +
 .../platform/arm/mali-c720/mali-c720-formats.c     | 452 +++++++++++++++++++++
 .../platform/arm/mali-c720/mali-c720-formats.h     | 132 ++++++
 3 files changed, 592 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 0685bb7e0f5545091a022bf4ed19b3f2b249c2de..4f8e2918937c1ca212a11ccc6c4a0edb72dca72c 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -12,7 +12,9 @@
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
+#include <linux/videodev2.h>
 
+#include "mali-c720-formats.h"
 #include "mali-c720-id.h"
 #include "mali-c720-register-access.h"
 #include "mali-c720-registers.h"
@@ -20,6 +22,12 @@
 #include "mali-c720-registers-ctx-mgr.h"
 #include "mali-c720-registers-modules.h"
 
+enum mali_c720_cap_devs {
+	MALI_C720_CAP_DEV_FR0_RGB,
+	MALI_C720_CAP_DEV_FR0_YUV,
+	MALI_C720_MAX_NUM_CAP_DEVS,
+};
+
 struct mali_c720_context_regs {
 	dma_addr_t dma_handle;
 	u8 *base;
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-formats.c b/drivers/media/platform/arm/mali-c720/mali-c720-formats.c
new file mode 100644
index 0000000000000000000000000000000000000000..a4a1ae89327886fdd1d728a8b0b548dc555658ce
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-formats.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/media-bus-format.h>
+
+#include "mali-c720-common.h"
+
+static const struct mali_c720_buffer_cfg mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_MAX] = {
+	[MALI_C720_BUFFER_CFG_BAYER24] = {
+	  .data_format = 23,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER20_DENSE] = {
+	  .data_format = 19,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER16] = {
+	  .data_format = 15,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER14_DENSE] = {
+	  .data_format = 13,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER12_DENSE] = {
+	  .data_format = 11,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER10_DENSE] = {
+	  .data_format = 9,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_BAYER8] = {
+	  .data_format = 7,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_3SEMIPLANE_24BIT] = {
+	  .data_format = 48,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 1,
+	},
+
+	[MALI_C720_BUFFER_CFG_NV12] = {
+	  .data_format = 144,
+	  .data_layout = MALI_C720_BUFFER_LAYOUT_NORMAL,
+	  .data_align = MALI_C720_BUFFER_ALIGN_DENSE,
+	  .num_fifos = 2,
+	},
+};
+
+static const struct mali_c720_mbus_format_info mali_c720_mbus_fmts[] = {
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_24BIT,
+	  .bit_depth = 24,
+	  .code = MEDIA_BUS_FMT_SRGGB24_1X24,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER24],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_20BIT,
+	  .bit_depth = 20,
+	  .code = MEDIA_BUS_FMT_SRGGB20_1X20,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER20_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_SRGGB16_1X16,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER16],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_14BIT,
+	  .bit_depth = 14,
+	  .code = MEDIA_BUS_FMT_SRGGB14_1X14,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER14_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_12BIT,
+	  .bit_depth = 12,
+	  .code = MEDIA_BUS_FMT_SRGGB12_1X12,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER12_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_10BIT,
+	  .bit_depth = 10,
+	  .code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER10_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_RGGB,
+	  .depth = MALI_C720_FORMAT_8BIT,
+	  .bit_depth = 8,
+	  .code = MEDIA_BUS_FMT_SRGGB8_1X8,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER8],
+	},
+
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_24BIT,
+	  .bit_depth = 24,
+	  .code = MEDIA_BUS_FMT_SGRBG24_1X24,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER24],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_20BIT,
+	  .bit_depth = 20,
+	  .code = MEDIA_BUS_FMT_SGRBG20_1X20,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER20_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_SGRBG16_1X16,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER16],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_14BIT,
+	  .bit_depth = 14,
+	  .code = MEDIA_BUS_FMT_SGRBG14_1X14,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER14_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_12BIT,
+	  .bit_depth = 12,
+	  .code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER12_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_10BIT,
+	  .bit_depth = 10,
+	  .code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER10_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GRBG,
+	  .depth = MALI_C720_FORMAT_8BIT,
+	  .bit_depth = 8,
+	  .code = MEDIA_BUS_FMT_SGRBG8_1X8,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER8],
+	},
+
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_24BIT,
+	  .bit_depth = 24,
+	  .code = MEDIA_BUS_FMT_SGBRG24_1X24,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER24],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_20BIT,
+	  .bit_depth = 20,
+	  .code = MEDIA_BUS_FMT_SGBRG20_1X20,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER20_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_SGBRG16_1X16,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER16],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_14BIT,
+	  .bit_depth = 14,
+	  .code = MEDIA_BUS_FMT_SGBRG14_1X14,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER14_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_12BIT,
+	  .bit_depth = 12,
+	  .code = MEDIA_BUS_FMT_SGBRG12_1X12,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER12_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_10BIT,
+	  .bit_depth = 10,
+	  .code = MEDIA_BUS_FMT_SGBRG10_1X10,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER10_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_GBRG,
+	  .depth = MALI_C720_FORMAT_8BIT,
+	  .bit_depth = 8,
+	  .code = MEDIA_BUS_FMT_SGBRG8_1X8,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER8],
+	},
+
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_24BIT,
+	  .bit_depth = 24,
+	  .code = MEDIA_BUS_FMT_SBGGR24_1X24,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER24],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_20BIT,
+	  .bit_depth = 20,
+	  .code = MEDIA_BUS_FMT_SBGGR20_1X20,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER20_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_SBGGR16_1X16,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER16],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_14BIT,
+	  .bit_depth = 14,
+	  .code = MEDIA_BUS_FMT_SBGGR14_1X14,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER14_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_12BIT,
+	  .bit_depth = 12,
+	  .code = MEDIA_BUS_FMT_SBGGR12_1X12,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER12_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_10BIT,
+	  .bit_depth = 10,
+	  .code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER10_DENSE],
+	},
+	{
+	  .type = MALI_C720_FORMAT_BAYER_BGGR,
+	  .depth = MALI_C720_FORMAT_8BIT,
+	  .bit_depth = 8,
+	  .code = MEDIA_BUS_FMT_SBGGR8_1X8,
+	  .buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_BAYER8],
+	},
+
+	{
+	  .type = MALI_C720_FORMAT_RGB,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_RGB161616_1X48
+	},
+	{
+	  .type = MALI_C720_FORMAT_RGB,
+	  .depth = MALI_C720_FORMAT_12BIT,
+	  .bit_depth = 12,
+	  .code = MEDIA_BUS_FMT_RGB121212_1X36
+	},
+
+	{
+	  .type = MALI_C720_FORMAT_YUV,
+	  .depth = MALI_C720_FORMAT_16BIT,
+	  .bit_depth = 16,
+	  .code = MEDIA_BUS_FMT_YUV16_1X48
+	},
+};
+
+static const struct mali_c720_v4l2_format_info mali_c720_v4l2_fmts[] = {
+	/* RGB formats */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.mbus_code = MEDIA_BUS_FMT_RGB161616_1X48,
+
+		.comp_planes = 1,
+		.bpp = { 24, 0, 0, 0 },
+		.hdiv = 1,
+		.vdiv = 1,
+
+		.supported_mask = BIT(MALI_C720_CAP_DEV_FR0_RGB),
+
+		.buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_3SEMIPLANE_24BIT],
+	},
+
+	/* YUV formats */
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.mbus_code = MEDIA_BUS_FMT_YUV16_1X48,
+
+		.comp_planes = 2,
+		.bpp = { 8, 16, 0, 0 },
+		.hdiv = 2,
+		.vdiv = 2,
+
+		.supported_mask = BIT(MALI_C720_CAP_DEV_FR0_YUV),
+
+		.buffer_cfg = &mali_c720_buffer_configs[MALI_C720_BUFFER_CFG_NV12],
+	},
+};
+
+int mali_c720_validate_mbus_format_match(const struct mali_c720_mbus_format_info *format,
+					 const struct mali_c720_mbus_format_match *match)
+{
+	return (match->type_mask & format->type) &&
+	       (match->depth_mask & format->depth);
+}
+
+const struct mali_c720_mbus_format_info *
+mali_c720_get_mbus_config_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_mbus_fmts); i++) {
+		if (mali_c720_mbus_fmts[i].code == code)
+			return &mali_c720_mbus_fmts[i];
+	}
+
+	return NULL;
+}
+
+const struct mali_c720_mbus_format_info *
+mali_c720_get_mbus_config_by_matched_index(unsigned int index,
+					   const struct mali_c720_mbus_format_match *match)
+{
+	unsigned int i;
+	unsigned int count = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_mbus_fmts); i++) {
+		if (!mali_c720_validate_mbus_format_match(&mali_c720_mbus_fmts[i],
+							  match))
+			continue;
+
+		if (count++ == index)
+			return &mali_c720_mbus_fmts[i];
+	}
+
+	return NULL;
+}
+
+const struct mali_c720_mbus_format_info *
+mali_c720_shift_mbus_format(const struct mali_c720_mbus_format_info *format,
+			    enum mali_c720_format_depth out_depth)
+{
+	unsigned int i;
+
+	if (format->depth == out_depth)
+		return format;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_mbus_fmts); i++) {
+		if (mali_c720_mbus_fmts[i].type == format->type &&
+		    mali_c720_mbus_fmts[i].depth == out_depth)
+			return &mali_c720_mbus_fmts[i];
+	}
+
+	return NULL;
+}
+
+bool
+mali_c720_mbus_code_supports_fmt(const struct mali_c720_v4l2_format_info *fmt,
+				 u32 code)
+{
+	/* Display all formats if no code is provided */
+	if (!code)
+		return true;
+
+	return fmt->mbus_code == code;
+}
+
+bool
+mali_c720_format_supported_by_vdev(const struct mali_c720_v4l2_format_info *fmt,
+				   unsigned int dev_id)
+{
+	if (fmt->supported_mask & BIT(dev_id))
+		return true;
+
+	return false;
+}
+
+static int
+mali_c720_validate_v4l2_format_match(const struct mali_c720_v4l2_format_info *format,
+				     const struct mali_c720_v4l2_format_match *match)
+{
+	if (!mali_c720_mbus_code_supports_fmt(format, match->mbus_code))
+		return 0;
+
+	if (!mali_c720_format_supported_by_vdev(format, match->dev_id))
+		return 0;
+
+	return 1;
+}
+
+const struct mali_c720_v4l2_format_info *
+mali_c720_get_v4l2_config_by_fourcc(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_v4l2_fmts); i++) {
+		if (mali_c720_v4l2_fmts[i].fourcc == fourcc)
+			return &mali_c720_v4l2_fmts[i];
+	}
+
+	return NULL;
+}
+
+const struct mali_c720_v4l2_format_info *
+mali_c720_get_v4l2_config_by_matched_index(unsigned int index,
+					   const struct mali_c720_v4l2_format_match *match)
+{
+	unsigned int i;
+	unsigned int count = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_v4l2_fmts); i++) {
+		if (!mali_c720_validate_v4l2_format_match(&mali_c720_v4l2_fmts[i], match))
+			continue;
+
+		if (count++ == index)
+			return &mali_c720_v4l2_fmts[i];
+	}
+
+	return NULL;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-formats.h b/drivers/media/platform/arm/mali-c720/mali-c720-formats.h
new file mode 100644
index 0000000000000000000000000000000000000000..5d6f01a14296028ac69affbcbb1e7df3ea62f012
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-formats.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_FORMATS_H
+#define MALI_C720_FORMATS_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+enum mali_c720_format_type {
+	MALI_C720_FORMAT_BAYER_RGGB = BIT(0),
+	MALI_C720_FORMAT_BAYER_GRBG = BIT(1),
+	MALI_C720_FORMAT_BAYER_GBRG = BIT(2),
+	MALI_C720_FORMAT_BAYER_BGGR = BIT(3),
+	MALI_C720_FORMAT_RGB = BIT(4),
+	MALI_C720_FORMAT_YUV = BIT(5),
+};
+
+#define MALI_C720_FORMAT_BAYER		(MALI_C720_FORMAT_BAYER_RGGB | \
+					 MALI_C720_FORMAT_BAYER_GRBG | \
+					 MALI_C720_FORMAT_BAYER_GBRG | \
+					 MALI_C720_FORMAT_BAYER_BGGR)
+
+enum mali_c720_format_depth {
+	MALI_C720_FORMAT_8BIT = BIT(0),
+	MALI_C720_FORMAT_10BIT = BIT(1),
+	MALI_C720_FORMAT_12BIT = BIT(2),
+	MALI_C720_FORMAT_14BIT = BIT(3),
+	MALI_C720_FORMAT_16BIT = BIT(4),
+	MALI_C720_FORMAT_20BIT = BIT(5),
+	MALI_C720_FORMAT_24BIT = BIT(6),
+};
+
+enum mali_c720_buffer_layout_ids {
+	MALI_C720_BUFFER_LAYOUT_NORMAL,
+	MALI_C720_BUFFER_LAYOUT_ALTERNATE,
+};
+
+enum mali_c720_buffer_align_ids {
+	MALI_C720_BUFFER_ALIGN_DENSE = 0,
+	MALI_C720_BUFFER_ALIGN_LSB = 2,
+	MALI_C720_BUFFER_ALIGN_MSB = 3,
+};
+
+enum mali_c720_buffer_cfg_ids {
+	/* Bayer */
+	MALI_C720_BUFFER_CFG_BAYER24,
+	MALI_C720_BUFFER_CFG_BAYER20_DENSE,
+	MALI_C720_BUFFER_CFG_BAYER16,
+	MALI_C720_BUFFER_CFG_BAYER14_DENSE,
+	MALI_C720_BUFFER_CFG_BAYER12_DENSE,
+	MALI_C720_BUFFER_CFG_BAYER10_DENSE,
+	MALI_C720_BUFFER_CFG_BAYER8,
+
+	/* Packed/Planar for RGB and YUV */
+	MALI_C720_BUFFER_CFG_3SEMIPLANE_24BIT,
+
+	/* YUV */
+	MALI_C720_BUFFER_CFG_NV12,
+
+	MALI_C720_BUFFER_CFG_MAX,
+};
+
+struct mali_c720_buffer_cfg {
+	unsigned int data_format;
+	unsigned int data_layout;
+	unsigned int data_align;
+	unsigned int num_fifos;
+};
+
+struct mali_c720_v4l2_format_match {
+	u32 mbus_code;
+	unsigned int dev_id;
+};
+
+struct mali_c720_v4l2_format_info {
+	u32 fourcc;
+	unsigned int mbus_code;
+
+	unsigned int comp_planes;
+	unsigned int bpp[4];
+	unsigned int hdiv;
+	unsigned int vdiv;
+
+	/* Mask designating which of the available video devs support this format. */
+	unsigned int supported_mask;
+
+	const struct mali_c720_buffer_cfg *buffer_cfg;
+};
+
+struct mali_c720_mbus_format_match {
+	unsigned int type_mask;
+	unsigned int depth_mask;
+};
+
+struct mali_c720_mbus_format_info {
+	enum mali_c720_format_type type;
+	enum mali_c720_format_depth depth;
+	unsigned int bit_depth;
+	u32 code;
+
+	const struct mali_c720_buffer_cfg *buffer_cfg;
+};
+
+int mali_c720_validate_mbus_format_match(const struct mali_c720_mbus_format_info *format,
+					 const struct mali_c720_mbus_format_match *match);
+const struct mali_c720_mbus_format_info *
+mali_c720_get_mbus_config_by_code(u32 code);
+const struct mali_c720_mbus_format_info *
+mali_c720_get_mbus_config_by_matched_index(unsigned int index,
+					   const struct mali_c720_mbus_format_match *match);
+const struct mali_c720_mbus_format_info *
+mali_c720_shift_mbus_format(const struct mali_c720_mbus_format_info *format,
+			    enum mali_c720_format_depth out_depth);
+
+bool
+mali_c720_mbus_code_supports_fmt(const struct mali_c720_v4l2_format_info *fmt,
+				 u32 code);
+bool
+mali_c720_format_supported_by_vdev(const struct mali_c720_v4l2_format_info *fmt,
+				   unsigned int dev_id);
+const struct mali_c720_v4l2_format_info *
+mali_c720_get_v4l2_config_by_fourcc(u32 fourcc);
+const struct mali_c720_v4l2_format_info *
+mali_c720_get_v4l2_config_by_matched_index(unsigned int index,
+					   const struct mali_c720_v4l2_format_match *match);
+
+#endif /* MALI_C720_FORMATS_H */

-- 
2.55.0

