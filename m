Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540118;
	b=byQZWnWQCrpE3dg/dmjLA916m4ZKb+jP/6nPONFcJyuIrDoCFhEbTukZMg1YZm3UnfUG
	 8IS52JLpGgT06Rbs3jL74q7nHMjK6TWhfIz3s9BWxCRUVh+hllHEus3herymeSyi0YYQO
	 7AH9SSs2C9OYwVPcezBtdsjRR9GhaCsDp2/75Jvv29G6HNojzI4oWLOCKyCpNxZGBC9WS
	 iOarPDFERQJZfTVVBX1NulJtuhhiKHNbapH4LLwvA+GXeCBVt6Le8GcRPpf8I39BTQ1H3
	 A1yonebnKObmGrvPO+AhBut9AJO89AWKvVP2NdrZSXRrn+TvX3QNbUzFg1mpavhjk4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540118;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ajYUQQBbL+Gre/VY4MXuXKporCwZduVT6bUpjggpyUA=;
	b=XsMr8W0/Ecoedc+TKxvFpyEvLE3fVK4728PPaml7DGtFCwdhkPpF0VHXS1tPsYSUor0u
	 Z2bPyyj0U2Sm4fE4ALitHYNupbqFEMH3Wt1981NceEW+bCuacA+TCffmXqw2El02Mo2Vf
	 LoKwfnM4UTj6PkJLqBFTScFtEMMNWy1C3/AP2OM0cHKOcPPEgWbN6jpyE647L/VMyqiZO
	 9STSM4QjXZCa5vR8TAZszbBcy1MwNMtdkG/K7D9ZDwmz0dmKYEc+Na3qnK2zQwTfC2vX9
	 wIi7wQGSdthLs5v1XE0RJVxeVmAwoWX5y8CuLWXL+192Bn71n8loMtkBx8Ar8j2bOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=apdVAVm1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D9E606A682;
	Tue, 24 Nov 2026 17:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D9E606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=apdVAVm1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19EB1A2D;
	Tue, 24 Nov 2026 09:08:33 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D76713F763;
	Tue, 24 Nov 2026 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540116; bh=a4FGBQrHH6Dhi3KSN3ek2TPlUEDmzN4/DJ4dPMzlUMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=apdVAVm1UBoiKUeI+pBf0xYfvhwTZXwiAdVnwtIxvLvWySKT0J/YBjY3uuraA/FeY
	 VML97INx1t3z6cDMiCXPf77rW9X7K+YuW6P6airepbb68isECccUEJUUB5fJKcJ1y+
	 bWp+C9og+5p9JrjZIJoptLoFL2VxgStNB6TAi1yk=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:39 +0000
Subject: [PATCH 11/24] media: mali-c720: Add full-resolution output
 subdevice
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-11-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=48983;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=vHeMaa1T+Z129/HTh+IomsFNJryxovEg3lz3XuN80Ms=;
 b=DvZJCyHas2B5gZW8EWCf+Zcox6qea0H66mg4CoSJbEATzofQYsH3pXt9yNOhgoKnmnVGr7hJH
 K8zJ9xcbNCMCt7d3CjKEKgzyGfFUVTqFNuVu6XP/xIKfvieYhcr0n71
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add the full-resolution output 0 (FR0) subdevice with RGB and YUV source
pads. It is currently connected to the human vision (HV) pipeline.
Support for additional full-resolution output pipelines and connections
to the computer vision (CV) pipeline will be added in the future.

Configure scaling through the sink-pad compose rectangle, followed by
cropping on the source pads. Both outputs share the scaling and crop
configuration.

Provide default scaler coefficients and YUV output formatter settings.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |   53 +
 .../platform/arm/mali-c720/mali-c720-fr-pipe.c     | 1178 ++++++++++++++++++++
 2 files changed, 1231 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 1037949d45e4eb8520254cd9addcbfce45def92d..ca7e04ef27a6ae3c4b41144de579c668255bfcaa 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -31,11 +31,15 @@
 
 #define MALI_C720_MIN_INPUT_WIDTH	256
 #define MALI_C720_MIN_INPUT_HEIGHT	256
+#define MALI_C720_MIN_OUTPUT_WIDTH	64
+#define MALI_C720_MIN_OUTPUT_HEIGHT	64
 #define MALI_C720_MAX_WIDTH		8192
 #define MALI_C720_MAX_HEIGHT		4608
 #define MALI_C720_DEFAULT_WIDTH		1920
 #define MALI_C720_DEFAULT_HEIGHT	1080
 
