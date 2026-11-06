Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972687;
	b=sG9yqbtlntYktJVG9DzCJES7BdrhlhtUnPdHzs4KgabOc4MfsYN1jOHLrmf+CxS9XjYk
	 GW5iaIF9Vi+Ud4wOfV8n4fcI8/wzgotU5uK7nLPt5G0jH9mQEaUtPW0gPMwSB7U6cCgyw
	 sjXhBDGniLpO7uBuZKYpedafGKbhvyilw3u9rQfy7/JJnLja3skZJDouP1iD2kjjv50Du
	 BgPI6hugbNX+xrW+Ebvx5eO6n5Sd0v/XeB1lvImiNGDO15Kab6Q2aRDUEu3RGkVztb42F
	 D6u0+Vvzs3OJXB89xQst8CnZMCbSuYwHkt3OQjukH3XrsOLnSdr0l4QpxzjjLk8pWKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
	b=MDt2cL2dWYX9qCRHeYmQzqz4qi2wqJ1UfGzyDXLHQA6zuNamusE43Irjgr7VU7S2rylv
	 AOoYhBuJehGRKWCCyeNMWlS1Qn2Cx9HjWI5yWhwO4X92QXEZAHc9Jor0Bu6fqWESweiNy
	 NdcGQbBO24ICA3BlJ523u5MIbaYaoDkzu5U72Is8Vd3cFSepx8jOqKGwfVbOx7BzgpGCO
	 nKQRn2BIOFBcoIZ7vRfl5aAm3G0nNE2XnXwF1bbbLzdwDFZSRKqqV4hpQuVUId2bQJxZ9
	 E7gcZTD5lEEGwc9XBT/L/ONcSP/j5AVuDT7Ts+K3JNG2vgeuAyTIxYpmZnbp54tE64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D5606EE94
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153D5606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APccf3685195
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=; b=GBZFvIQTGt0yxwew
	VfjJMKC3DWQx1y5HV8xDitYh8SRUZi9Pn1fpydibyFVtI2IqNBQfXH1dXIBmjcku
	hMOREk61sIunKEnxGLoLN8TQjHMXhefPF/9owEwxlCPR/KS7Re7XSj2fHNKlMzsU
	3Ysd+MWT1jXNdpEC1Q58tZCbmcBhH7YfJLe2+uWb30ynIf8VaWMd1UYqLuHo2bJO
	YbJoha7rvUYiQseoBx/kBFyffCpO9tL3NIPq2fWv8RfiUUAwrPCPYNl3MSjrSonT
	ZR4fKfsy1AOCONSQFs12AlKwzlj5LiLD49zAfuK9mkWMQBw/84ovrFC9l7fcP+HK
	eewsfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so155197885a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972684; x=1794577484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=hDXug8j2X/I4oITO5Xh+cdongdUf8XlXy9n7FuLucoxh8j8ryaqFjJMd1FfWFYCOij
         UQ87gqCVmSqq7YAd+SZHX2nkBIIVjxKr6WzhEXAyZdPXDhvE8KDZJthxPkqHJQ9UNiSf
         f5IXkHTwSvB8Hey2NAhnJuM77Q+MFXEkTuuS3a3mh4QtyC5Y8MOoj+4HtADTQLAbDocd
         ZTNVgM5FP+8P0bb9YOQmkdFLsKn7ewdPWsQauBqrGtZtsB0wgBnCZmxf7FGi72aaUf33
         N332qf/mQ6dgE/AFae+J3VnP9kp2YExa9ccayFUzPbFWwsx9GI89b9GMK554QCEvbz9G
         MT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972684; x=1794577484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=IJzttXUs7jxRH/7Y3XhkUqpVIxfBjLysHma0036zCJPDXrhkAFP4uDCrBk2DNISiqu
         GUIKBWP3yOR7PJrhS9sit0wGZBA9zOUCgoN5ojAzgwIkea/sZ76QN5dtP9zs8drziJ7D
         yOWE2ZgibE/vqZfQcF9YqdbIBpYQeAZlI0heEgqg2GHPhNnQ2SjwaVjcNBZEMOJtrLL8
         IIJsXe4KHzgKsgS7jhF06Jxp3gIwpcU9ipY1bpdI8IT+bqCnovzyhKbKTFguOI69xC3q
         ruKq77GXRcv8y+RMXhFJ05ohJMhTtdQXvKTMamfV5/B55XKZKPeHZcv1k/onL1jQPFKz
         VnlA==
