Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204548;
	b=gWkUFVaemgon11fZQWl+Ydwd7y7hW5kaWXKj4g7UvtJpHX1OdlfmMQby3ANhYsh4Emsv
	 E4buXcBLfk7mHeYrt3CZ9f358cWQHwTh92wKqxiWJkzjPxFCaYaZj6s7d0nQ8LqTraQV0
	 Qcfd6JircwbjB6VkWCTdUbbxUTUhxm+MymbbkZyEM4/A+tIcqc1tyruTDnVuBSx2aI4Yz
	 XPWwxfrYBk4bUnExOS1MP1MGTK7G91zdWlyes4F1QcwIdBRJ61RiSEsgdPKb0B0xFF7XI
	 b+i7eNS9xaGzsPCNNwapI47CllumLiofiWX0gTYph5/J3Ui5eiRmEuBWRyrNuIxFBkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WwvS9cnGyKmVciDXPMw8j3A8UV5rNnQMdUutKZ1OmTs=;
	b=o2cMNBzYCUAcLP6XV/cb+znfRcpcY8qyVBb3+jPRfnpXmyfDzIbYeEwWhOFWGaCstJiM
	 WkvxNojp0b3j+rLyoBE15Yi+G9m4uwT7GnY8xPPiRo36tZW0gp0EGDrYQ3O2tOKk4mvXq
	 vbvjyh7y9gvbQg9MoRqzAhYopa2J2GlRaEIaf7L3l0jLsnjARbH5CwF9y1njAMkJs+opg
	 TI/EuaTlgE6DQ2jHGuEuoDRpyXwKd+LzybcD35jaRw5RJECazlAvVTdl5qE4EkS5OySAC
	 SbWdTgGN6U6KMgsO+eI5T5wlgDr99COko/9hYnbuUvMGK1nPVMBmZC9O+F+eeemg3pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MY/Oferx";
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB40E606A6FF
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB40E606A6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY/Oferx
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a00144f1so396375a34.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204540; x=1795809340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwvS9cnGyKmVciDXPMw8j3A8UV5rNnQMdUutKZ1OmTs=;
        b=MY/Oferxk6Hw/z78ueubsQie+EIab9EypuleiTQPSPcsNyXkxmEYvm2LmG06o2/n4+
         iS416OcbT9QdYqAyzUSNFGHvZfeLINP1UuZO6UWsxZDSVnXNROtuaR2JQRIQSoCpjVE9
         gFZn5fkfxUMhAgnnt1DQn0qIa7n8pUinlZ/c1huFemMMTdaGXwjdMdYpYvAIZ29tpV3y
         AilE94rbhzsAO1txUML2/adDORS/anfo5yx62xHz+PP4VSagfc5AZOnP2yhTWkDkQ2wu
         Fl9VsXUjZUwBC6wswYaSbNGt8UR+VbB7H7LW9XVKn3Zhacl5UFtfLfd/X7faTGDXMIoM
         d8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204540; x=1795809340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwvS9cnGyKmVciDXPMw8j3A8UV5rNnQMdUutKZ1OmTs=;
        b=CgohGvFS/y6a3cxGmjdrJuwxyll35gR7HTy5XcQU43dAuRMUi7pNbxIe1bKLFKoyz3
         +i3srZ+9SD8X7sWpGPSnTNqMEUHibpKLBJl2NZlQENjBiaWfVek4CSVUYG+mM3PNlRHE
         g3pEcoVj9+/CLnPfyoOWlUHvL1ZRKVTmIAZF+TRu2G7kiz8JNAFw8+dZfqKf+e16EzZt
         LRuQZXMC9197m/VP3TGe679DyYV8vtjHrKnZFLIIdfa+yaaBFOPd3Y+rCxJ9NwkQ0bOi
         dZ7RBZUtS2RRUnMkuKheFKrlPYoRzK59kAXG2YkZ8LK5MI7C0jK7xq8kiPgPWOa2TQk3
         uZnw==
