Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246676;
	b=SBinDFnVPzlK4jglEnAVRJ6eYawwW5lQ5Tmgv0VJlNvMz0vt1H3GfrlBZTX8H1tjoRP+
	 szf76nIW2CgMk+lmjWCdyhFSxvQTWA+M6QtWK+wAqWf69x4xQGYF7DBlnjL9Sn5L+Rssf
	 xMcuNeX//ABcg+jSB6dgc64vVwbxUCZX7MYoSsOamaqhBlqFR+Rt/JUvllo9I8fVjz7D5
	 6lnSP+Bq5KjNQJBNj2qWOC17uMPlXzw2E6vP/LYyX1WLWt/PJkJjm4Sv0sexB4cfwRP5Z
	 8vSH8LvTVGb82NzsLuAGldFcjirbdz5QQWG5gRjpn3LwAN0QHmqzYZqjJln8c6ptAJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
	b=QK53RE4taI6ZNFsSFJ+xn85X5ojqS9XrLMCkShTkpwf5Q9tfLcFak47PXbXKnJKYQ+5Q
	 4B+nMgUp6EiFNTZkFcFoHeS0YvjPHjrjv8SzSCCvXfgvxTeK/Q076ImHi3MBWbBJhqfsg
	 dPQjsH1mjct18aNaSUAuvqOrc9tSQ4rx48ElSG1e6B81/DvAdsmqqHmNzP7e0+57Rrocz
	 T73YmzaK7jT7WMLxqvCcMoIzfRp++m19DtBQKieX3VcMFH3VtIgGaZ6HB6g16E9rCLtUk
	 6R1FyuewEzSDQPduf+VHkcTdtTC8KQ8M0sB68WTbv61+EM7z/lTWuDvVQgaPJaUBZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFj2wQAH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5A60A2604
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE5A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFj2wQAH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7055865e9.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246675; x=1794851475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=uFj2wQAHPEFRu5o+V9QzgKrmpmZFhpR17p1/BdPuKU3i9YXvay3sqVHBT/wPdUvMnE
         2Gq1j4i4+bGR2mMow6WeB4H0dB+W+G6Aviu8wrvTVtplioS8onpQbLUaNPFqdYHJ+6tH
         aJAEk36ooluQymg3lAf3B1MojQWzrMKiWW4SMMU/0NevIJUwI9xHXHjryFbdGL44dtX3
         FnZsIU8sckk3Lv8nGoipvQZn3tcdkLtNum027x63iPnmbzWeUmv2WCcH+Zd6b7DUyAH7
         XqlFlDmZ+qEYcKuOpSH0gOKNIJmwuahxZDtmX8y+yxayTl8vtaHn8QoDp6tEy/UdDO5t
         ErKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246675; x=1794851475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=fRopkCG7L4BcOG/ckBXvRqAJMIz7MqGDTH20rMDupaKcc/TVMQ9Gv8bBHhPgVwefx3
         CPov62txF/66uEwKlxSDUp8pzkdhXYdzdkwFbAj8A0qiwWXV08JjtzMGMH2jvT/7ax8v
         JqB9rpmsteJZ0IpS80z9qWY66iB+ODAkoi+NWuazMtZypAsQZaQ52MG70BUJB2ki7yE1
         cz7/ZIJ/lQ2wrycgm6i6tDIIdjAxkxwwq0RtGVptxNPrBo06M4/vTRAFbDa0r/mg0y45
         JH8cBly/UeVOfQ1E74qdhwm/qA7NzGtkZmT96OWQ3Z4N3O7l9bgJS2DSndU2HxqX//Ss
         X5ug==
X-Forwarded-Encrypted: i=1; AL+hErGIhCw4nKxaRZdw8MYnHqzaEN2YqPv6B217B8jQlY5dp+3+cvjdlpk/8TzHjvKIhGPB0rRN2gIxUByUUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z95pqEK7StoV3S5Bja0wSd1htXSCgxCMVQTw8yNuVU2izf58XLS
	ofzydYrZjcgbwbxg25IDEBssyHEuGDiwZ1CpXwnIcS/t4ki37nRjxF2m
X-Gm-Gg: AYBFou3lfYxCjd+cQlB9TlqmLN8u2MYEFtT4jvtisATrWxkWX1p39gKERBtACfYVGQJ
	4URux/Eyt4pL3uHc6JAJptzZFCWpVFxTeWgie6I+8G666tfginScm255786p76nhU1YYCwpZwo7
	VYQokI16aI3vDav/loILUQje707KWhvmtKRZ9W+bZbui+O4AoB9q544i9OmiO44l4UyX6XsghOB
	VYXwjtP9TlILjq/eNfYSxP2YATmTu3c4/etyEv3iTN4VuloAK6Qape1IRMoKtQvQePxfVIBbv1o
	tpbPl6LDvWdxFKuMTockYqlq314El7G8Cy8x2bKavZzM9l0M+gBy/wzHURj5a5jf0v9tIPtLS46
	88/5IvLPqOFP0ht2vPLEmyDJaEpdEZnkd5wQBHME6WB2M0vJRxTAbeaPV3pr78ZzKIyEmqdtwyn
	krcNKPCWmZrqx1P7RdlhET73OSY3ex0frqLsUNFxQh3j6awqxpxDY7QUoerr18J9KqqOK7uNSmI
	fdGppHvzhmpemzLbhWisVE7bqkJeuIxBIoTrn0ulskce+BiE+TlX+5sAGOJ40VZjSMvZRmxTZ6P
	E2stjLY++9rwvIyYl4ahLrhZn4CR7a8X3aEylmifyvz+58ZaSisi54blF8t63ydmPl13Gva70JZ
	i+jLJuHpeNUCTtfl/c8JYRzdSLdg5vbql6RyqGYKfB0U3tlHsWa62fuX36BxxfS9jiuE8JluXuH
	97KCiDgiSl6h58qtWxHoa5j8bQ0kKBSq27FsIVnYuedEdtLyOZptVk1nZ6X6tVsZ+A0/PYOorAU
	wuL2T3/BaVVgUfSe1GHELAoh5jjA/lJQyvcypMrt7qcT/Yzioo=
X-Received: by 2002:a05:600c:1d08:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4b963c8156fmr85596545e9.28.1794246674551;
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
Date: Mon,  9 Nov 2026 18:50:12 +0100
Message-ID: <20261109175016.42061-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Like for the H.264 and HEVC SPS, reject frames beyond the hardware
limits in try_ctrl, and fail the job in the setup callback if the frame
doesn't fit the buffers. The VP8 frame size register holds the size in
8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
width.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 197213911bf7..6c6aa45f5f96 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,8 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+#define CEDRUS_VP8_MAX_WIDTH	4080U
+
 /*
  * Reject picture sizes beyond the hardware limits. Whether the picture fits
  * the buffers is checked when a job is set up, see cedrus_check_pic_size().
@@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
 					       cedrus_h264_sps_height(sps)))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		/* The VP8 frame size register holds 8-bit macroblock counts. */
+		if (!cedrus_pic_size_supported(frame->width, frame->height) ||
+		    frame->width > CEDRUS_VP8_MAX_WIDTH)
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..fecca343bd92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
+	if (cedrus_check_pic_size(ctx, slice->width, slice->height))
+		return -EINVAL;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
-- 
2.43.0

