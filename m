Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540136;
	b=whdA8utboaASAyUd1skjqj4xd8IL9UtuSJfFpuLA4AcxDKqVK4cchqjVMQobXu6fJNTV
	 t+AFdByMq0TchY3jqQ0ilHlbrh2FYbrOAE9mCA8KPCRGSXvY2S4L5do4ltWxfW1w53kYF
	 ZVzakIe0Vua7tE4UaHIjKugh2vBR6YG5ED3YoGk846WOAEe4efiD1NjOx/DOLsI+NJQcq
	 YP9pjqwoMIjjLwE+NNazvgl+4fdgU/DBQxg2YCVCnLPWjhzYcoPtGCGA8POGVbpLwZ1tY
	 dduildfJlcKEKLgR4WGRAclb+jkWV+AtVMpuuKaOtaPxDhzLf68xjuzjekZZgVWV2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540136;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0RVu/z+gUm67JSyCZkZQDUBjTuH8JpC54wDZtuX1RLU=;
	b=etZm1nWT5c34Rcyu46Pt4Z+R6Uc5dlihQ4miixUfynbZjpFBphBTtxOZGXce4VaVXcgk
	 rJLrduZtrx5GEEy0s8PyT70LGCrroSUx3xdcMZoAIk07HQDkVF3e88wZF3XgeiOFXAfrA
	 CqFp1R7iBOQMikZgvTm1ZWFoQ1oO/UsJWo1lQfyMrF8wvK3VpNnuolzyfcvP6b8VY5KBx
	 raJ8G3AAE3skdCjtqttXbF7y3CUszOPLzVRxJ2mX411B3g4dkIeKhUkPaGj+w1kWVbip9
	 ciZ3btc8DXRPwGOyIOaPWf+UY2IklOMdyyoXe6j+o1c1l5jGI7hqCFIl+EZIvEe2/cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n80xmAdf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A437560A260B;
	Tue, 24 Nov 2026 17:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A437560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n80xmAdf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CDC51BCA;
	Tue, 24 Nov 2026 09:08:52 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 506913F763;
	Tue, 24 Nov 2026 09:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540135; bh=1VDMzkE8mn8gQAx2meicpsU8GrquiFVmRmZJ57u7SsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n80xmAdfDMU+Z5rqu7JjByNFeo1wErf1D6myQ8uTgsW4OcAt4Ba5XW2oPZ3I11MjE
	 MxkOmsILuNjkjpuq/YMHTAx1Pj+jA1E0sUkc6RZ/Q0rQ7LKF9vkiHglF1QW6QO33ra
	 +O3Wr1YaDFjA7mOdYhklQiWG3NuFKwIqvfy4gJ8o=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:45 +0000