X-Forwarded-Encrypted: i=1; AL+hErEFjn/yIBTF2r/r2NnN3SeLAT5pcnPB191shWqM4euxnBnSfPeR2NGfeRra48CrmgpJ1Dxy5zCdXFdBZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z//qw7iBmstRp5aSVYYkwALZXVCSMeWNbr1cJH83oMLsOrz7D1j
	vO5FX23eDFmAlGQIo/nvQSnYzPOTIITu2HI7p5ewroGj2wqrRPI4aQxx
X-Gm-Gg: AYBFou2Z+4YBOk7nMzd2gyplJDgEGJeOIWxJCnlIugyPO0TKH1JOt558A66RJTi5Lrm
	a1dP1EHK9NTpbaB4p9Zd8/YpbsXr33y4tHIAJZo9C9hbdgOk+JcSDhvO1W6Ce1bLLfZ5cfTkxjd
	woVrtF+tgtQa4iuVa9YYbSM4FRX9dJBkBUPG2E+OCM7rFD6uATEwZDoQKM+o6/LjAZ0mehATEtr
	uySDJvwjV6IL+n3rLILcPg6f1pGUz2g8r8//wAhK8jdwamai46A/W9xB8US+M2rC8/HhDrbsrjq
	H9vh+7EVGCCjZOEaRbKbI2+U5DotX25n+J8isMsaj4yreRzCtbrScy5wOSnOCPf/a5AkiIlzMPA
	WwAec3plvq57Zus6HqMsI/dxUw6IukVqXCD1HPbNIZYMuPEWMw121RuD1Y0IWho9AgPngc7gV8U
	IoYNkmLrkE5v1aFQjlEPOdszLM83TQP06DwJGrwh/SJHVgQr+IBF63MKz9Bbv6H9XLWaJEsGOm7
	deejvkKv7MOCxHlO2SFzcedEOsAPn7V8tXur1IbsFlDZ4tIM0wFn+nPIy4TiCx4bzDPUnSteYkj
	Lsr+iNpWpqgdL4/46+LNyMGhmlY6hwjVHs+Mb8I45Cxuu8QL/b2leQTXHSajTomum1ZRUuaaOCS
	W0SWHJeGKtFC9l/noShOd6PFNp07N0V6/ilSpN6Hr
X-Received: by 2002:a05:6830:680c:b0:823:e626:2764 with SMTP id 46e09a7af769-863156221c3mr5265763a34.5.1795204539661;
        Fri, 20 Nov 2026 11:55:39 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:35 -0600
Subject: [PATCH 1/8] media: mediatek: vcodec: Decode H.264 access units on
 MT8173
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-1-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=9530;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=UE10HK8tVZ2ZheMA8pNkF0vbhr+jjejo2Gge+fGL8zI=;
 b=w6MBbA7EWyZI5u4X53yXwQYXcTbaowtHcVf1cOS3JJhtkGOWLsIKyrCPhtpj5V1jO/Y55Wpma
 kDaH3WLYToLBz6aAAZyaPZpp23idrMpMuG5rhuEWTtUU1oZaECCwqG+
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The stateful decoder interface hands the driver one H.264 access unit
per buffer (pixfmt-compressed.rst, V4L2_PIX_FMT_H264), but the MT8173
VPU firmware takes one NAL unit per call, and the driver passes it the
whole buffer with the type of the first unit only. An access unit that
starts with a delimiter, its parameter sets or an SEI therefore loses
its PPS, and every slice after it fails with a bitstream error. Pictures
of more than one slice never decoded at all: given one slice, the
hardware never raises its interrupt.

Walk the units of the buffer: the parameter sets one by one, then the
slices of the picture together in one call, through to the end of the
buffer. Skip the units the firmware does not decode (SEI, delimiters,
filler); handed the frame buffer with an SEI, it loses the picture
decoded into it later, so the frame buffer goes with the slices only,
and a frame buffer that no slice used goes back to the free list.

The decoder starts reading at the bitstream address rounded down to 16
bytes, and decodes from the first start code it finds there, so a unit
with another start code within those bytes in front of it, such as a
slice after a six-byte delimiter, is decoded as the wrong unit. Copy
such slices, and the parameter sets, which the firmware parses the same
way, to buffers of their own. The slice buffer grows to the largest
picture seen. A picture behind a delimiter, or behind parameter sets
short enough to share its 16 bytes, thus costs one copy of its slices.

