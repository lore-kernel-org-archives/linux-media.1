Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953536;
	b=Ok6EnkglaunOujdMEtRUDxioSwUFKffmq08y3UVGTrwsOVMiTm05dNIhJ7y+bBCrjXnY
	 3p+qjIfyfWnDLqYqCBaihQcunrunN6vlGk2f9DLJ4F2yYWHPbIO+pI6PHLF7a2yfQuuWD
	 QPWiSgvz9Diy41+1zlUeSJEywcqYI7rlkEEcsoI4RGIK0QUy7VFDyttuvt2b7PTDV/VWh
	 Fwc9J+SV6a/OXxMuTaiJlRe9cLrJNSr6vCHu2IVtZPtYQvyyt4ugfPxynkfuyVR6h1BtR
	 6Jvw1yy/q7nhtTMa0hUJXsNAoUE33aPlfFqTCfFRiKIxq6hPwq9gFYOl4gBNqQdFBpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
	b=ELkLKJqRScp9NOmlSE+7olfdADtWOmRCqR0zfizCDlNZMrseNBgkufu4yEZJ2xI7buSh
	 CoDMX0P6LdbKYZOQ8ucBLiIGgz9Xf3D0EgUTBLfnsxoe2ozubcDN/756PNI4g7ZLHcxXK
	 60gxKS+9zaad19lVCTmMtlf3LTiXKN5eKAEe5hdnFWKyNfovjm/fDcczOHdXfll1VLRYt
	 5HEOQRUoG+Hm72cmUq4USZSHxhXipE2YLlQZTDcl3XX/oCOLhdg+M/yFsVPDAqLS5Fn9D
	 Aowk1wvhuwhdnkulVhVM/SHP569kvSbOe+bhPJCZcMw8iMt8Ca8E+kQj4H48oRTW/VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VC7HCygU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDrNbVvm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6463606A33D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6463606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VC7HCygU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDrNbVvm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNLI2933635
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VJiVHhGRcwV
	/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=; b=VC7HCygUR55Q2rwGgfY6e5p5n8U
	aBCjW4qpLSqYbtSsJQBxQ7fbwOOPfJMHW7nDMt15k/ubK7itnGIjVSOTfFQzKaWW
	sI8SITZ0/W45ahq/Te5YHrsfHFpewxp0V9FhO0UH6Z+CGFyTWwED2RUu244vVrGt
	9TXWWS+v13ojQMhAXrdKMDhNgV2SFPZZfrky1+fWK/D0RudbFYB72ODmnz0VIvFd
	TctV1DVNHOeqh2de6U4WDKWMgliG1/wOQYNY7iUXw1REN8AF5HkRXZhNsxZLw86E
	lMC15kf3LxWIkNgW9z6GwVJcqo6MRhnAJi2EGFT8KUZr/h0ibZdR+vCki6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1utn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so41612985a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953533; x=1794558333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=GDrNbVvm86m6fbFjHNEKl/wm5NEW1UeKKi9CqgbJP4l+ixVZJpajrmXP4AGISRpROi
         eo5MnUwrYhKJRIdocG1brnQwOtMnLIb8JNphUmwhJQphWWaYZ9sZ4Lmo9LRbGfEam4Vo
         TF9RgiprzLY6uiEU/p6ZKoKy3qXqxAP2nNkhnde+Ok0ekThS7B692axN+uL7sd38gY+L
         SiKgNhUaLnq2rf/WHEXzSxrrw8/ggDrviW7cpTDL4zZJNwzAdazHrsU8RORBm+HsNy9S
         iZQaxhGw73fT0KX25znsems++9TVc3QKOmopozgzc1f/x+ghxFTyMNM93oL4fMfrT3Pr
         YEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953533; x=1794558333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJiVHhGRcwV/rD/F4p3bmkosbUsG62dv3yDIyyclfPI=;
        b=LgYl/aePI1NgutxfB0oSl5n3LiIKV2FMKOPOBL4nK2KPVTv9KaXiHfPSN/wOno8xz4
         JalltNKcy8gmTzZUSQhgsbQl4eNY/WDH5Nd4/KHz0f5s6iNhf4lFsFn5Vw8UwU9IPRvE
         f7QDGXKBHrVlNiyVttREXM0sbG4W1UZh4GhBQmxLrXkmnGz2sse7RzyyOJbp/ULbW8eK
         G4GDWmxDGhPdhydSP3tTuKzBc3nxqIXXeHDK/LYb8Nwk136g5xrwjCLHdYctqU6MxA3u
         uI/hfC6+oKAu8gZfL4eWYwpGPqVtYbT2ecJ+MaGLIaCRnY4m8fVlMpsi9AORvTjto5Xd
         /zfw==
