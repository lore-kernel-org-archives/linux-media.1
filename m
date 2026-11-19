Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102728;
	b=ZrVul8CGMdSdv03SqHVwPoeTGUqv+aJr7PD7S9qwOsaZHNNpdF6ybEzFjfAZLvBYM5XF
	 Z9UTMwNEwtN5/vfNMQC1z3DiGsTd5OqAUmb3nq8ZU4WdT0/mE3XLhe8qE0s9Y5SCcxbak
	 LBkM1Ym+A2v6nO4Z42neDGvRvXAxXv4wyjckoarLZ3s0c2OUcLbtekkeS5SnrRHhARUBf
	 C3Ke+Do2YSKe6xDE9NzPJKq9AG9dqhaA8dF6MtQDyacNJk30k6+HVTVyBG51c7/NqpG6p
	 mPHv3ckksIGLDAFQJ8dDI2QQHV0iLYgvWnXHQDHn5bOnU2wjL2spVe+6BF5FeB4kiVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102728;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t/ptjTUIZontaktGiNEpiUvDRFxFjpZ4bo7hFzEny+A=;
	b=4UURRQZU9Mrs+blrlz13ETHFcBpgRH1ReW15/Hf0U3Pb7FPkWdbq9TTPw03njOyazIfD
	 jAQgOIyM+oVmzselKYiBbybrCf9QoKouPfk/AEGQVOHdbF3zo+qvJScY94xb3t7k8vfdA
	 EQBjqsM0nGAp7cM+SHs0kC2Zp0PiYTrtRgh92SamZ3nyqwcNH+uLcPuWUE0UqbRoKnr60
	 yt+CBiVIF/1Y1FndZXIV60mKE/kRgQrDs57QrAEDzNuoQYY/R4ue61/HR0EidV3V2et1t
	 vsupxd+eVH6jU5JDkDV3OI+nj0I/i6/LSDSVS2rf1+/Ko0O5lWMPKO3A5jqn7H87VKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AlQgGip5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F68960A5BDA;
	Thu, 19 Nov 2026 15:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F68960A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AlQgGip5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 549CD1C25;
	Thu, 19 Nov 2026 07:38:35 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C02703F882;
	Thu, 19 Nov 2026 07:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102718; bh=q1wmOkXsrySVQhcHOt3ZfSMiGZiDmnncuDgR3I9FjOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlQgGip5GpTjqGb7Xi0hN613676MbGZG6D0WqFDpd/dN778Lt5JL1sVA2GfUWb3Ux
	 KABotX+9D6CvQTFvVYiPPtE6P0oF4vfKXebf3sZ9L/0qAHZ8iuW7wgjCBfawaK8WC8
	 Yp7c3XxAtRrbNVRlReL4wKTUhFUtc4tuolT/GLPw=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 06/28] media: mali-vpu: implement format query ioctls
Date: Thu, 19 Nov 2026 15:37:36 +0000
Message-ID: <20261119153758.1426673-7-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose H.264 as the decoder OUTPUT format and YUV420M, NV12M, NV21M as the
CAPTURE formats through VIDIOC_ENUM_FMT.

Implement VIDIOC_ENUM_FRAMESIZES to report the variant-specific stepwise
frame size limits. Add VIDIOC_G_FMT support to return the current source
and destination formats for each session.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   5 +
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 152 ++++++++++++++++--
 2 files changed, 146 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index dfd1833f884af..f8a602cb59006 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -49,4 +49,9 @@ struct mali_vpu_session {
 int mali_vpu_session_init(struct mali_vpu_session *sess);
 void mali_vpu_session_cleanup(struct mali_vpu_session *sess);
 
+static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct mali_vpu_session, fh);
+}
+
 #endif /* __MALI_VPU_SESSION_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index aaf604beff93a..b993255b8c817 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -12,7 +12,9 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 
+#include "mali-vpu-formats.h"
 #include "mali-vpu-session.h"
+#include "mali-vpu-variant.h"
 #include "mali-vpu-vidioc.h"
 
 static int mali_vpu_open(struct file *filp)