X-Forwarded-Encrypted: i=1; AKwUvBwQZ4crPGKkRWr1wlUS9cTrj1+G8PkolH78A5O29Pe116plY0smrus8fpMYzR+emBrZWzqLw6gYtz6TlA==@vger.kernel.org
X-Gm-Message-State: APuU4Z82s1BOMj5AXzcg0TvvECvo5iVy51Euepr8P0m6X6vo7ofEa2qh
	M9gxqVT96VYAd469AmDioSkLpq0mqYkLMJuAVvNRB/9/ljqO8x/fZLdBdhrjEGWdGno+LIKDWxa
	T7L55Dk2R3wa2LTk/g3wN0GXD7f24ALnPHTO61gOXmvt3tkVQC2dqE/qOcnQ9hjL912ybHvkusw
	==
X-Gm-Gg: AYBFou3cmtk0B48mQ2CmKz5Muduw39ExVlcqYyV3KtUk+Yo3GFbTEi7yGUkvhW307ui
	tVJBdMcR6H0huKd6N26ia9fESe4251KSl97onWmMAyfuarmY45aQ6PmsyER+ttvN5FoqqGNSftK
	mt2XJzmh3sOXydEmQdYDijQE6MLV1rr0BOyvaVcpqGbJsCKZJC346LQvxEFZJRAU4Fz3XKAOM5O
	KDmxgmXJcLzkdoYQrXtOM3CYpheFAcFDHHKZBW2LRoax7wf8z255OjIjhbAUIEYNXJehGHsGmiV
	bYTfV6TV1hHbW2bSWRGA1m630r6+MHO9GnAgoZ/J7asMHI+QmVDrXKp9I2+HTNamQzJS4auqHrJ
	VPUUTvm1NalurMO76osLOIWgaLl/FvsMg90A8Xl6le/04XgCEnMSR21nnC63K83s4oKAdLGEk+K
	KwLrmBmuMSl/rjUQUxGTvTB11FWMKwTatyBI5WoAuRIJyBLZSVvaTFQhLGkzYsVg==
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352009285a.58.1793972684196;
        Fri, 06 Nov 2026 05:44:44 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352004485a.58.1793972683453;
        Fri, 06 Nov 2026 05:44:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:10 +0200
Subject: [PATCH v2 4/8] drm/msm: check UBWC framebuffers against their
 layout
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
Message-Id: <20261106-ubwc-format-docs-v2-4-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6xPvBKvXF4Oj5ER3IOirKs4PSww1szDN0iEI4yJmcYk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm1xmEojRhtbHd26chPgyY5e9DYUB3anpavp
 sGYE9QRf6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZtQAKCRCLPIo+Aiko
 1aybCACWYFM2oDjJ4iQ8s/DVtvJt4yeL6Z+vXT5ZTRIExu9PNK25Kr5AIqBHZMkgiJkyTgutTPj
 8birGSMAO+r6KJCGQcbAzr2ElX46/NVd9PubPCl1CbCHcAIZy9dP6Jn7n0y+8RvJhh/1Rj2Os3p
 ztKl58J7/xel36mG1SW3pVq3cBk0IsjpjsVRFDSPSHiz3gPrz/LEBMtItmvBl5Ha8NisCdBUdWM
 kljD7wThly8rGkRBS0iPRhbm3WoI81lYl3BgKyQXolQ2LnfmT4IybHXZVc17b3kDlTskbmZJjBN
 kEkpUolW95vQmhIt2vNiHa/kwm+uvPcjzIQsZ5OPVFKcJnVn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZD5C9uFPBH7Q70uGFYctFGOQHfq9ezom
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX47DUALXyYRiH
 HlM8z6FN186D2vCETo4hWiwZ9rR8kGyjQQ2xI4vYHa5aa8StZX2kEBmtiWBdJuHO6Kmdj5RPZW8
 At9Xpy0Onogj7F8g5o8avVO6/C5hGeU=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aedd9cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gedFiD_-BdM4RCKrvjUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX1lMyn8yRaG/e
 XMXB4JvUhvXSVh061F9UiOtXPrDRQTf0oe3WnxARh+cyRF6DJzG7qnteRGTqDk/oSTl6rdwqSYE
 O4ZKuy9t/FMhj2cPd3CBOOynvGmClAp0tv9ceGTR9ge/21wB9/itfKpqriyKFxTfnbgbwmDsYEe
 HtwY3KB8Os4cmNZMFmtgHxiVfJb4E6uk9ZkDgLL2vwNPWv2yorOGJIF33xDFRDfbTqeKIoQJFPa
 WFlZIgS4aGUrJOnobqldDmeHWyyu2flXwIPsTMC2dDzMYjZJ1gXFRVFA7uPwjxRGJ2M/fhUBvbK
 VUm7YTnRDRKHgTmUvat4OISGjTE2u9qaSXemUwPTj6pVttG8tZyI/zDFfJXyrmtb2bLWH2XV8Rc
 Ess/Uc0PxeYY5ubwY5RVgj7oe+/P6GFhc7NfZPSg4me1zhh3mUOlKHqVmBjIE0IwvRQJDA/xjSV
 Afk5qoPtNjmyDqzqOMw==