X-Gm-Message-State: APuU4Z9WH8ByaOBV3mPzhzcYnUZ3adDiqZ6B3jTQGkNo3rZzffyY7Dal
	56UcECQhOzG1hbEjIgus//zuCJ9Y3aoqtucel31Sm99za7lFZIeLxdgvgKdBtXkzfTx7Lmn9elS
	8Uq5+O6/YjpL2CjE5NkavAHG2w5dn+fPW2pA0jkfPcKllCITLD8BF66WWsnO60MvYLXmDZRtJYE
	VV
X-Gm-Gg: AYBFou165cgM5X8UH9bPbDZpQD816JtzGgFlhsfE37ig7DU0pvItLRJumqnDD68KKZq
	45MJ0vFUajOj0XzrWHoXX4rBrCSOUYGJ2KIWvruA/kc1k/V6f2bgqG/Mdrfg33roZhn072LiQt4
	WPwRslzVNecngvWmJi57sVo5H41TMBjmWLxFS5Zd3WsC+QeEhD4e20sS+fHqw5aPlSYaj3fvYlP
	qEEL/RmXdBPuHFzEFoBy2OvizG021xhZlNaZxYcGoMbnngFEEdcP6u7YszV0a9bsZPZ5/sbyC2W
	nZbxWf9uHVQi0Ky5LCCd6RUDQl0Wj3erWdLwqQYt38vFa86e8QlU1etKqJPbYwBt+KZzDvTLHVf
	FeHu2R1S+4zjLSAYSDRla+hdwfrRsEqi9MK041wwlgMPpCoIooIS4RGypH8yuFl43HdTUDKjyWw
	==
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-945f35f1873mr254277285a.76.1793953532944;
        Fri, 06 Nov 2026 00:25:32 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-945f35f1873mr254274985a.76.1793953532386;
        Fri, 06 Nov 2026 00:25:32 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:31 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Fri,  6 Nov 2026 10:25:17 +0200
Message-Id: <20261106082522.1448390-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1fZJQhpF_hPqqUIC-LWhW0mWR1ArdFyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX6lCH14btLunZ
 5KoS9mHY88oJRtDcKA85klAX1gw+cL9ckKMhyBhDQ21p4f0c59sjxd+N7gAHVXw+IpOpnbxy/px
 wZwoqSfsnwBgXX7S+6T+P3t9Ni99VOdG9hW7uIVli5iT/nYm4MHQSg/xJee2495BLATHXvIn1Xx
 QbKEQpHbPJUqKkFl/rzhNGOmm6OjVfZe2tWhpi6zBn/r+6RnArOAr5k/XOHeK0tJ+y/L2QzAbar
 tAHd3G5XoTPljvohBhlvr+8PfFZaRjZQXO9TLJnd0BbEpfYeh81h1oiPIO659wiYm6FTSIeyWji
 kpouu5sJL3rtD0TIzcaKAlFVzG0uxQtjtZG5Gly4D/aju3haIhIB/o6kca2SXA0PMztlwNkZArm
 TauCwid0yAsht6HJVwdTIKbUMnYV0eJlw4zGDXyAXi8V1kxVoPCtZEsq7n4vs8oR3FQDDOeIKIc
 EIPnTttJ7MDfWeQJz8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX11C5OqbMlipo
 8cK5Bf0LLVuC4OF+rSH0LO7K4SdZB65jNvNFFuWP53KJ1wZsfpMc1rWO0kgTheIA1byW7lq47ZN
 JgFQ/LzxLEOC0MRYiI2mxZVMr8WbBZk=
X-Proofpoint-ORIG-GUID: 1fZJQhpF_hPqqUIC-LWhW0mWR1ArdFyH
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8efd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uaGMt4ufPnOKGkpinpYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Several V4L2 JPEG encoder drivers build the JPEG header in the driver
from a fixed template and patch the image size and quantization tables
for each frame. Add v4l2_jpeg_write_header() for the baseline case: it
writes SOI, an optional JFIF APP0, one DQT segment per table, SOF0, the
ITU-T T.81 Annex K reference Huffman tables in one DHT segment and SOS,
and returns the offsets of the fields set per frame. Add
v4l2_jpeg_hdr_set_size() to set the image size in such a header.