Subject: [PATCH 17/24] media: uapi: Add statistics structs to
 mali-c720-config.h
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-17-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=7373;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=dXq0+EuuWHqTSaaaas7PwGyMzZpHf/IdV/CLomR2P78=;
 b=ECuMqv8kzKe2XP0I7fihk8cravIsv7SWmFUo3xTrWxBP9eCcMiPRcHKDO44z55RUrm6/1JGzm
 vvgIExcM+aUA/Iyp+DcS+o7s+O0ieraOwIIc3UGpyryt5A6pztwoUkz
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Describe the format of the 3A statistics buffers in the userspace API
for the Mali-C720 ISP.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 include/uapi/linux/media/arm/mali-c720-config.h | 184 ++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/include/uapi/linux/media/arm/mali-c720-config.h b/include/uapi/linux/media/arm/mali-c720-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..445cae09a84cce37de9b15e051b93f96b06cbc50
--- /dev/null
+++ b/include/uapi/linux/media/arm/mali-c720-config.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef __UAPI_MALI_C720_CONFIG_H
+#define __UAPI_MALI_C720_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/v4l2-controls.h>
+#include <linux/media/v4l2-isp.h>
+
+#define MALI_C720_MAX_ZONES 1024
+
+/**
+ * struct mali_c720_awb_stats_nodes_used - Color statistics zone dimensions
+ * @reserved1: Undefined buffer space
+ * @nodes_used_horiz: Number of horizontal zones used for this frame
+ * @nodes_used_vert: Number of vertical zones used for this frame
+ * @reserved2: Undefined buffer space
+ *
+ * The product of the dimensions gives the number of valid zone records in
+ * &struct mali_c720_awb_statistics, up to MALI_C720_MAX_ZONES.
+ */
+struct mali_c720_awb_stats_nodes_used {
+	__u8 reserved1[8];
+	__u8 nodes_used_horiz;
+	__u8 nodes_used_vert;
+	__u8 reserved2[6];
+} __attribute__((aligned(16)));
+
+/**
+ * struct mali_c720_awb_statistics_tail - Global color statistics
+ * @global_rg: Global R/G or G/R ratio, in Q4.8 format
+ * @global_bg: Global B/G or G/B ratio, in Q4.8 format
+ * @global_num_pixels: Number of accepted pixels after zone weighting
+ * @frame_count: Frame counter
+ * @crc16: Statistics CRC
+ * @reserved: Undefined buffer space
+ *
+ * This structure contains the global color ratios and pixel count. It follows
+ * the active zone records and can be located using mali_c720_awb_stats_tail().
+ * The ratio mode is selected by awb_stats_mode in
+ * &struct mali_c720_params_color_stats. See &enum mali_c720_awb_stats_mode.
+ */
+struct mali_c720_awb_statistics_tail {
+	__le16 global_rg;
+	__le16 global_bg;
+	__le32 global_num_pixels;
+	__le32 frame_count;
+	__le16 crc16;
+	__u8 reserved[2];
+};
+
+/**
+ * struct mali_c720_awb_statistics - Per-zone and global color statistics
+ * @zones: Zone records in row-major order, starting at the top left
+ * @zones.avg_rg: R/G or G/R ratio, in Q4.8 format
+ * @zones.avg_bg: B/G or G/B ratio, in Q4.8 format
+ * @zones.num_pixels: Number of accepted pixels in the zone before weighting
+ * @tail_reserved: Undefined buffer space
+ * @nodes_used: Zone dimensions used for this frame
+ *
+ * The ISP collects average color ratios and pixel counts for each zone. The
+ * global statistics follow the last active zone and can be located using
+ * mali_c720_awb_stats_tail(). The ratio mode is selected by awb_stats_mode in
+ * &struct mali_c720_params_color_stats. See &enum mali_c720_awb_stats_mode.
+ */
+struct mali_c720_awb_statistics {
+	struct {
+		__le16 avg_rg;
+		__le16 avg_bg;
+		__le32 num_pixels;
+	} zones[MALI_C720_MAX_ZONES];
+
+	__u8 tail_reserved[sizeof(struct mali_c720_awb_statistics_tail)];
+	struct mali_c720_awb_stats_nodes_used nodes_used;
+} __attribute__((aligned(16)));
+
+static inline struct mali_c720_awb_statistics_tail *
+mali_c720_awb_stats_tail(struct mali_c720_awb_statistics *stats)
+{
+	return (struct mali_c720_awb_statistics_tail *)
+		(stats->zones + stats->nodes_used.nodes_used_horiz *
+		 stats->nodes_used.nodes_used_vert);
+}
+
+/**
+ * struct mali_c720_ae_1024bin_hist - Histogram statistics
+ * @bins: 1024 compressed, weighted pixel counts
+ * @total_pixels: Number of sampled pixels before weighting
+ * @counted_pixels: Sum of weights accumulated in all histogram banks
+ * @plane_total: Sampled pixel counts for each bank before weighting
+ * @plane_counted: Sum of weights accumulated in each bank
+ * @frame_count: Frame counter
+ * @crc16: Statistics CRC
+ * @reserved: Undefined buffer space
+ *
+ * The histogram collects a zone-weighted distribution of pixel intensities.
+ * The configured plane mode selects one 1024-bin histogram, four 256-bin
+ * histograms or two 512-bin histograms, stored consecutively in @bins. The
+ * bank counters follow the same order.
+ *
+ * Each bin contains a four-bit exponent followed by a twelve-bit mantissa.
+ * An approximate weighted pixel count can be decoded as::
+ *
+ *     e = bin >> 12;
+ *     m = bin & 0xfff;
+ *     count = (e ? (m + 4096) << (e - 1) : m) * 4;
+ */
+struct mali_c720_ae_1024bin_hist {
+	__le16 bins[1024];
+	__le32 total_pixels;
+	__le32 counted_pixels;
+	__le32 plane_total[4];
+	__le32 plane_counted[4];
+	__le32 frame_count;
+	__le16 crc16;
+	__u8 reserved[2];
+} __attribute__((aligned(16)));
+
+/**
+ * enum mali_c720_stats_type - Mali-C720 statistics block targets
+ * @MALI_C720_STATS_NOOP: No data; skip the block using its size.
+ * @MALI_C720_STATS_HISTOGRAM_INP: Input histogram statistics.
+ * @MALI_C720_STATS_HISTOGRAM_HV: HV histogram statistics (pre-Iridix).
+ * @MALI_C720_STATS_HISTOGRAM_HV_IRIDIX: HV histogram statistics (post-Iridix).
+ * @MALI_C720_STATS_COLOR_HV: HV color statistics.
+ */
+enum mali_c720_stats_type {
+	MALI_C720_STATS_NOOP,
+	MALI_C720_STATS_HISTOGRAM_INP,
+	MALI_C720_STATS_HISTOGRAM_HV,
+	MALI_C720_STATS_HISTOGRAM_HV_IRIDIX,
+	MALI_C720_STATS_COLOR_HV,
+	MALI_C720_STATS_MAX,
+};
+
+/**
+ * struct mali_c720_stats_color - Color statistics block
+ * @header: Generic V4L2 ISP block header; type identifies the color statistics
+ *          target from &enum mali_c720_stats_type
+ * @reserved: Undefined buffer space
+ * @data: Color statistics payload
+ */
+struct mali_c720_stats_color {
+	struct v4l2_isp_block_header header;
+	__u8 reserved[8];
+	struct mali_c720_awb_statistics data;
+};
+
+/**
+ * struct mali_c720_stats_histogram - Histogram statistics block
+ * @header: Generic V4L2 ISP block header; type identifies the histogram target
+ *          from &enum mali_c720_stats_type
+ * @reserved: Undefined buffer space
+ * @data: Histogram payload
+ */
+struct mali_c720_stats_histogram {
+	struct v4l2_isp_block_header header;
+	__u8 reserved[8];
+	struct mali_c720_ae_1024bin_hist data;
+};
+
+/**
+ * MALI_C720_STATS_MAX_SIZE - Maximum serialized statistics block size
+ *
+ * Maximum size of all statistics blocks in a full hardware configuration,
+ * including the initial NOOP block used for alignment, but excluding the
+ * struct v4l2_isp_buffer header. The actual buffer size depends on the
+ * discovered statistics blocks and is reported through the metadata format.
+ */
+#define MALI_C720_STATS_MAX_SIZE				\
+	(sizeof(struct v4l2_isp_block_header) +			\
+	 sizeof(struct mali_c720_stats_color) +			\
+	 sizeof(struct mali_c720_stats_histogram) +		\
+	 sizeof(struct mali_c720_stats_histogram) +		\
+	 sizeof(struct mali_c720_stats_histogram))
+
+#define V4L2_CID_MALI_C720_STATS_CAPABILITIES		(V4L2_CID_USER_MALI_C720_BASE + 0)
+
+#endif

-- 
2.55.0

