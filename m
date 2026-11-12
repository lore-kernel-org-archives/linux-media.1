Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500135;
	b=5jGiNdDBbVywUYlqfA61OvfQT7Lw4g172bP/IgtVqlwj/i5/q5su1+o0MQyf0+ub2m9h
	 hOPohsjSQCjp8d9sJAgR7gfjcCmizAqWAnxkyxWq4Ybum0WFOv93oq9trKDx8lNOTw9Mt
	 v2+eZvUMyL21E3cHT4qGuN5C+5E6RLKr+47lI1vcTuse7WuQZ+TURKrX9MUgZj8xgrj5U
	 AHTEv4T5WA5+AtdDrrTYFySp+iRml5uFNgR9coIWz8NnpdeM1EqRK+Z/RAnGu6AllK3wj
	 /tB2BwitMB/j5CLePMKsyKmlL5AEZMW96EVs0DQE+q+R9lxfl4rpoFBXUcNnuxM6HFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tzUoBcULPnhR/Dv1/hNrXAMLDMXFYb0dXpYnSaQBg+A=;
	b=fvtaQd/f+MWYWt8KWzHxDTgy+tseoMmtlZdg45inIcuemgVpsheEaDszmhqt3Y2uRRJE
	 s50PD4H3iajq+NZULpgohR0F0xoWRyOzFL32CTRrXXhUpQg1UtBNC6w+2cfJTZvZVRbkF
	 uK5LjCGLW4rzGNFlEDPWcDw2A59s2I1V2lTTY6vW+51b1aZw91CjyHJlj7oCkBbJ6P/fy
	 2C5OrDVGCFPJOuq2D5DX2IZmKWXR5slDqoaeMgwjIufShozDiGnhoFFWyCsRNu2ZztBDv
	 IbLYVJGVCD4DmnxPE6xTW2Dhl3+JfaCMwa/By8BfB8V7rIhpkMhoYZf5jGj9E+2Bv0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ROMqFnIi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Crbs1FJL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F64606A880
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F64606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ROMqFnIi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Crbs1FJL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZN9x2293193
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzUoBcULPnhR/Dv1/hNrXAMLDMXFYb0dXpYnSaQBg+A=; b=ROMqFnIiXmDRV9Gc
	9NRZUwdSuaXYVPrSF9yP4h1k9sYML53U2Os6tZBmSNbnifSsdVcLssUm8lLw+owo
	C92zNv7v82NPqBTdNFdfQuBaVZhqzTyn+Pty9Lgo8NzFVktmP0sDUDwdI8wPzV74
	JoEyfP6FIhsf3fIdCklW1xpk9Abeeub1oL5I+ncuHNwnEuw8XFttjuRrNaCl5DJk
	dc70ZZQlLhawdnhPnbHCzN1MTOafakoYkgY50fsTm6KhMM0P1soRYyJtaJ78vAhJ
	BKWZmktMM4okI8yf7UfkD6HuixJlcJ+8X1Of7ctSRMpkVbrTGT/AoDkAa35yiS7+
	8U7ACg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs0187p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:15:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2eba20719so861341137.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500133; x=1795104933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzUoBcULPnhR/Dv1/hNrXAMLDMXFYb0dXpYnSaQBg+A=;
        b=Crbs1FJLGvl2BAh80AfELYCwtmf8MWf9cK2rgbj/NWTw78MVAn7a/yA9C+V4kEbfiw
         RrzaT4BlIDFTOWjwhl3ioWdZVjfpkglkuO6pIah6O4vx9/rYV67MJnInTEFlOr5fESsk
         ZzxptR0wzjDR++1+Xn/fqeZvxAKxUsDJw07yZDS2YIX36tgEV1Du3a/flaSKwBgweKEh
         9txMYxddzadCPn66cMZGfU2DGijcxoiXmizgH8uVug5cPzMyfS4yyNs0dbcKM4/5O2tb
         iIUX9MCRjkz1VCtTW1pktDmQKMrUzWvUuIyxVjuKaTHyaoO16Xl1bt/hEbyqpNme3ShJ
         mFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500133; x=1795104933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzUoBcULPnhR/Dv1/hNrXAMLDMXFYb0dXpYnSaQBg+A=;
        b=HU5h5G8zooggn/dJnuE7yzHaRUH3yiB/qUmefmz+wZrH3Q7jZ3pf3iyqnJfLkxxBLr
         63w1p/xuKqLF0cI0uDEXPa0hhBQWbBj1asBHBVXgNyhx1zi5RnHIKZHAaUcC3TYWARjj
         sp5t+/XIHRGznO++JfNhdbHlnN9R3X3cd/bubKqOnARpBxSpHj6/f3L14qA9XSz8fK6J
         0W3rH8XeN2FIX0cUhjxLGhJBDJcuTvwCrXpq+vYP/woUW4d80n9AQLD1qbVQVer7lCFy
         eh2dNbCXE45uveBmXgZYxnQcfZ4e2IWF4/kppdQu0vg1QSAbVg9jn2CeNcV6x2n/m4rz
         YMgA==