The field values come from media/jpeg.h, so the driver keeps only the
hardware specifics.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-jpeg.c | 165 ++++++++++++++++++++++++++++
 include/media/v4l2-jpeg.h           |  31 ++++++
 2 files changed, 196 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
index 36a0f1a1b0d97..f466dc6a457de 100644
--- a/drivers/media/v4l2-core/v4l2-jpeg.c
+++ b/drivers/media/v4l2-core/v4l2-jpeg.c
@@ -13,7 +13,10 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
 #include <linux/types.h>
+#include <media/jpeg.h>
 #include <media/v4l2-jpeg.h>
 
 MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
@@ -711,3 +714,165 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
 	return marker;
 }
 EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
+
+/* baseline JPEG header writer */
+
+/* Segment length of a header struct: the marker is not counted */
+#define JPEG_SEG_LEN(hdr)	(sizeof(struct hdr) - offsetof(struct jpeg_seg_hdr, length))
+
+struct jpeg_hdr_buf {
+	u8 *buf;
+	size_t len;
+	size_t pos;
+};
+
+/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
+static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
+{
+	if (b->pos + n <= b->len) {
+		if (src)
+			memcpy(b->buf + b->pos, src, n);
+		else
+			memset(b->buf + b->pos, 0, n);
+	}
+	b->pos += n;
+}
+
+static void jpeg_put_u8(struct jpeg_hdr_buf *b, u8 val)
+{
+	jpeg_put_bytes(b, &val, 1);
+}
+
+static void jpeg_put_be16(struct jpeg_hdr_buf *b, u16 val)
+{
+	u8 data[2] = { val >> 8, val & 0xff };
+
+	jpeg_put_bytes(b, data, sizeof(data));
+}
+
+static void jpeg_put_dht(struct jpeg_hdr_buf *b, u8 class_id, const u8 *table, size_t len)
+{
+	jpeg_put_u8(b, class_id);
+	jpeg_put_bytes(b, table, len);
+}
+
+/**
+ * v4l2_jpeg_write_header - write a baseline JPEG header
+ * @buf: destination buffer
+ * @len: length of the destination buffer
+ * @params: header parameters
+ * @layout: returns the header size and the offsets of the fields set per frame
+ *
+ * Writes SOI, an optional JFIF APP0, one DQT segment per quantization table,
+ * SOF0, one DHT segment with the reference Huffman tables of ITU-T.81 Annex K
+ * and SOS. Width, height and the quantization table values are written as
+ * zero; set them with v4l2_jpeg_hdr_set_size() and through the
+ * @layout->dqt_offset offsets.
+ *
+ * Returns 0 on success, -EINVAL for an unsupported number of components or
+ * -ENOSPC if @buf is too small.
+ */
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout)
+{
+	static const u8 jfif[] = {
+		'J', 'F', 'I', 'F', JFIF_IDENT_TERM,
+		JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR,
+		JFIF_UNITS_NONE,
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* X density */
+		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* Y density */
+		JFIF_THUMBNAIL_SIZE, JFIF_THUMBNAIL_SIZE,
+	};
+	struct jpeg_hdr_buf b = { .buf = buf, .len = len };
+	unsigned int nc = params->num_components;
+	unsigned int ntables = nc == JPEG_COMP_MONO ? 1 : 2;
+	unsigned int i;
+
+	if (nc != JPEG_COMP_MONO && nc != JPEG_COMP_COLOR)
+		return -EINVAL;
+
+	memset(layout, 0, sizeof(*layout));
+
+	jpeg_put_be16(&b, SOI);
+
+	if (params->jfif) {
+		jpeg_put_be16(&b, APP0);
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(jfif));
+		jpeg_put_bytes(&b, jfif, sizeof(jfif));
+	}
+
+	/* one 8-bit table per segment, luma Tq 0, chroma Tq 1 */
+	for (i = 0; i < ntables; i++) {
+		jpeg_put_be16(&b, DQT);
+		/* length field, Pq/Tq byte, table */
+		jpeg_put_be16(&b, sizeof(__be16) + sizeof(u8) + V4L2_JPEG_PIXELS_IN_BLOCK);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+		layout->dqt_offset[i] = b.pos;
+		jpeg_put_bytes(&b, NULL, V4L2_JPEG_PIXELS_IN_BLOCK);
+	}
+
+	layout->sof_offset = b.pos;
+	jpeg_put_be16(&b, SOF0);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sof_hdr) + nc * sizeof(struct jpeg_sof_comp));
+	jpeg_put_u8(&b, JPEG_SAMPLE_PRECISION_BITS);
+	jpeg_put_be16(&b, 0);		/* height */
+	jpeg_put_be16(&b, 0);		/* width */
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
+		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
+	}
+
+	jpeg_put_be16(&b, DHT);
+	/* length field, then per table class a Tc/Th byte and the DC and AC tables */
+	jpeg_put_be16(&b, sizeof(__be16) + ntables * (2 * sizeof(u8) + V4L2_JPEG_REF_HT_DC_LEN +
+						      V4L2_JPEG_REF_HT_AC_LEN));
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT, v4l2_jpeg_ref_table_luma_dc_ht,
+		     V4L2_JPEG_REF_HT_DC_LEN);
+	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT, v4l2_jpeg_ref_table_luma_ac_ht,
+		     V4L2_JPEG_REF_HT_AC_LEN);
+	if (nc == JPEG_COMP_COLOR) {
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT,
+			     v4l2_jpeg_ref_table_chroma_dc_ht, V4L2_JPEG_REF_HT_DC_LEN);
+		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT,
+			     v4l2_jpeg_ref_table_chroma_ac_ht, V4L2_JPEG_REF_HT_AC_LEN);
+	}
+
+	jpeg_put_be16(&b, SOS);
+	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sos_hdr) + nc * sizeof(struct jpeg_sos_comp) +
+		      sizeof(struct jpeg_sos_tail));
+	jpeg_put_u8(&b, nc);
+	for (i = 0; i < nc; i++) {
+		jpeg_put_u8(&b, i + 1);
+		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
+	}
+	jpeg_put_u8(&b, JPEG_SPECTRAL_START);
+	jpeg_put_u8(&b, JPEG_SPECTRAL_END);
+	jpeg_put_u8(&b, JPEG_APPROX_HIGH_LOW);
+
+	if (b.pos > len)
+		return -ENOSPC;
+
+	layout->size = b.pos;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_write_header);
+
+/**
+ * v4l2_jpeg_hdr_set_size - set the image size in a header from v4l2_jpeg_write_header()
+ * @buf: header buffer
+ * @layout: layout returned by v4l2_jpeg_write_header()
+ * @width: image width
+ * @height: image height
+ */
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height)
+{
+	u8 *sof = (u8 *)buf + layout->sof_offset;
+
+	put_unaligned_be16(height, sof + offsetof(struct jpeg_sof_hdr, height));
+	put_unaligned_be16(width, sof + offsetof(struct jpeg_sof_hdr, width));
+}
+EXPORT_SYMBOL_GPL(v4l2_jpeg_hdr_set_size);
diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
index 62dda1560275a..d789ccfeba734 100644
--- a/include/media/v4l2-jpeg.h
+++ b/include/media/v4l2-jpeg.h
@@ -167,8 +167,39 @@ struct v4l2_jpeg_header {
 	enum v4l2_jpeg_app14_tf app14_tf;
 };
 