@@ -56,8 +58,7 @@ static int mali_vpu_open(struct file *filp)
 
 static int mali_vpu_release(struct file *filp)
 {
-	struct mali_vpu_session *sess = container_of(file_to_v4l2_fh(filp),
-						     struct mali_vpu_session, fh);
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
 
 	mali_vpu_session_cleanup(sess);
 	v4l2_fh_del(&sess->fh, filp);
@@ -105,14 +106,143 @@ static int mali_vpu_querycap(struct file *filp, void *fh,
 	return 0;
 }
 
+static int mali_vpu_enum_fmt(struct file *filp, void *fh,
+			     struct v4l2_fmtdesc *f)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	const struct mali_vpu_format_list *fmt_list;
+
+	switch (f->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt_list = &sess->port_src.supported_fmts;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt_list = &sess->port_dst.supported_fmts;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (f->index >= fmt_list->num_fmts)
+		return -EINVAL;
+
+	f->pixelformat = fmt_list->fmts[f->index].fourcc;
+	f->flags = fmt_list->fmts[f->index].flags;
+	return 0;
+}
+
+static const struct v4l2_format *mali_vpu_get_port_fmt(struct mali_vpu_session *sess,
+						       u32 type)
+{
+	const struct mali_vpu_port *port;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		port = &sess->port_src;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		port = &sess->port_dst;
+		break;
+	default:
+		return NULL;
+	}
+
+	return &port->curr_fmt;
+}
+
+static int mali_vpu_g_fmt(struct file *filp, void *fh, struct v4l2_format *fmt)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	const struct v4l2_format *port_fmt;
+	int ret = 0;
+
+	mutex_lock(&sess->vq_lock);
+
+	port_fmt = mali_vpu_get_port_fmt(sess, fmt->type);
+	if (port_fmt)
+		*fmt = *port_fmt;
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&sess->vq_lock);
+	return ret;
+}
+
+static const struct mali_vpu_format_desc *mali_vpu_find_format(struct mali_vpu_session *sess,
+							       u32 pixfmt, u32 type)
+{
+	const struct mali_vpu_format_desc *fmt_list;
+	u32 num_fmts;
+	u32 i;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt_list = sess->port_src.supported_fmts.fmts;
+		num_fmts = sess->port_src.supported_fmts.num_fmts;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt_list = sess->port_dst.supported_fmts.fmts;
+		num_fmts = sess->port_dst.supported_fmts.num_fmts;
+		break;
+	default:
+		return NULL;
+	}
+
+	for (i = 0; i < num_fmts; i++) {
+		if (fmt_list[i].fourcc == pixfmt)
+			return &fmt_list[i];
+	}
+
+	return NULL;
+}
+
+static int mali_vpu_validate_format(struct mali_vpu_session *sess, u32 pixfmt)
+{
+	const struct mali_vpu_format_desc *fmt;
+
+	fmt = mali_vpu_find_format(sess, pixfmt, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!fmt) {
+		fmt = mali_vpu_find_format(sess, pixfmt, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!fmt)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_enum_framesizes(struct file *filp, void *fh,
+				    struct v4l2_frmsizeenum *fsize)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	const struct mali_vpu_framesize_caps *fmsz = &sess->vpu_dev->variant->frmsz_caps;
+	int ret;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	ret = mali_vpu_validate_format(sess, fsize->pixel_format);
+	if (ret)
+		return ret;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = fmsz->stepwise;
+
+	return 0;
+}
+
 const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
-	.vidioc_querycap	= mali_vpu_querycap,
-	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
-	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
-	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
-	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
-	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
-	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
-	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
-	.vidioc_remove_bufs	= v4l2_m2m_ioctl_remove_bufs,
+	.vidioc_querycap		= mali_vpu_querycap,
+	.vidioc_enum_fmt_vid_out	= mali_vpu_enum_fmt,
+	.vidioc_enum_fmt_vid_cap	= mali_vpu_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane	= mali_vpu_g_fmt,
+	.vidioc_g_fmt_vid_cap_mplane	= mali_vpu_g_fmt,
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_remove_bufs		= v4l2_m2m_ioctl_remove_bufs,
+	.vidioc_enum_framesizes		= mali_vpu_enum_framesizes,
 };
-- 
2.43.0