X-Forwarded-Encrypted: i=1; AL+hErHtFFFOMdLkEhjXnbziDG8pH2fxPf92Gbf1JVYSofhoukhiHK1izRB3NSlwWFlJ5gd5B8XaeSDGiog+Pw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PIXANr4J21zs9XriqxYkkETzWBZtYSm4gRMXXtav60cstFXGU
	dom2NOm9IMFcT4ymW02Cv2RERUhI8PszROOwQD9pI8mXcQT3T1lmSMPVHAGy0lvMKe1sMhr74/D
	GVxSP9Fr9THqEyMPWPLOu+tD0Pz9DBXnF0hQSJdOTcDK0z6RELdW6wSyIbWVPCiO3yg==
X-Gm-Gg: AYBFou36WFXtxbPPPAyFzAK7BfwQCs6xW+dYZ1Dp17r8XXtEStyU+0uVL6MFNrWK9Y7
	yaa0kU9N4N3Ig6m0i/Xgbp+bAnJn8H9fUrHB/oylJPq1xL9Tb/7BKRUtin40uGAHlO+h8d1CksM
	m1DtzKtWXwlAUdy8DHhGrthd/q9WY/ZfTwv3vW2f05h1htmlfxie41/C1Q5rA0Ak9Giu+ODUZqI
	0+hVUb77h9nsjimfjWAbMxPQdAekcBlHK02Zd+PBaz5OgYK0Idse1/WDzgfkC8MB3WD6MWewvI/
	JbOUFPR9ZVTMJj+5JfLiNodNUQSYPaen6fcICz96o5VnhzhRuFWQAAyeZWnSaCj4LV37e/9Pa+X
	rfY3dBHtbJkJSR1NKaanAfxaxetVy6S2VzSsjxJeXJ+vpv1rHzB2x6kVKFJa3EGnBoiNML8IGPa
	oAgsY08OtuJ2UW8ePh5Qho2U+1eypcuLF++siNtS2IeRhcMNEpWBAyUfUKIv5E3E6i9DijjE+ht
	JgmrLrGwXdL36Z7C+5DkQUBwBU=
X-Received: by 2002:a05:6102:5708:b0:7ce:8505:9848 with SMTP id ada2fe7eead31-7d50618e5c0mr2824042137.31.1794500133055;
        Thu, 12 Nov 2026 08:15:33 -0800 (PST)
X-Received: by 2002:a05:6102:5708:b0:7ce:8505:9848 with SMTP id ada2fe7eead31-7d50618e5c0mr2824023137.31.1794500132454;
        Thu, 12 Nov 2026 08:15:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:15:28 +0100