Without a frame buffer only the header is being parsed, so stop at the
first slice, and stop when the firmware reports a resolution change,
since the core decodes the same buffer again after reconfiguring.
Buffers holding a single NAL unit decode the same as before.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    | 168 ++++++++++++++++++++-
 1 file changed, 161 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
index a95327388f57..d2d7103c09c0 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 
 #include "../vdec_drv_if.h"
@@ -15,8 +16,11 @@
 
 #define NAL_NON_IDR_SLICE			0x01
 #define NAL_IDR_SLICE				0x05
+#define NAL_H264_SPS				0x07
 #define NAL_H264_PPS				0x08
 #define NAL_TYPE(value)				((value) & 0x1F)
+/* the decoder reads the bitstream from an address rounded down to this */
+#define H264_BS_READ_ALIGN			16
 
 #define BUF_PREDICTION_SZ			(32 * 1024)
 
@@ -118,6 +122,9 @@ struct vdec_h264_vsi {
  * @num_nalu : how many nalus be decoded
  * @ctx      : point to mtk_vcodec_dec_ctx
  * @pred_buf : HW working prediction buffer
+ * @param_buf : copy of a parameter set for the firmware
+ * @slice_buf : copy of the slices when another start code precedes theirs
+ *              within the decoder's read alignment
  * @mv_buf   : HW working motion vector buffer
  * @vpu      : VPU instance
  * @vsi      : VPU shared information
@@ -126,6 +133,8 @@ struct vdec_h264_inst {
 	unsigned int num_nalu;
 	struct mtk_vcodec_dec_ctx *ctx;
 	struct mtk_vcodec_mem pred_buf;
+	struct mtk_vcodec_mem param_buf;
+	struct mtk_vcodec_mem slice_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_FB_NUM];
 	struct vdec_vpu_inst vpu;
 	struct vdec_h264_vsi *vsi;
@@ -309,6 +318,10 @@ static void vdec_h264_deinit(void *h_vdec)
 
 	vpu_dec_deinit(&inst->vpu);
 	free_prediction_buf(inst);
+	if (inst->param_buf.va)
+		mtk_vcodec_mem_free(inst->ctx, &inst->param_buf);
+	if (inst->slice_buf.va)
+		mtk_vcodec_mem_free(inst->ctx, &inst->slice_buf);
 	free_mv_buf(inst);
 
 	kfree(inst);
@@ -326,10 +339,10 @@ static int find_start_code(unsigned char *data, unsigned int data_sz)
 	return -1;
 }
 