+#define MALI_C720_MAX_DOWNSCALE_RATIO	0xffffff /* Q4.20 */
+
 #define MALI_C720_FRAME_TIMESTAMP_COUNT	256
 
 struct mali_c720_subdev {
@@ -93,6 +97,48 @@ struct mali_c720_vision_pipe {
 	struct media_pad pads[MALI_C720_VISION_PIPE_NUM_PADS];
 };
 
+enum mali_c720_fr_pipe_pads {
+	MALI_C720_FR_PIPE_PAD_SINK_VIDEO,
+	MALI_C720_FR_PIPE_PAD_SOURCE_RGB,
+	MALI_C720_FR_PIPE_PAD_SOURCE_YUV,
+	MALI_C720_FR_PIPE_NUM_PADS,
+};
+
+struct mali_c720_crop_config {
+	u32 start_x;
+	u32 start_y;
+	u32 size_x;
+	u32 size_y;
+	bool bypass;
+};
+
+struct mali_c720_fr_resizer_config {
+	struct mali_c720_crop_config crop;
+	u32 hfilt_tincr;
+	u32 vfilt_tincr;
+	unsigned int hbank;
+	unsigned int vbank;
+	bool hfilt_enable;
+	bool vfilt_enable;
+};
+
+struct mali_c720_fr_pipe {
+	struct mali_c720_subdev mdev;
+	struct media_pad pads[MALI_C720_FR_PIPE_NUM_PADS];
+	struct media_pad *remote_src;
+	u32 crop_base;
+	u32 scaler_base;
+	u32 scaler_hmem_base;
+	u32 scaler_vmem_base;
+	u32 output_formatter_base;
+
+	/* Protect resizer_config, resizer_updated and enabled_crops. */
+	spinlock_t resizer_lock;
+	struct mali_c720_fr_resizer_config resizer_config;
+	bool resizer_updated;
+	unsigned long enabled_crops;
+};
+
 enum mali_c720_cap_devs {
 	MALI_C720_CAP_DEV_FR0_RGB,
 	MALI_C720_CAP_DEV_FR0_YUV,
@@ -152,6 +198,7 @@ struct mali_c720 {
 	struct mali_c720_input input;
 	struct mali_c720_isp isp;
 	struct mali_c720_vision_pipe vision_pipe;
+	struct mali_c720_fr_pipe fr_pipe;
 
 	struct mali_c720_registers registers;
 	u8 *default_regs;
@@ -185,6 +232,12 @@ int mali_c720_register_vision_pipe(struct mali_c720 *mali_c720);
 void mali_c720_unregister_vision_pipe(struct mali_c720 *mali_c720);
 void mali_c720_cleanup_vision_pipe(struct mali_c720 *mali_c720);
 
+int mali_c720_register_fr_pipe(struct mali_c720 *mali_c720);
+void mali_c720_unregister_fr_pipe(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_fr_pipe(struct mali_c720 *mali_c720);
+
+void mali_c720_fr_pipe_apply_resizer_config(struct mali_c720_fr_pipe *pipe);
+
 void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence);
 
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c b/drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c
new file mode 100644
index 0000000000000000000000000000000000000000..a2f97ebce609b6d9434f942958c24aa3df40e69c
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c
@@ -0,0 +1,1178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bitops.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-rect.h>
+
+#include "mali-c720-common.h"
+
+#define MALI_C720_SCALER_FACTOR		BIT(20)
+
+#define MALI_C720_RSZ_COEFS_BANKS	8
+#define MALI_C720_RSZ_COEFS_ENTRIES	64
+
+/* Set initial phase as 0.5 in Q4.20, for the best image quality */
+#define MALI_C720_SCALER_START_PHASE	0x80000
+
+/*
+ * Default coefficients for the 32-phase, 7-tap scaler filters.
+ * Eight banks are optimised for image quality at different scaling ratios,
+ * with independent bank selection for horizontal and vertical scaling.
+ * Each phase contains seven signed 8-bit coefficients packed into two
+ * 32-bit words.
+ */
+static const unsigned int
+mali_c720_rsz_filter_coeffs_h[MALI_C720_RSZ_COEFS_BANKS]
+			    [MALI_C720_RSZ_COEFS_ENTRIES] = {
+	{	/* Bank 0 */
+		0x24fc0000, 0x0000fc24, 0x27fc0000, 0x0000fc21,
+		0x28fc0000, 0x0000fd1f, 0x2cfb0000, 0x0000fd1c,
+		0x2efb0000, 0x0000fd1a, 0x30fb0000, 0x0000fe17,
+		0x32fb0000, 0x0000fe15, 0x35fb0000, 0x0000fe12,
+		0x35fc0000, 0x0000ff10, 0x37fc0000, 0x0000ff0e,
+		0x39fc0000, 0x0000ff0c, 0x3afd0000, 0x0000ff0a,
+		0x3afe0000, 0x00000008, 0x3cfe0000, 0x00000006,
+		0x3dff0000, 0x00000004, 0x3d000000, 0x00000003,
+		0x3c020000, 0x00000002, 0x3d030000, 0x00000000,
+		0x3d040000, 0x000000ff, 0x3c060000, 0x000000fe,
+		0x3a080000, 0x000000fe, 0x3a0aff00, 0x000000fd,
+		0x390cff00, 0x000000fc, 0x370eff00, 0x000000fc,
+		0x3510ff00, 0x000000fc, 0x3512fe00, 0x000000fb,
+		0x3215fe00, 0x000000fb, 0x3017fe00, 0x000000fb,
+		0x2e1afd00, 0x000000fb, 0x2c1cfd00, 0x000000fb,
+		0x281ffd00, 0x000000fc, 0x2721fc00, 0x000000fc,
+	},
+	{	/* Bank 1 */
+		0x25fb0000, 0x0000fb25, 0x27fb0000, 0x0000fb23,
+		0x29fb0000, 0x0000fb21, 0x2afc0000, 0x0000fb1f,
+		0x2cfc0000, 0x0000fb1d, 0x2efc0000, 0x0000fb1b,
+		0x2ffd0000, 0x0000fb19, 0x2ffe0000, 0x0000fc17,
+		0x31fe0000, 0x0000fc15, 0x32ff0000, 0x0000fc13,
+		0x3400ff00, 0x0000fc11, 0x3301ff00, 0x0000fd10,
+		0x3402ff00, 0x0000fd0e, 0x3503ff00, 0x0000fd0c,
+		0x3505ff00, 0x0000fd0a, 0x3506fe00, 0x0000fe09,
+		0x3607fe00, 0x0000fe07, 0x3509fe00, 0x0000fe06,
+		0x350afd00, 0x0000ff05, 0x350cfd00, 0x0000ff03,
+		0x340efd00, 0x0000ff02, 0x3310fd00, 0x0000ff01,
+		0x3411fc00, 0x0000ff00, 0x3213fc00, 0x000000ff,
+		0x3115fc00, 0x000000fe, 0x2f17fc00, 0x000000fe,
+		0x2f19fb00, 0x000000fd, 0x2e1bfb00, 0x000000fc,
+		0x2c1dfb00, 0x000000fc, 0x2a1ffb00, 0x000000fc,
+		0x2921fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
+	},
+	{	/* Bank 2 */
+		0x1f010000, 0x0000011f, 0x21010000, 0x0000001e,
+		0x21020000, 0x0000001d, 0x22020000, 0x0000001c,
+		0x23030000, 0x0000ff1b, 0x2404ff00, 0x0000ff1a,
+		0x2504ff00, 0x0000ff19, 0x2505ff00, 0x0000ff18,
+		0x2606ff00, 0x0000fe17, 0x2607ff00, 0x0000fe16,
+		0x2708ff00, 0x0000fe14, 0x2709ff00, 0x0000fe13,
+		0x270aff00, 0x0000fe12, 0x280bfe00, 0x0000fe11,
+		0x280cfe00, 0x0000fe10, 0x280dfe00, 0x0000fe0f,
+		0x280efe00, 0x0000fe0e, 0x280ffe00, 0x0000fe0d,
+		0x2810fe00, 0x0000fe0c, 0x2811fe00, 0x0000fe0b,
+		0x2712fe00, 0x0000ff0a, 0x2713fe00, 0x0000ff09,
+		0x2714fe00, 0x0000ff08, 0x2616fe00, 0x0000ff07,
+		0x2617fe00, 0x0000ff06, 0x2518ff00, 0x0000ff05,
+		0x2519ff00, 0x0000ff04, 0x241aff00, 0x0000ff04,
+		0x231bff00, 0x00000003, 0x221c0000, 0x00000002,
+		0x211d0000, 0x00000002, 0x211e0000, 0x00000001,
+	},
+	{	/* Bank 3 */
+		0x1b06ff00, 0x00ff061b, 0x1b07ff00, 0x00ff061a,
+		0x1c07ff00, 0x00ff051a, 0x1c08ff00, 0x00ff0519,
+		0x1c09ff00, 0x00ff0419, 0x1d09ff00, 0x00ff0418,
+		0x1e0aff00, 0x00ff0317, 0x1e0aff00, 0x00ff0317,
+		0x1e0bff00, 0x00ff0316, 0x1f0cff00, 0x00ff0215,
+		0x1e0cff00, 0x00000215, 0x1e0dff00, 0x00000214,
+		0x1e0e0000, 0x00000113, 0x1e0e0000, 0x00000113,
+		0x1e0f0000, 0x00000112, 0x1f100000, 0x00000011,
+		0x20100000, 0x00000010, 0x1f110000, 0x00000010,
+		0x1e120100, 0x0000000f, 0x1e130100, 0x0000000e,
+		0x1e130100, 0x0000000e, 0x1e140200, 0x0000ff0d,
+		0x1e150200, 0x0000ff0c, 0x1f1502ff, 0x0000ff0c,
+		0x1e1603ff, 0x0000ff0b, 0x1e1703ff, 0x0000ff0a,
+		0x1e1703ff, 0x0000ff0a, 0x1d1804ff, 0x0000ff09,
+		0x1c1904ff, 0x0000ff09, 0x1c1905ff, 0x0000ff08,
+		0x1c1a05ff, 0x0000ff07, 0x1b1a06ff, 0x0000ff07,
+	},
+	{	/* Bank 4 */
+		0x17090000, 0x00000917, 0x18090000, 0x00000916,
+		0x170a0100, 0x00000816, 0x170a0100, 0x00000816,
+		0x180b0100, 0x00000715, 0x180b0100, 0x00000715,
+		0x170c0100, 0x00000715, 0x190c0100, 0x00000614,
+		0x180d0100, 0x00000614, 0x190d0200, 0x00000513,
+		0x180e0200, 0x00000513, 0x180e0200, 0x00000513,
+		0x1a0e0200, 0x00000412, 0x190f0200, 0x00000412,
+		0x190f0300, 0x00000411, 0x18100300, 0x00000411,
+		0x1a100300, 0x00000310, 0x18110400, 0x00000310,
+		0x19110400, 0x0000030f, 0x19120400, 0x0000020f,
+		0x1a120400, 0x0000020e, 0x18130500, 0x0000020e,
+		0x18130500, 0x0000020e, 0x19130500, 0x0000020d,
+		0x18140600, 0x0000010d, 0x19140600, 0x0000010c,
+		0x17150700, 0x0000010c, 0x18150700, 0x0000010b,
+		0x18150700, 0x0000010b, 0x17160800, 0x0000010a,
+		0x17160800, 0x0000010a, 0x18160900, 0x00000009,
+	},
+	{	/* Bank 5 */
+		0x120b0300, 0x00030b12, 0x120c0300, 0x00030b11,
+		0x110c0400, 0x00030b11, 0x110c0400, 0x00030b11,
+		0x130c0400, 0x00020a11, 0x120d0400, 0x00020a11,
+		0x110d0500, 0x00020a11, 0x110d0500, 0x00020a11,
+		0x130d0500, 0x00010911, 0x130e0500, 0x00010910,
+		0x120e0600, 0x00010910, 0x120e0600, 0x00010910,
+		0x130e0600, 0x00010810, 0x120f0600, 0x00010810,
+		0x120f0700, 0x00000810, 0x130f0700, 0x0000080f,
+		0x140f0700, 0x0000070f, 0x130f0800, 0x0000070f,
+		0x12100800, 0x0000070f, 0x12100801, 0x0000060f,
+		0x13100801, 0x0000060e, 0x12100901, 0x0000060e,
+		0x12100901, 0x0000060e, 0x13100901, 0x0000050e,
+		0x13110901, 0x0000050d, 0x11110a02, 0x0000050d,
+		0x11110a02, 0x0000050d, 0x12110a02, 0x0000040d,
+		0x13110a02, 0x0000040c, 0x11110b03, 0x0000040c,
+		0x11110b03, 0x0000040c, 0x12110b03, 0x0000030c,
+	},
+	{	/* Bank 6 */
+		0x0b0a0805, 0x00080a0c, 0x0b0a0805, 0x00080a0c,
+		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
+		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
+		0x0b0b0806, 0x00070a0b, 0x0c0b0806, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0c0b0906, 0x0006090b,
+		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0c0b0907, 0x0006080b,
+		0x0b0b0a07, 0x0006080b, 0x0c0b0a07, 0x0006080a,
+		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+	},
+	{	/* Bank 7 */
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+	}
+};
+
+static const unsigned int
+mali_c720_rsz_filter_coeffs_v[MALI_C720_RSZ_COEFS_BANKS]
+			    [MALI_C720_RSZ_COEFS_ENTRIES] = {
+	{	/* Bank 0 */
+		0x2424fc00, 0x000000fc, 0x2721fc00, 0x000000fc,
+		0x281ffd00, 0x000000fc, 0x2c1cfd00, 0x000000fb,
+		0x2e1afd00, 0x000000fb, 0x3017fe00, 0x000000fb,
+		0x3215fe00, 0x000000fb, 0x3512fe00, 0x000000fb,
+		0x3510ff00, 0x000000fc, 0x370eff00, 0x000000fc,
+		0x390cff00, 0x000000fc, 0x3a0aff00, 0x000000fd,
+		0x3a080000, 0x000000fe, 0x3c060000, 0x000000fe,
+		0x3d040000, 0x000000ff, 0x3d030000, 0x00000000,
+		0x3c020000, 0x00000002, 0x3d000000, 0x00000003,
+		0x3dff0000, 0x00000004, 0x3cfe0000, 0x00000006,
+		0x3afe0000, 0x00000008, 0x3afd0000, 0x0000ff0a,
+		0x39fc0000, 0x0000ff0c, 0x37fc0000, 0x0000ff0e,
+		0x35fc0000, 0x0000ff10, 0x35fb0000, 0x0000fe12,
+		0x32fb0000, 0x0000fe15, 0x30fb0000, 0x0000fe17,
+		0x2efb0000, 0x0000fd1a, 0x2cfb0000, 0x0000fd1c,
+		0x28fc0000, 0x0000fd1f, 0x27fc0000, 0x0000fc21,
+	},
+	{	/* Bank 1 */
+		0x2525fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
+		0x2921fb00, 0x000000fb, 0x2a1ffb00, 0x000000fc,
+		0x2c1dfb00, 0x000000fc, 0x2e1bfb00, 0x000000fc,
+		0x2f19fb00, 0x000000fd, 0x2f17fc00, 0x000000fe,
+		0x3115fc00, 0x000000fe, 0x3213fc00, 0x000000ff,
+		0x3411fc00, 0x0000ff00, 0x3310fd00, 0x0000ff01,
+		0x340efd00, 0x0000ff02, 0x350cfd00, 0x0000ff03,
+		0x350afd00, 0x0000ff05, 0x3509fe00, 0x0000fe06,
+		0x3607fe00, 0x0000fe07, 0x3506fe00, 0x0000fe09,
+		0x3505ff00, 0x0000fd0a, 0x3503ff00, 0x0000fd0c,
+		0x3402ff00, 0x0000fd0e, 0x3301ff00, 0x0000fd10,
+		0x3400ff00, 0x0000fc11, 0x32ff0000, 0x0000fc13,
+		0x31fe0000, 0x0000fc15, 0x2ffe0000, 0x0000fc17,
+		0x2ffd0000, 0x0000fb19, 0x2efc0000, 0x0000fb1b,
+		0x2cfc0000, 0x0000fb1d, 0x2afc0000, 0x0000fb1f,
+		0x29fb0000, 0x0000fb21, 0x27fb0000, 0x0000fb23,
+	},
+	{	/* Bank 2 */
+		0x1f1f0100, 0x00000001, 0x211e0000, 0x00000001,
+		0x211d0000, 0x00000002, 0x221c0000, 0x00000002,
+		0x231bff00, 0x00000003, 0x241aff00, 0x0000ff04,
+		0x2519ff00, 0x0000ff04, 0x2518ff00, 0x0000ff05,
+		0x2617fe00, 0x0000ff06, 0x2616fe00, 0x0000ff07,
+		0x2714fe00, 0x0000ff08, 0x2713fe00, 0x0000ff09,
+		0x2712fe00, 0x0000ff0a, 0x2811fe00, 0x0000fe0b,
+		0x2810fe00, 0x0000fe0c, 0x280ffe00, 0x0000fe0d,
+		0x280efe00, 0x0000fe0e, 0x280dfe00, 0x0000fe0f,
+		0x280cfe00, 0x0000fe10, 0x280bfe00, 0x0000fe11,
+		0x270aff00, 0x0000fe12, 0x2709ff00, 0x0000fe13,
+		0x2708ff00, 0x0000fe14, 0x2607ff00, 0x0000fe16,
+		0x2606ff00, 0x0000fe17, 0x2505ff00, 0x0000ff18,
+		0x2504ff00, 0x0000ff19, 0x2404ff00, 0x0000ff1a,
+		0x23030000, 0x0000ff1b, 0x22020000, 0x0000001c,
+		0x21020000, 0x0000001d, 0x21010000, 0x0000001e,
+	},
+	{	/* Bank 3 */
+		0x1b1b06ff, 0x0000ff06, 0x1b1a06ff, 0x0000ff07,
+		0x1c1a05ff, 0x0000ff07, 0x1c1905ff, 0x0000ff08,
+		0x1c1904ff, 0x0000ff09, 0x1d1804ff, 0x0000ff09,
+		0x1e1703ff, 0x0000ff0a, 0x1e1703ff, 0x0000ff0a,
+		0x1e1603ff, 0x0000ff0b, 0x1f1502ff, 0x0000ff0c,
+		0x1e150200, 0x0000ff0c, 0x1e140200, 0x0000ff0d,
+		0x1e130100, 0x0000000e, 0x1e130100, 0x0000000e,
+		0x1e120100, 0x0000000f, 0x1f110000, 0x00000010,
+		0x20100000, 0x00000010, 0x1f100000, 0x00000011,
+		0x1e0f0000, 0x00000112, 0x1e0e0000, 0x00000113,
+		0x1e0e0000, 0x00000113, 0x1e0dff00, 0x00000214,
+		0x1e0cff00, 0x00000215, 0x1f0cff00, 0x00ff0215,
+		0x1e0bff00, 0x00ff0316, 0x1e0aff00, 0x00ff0317,
+		0x1e0aff00, 0x00ff0317, 0x1d09ff00, 0x00ff0418,
+		0x1c09ff00, 0x00ff0419, 0x1c08ff00, 0x00ff0519,
+		0x1c07ff00, 0x00ff051a, 0x1b07ff00, 0x00ff061a,
+	},
+	{	/* Bank 4 */
+		0x17170900, 0x00000009, 0x18160900, 0x00000009,
+		0x17160800, 0x0000010a, 0x17160800, 0x0000010a,
+		0x18150700, 0x0000010b, 0x18150700, 0x0000010b,
+		0x17150700, 0x0000010c, 0x19140600, 0x0000010c,
+		0x18140600, 0x0000010d, 0x19130500, 0x0000020d,
+		0x18130500, 0x0000020e, 0x18130500, 0x0000020e,
+		0x1a120400, 0x0000020e, 0x19120400, 0x0000020f,
+		0x19110400, 0x0000030f, 0x18110400, 0x00000310,
+		0x1a100300, 0x00000310, 0x18100300, 0x00000411,
+		0x190f0300, 0x00000411, 0x190f0200, 0x00000412,
+		0x1a0e0200, 0x00000412, 0x180e0200, 0x00000513,
+		0x180e0200, 0x00000513, 0x190d0200, 0x00000513,
+		0x180d0100, 0x00000614, 0x190c0100, 0x00000614,
+		0x170c0100, 0x00000715, 0x180b0100, 0x00000715,
+		0x180b0100, 0x00000715, 0x170a0100, 0x00000816,
+		0x170a0100, 0x00000816, 0x18090000, 0x00000916,
+	},
+	{	/* Bank 5 */
+		0x12120b03, 0x0000030b, 0x12110b03, 0x0000030c,
+		0x11110b03, 0x0000040c, 0x11110b03, 0x0000040c,
+		0x13110a02, 0x0000040c, 0x12110a02, 0x0000040d,
+		0x11110a02, 0x0000050d, 0x11110a02, 0x0000050d,
+		0x13110901, 0x0000050d, 0x13100901, 0x0000050e,
+		0x12100901, 0x0000060e, 0x12100901, 0x0000060e,
+		0x13100801, 0x0000060e, 0x12100801, 0x0000060f,
+		0x12100800, 0x0000070f, 0x130f0800, 0x0000070f,
+		0x140f0700, 0x0000070f, 0x130f0700, 0x0000080f,
+		0x120f0700, 0x00000810, 0x120f0600, 0x00010810,
+		0x130e0600, 0x00010810, 0x120e0600, 0x00010910,
+		0x120e0600, 0x00010910, 0x130e0500, 0x00010910,
+		0x130d0500, 0x00010911, 0x110d0500, 0x00020a11,
+		0x110d0500, 0x00020a11, 0x120d0400, 0x00020a11,
+		0x130c0400, 0x00020a11, 0x110c0400, 0x00030b11,
+		0x110c0400, 0x00030b11, 0x120c0300, 0x00030b11,
+	},
+	{	/* Bank 6 */
+		0x0b0c0a08, 0x0005080a, 0x0b0c0a08, 0x0005080a,
+		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0c0b0a07, 0x0006080a,
+		0x0b0b0a07, 0x0006080b, 0x0c0b0907, 0x0006080b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0c0b0806, 0x0007090b,
+		0x0b0b0806, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0c0a0805, 0x00080a0b,
+		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
+	},
+	{	/* Bank 7 */
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+	}
+};
+
+static const unsigned int mali_c720_rsz_coef_banks_range_start[] = {
+	770, 600, 460, 354, 273, 210, 162, 125
+};
+
+/*
+ * Select the filter coefficient bank from the output/input size ratio,
+ * using the sink compose rectangle and sink format respectively.
+ */
+static unsigned int mali_c720_rsz_calculate_bank(unsigned int rsz_in,
+						 unsigned int rsz_out)
+{
+	unsigned int rsz_ratio = (rsz_out * 1000U) / rsz_in;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_rsz_coef_banks_range_start) - 1; i++)
+		if (rsz_ratio >= mali_c720_rsz_coef_banks_range_start[i])
+			break;
+
+	return i;
+}
+
+static u32 mali_c720_fr_pipe_calculate_scaling_factor(unsigned int input_width,
+						      unsigned int output_width)
+{
+	u64 scale;
+
+	/* The scaling factor is in Q4.20 format */
+	scale = (u64)input_width * MALI_C720_SCALER_FACTOR -
+		MALI_C720_SCALER_START_PHASE - 1;
+	do_div(scale, output_width - 1);
+
+	return (u32)(scale & 0xFFFFFFFF);
+}
+
+static void mali_c720_fr_pipe_update_resizer_config(struct mali_c720_fr_pipe *pipe,
+						    struct v4l2_subdev_state *state)
+{
+	struct mali_c720_fr_resizer_config *config = &pipe->resizer_config;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct v4l2_rect *scale, *crop;
+
+	fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO, 0);
+	scale = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO, 0);
+	crop = v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB, 0);
+
+	guard(spinlock)(&pipe->resizer_lock);
+
+	config->crop.start_x = (u32)crop->left;
+	config->crop.start_y = (u32)crop->top;
+	config->crop.size_x = crop->width;
+	config->crop.size_y = crop->height;
+	config->crop.bypass = crop->width == scale->width && crop->height == scale->height;
+	config->hfilt_enable = fmt->width != scale->width;
+	config->vfilt_enable = fmt->height != scale->height;
+	config->hfilt_tincr = 0;
+	config->vfilt_tincr = 0;
+	if (config->hfilt_enable)
+		config->hfilt_tincr = mali_c720_fr_pipe_calculate_scaling_factor(fmt->width,
+										 scale->width);
+	if (config->vfilt_enable)
+		config->vfilt_tincr = mali_c720_fr_pipe_calculate_scaling_factor(fmt->height,
+										 scale->height);
+	config->hbank = mali_c720_rsz_calculate_bank(fmt->width, scale->width);
+	config->vbank = mali_c720_rsz_calculate_bank(fmt->height, scale->height);
+
+	pipe->resizer_updated = true;
+}
+
+static void mali_c720_fr_pipe_bypass_scaler(struct mali_c720_context *ctx,
+					    unsigned int bypass)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+
+	mali_c720_ctx_group_write(ctx, mali_c720->top_base,
+				  &pipeline->bypass_fr0_rgb_scaler, bypass);
+}
+
+static void
+mali_c720_fr_pipe_program_scaler_coefficients(struct mali_c720_fr_pipe *pipe,
+					      const struct mali_c720_fr_resizer_config *config)
+{
+	struct mali_c720 *mali_c720 = pipe->mdev.mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	unsigned int i;
+	u32 haddr = pipe->scaler_hmem_base;
+	u32 vaddr = pipe->scaler_vmem_base;
+
+	for (i = 0; i < MALI_C720_RSZ_COEFS_ENTRIES; i++) {
+		mali_c720_ctx_write_raw(ctx, haddr,
+					mali_c720_rsz_filter_coeffs_h[config->hbank][i]);
+		mali_c720_ctx_write_raw(ctx, vaddr,
+					mali_c720_rsz_filter_coeffs_v[config->vbank][i]);
+
+		haddr += sizeof(u32);
+		vaddr += sizeof(u32);
+	}
+}
+
+static void mali_c720_fr_pipe_program_scaler(struct mali_c720_fr_pipe *pipe,
+					     const struct mali_c720_fr_resizer_config *config)
+{
+	struct mali_c720 *mali_c720 = pipe->mdev.mali_c720;
+	const struct mali_c720_rgb_scaler_regs *rgb_scaler =
+		mali_c720->registers.modules->rgb_scaler;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+
+	if (!config->hfilt_enable && !config->vfilt_enable)
+		return mali_c720_fr_pipe_bypass_scaler(ctx, 1);
+
+	mali_c720_fr_pipe_program_scaler_coefficients(pipe, config);
+
+	if (!config->hfilt_enable) {
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->hfilt_enable, 0);
+	} else {
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->hfilt_tincr,
+					  config->hfilt_tincr);
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->hfilt_start_phase,
+					  MALI_C720_SCALER_START_PHASE);
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->hfilt_enable, 1);
+	}
+
+	if (!config->vfilt_enable) {
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->vfilt_enable, 0);
+	} else {
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->vfilt_tincr,
+					  config->vfilt_tincr);
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->vfilt_start_phase,
+					  MALI_C720_SCALER_START_PHASE);
+		mali_c720_ctx_group_write(ctx, pipe->scaler_base,
+					  &rgb_scaler->vfilt_enable, 1);
+	}
+
+	mali_c720_fr_pipe_bypass_scaler(ctx, 0);
+}
+
+static void mali_c720_fr_pipe_bypass_crop(struct mali_c720_context *ctx,
+					  unsigned int bypass)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+
+	mali_c720_ctx_group_write(ctx, mali_c720->top_base,
+				  &pipeline->bypass_fr0_crop, bypass);
+}
+
+static void mali_c720_fr_pipe_program_crop(struct mali_c720_fr_pipe *pipe,
+					   const struct mali_c720_crop_config *crop)
+{
+	struct mali_c720 *mali_c720 = pipe->mdev.mali_c720;
+	const struct mali_c720_crop_regs *crop_regs = mali_c720->registers.modules->crop;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+
+	if (crop->bypass)
+		return mali_c720_fr_pipe_bypass_crop(ctx, 1);
+
+	mali_c720_ctx_group_write(ctx, pipe->crop_base, &crop_regs->start_x, crop->start_x);
+	mali_c720_ctx_group_write(ctx, pipe->crop_base, &crop_regs->start_y, crop->start_y);
+	mali_c720_ctx_group_write(ctx, pipe->crop_base, &crop_regs->size_x, crop->size_x);
+	mali_c720_ctx_group_write(ctx, pipe->crop_base, &crop_regs->size_y, crop->size_y);
+	mali_c720_ctx_group_write(ctx, pipe->crop_base, &crop_regs->enable_crop, 1);
+
+	mali_c720_fr_pipe_bypass_crop(ctx, 0);
+}
+
+void mali_c720_fr_pipe_apply_resizer_config(struct mali_c720_fr_pipe *pipe)
+{
+	struct mali_c720_fr_resizer_config *config = &pipe->resizer_config;
+
+	if (!pipe->mdev.mali_c720)
+		return;
+
+	guard(spinlock)(&pipe->resizer_lock);
+	if (!pipe->enabled_crops || !pipe->resizer_updated)
+		return;
+
+	mali_c720_fr_pipe_program_scaler(pipe, config);
+	mali_c720_fr_pipe_program_crop(pipe, &config->crop);
+	pipe->resizer_updated = false;
+}
+
+static void mali_c720_fr_pipe_program_output_formatter(struct mali_c720_fr_pipe *pipe)
+{
+	struct mali_c720 *mali_c720 = pipe->mdev.mali_c720;
+	const struct mali_c720_out_format_regs *out_format =
+		mali_c720->registers.modules->out_format;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	u32 base = pipe->output_formatter_base;
+
+	/* Default BT.709 limited-range RGB to YUV conversion in Q8 format. */
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_11, 47);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_12, 157);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_13, 16);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_21, 32794);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_22, 32855);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_23, 112);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_31, 112);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_32, 32869);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_33, 32777);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_o1, 4129);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_o2, 32768);
+	mali_c720_ctx_group_write(ctx, base, &out_format->coefft_o3, 32768);
+	mali_c720_ctx_group_write(ctx, base, &out_format->clip_min_y, 0);
+	mali_c720_ctx_group_write(ctx, base, &out_format->clip_max_y, 65535);
+	mali_c720_ctx_group_write(ctx, base, &out_format->clip_min_uv, 0);
+	mali_c720_ctx_group_write(ctx, base, &out_format->clip_max_uv, 65535);
+}
+
+static unsigned int mali_c720_fr_pipe_min_output_size(unsigned int input_size)
+{
+	u64 size;
+
+	/* Invert the phase-increment calculation and round up to fit Q4.20. */
+	size = (u64)input_size * MALI_C720_SCALER_FACTOR -
+	       MALI_C720_SCALER_START_PHASE - 1;
+
+	return (unsigned int)DIV_ROUND_UP_ULL(size, MALI_C720_MAX_DOWNSCALE_RATIO) + 1;
+}
+
+static int mali_c720_fr_pipe_enum_mbus_code(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index)
+		return -EINVAL;
+
+	switch (code->pad) {
+	case MALI_C720_FR_PIPE_PAD_SINK_VIDEO:
+		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
+	case MALI_C720_FR_PIPE_PAD_SOURCE_RGB:
+		code->code = MEDIA_BUS_FMT_RGB161616_1X48;
+		break;
+	case MALI_C720_FR_PIPE_PAD_SOURCE_YUV:
+		/*
+		 * Chroma subsampling limits the UV planes to 12 bits of precision,
+		 * although the media bus width remains 16 bits.
+		 */
+		code->code = MEDIA_BUS_FMT_YUV16_1X48;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_c720_fr_pipe_enum_frame_size(struct v4l2_subdev *sd,
+					     struct v4l2_subdev_state *state,
+					     struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct v4l2_rect *crop;
+
+	if (fse->index)
+		return -EINVAL;
+
+	switch (fse->pad) {
+	case MALI_C720_FR_PIPE_PAD_SINK_VIDEO:
+		if (fse->code != MEDIA_BUS_FMT_RGB121212_1X36)
+			return -EINVAL;
+
+		fse->min_width = MALI_C720_MIN_INPUT_WIDTH;
+		fse->min_height = MALI_C720_MIN_INPUT_HEIGHT;
+		fse->max_width = MALI_C720_MAX_WIDTH;
+		fse->max_height = MALI_C720_MAX_HEIGHT;
+
+		return 0;
+	case MALI_C720_FR_PIPE_PAD_SOURCE_RGB:
+		if (fse->code != MEDIA_BUS_FMT_RGB161616_1X48)
+			return -EINVAL;
+		break;
+	case MALI_C720_FR_PIPE_PAD_SOURCE_YUV:
+		if (fse->code != MEDIA_BUS_FMT_YUV16_1X48)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	crop = v4l2_subdev_state_get_crop(state, fse->pad);
+
+	fse->min_width = crop->width;
+	fse->min_height = crop->height;
+	fse->max_width = crop->width;
+	fse->max_height = crop->height;
+
+	return 0;
+}
+
+static int mali_c720_fr_pipe_set_fmt(struct v4l2_subdev *sd,
+				     const struct v4l2_subdev_client_info *ci,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	struct v4l2_rect *compose;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	/*
+	 * Disallow set_fmt on the source pads; format is fixed and the size
+	 * is propagated from the sink pad.
+	 */
+	if (format->pad != MALI_C720_FR_PIPE_PAD_SINK_VIDEO)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+
+	/*
+	 * Clamp to min/max and then reset crop and compose rectangles to the
+	 * newly applied size.
+	 */
+	sink_fmt->width = fmt->width;
+	sink_fmt->height = fmt->height;
+	v4l_bound_align_image(&sink_fmt->width, MALI_C720_MIN_INPUT_WIDTH,
+			      MALI_C720_MAX_WIDTH, 1,
+			      &sink_fmt->height, MALI_C720_MIN_INPUT_HEIGHT,
+			      MALI_C720_MAX_HEIGHT, 1, 0);
+
+	*fmt = *sink_fmt;
+
+	compose = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = sink_fmt->width;
+	compose->height = sink_fmt->height;
+
+	*v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB) = *compose;
+	*v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV) = *compose;
+
+	/*
+	 * Propagate format to source pads. On the RGB output pad use
+	 * the internal RGB processed format, and on the YUV pad use the internal
+	 * YUV processed format. The sizes on both pads are the same as the shared source
+	 * crop rectangle. The "code" "field" "colorspace" fields are set in
+	 * .init_state() and fixed for both source pads.
+	 */
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+	src_fmt->width = compose->width;
+	src_fmt->height = compose->height;
+
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV);
+	src_fmt->width = compose->width;
+	src_fmt->height = compose->height;
+
+	return 0;
+}
+
+static int mali_c720_fr_pipe_get_selection(struct v4l2_subdev *sd,
+					   const struct v4l2_subdev_client_info *ci,
+					   struct v4l2_subdev_state *state,
+					   struct v4l2_subdev_selection *sel)
+{
+	const struct v4l2_mbus_framefmt *sink_fmt;
+	const struct v4l2_rect *compose;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		if (sel->pad != MALI_C720_FR_PIPE_PAD_SOURCE_RGB &&
+		    sel->pad != MALI_C720_FR_PIPE_PAD_SOURCE_YUV)
+			return -EINVAL;
+
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		if (sel->pad != MALI_C720_FR_PIPE_PAD_SINK_VIDEO)
+			return -EINVAL;
+
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (sel->pad != MALI_C720_FR_PIPE_PAD_SOURCE_RGB &&
+		    sel->pad != MALI_C720_FR_PIPE_PAD_SOURCE_YUV)
+			return -EINVAL;
+
+		compose = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+		sel->r = (struct v4l2_rect) {
+			.width = compose->width,
+			.height = compose->height,
+		};
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		if (sel->pad != MALI_C720_FR_PIPE_PAD_SINK_VIDEO)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state, sel->pad);
+		sel->r = (struct v4l2_rect) {
+			.width = sink_fmt->width,
+			.height = sink_fmt->height,
+		};
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_c720_fr_pipe_set_crop(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_fr_pipe *pipe = mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *compose, *crop, adjusted_size;
+	struct v4l2_rect requested_size = {
+		.width = sel->r.width,
+		.height = sel->r.height,
+	};
+
+	crop = v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+	compose = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+
+	adjusted_size = requested_size;
+
+	/* Streaming fixes the output size, but crop offsets may still change. */
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity)) {
+		v4l2_rect_set_size_to(&adjusted_size, crop);
+	} else {
+		/* The alignment helper rounds odd sizes up; LE alone needs down. */
+		if ((sel->flags & V4L2_SEL_FLAG_LE) && !(sel->flags & V4L2_SEL_FLAG_GE)) {
+			adjusted_size.width &= ~1U;
+			adjusted_size.height &= ~1U;
+		}
+
+		v4l_bound_align_image(&adjusted_size.width, MALI_C720_MIN_OUTPUT_WIDTH,
+				      compose->width, 1,
+				      &adjusted_size.height, MALI_C720_MIN_OUTPUT_HEIGHT,
+				      compose->height, 1, 0);
+	}
+
+	/* GE/LE constrain size independently of crop position. */
+	if ((sel->flags & V4L2_SEL_FLAG_GE) &&
+	    !v4l2_rect_enclosed(&requested_size, &adjusted_size))
+		return -ERANGE;
+	if ((sel->flags & V4L2_SEL_FLAG_LE) &&
+	    !v4l2_rect_enclosed(&adjusted_size, &requested_size))
+		return -ERANGE;
+
+	crop->left = sel->r.left;
+	crop->top = sel->r.top;
+	v4l2_rect_set_size_to(crop, &adjusted_size);
+
+	/* Constrain offsets within the compose window and align to even pixels. */
+	v4l2_rect_map_inside(crop, compose);
+	crop->left &= ~1;
+	crop->top &= ~1;
+
+	*v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV) = *crop;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY ||
+	    !media_entity_is_streaming(&sd->entity)) {
+		src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+		src_fmt->width = crop->width;
+		src_fmt->height = crop->height;
+
+		src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV);
+		src_fmt->width = crop->width;
+		src_fmt->height = crop->height;
+	}
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		mali_c720_fr_pipe_update_resizer_config(pipe, state);
+
+	sel->r = *crop;
+	return 0;
+}
+
+static int mali_c720_fr_pipe_set_compose(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_selection *sel)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_fr_pipe *pipe = mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *crop, *compose, adjusted_size;
+	struct v4l2_rect requested_size = {
+		.width = sel->r.width,
+		.height = sel->r.height,
+	};
+	unsigned int min_width, min_height;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+	crop = v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+	compose = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+
+	min_width = mali_c720_fr_pipe_min_output_size(sink_fmt->width);
+	min_height = mali_c720_fr_pipe_min_output_size(sink_fmt->height);
+
+	/* Preserve the output crop size while streaming and respect the scaler limit. */
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity)) {
+		min_width = MAX(min_width, crop->width);
+		min_height = MAX(min_height, crop->height);
+	} else {
+		min_width = MAX(min_width, MALI_C720_MIN_OUTPUT_WIDTH);
+		min_height = MAX(min_height, MALI_C720_MIN_OUTPUT_HEIGHT);
+	}
+
+	/* The alignment helper rounds odd sizes up; LE alone needs down. */
+	adjusted_size = requested_size;
+	if ((sel->flags & V4L2_SEL_FLAG_LE) && !(sel->flags & V4L2_SEL_FLAG_GE)) {
+		adjusted_size.width &= ~1U;
+		adjusted_size.height &= ~1U;
+	}
+	v4l_bound_align_image(&adjusted_size.width, min_width, sink_fmt->width, 1,
+			      &adjusted_size.height, min_height, sink_fmt->height, 1, 0);
+
+	if ((sel->flags & V4L2_SEL_FLAG_GE) &&
+	    !v4l2_rect_enclosed(&requested_size, &adjusted_size))
+		return -ERANGE;
+	if ((sel->flags & V4L2_SEL_FLAG_LE) &&
+	    !v4l2_rect_enclosed(&adjusted_size, &requested_size))
+		return -ERANGE;
+
+	*compose = adjusted_size;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity)) {
+		/* Keep crop offsets inside the new compose bounds without resizing. */
+		v4l2_rect_map_inside(crop, compose);
+	} else {
+		*crop = *compose;
+	}
+
+	*v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV) = *crop;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY ||
+	    !media_entity_is_streaming(&sd->entity)) {
+		src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+		src_fmt->width = compose->width;
+		src_fmt->height = compose->height;
+
+		src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV);
+		src_fmt->width = compose->width;
+		src_fmt->height = compose->height;
+	}
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		mali_c720_fr_pipe_update_resizer_config(pipe, state);
+
+	sel->r = *compose;
+	return 0;
+}
+
+static int mali_c720_fr_pipe_set_selection(struct v4l2_subdev *sd,
+					   const struct v4l2_subdev_client_info *ci,
+					   struct v4l2_subdev_state *state,
+					   struct v4l2_subdev_selection *sel)
+{
+	/*
+	 * RGB and YUV share one post-scaler crop. Expose it on both source pads;
+	 * changing either updates the crop and output dimensions of both pads.
+	 */
+	if (sel->target == V4L2_SEL_TGT_CROP &&
+	    (sel->pad == MALI_C720_FR_PIPE_PAD_SOURCE_RGB ||
+	     sel->pad == MALI_C720_FR_PIPE_PAD_SOURCE_YUV))
+		return mali_c720_fr_pipe_set_crop(sd, state, sel);
+
+	if (sel->target == V4L2_SEL_TGT_COMPOSE &&
+	    sel->pad == MALI_C720_FR_PIPE_PAD_SINK_VIDEO)
+		return mali_c720_fr_pipe_set_compose(sd, state, sel);
+
+	return -EINVAL;
+}
+
+static int mali_c720_fr_pipe_enable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state, u32 pad,
+					    u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720 *mali_c720 = mdev->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	struct mali_c720_fr_pipe *pipe =
+		mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct v4l2_subdev *src_sd;
+	struct media_pad *sink_pad;
+	int ret;
+
+	sink_pad = &pipe->pads[MALI_C720_FR_PIPE_PAD_SINK_VIDEO];
+	pipe->remote_src = media_pad_remote_pad_unique(sink_pad);
+	if (IS_ERR(pipe->remote_src)) {
+		dev_err(mali_c720->dev,
+			"No remote source for fr 0 pipe\n");
+		return -EINVAL;
+	}
+
+	src_sd = media_entity_to_v4l2_subdev(pipe->remote_src->entity);
+	mali_c720_ctx_group_write(ctx, mali_c720->top_base,
+				  &pipeline->fr0_hv_cv_mux_sel,
+				  ISP_TOP_FR0_HV_CV_MUX_SEL_HV);
+
+	/* Enable the upstream subdevice unless another output already enabled it. */
+	ret = v4l2_subdev_enable_streams(src_sd, pipe->remote_src->index, BIT(0));
+	if (ret && ret != -EALREADY)
+		return ret;
+
+	mali_c720_fr_pipe_update_resizer_config(pipe, state);
+	if (pad == MALI_C720_FR_PIPE_PAD_SOURCE_YUV)
+		mali_c720_fr_pipe_program_output_formatter(pipe);
+
+	guard(spinlock)(&pipe->resizer_lock);
+	pipe->enabled_crops |= BIT(pad);
+
+	return 0;
+}
+
+static int mali_c720_fr_pipe_disable_streams(struct v4l2_subdev *sd,
+					     struct v4l2_subdev_state *state, u32 pad,
+					     u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_fr_pipe *pipe =
+		mali_c720_sd_to_sd(mdev, struct mali_c720_fr_pipe);
+	struct v4l2_subdev *src_sd;
+
+	if (pipe->remote_src) {
+		src_sd = media_entity_to_v4l2_subdev(pipe->remote_src->entity);
+		v4l2_subdev_disable_streams(src_sd, pipe->remote_src->index,
+					    BIT(0));
+	}
+	pipe->remote_src = NULL;
+
+	guard(spinlock)(&pipe->resizer_lock);
+	pipe->enabled_crops &= ~BIT(pad);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c720_fr_pipe_pad_ops = {
+	.enum_mbus_code		= mali_c720_fr_pipe_enum_mbus_code,
+	.enum_frame_size	= mali_c720_fr_pipe_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c720_fr_pipe_set_fmt,
+	.get_selection		= mali_c720_fr_pipe_get_selection,
+	.set_selection		= mali_c720_fr_pipe_set_selection,
+	.link_validate		= v4l2_subdev_link_validate_default,
+	.enable_streams		= mali_c720_fr_pipe_enable_streams,
+	.disable_streams	= mali_c720_fr_pipe_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mali_c720_fr_pipe_ops = {
+	.pad	= &mali_c720_fr_pipe_pad_ops,
+};
+
+static int mali_c720_fr_pipe_init_state(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *out_crop, *in_compose;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+	in_compose = v4l2_subdev_state_get_compose(state, MALI_C720_FR_PIPE_PAD_SINK_VIDEO);
+	out_crop = v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+
+	sink_fmt->width = MALI_C720_DEFAULT_WIDTH;
+	sink_fmt->height = MALI_C720_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, sink_fmt->colorspace,
+					      sink_fmt->ycbcr_enc);
+
+	in_compose->top = 0;
+	in_compose->left = 0;
+	in_compose->width = MALI_C720_DEFAULT_WIDTH;
+	in_compose->height = MALI_C720_DEFAULT_HEIGHT;
+
+	*out_crop = *in_compose;
+	*v4l2_subdev_state_get_crop(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV) = *out_crop;
+
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_RGB);
+	src_fmt->width = MALI_C720_DEFAULT_WIDTH;
+	src_fmt->height = MALI_C720_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_RGB161616_1X48;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+	src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
+	src_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, src_fmt->colorspace,
+					      src_fmt->ycbcr_enc);
+
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_FR_PIPE_PAD_SOURCE_YUV);
+	src_fmt->width = MALI_C720_DEFAULT_WIDTH;
+	src_fmt->height = MALI_C720_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_YUV16_1X48;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_709;
+	src_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, src_fmt->colorspace,
+					      src_fmt->ycbcr_enc);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops mali_c720_fr_pipe_internal_ops = {
+	.init_state = mali_c720_fr_pipe_init_state,
+};
+
+static int mali_c720_fr_pipe_fetch_discovery_data(struct mali_c720 *mali_c720,
+						  struct mali_c720_fr_pipe *pipe)
+{
+	const struct mali_c720_discovery_target crop = {
+		.module_id = MALI_C720_DISC_MODULE_ID_CROP,
+		.pipeline_id = MALI_C720_DISC_PIPE_FR_OUTPUT,
+	};
+	const struct mali_c720_discovery_target scaler = {
+		.module_id = MALI_C720_DISC_MODULE_ID_SCALER_RGB,
+		.pipeline_id = MALI_C720_DISC_PIPE_FR_OUTPUT,
+	};
+	const struct mali_c720_discovery_target output_formatter = {
+		.module_id = MALI_C720_DISC_MODULE_ID_OUTPUT_FORMATTER,
+		.pipeline_id = MALI_C720_DISC_PIPE_FR_OUTPUT,
+	};
+	int ret;
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, &crop, &pipe->crop_base);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, &scaler,
+						  &pipe->scaler_base);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, &output_formatter,
+						  &pipe->output_formatter_base);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_discovery_get_module_table_base(mali_c720, &scaler,
+							MALI_C720_DISC_TABLE_SCALER_RGB_H_MEM_ID,
+							&pipe->scaler_hmem_base);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_discovery_get_module_table_base(mali_c720, &scaler,
+							MALI_C720_DISC_TABLE_SCALER_RGB_V_MEM_ID,
+							&pipe->scaler_vmem_base);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct media_entity_operations mali_c720_fr_pipe_media_ops = {
+	.link_validate		= v4l2_subdev_link_validate,
+};
+
+int mali_c720_register_fr_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_fr_pipe *pipe = &mali_c720->fr_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+	struct v4l2_subdev *sd = &mdev->sd;
+	int ret;
+
+	ret = mali_c720_fr_pipe_fetch_discovery_data(mali_c720, pipe);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"Failed to fetch discovery data for fr 0 pipe: %d\n", ret);
+		return ret;
+	}
+
+	mdev->mali_c720 = mali_c720;
+
+	spin_lock_init(&pipe->resizer_lock);
+	v4l2_subdev_init(sd, &mali_c720_fr_pipe_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.ops = &mali_c720_fr_pipe_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->internal_ops = &mali_c720_fr_pipe_internal_ops;
+	strscpy(sd->name, "mali-c720 fr 0 pipe", sizeof(sd->name));
+
+	pipe->pads[MALI_C720_FR_PIPE_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+							     MEDIA_PAD_FL_MUST_CONNECT;
+	pipe->pads[MALI_C720_FR_PIPE_PAD_SOURCE_RGB].flags = MEDIA_PAD_FL_SOURCE;
+	pipe->pads[MALI_C720_FR_PIPE_PAD_SOURCE_YUV].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity,
+				     MALI_C720_FR_PIPE_NUM_PADS,
+				     pipe->pads);
+	if (ret)
+		goto err_clear_parent;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_device_register_subdev(&mali_c720->v4l2_dev, sd);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+err_clear_parent:
+	mdev->mali_c720 = NULL;
+
+	return ret;
+}
+
+void mali_c720_unregister_fr_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_fr_pipe *pipe = &mali_c720->fr_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_device_unregister_subdev(&mdev->sd);
+}
+
+void mali_c720_cleanup_fr_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_fr_pipe *pipe = &mali_c720->fr_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_subdev_cleanup(&mdev->sd);
+	media_entity_cleanup(&mdev->sd.entity);
+	mdev->mali_c720 = NULL;
+}

-- 
2.55.0