Subject: [PATCH 1/2] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
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
Message-Id: <20261112-iris-fixes-v1-1-22b759c3c285@oss.qualcomm.com>
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
In-Reply-To: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfXytM+w0Lp7c/M
 Ayqq41NSGcLPJlpJMEeQ9ENM+sUSsTVtiZiRFLJ6x7E93VatWm0MUv+HKW6zA3IKGjoAvferLik
 N1b8MU5DSqP+wNwYKz2bc+vOZglMfunAj0xKd8lwplxor18jGu76w5bpWu7tdJ+CA5Djb09AEON
 cxohYiiFcFHL8jCHj3eljCcayCoK/tSBlu4d1e4HJ4aTwEUM+3yJqGRppv0nkhkuqE49NI0Uyb7
 PnhAueA9hF+S0wwCiOyln1gWTgbzxMfaDoUAFcDhtoTS0sI1cbinA8BCWnwKEQ5ypdsG3BKKFd9
 qnyaaUNR5I4XtnTtqZ02UCFPWlfiKSvrBRqW5iqK2owf82ixT89bZ/tQ2d9CrhFd3sd1bjMDX8Y
 Dydtg9UkAHpSwdvpZhKSObQel+4QBCcCnMm3H14/5QoeJK5X2qqlJBQLLC8T50g3PBM9e7Tx0hT
 w+5CpdyNjL1fUCK7AJQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5e625 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kSwDjhpa1ZG9DP52KJ0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX0uzEPexQ7x4c
 /3/ZMEo2eLBQPgecl51cH1muFJzf4Pldq4wpcAzeiKSg0x1nDrwjqBaOEEbbu5ougAVN/yn6FSF
 MUNWXhQN6KMDVj4pEBHM7DBJG7DmHl4=
X-Proofpoint-GUID: lu761lSALYGNHT-CXacqnRtGEbWYpgKO
X-Proofpoint-ORIG-GUID: lu761lSALYGNHT-CXacqnRtGEbWYpgKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

The encoder keeps two source resolutions. inst->fmt_src holds the padded
buffer geometry handed to userspace, with width aligned to 128 and height
to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
to the firmware as HFI_PROP_RAW_RESOLUTION.

inst->crop must use the visible resolution, because
iris_hfi_gen2_set_crop_offsets() computes

	bottom_offset = inst->enc_raw_height - inst->crop.height;

iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
so any height that is not a multiple of 32 underflows. For 1280x720,
crop.height becomes 736 and bottom_offset becomes 0xfffffff0. The two
offsets share one payload word, so the right offset is corrupted too.

iris_venc_s_fmt_output() compared the requested coded size against
fmt_src, so a plain 1280x720 session looked like a 736 -> 720 downscale.
Seed fmt_dst from the visible size. The encoder does not use fmt_dst for
stride programming.

Seeding fmt_dst from the visible size also means the codec alignment has
to be applied on every path and not only when scaling, so that the
CAPTURE queue keeps reporting the coded size. For 1920x1080 that is 1088,
and the firmware signals the visible 1080 with SPS frame cropping.

Report CROP_BOUNDS and CROP_DEFAULT from enc_raw_*, so the bounds match
the real source frame.

G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
report the vertical luma padding, and the hardware is programmed with
scanline_y = ALIGN(h, 32).

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --get-selection-output=target=crop

Before:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736

After:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 20 ++++++++++++--------
 drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..b367367ac2ccf874a00606b8b1352fed37b37a57 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -240,14 +240,18 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 	 * If output format size != input format size,
 	 * it is considered a scaling case,
 	 * and the scaled size needs to be saved.
+	 * Compare against the visible source resolution.
 	 */
-	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
-	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+	if (f->fmt.pix_mp.width != inst->enc_raw_width ||
+	    f->fmt.pix_mp.height != inst->enc_raw_height) {
 		inst->enc_scale_width = f->fmt.pix_mp.width;
 		inst->enc_scale_height = f->fmt.pix_mp.height;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
 	}
+
+	/* The CAPTURE queue reports the coded size, in whole macroblocks. */
+	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -293,8 +297,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
 	output_fmt = inst->fmt_dst;
-	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
-	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
+	output_fmt->fmt.pix_mp.width = f->fmt.pix_mp.width;
+	output_fmt->fmt.pix_mp.height = f->fmt.pix_mp.height;
 	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
 	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
 	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
@@ -312,8 +316,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-		inst->crop.width = fmt->fmt.pix_mp.width;
-		inst->crop.height = fmt->fmt.pix_mp.height;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
 
 		iris_venc_s_fmt_output(inst, output_fmt);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		switch (s->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
 		case V4L2_SEL_TGT_CROP_DEFAULT:
-			s->r.width = inst->fmt_src->fmt.pix_mp.width;
-			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			s->r.width = inst->enc_raw_width;
+			s->r.height = inst->enc_raw_height;
 			break;
 		case V4L2_SEL_TGT_CROP:
 			s->r.width = inst->crop.width;

-- 
2.34.1