-static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-			    struct vdec_fb *fb, bool *res_chg)
+static int vdec_h264_decode_nal(struct vdec_h264_inst *inst,
+				struct mtk_vcodec_mem *bs,
+				struct vdec_fb *fb, bool *res_chg)
 {
-	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	int nal_start_idx = 0;
 	int err = 0;
@@ -345,10 +358,6 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	mtk_vdec_debug(inst->ctx, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
 		       ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
 
-	/* bs NULL means flush decoder */
-	if (bs == NULL)
-		return vpu_dec_reset(vpu);
-
 	buf = (unsigned char *)bs->va;
 	buf_sz = bs->size;
 	nal_start_idx = find_start_code(buf, buf_sz);
@@ -422,6 +431,151 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return err;
 }
 
+/* Offset of the next start code (00 00 01) at or after @from, or @size */
+static size_t next_start_code(const unsigned char *buf, size_t from,
+			      size_t size)
+{
+	size_t i;
+
+	for (i = from; i + 3 <= size; i++)
+		if (buf[i] == 0 && buf[i + 1] == 0 && buf[i + 2] == 1)
+			return i;
+
+	return size;
+}
+
+/*
+ * The decoder starts reading at the bitstream address rounded down to 16
+ * bytes and decodes from the first start code it finds there. A unit
+ * whose start code has another one in front of it within that window
+ * has to be copied to a buffer of its own; so do the parameter sets,
+ * which the firmware parses the same way.
+ */
+static bool vdec_h264_needs_copy(const struct mtk_vcodec_mem *bs, size_t start)
+{
+	size_t back = (bs->dma_addr + start) & (H264_BS_READ_ALIGN - 1);
+	size_t from = start > back ? start - back : 0;
+
+	return next_start_code(bs->va, from, start + 2) < start;
+}
+
+static int vdec_h264_copy_nal(struct vdec_h264_inst *inst,
+			      struct mtk_vcodec_mem *dst,
+			      struct mtk_vcodec_mem *nal)
+{
+	if (dst->size < nal->size + H264_BS_READ_ALIGN) {
+		if (dst->va)
+			mtk_vcodec_mem_free(inst->ctx, dst);
+		/* room past the end, as a bitstream buffer has */
+		dst->size = round_up(nal->size + H264_BS_READ_ALIGN, SZ_4K);
+		if (mtk_vcodec_mem_alloc(inst->ctx, dst)) {
+			dst->size = 0;
+			return -ENOMEM;
+		}
+	}
+
+	memcpy(dst->va, nal->va, nal->size);
+	nal->va = dst->va;
+	nal->dma_addr = dst->dma_addr;
+	return 0;
+}
+
+/*
+ * The firmware takes one NAL unit per call, while the stateful decoder
+ * interface hands the driver one access unit per buffer. Feed the units
+ * of the buffer to the firmware one by one: the parameter sets, then the
+ * slices of the picture together. Units it does not decode (SEI,
+ * delimiters, filler) are skipped: handed the frame buffer with an SEI,
+ * it loses the picture decoded into it later. The frame buffer goes with
+ * the slices only; a frame buffer that no slice used goes back to the
+ * free list.
+ * Without a frame buffer only the parameter sets are of interest, so
+ * stop at the first slice.
+ */
+static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+			    struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
+	const unsigned char *buf;
+	size_t start, end;
+	int err;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(&inst->vpu);
+
+	*res_chg = false;
+	buf = bs->va;
+	start = next_start_code(buf, 0, bs->size);
+	if (start == bs->size)
+		return vdec_h264_decode_nal(inst, bs, fb, res_chg);
+
+	while (start < bs->size) {
+		struct mtk_vcodec_mem nal = *bs;
+		unsigned int nal_type;
+		bool is_slice;
+
+		nal_type = start + 3 < bs->size ? NAL_TYPE(buf[start + 3]) : 0;
+		is_slice = nal_type == NAL_NON_IDR_SLICE ||
+			   nal_type == NAL_IDR_SLICE;
+		if (!fb && is_slice)
+			break;
+
+		if (is_slice) {
+			/*
+			 * The slices of a picture go in one call: the hardware
+			 * reads on through them, and interrupts once, at the
+			 * picture's end.
+			 */
+			end = bs->size;
+		} else {
+			end = next_start_code(buf, start + 3, bs->size);
+			/* A zero byte before a start code belongs to it */
+			if (end < bs->size && buf[end - 1] == 0)
+				end--;
+		}
+
+		if (!is_slice && nal_type != NAL_H264_SPS &&
+		    nal_type != NAL_H264_PPS) {
+			start = next_start_code(buf, end, bs->size);
+			continue;
+		}
+
+		nal.va = bs->va + start;
+		nal.dma_addr = bs->dma_addr + start;
+		nal.size = end - start;
+
+		if (!is_slice)
+			err = vdec_h264_copy_nal(inst, &inst->param_buf, &nal);
+		else if (vdec_h264_needs_copy(bs, start))
+			err = vdec_h264_copy_nal(inst, &inst->slice_buf, &nal);
+		else
+			err = 0;
+		if (err) {
+			put_fb_to_free(inst, fb);
+			return err;
+		}
+
+		err = vdec_h264_decode_nal(inst, &nal, is_slice ? fb : NULL,
+					   res_chg);
+		/* The slices run to the end of the buffer and keep the frame */
+		if (is_slice)
+			return err;
+		if (err) {
+			put_fb_to_free(inst, fb);
+			return err;
+		}
+		if (*res_chg)
+			break;
+
+		start = next_start_code(buf, end, bs->size);
+	}
+
+	put_fb_to_free(inst, fb);
+
+	return 0;
+}
+
 static void vdec_h264_get_fb(struct vdec_h264_inst *inst,
 			     struct h264_ring_fb_list *list,
 			     bool disp_list, struct vdec_fb **out_fb)

-- 
2.56.0