X-Proofpoint-ORIG-GUID: ZD5C9uFPBH7Q70uGFYctFGOQHfq9ezom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

msm_framebuffer_init() checks every framebuffer plane as a linear one:
(height - 1) * pitch + width * cpp + offset must fit into the buffer.
For UBWC this has nothing to do with the memory the DPU fetches.  The
metadata and the scanline padding are not accounted for, so a 1080p NV12
framebuffer whose buffer is 15872 bytes short of the UBWC layout is
accepted and the DPU reads past its end.  The CbCr planes are checked
where the DPU does not look: it always fetches them after the Y data in
the first buffer, ignoring handles[1], offsets[1] and pitches[1], and
userspace relies on that (turnip reports offset 0 for both planes).  The
pitches are not checked at all, as the DPU replaces them with its own.

Compute the UBWC layout instead: require the first pitch to match it,
the CbCr plane to be in the first buffer, and check that the metadata
and data of all planes fit into it.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 1e236416e15f..dd24aa7a5ee8 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "disp/mdp_format.h"
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "msm_gem.h"
@@ -146,6 +147,7 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 	struct msm_framebuffer *msm_fb = NULL;
 	struct drm_framebuffer *fb;
 	const struct msm_format *format;
+	u32 ubwc_pitch[4], ubwc_size[4];
 	int ret, i, n;
 
 	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%p4cc)\n",
@@ -177,14 +179,41 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 		goto fail;
 	}
 
+	if (format->fetch_mode == MDP_FETCH_UBWC)
+		mdp_format_ubwc_plane_sizes(format, mode_cmd->width,
+					    mode_cmd->height, ubwc_pitch,
+					    ubwc_size);
+
 	for (i = 0; i < n; i++) {
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
-		unsigned int min_size;
-
-		min_size = (height - 1) * mode_cmd->pitches[i]
-			 + width * info->cpp[i]
-			 + mode_cmd->offsets[i];
+		u64 min_size;
+
+		if (format->fetch_mode == MDP_FETCH_UBWC) {
+			/*
+			 * The CbCr planes follow the Y data in the first buffer,
+			 * offsets[1] and pitches[1] are not used.
+			 */
+			if (i > 0) {
+				if (bos[i] != bos[0]) {
+					ret = UERR(EINVAL, dev,
+						   "plane %d not in the first buffer", i);
+					goto fail;
+				}
+				min_size = 0;
+			} else if (mode_cmd->pitches[0] != ubwc_pitch[0]) {
+				ret = UERR(EINVAL, dev, "pitch %u, expected %u",
+					   mode_cmd->pitches[0], ubwc_pitch[0]);
+				goto fail;
+			} else {
+				min_size = (u64)mode_cmd->offsets[0] + ubwc_size[0] +
+					   ubwc_size[1] + ubwc_size[2] + ubwc_size[3];
+			}
+		} else {
+			min_size = (height - 1) * mode_cmd->pitches[i]
+				 + width * info->cpp[i]
+				 + mode_cmd->offsets[i];
+		}
 
 		if (bos[i]->size < min_size) {
 			ret = UERR(EINVAL, dev, "plane %d too small", i);

-- 
2.47.3

