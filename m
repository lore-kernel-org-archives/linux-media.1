Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B438D40A
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088827; cv=none; b=nZUz8j9pes2XyDEfHseYIibK6Jy720hO0tgD2COTVGt64ZGbShISe7kTBXixJ/D/cZWIsLg7f0Sr6RMawO8xFOmjumJAcp8Jlet4lNmgHUp0r3GGGGiL/kVNFVxxLAVrDbaRy4QKUcgmCGJ4TR/WbjxNcsE7FZGpb1e3FRn1Qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088827; c=relaxed/simple;
	bh=rITWBtwg0UeGwC630A2BplVUfVAaNVBrdnLfpp5GL0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnWojiCR96j+YEhW9mxij51HJbEyebBJGA1EEOqizWl3teixpVRJET0J5la8xfSNEafimkCpVp88uO+ddWLITOeNUSrb0N2JduZJC/o+MhCnXsIqUzG5oAcfinBjna3CkHGxlh8HKJdOL2QXdEVml4OWEP+WcSXNCf8r+YegjPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFylzvsD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFylzvsD"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb63dbd229so1315842a34.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786088824; x=1786693624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb5mypZerDUo20ECX+N2iCIoD56vxG0H2P2o/289Is8=;
        b=mFylzvsDSRZmLi0CzE67TvtaJnEJEiuAVBFDhR8ERRyxAMqc4M4EIUX2jhfgXdKF6n
         hgUVyIy4kMgdFctyuZK1fv7u6dh6tUPpQfM5+wcMxSY2iE3jTdIAL7JoWrUoWxBLu/cO
         XC28L4NAJjO4y1FsZ5GuT3RvnIxSPf8dvVYrPw7kDlb3KQcyhQoSubkOaf6tvcUrEod7
         SrOthSIcuZnrYty5ytAP91P/6Ie/WP+wCQn1Z4FuLXhedGnF7eqg551oj3NBxgQ6Xy4G
         /99COTfWI/WwJYQd31jGREegutA5rJ1+QglMndcPIqJ/1CxPNQ4GpaPF0wK+CIOzqf9k
         V3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088824; x=1786693624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb5mypZerDUo20ECX+N2iCIoD56vxG0H2P2o/289Is8=;
        b=SS0E5hEcf/28xU/ColNhEfoqAX9Q2GI2PY2UJnEHt1Sc1vrza+Qf6bW98GZ8ikJJIN
         Ga5a5PfNPZh+gZ64oTT6QLbVH4atHoRGRbjDhwXfmt0EweLcNUSjqTdprPJwQyyyaB7g
         gzUgeSz92hXtNrn6rX/8sq5Zzn+KrN+eazp+sITGfz3H1GUU9jaT4GuB7CJRV2WGF0Uz
         kHADwudcYCuJ/HcpfPABNwzZ2T0o3UcTd5qRCnGLQ8k7d+SYw/9IKHy9f3JXSqeaz5Ah
         iodrycbvFBYPxyvBEDpO/DKaWGpiX501v9KMXUTBSE03M9cE7FnSLXw363xAmCGCzP5C
         CEpw==
X-Gm-Message-State: AOJu0Ywn8j1pBMSZedaSSfyLUiF/H8j+MzNIEWU5c3C4G2VmGd8i0BAj
	klwEA0HSYBNro9OiBAQLAkrs9segsl9QLGJa5tzFDZ2piG9RRndzgJvZvfG87TY/
X-Gm-Gg: AR+sD11xkBZZqYMDva2/ziv/DOpVyQt9DMur2ru4u2VSHU0s+uZTd9Yj2Iq8qwDJW9C
	hKl6Hg2LYEgOFg+QhQ+hR9qIU97lMCkZPhbx553EP16EDPr89fDfVI/ortrqOS/NfLKG/AgA3qI
	Z/jk8e8sebUSPKJVlWqEXB7UDqs0DiiJyz0VYu8E8CJsprw1IqoS5NdD/QoPfLs9fepKLD/Axew
	LhzFGwbVMpo8m53Da+XbHdKLS3TZe4P0rojvfQ78dccwbsFvy4wBLjtd/ZJ/JKt1uZX1IkIxVv1
	9SH5WhtB7N9iD3/0SerDxohMaIsePShI8ZprI8vPils6gOZjIwF3A7Otti47sqGlkiBOIWHM7bI
	Bs8lJfY2OEf0n1sOc43ySLOOclK+ysMcZWhvM0i0kIeIq163eMVGFiPRIuK/r2Wbh3IwCxTkqHf
	sBIIvm03V5+8nXD4WXRzqLlDjBen89kKHGziKwFQN4TTmJrw2Iy/8rabcptbTTXeRggEN2snjyT
	bepaFLPR3L3L5PKQk302txVuhii+e9BnGBtDkCt
