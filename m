Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78618344024;
	Mon, 18 May 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099990; cv=none; b=Mm41NTlyzYJ45DtfeWUBNCH10w0/7+7OSOKuBskIOUF7uFeEENU7Y21u8UVxHX7AG/cQRlm5w92EGwXNb07VOOwDg2XcwSlqI8gauiK/jXOPhwdeY3r8Y5BAc09DhUKJwywNwtxkfT+cnAVkn6BhbIfMBBCxXN7XZf5ma4LXZ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099990; c=relaxed/simple;
	bh=vXy7wGbCoWon8e0bM6D24f1MQwlaCnUDtj8yulvwCl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5VVNv5CYQQO942UemG/k2knXNhu8ycrMTYZVJOdG+KLxkPi9AZhwIT+tGgm82KzNF0uy5v2OoRjO+AxY813GfGnb9JAe046EL/pqTALHsEcZmB1aQo9PiEaikRUoz9+g8HC98lzbHm51WQv0NCxMyibMK0M+zYdlpiMJIGtqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 852A91F80041;
	Mon, 18 May 2026 10:26:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 07D73B40802; Mon, 18 May 2026 10:26:26 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id C362EB407F0;
	Mon, 18 May 2026 10:24:53 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 02/16] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Mon, 18 May 2026 12:24:37 +0200
Message-ID: <20260518102451.417971-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arash Golgol <arash.golgol@gmail.com>

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.54.0