+/**
+ * struct v4l2_jpeg_hdr_params - baseline JPEG header parameters
+ * @num_components: number of color components, 1 (grey) or 3 (YCbCr)
+ * @luma_sampling: luma horizontal and vertical sampling factors, as in the
+ *	SOF0 component specification (0x11, 0x21 or 0x22); chroma uses 0x11
+ * @jfif: emit a JFIF APP0 segment after SOI
+ */
+struct v4l2_jpeg_hdr_params {
+	u8 num_components;
+	u8 luma_sampling;
+	bool jfif;
+};
+
+/**
+ * struct v4l2_jpeg_hdr_layout - offsets of the fields set per frame
+ * @size: header size in bytes
+ * @sof_offset: offset of the SOF0 marker
+ * @dqt_offset: offset of the luma and chroma quantization table values
+ *	(V4L2_JPEG_PIXELS_IN_BLOCK bytes in zigzag order), 0 if not present
+ */
+struct v4l2_jpeg_hdr_layout {
+	u32 size;
+	u32 sof_offset;
+	u32 dqt_offset[2];
+};
+
 int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out);
 
+int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
+			   struct v4l2_jpeg_hdr_layout *layout);
+void v4l2_jpeg_hdr_set_size(void *buf, const struct v4l2_jpeg_hdr_layout *layout, u16 width,
+			    u16 height);
+
 extern const u8 v4l2_jpeg_zigzag_scan_index[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
 extern const u8 v4l2_jpeg_ref_table_chroma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];
-- 
2.34.1