X-Received: by 2002:a05:6830:4108:b0:7e9:da5e:93f5 with SMTP id 46e09a7af769-7f3444a4a27mr2552017a34.12.1786088823924;
        Fri, 07 Aug 2026 00:47:03 -0700 (PDT)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b7c4c3bsm737815a34.24.2026.08.07.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:47:02 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: hws: report measured colorimetry
Date: Fri,  7 Aug 2026 03:46:47 -0400
Message-ID: <20260807074647.435011-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At 1920x1080, the driver advertises V4L2_COLORSPACE_REC709 with
V4L2_YCBCR_ENC_DEFAULT. The default maps to a Rec.709 matrix, but
controlled A/B captures using the in-tree and baseline drivers show that
both produce YUYV samples using a BT.601 matrix and full-range
quantization. The captures differ by at most one code value, whereas a
601-to-709 conversion would move primary luma values by roughly 11 to 33
codes.

Set the Y'CbCr encoding explicitly to V4L2_YCBCR_ENC_601 at every
resolution. Keep the resolution-based colorspace so HD retains presumed
Rec.709 primaries and transfer characteristics while SD continues to use
SMPTE 170M. Refresh the colorspace on detected geometry changes so an
SD/HD transition does not leave stale metadata.

The decoder mode register is undocumented. Stop claiming that value 0x13
selects BT.709; both drivers use that value while producing the measured
output.

Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
Assisted-by: Codex:gpt-5.6
Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws.h            | 4 ++--
 drivers/media/pci/hws/hws_reg.h        | 3 ++-
 drivers/media/pci/hws/hws_v4l2_ioctl.c | 5 +++--
 drivers/media/pci/hws/hws_video.c      | 4 +++-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index 8fbe1fe27844..d87d52674b69 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -33,8 +33,8 @@ struct hws_pix_state {
 	u32 sizeimage;		/* full frame */
 	enum v4l2_field field;	/* V4L2_FIELD_NONE or INTERLACED */
 	enum v4l2_colorspace colorspace;	/* e.g., REC709 */
-	enum v4l2_ycbcr_encoding ycbcr_enc;	/* V4L2_YCBCR_ENC_DEFAULT */
-	enum v4l2_quantization quantization;	/* V4L2_QUANTIZATION_LIM_RANGE */
+	enum v4l2_ycbcr_encoding ycbcr_enc;	/* V4L2_YCBCR_ENC_601 */
+	enum v4l2_quantization quantization;	/* V4L2_QUANTIZATION_FULL_RANGE */
 	enum v4l2_xfer_func xfer_func;	/* V4L2_XFER_FUNC_DEFAULT */
 	bool interlaced;	/* cached hardware state */
 	u32 half_size;		/* hardware half-frame size */
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
index e4fb4af44434..f6027a16a193 100644
--- a/drivers/media/pci/hws/hws_reg.h
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -70,7 +70,8 @@
 #define HWS_CTL_IRQ_ENABLE_BIT BIT(0)   /* Global interrupt enable bit */
 /*  Write 0x00 to fully reset decoder,
  *  set bit 31=1 to "start run",
- *  low byte=0x13 selects YUYV/BT.709/etc,
+ *  low byte=0x13 is the vendor baseline capture-mode value; its individual
+ *  bit meanings are not documented,
  *  in ReadChipId() we also write 0x00 and 0x10 here for chip-ID sequencing.
  */
 
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
index 0303e311ee4a..ce396b7225d2 100644
--- a/drivers/media/pci/hws/hws_v4l2_ioctl.c
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
@@ -511,8 +511,9 @@ static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
 {
 	bool sd = p->height <= 576;
 
+	/* Captured samples use full-range BT.601 Y'CbCr at every resolution. */
 	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
-	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
+	p->ycbcr_enc    = V4L2_YCBCR_ENC_601;
 	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
 }
@@ -736,7 +737,7 @@ static inline void hws_set_colorimetry_fmt(struct v4l2_pix_format *p)
 	bool sd = p->height <= 576;
 
 	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
-	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
+	p->ycbcr_enc    = V4L2_YCBCR_ENC_601;
 	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
 }
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 18e4bc6901d3..09cfb5a909f9 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -327,7 +327,7 @@ int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
 	vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
 	vid->pix.field = V4L2_FIELD_NONE;
 	vid->pix.colorspace = V4L2_COLORSPACE_REC709;
-	vid->pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	vid->pix.ycbcr_enc = V4L2_YCBCR_ENC_601;
 	vid->pix.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	vid->pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 	vid->pix.interlaced = false;
@@ -895,6 +895,8 @@ static void hws_video_apply_mode_change(struct hws_pcie_dev *pdx,
 	v->pix.width = w;
 	v->pix.height = h;
 	v->pix.interlaced = interlaced;
+	v->pix.colorspace = h <= 576 ? V4L2_COLORSPACE_SMPTE170M :
+					 V4L2_COLORSPACE_REC709;
 	hws_set_current_dv_timings(v, w, h, interlaced);
 	v->current_fps = fps;
 
-- 
2.55.0

