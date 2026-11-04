Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810197;
	b=YYBEEa0M/I21Ny3BpSfrfrykD3q+R3SNvkxf8M72q5DDoKeB1ImBmnpmlH2HJCLxFPmu
	 HYAu07cPudwUIPvBpQS+7gTu5vNGGylmRf8/ZWjthyT+tfV0y4n4OQc7AcGegJZX6RqOP
	 lRasZX1Xv+PgCtAfNnXfpX4jL92iQpopRTCm7YOrw58CYWN/JJQhL2edfTz8Ptl0fBVSc
	 dO301ESh1BSAtu1bD/Et40U7+cP5MVO1D5sEqeg+pCvXXl/ZK4sWfOY0lh4UKufPdHW0z
	 rvnrcDuZ9PHuqs51M5wqQtVrO1E6NnXsPOt/5fbX7KuRMk71N/JyJ3i40FqvmUh1VHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
	b=Bf9WfoUADyUOjRHmi121nLRoG2xtkZVt8PaAfQyp2hubv3KnrGZjiZaX3vaia7EceJM4
	 Em5PZobMLWSjKkud5FWfsnTGpdodQ+mHgL3MMH4cPvf5q+WRxIEpy9HkeWTTDqMrSfuFj
	 h2dHTHgoDarIWdTOGAo4LXRglvtufP0EP9UIrUCZg399tubb7TsPQXPuLEet1B8+SSFzI
	 IK9gkkiRMkVUep5a3dTvCUIqPEKTaNOZUcDNQRmV4p+eyzwPqRa7USk9qbPrGCrrBcbMX
	 nCz8axkT4mR8h5F8NyWtHYVgOOM3FK49p4jWrnBrze1OV+BB3xsRtcU4DdEuAIrmcuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFi+GMAT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RAHEQk/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB5606EEB7
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97AB5606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFi+GMAT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RAHEQk/x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjRHt3209178
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=; b=cFi+GMATdZpiLZQ+
	ESk+1+NNVpPg8fSXYpI33gSwGJrZZFg047bQ9eo52P61uKZuXhfBPl+MGofxZrEE
	X34fMtLJ4MJFRpBddLB9lVJ/N8zXNfBotRltZCCFnA4FVsYI0BQpmVNg7cfS5m9s
	k7jAeL7i+frt04nIaaQkuv/8s38X4Z/CP/kk1yKlKtWBzCkGdrMDjkja4vmbFudU
	khTEdls1f4giQbAlFmAMpRn5vm2iCrlJX3zerrSEJzpHwwBRxOO7OoqOw0a9cBJZ
	1sa1XrkMSbsG2hgCj/go6zGUHIEYIqtLBOcMnJwGNkLeB0nH8Dwug6DOkEG6f3YC
	oa9TMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0j8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so161250085a.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810195; x=1794414995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
        b=RAHEQk/xM6vbi+BQRYE9v63XVAP/bAeX9w0IjCG3AqPGNCt38nt5UnToDkRVROFwli
         lbk7J3XKsr1sD1CZkeuK1oWgR2GXlBCzucc9kLPEFXl8/RTu/x1m2LkeKiBNNneXdoOu
         /299iYM13TlszEHHGsg9sz1N48qS8QIR9XyOrJMfaJOOOOeDCPB4/iDUw4T3j9z62ume
         zslLwBveCPOwdKAoJqCDt4tx8YLBFLj6axGirNRuzkwNJqaF2Zd9glzoSiqy1kquadYN
         gtoI2RBEPQAdBfCXEVnLN+9ElwerrwB2TDNA8zNZAIo9owobc8BDCsUP8DAfdrsM14xp
         3mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810195; x=1794414995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iimt5F36G44tPNYEFxjnFuU3no1lGzf4ouTx45FX12k=;
        b=HVqCN9MBQ20EOgONOlaEMtcZAPcVvaqzVvgUhNrYxkqO5v7UX2w3BwHnFRjNJjdv72
         gggZyq6kLolLrKu59ulYwSBIhalqS1JmXpgA6bjTIXz6sX3A2CkAfhMmmM6FT4selfjb
         18u5hYGTvBxjU2avyHIJa2cc0dKiPhINXVPrMT2cukmaQxuTYMktrfJ7kPH5DS/4CRGm
         aU0xlGQRu0O5HBq0//d7WZ7tgyhE67xY7EIbT9uiYWizcTYtgyneyzmvN2Nowhu80HSV
         G4whage68BRQFAw6btB8K3uJwrLHzC0cjikJkclhWSv+0hFGDKehYZ4DnffTHvJ+Gaa2
         Ctig==
X-Forwarded-Encrypted: i=1; AKwUvBxCmPqqjCAdMuRi1KUbcRR+G1ZP5ziU4/JplYxINpThAwF0Vbf2+ZW3z7pHqfN1o36hhVTxUBcXrItgbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mzi8M9qkaqNjseAJ/FMi2W/lqaXZaDbpGR2gLIMdwzDTbemNq
	mjrOkgyp24SVFvs6RLRbFQkldZe52XCTurBc496Yidg3VfwIBlOGhajkPEOLXmDCctyzex8DYsu
	1PvRXEOVY2fGTKrOzZve0uGFOtmodF2bw4kfh4WO+3jm6NIyjkRlhaNO8bHkk1KULDA==
X-Gm-Gg: AYBFou3thlLRRvPriXLmmiB8VHQ4tiho4MUEcsBoyOq1JETZ3BVmFH/1LBpdlXkkAlS
	HqxZ9GmjBrtpRHqJTAB6laZ9jSE+F2Rexpl74zxslZjbscVF8ZGWmBXEOwcKilNY5K+Xev+Ns2Q
	BFdOOekOwzn4NKNWyd7WonC9ZdbUtEt6Vb1wvqZjmtWPgJxl4D8jf3e9BuD+d0ylj2ekkHEsXNY
	Xa0jiCaG2ziJ7KGZXUm4A3N+InH0sIMV8bhWTUWHCKcxOb+J1lwSn5ziOPzbPDAdJ6qzzQCZ/10
	DpVmVkRIdYFEWFmpfnarH6ZvRbRSd1sQ4CUjWAofP3WeDONaHMRnGzY10/495b1eoRV29qVFP2V
	xY/w5XHC7cZD3d/B0Z2dps476oDttCEgGL13Mat9mTjJ3Njgo4dkujTIMgmZ1L83tG8XUUsmCqN
	B7XyU9FJcuDH6JrZE4wUsLYWcQpt37N/tTJ7d6rDTFvp+Cq7w800vmAN+CQqxaog==
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr2603614485a.23.1793810194735;
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr2603606985a.23.1793810194196;
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:08 +0200
Subject: [PATCH 4/7] drm/fourcc: describe the Qualcomm UBWC layout
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
Message-Id: <20261104-ubwc-format-docs-v1-4-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEuVWpWw+ZvRtd/ph1qijykYD+geIIf1V4AoPskkiBs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618DOnOCXWOdFy9DrR+HTZ+OufFZQnRzOL58j
 QhxFDE2o1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfAwAKCRCLPIo+Aiko
 1TkeB/9/YScH28RnzVapYiP/35zH7PBwopbsXbqYiu9NNpAg8E71VSwtVG2P0Ts7TpgVNvFIvl/
 6vdwSasVx1ubjKGzAn9YtmrTKVAHq3/wKmVSrwXHrIYFsz/JbjUU67Z+TgV8Es/pNifCDt/ppr/
 fcZjFclGlr0Uv83d871E2h34UvBGc4WSdwGhf6RDLea2csRitdQtZnQ2arZiQmlc3rYt93mazm7
 4LgxvpTxiIusG6cvXAaE3JPs7IVg14uFcPeIfRQY+XVN9YcUqCe6yFLsAQXcVh4eUc1C8hEggbi
 XD4tydgQPJdu8/ZImTv9xbJMRE2fgHPaQhjBVHw9W1O9sN+o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX7wls/F632eUW
 luvh6jscNHj/QXMjH/aoy80+fIpNIw3uQgmzJgGgrFEA8RaSRh3yWgi2lXbm5cK2ZFR6oRvQ5GU
 vt7FKPC/W3z8I+70llNeMBOFsRybtu6FJ90FlywcE/Xq1bcOO58v3Zip+QXrVn+xYWC149mek+w
 HQW5319SXIaqTbzlvgolGWIdBjI9LrflRm6KbBqvZwiCfef+MXxWWl+jtQFCiATTdc4atrSgX+A
 g4b6GAUD8EwiUEMmGGxe96rjjuXLBtCY5eTDF0f+M57sbY/2qcW0BLO/b1RUYs+ZxxOHynQPdKl
 uBeopHPGsKsuLeB/3Hcaw5WL7dMBJRSmoFxTVTvFnm+h50jrpfQ8tJH+pH0dtWkizngS2MHTKTH
 6T+AyVzXrdQ2K5W2rMTIyBmjBDNkeCCXDDVSLE/uZDc+SoLs5hL9wt9Ejvr/yBQRfWDTKIOaqhQ
 laeJhBMy9+vKAo34wCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXzEEx+uRu7ZFK
 i+GdvfakJiWvl/4h9FXO+vqHtqV0rdoJLY2yORCo72nHrbryLx0771aufkhhP/CiJuQhHdo4VdC
 tRm/kAlokFiQCE2WwdTKIEaEkhoYF4k=
X-Proofpoint-ORIG-GUID: 7zqajV2QWEn1SkNyspelitBHK3dn5BE5
X-Proofpoint-GUID: 7zqajV2QWEn1SkNyspelitBHK3dn5BE5
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb5f13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TpXcIlR_JNNDu9J-qogA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

The DRM_FORMAT_MOD_QCOM_COMPRESSED description talks about macrotiles
but does not say where the metadata is, what the pitch refers to or how
large the planes are. The msm driver derives all of that from the width
and the height, and the GPU drivers and video decoders allocate buffers
to match, so the layout is uAPI whether it is written down or not.

Document it for the formats the display controller supports: the
metadata before the data in each plane, the tile sizes and alignments,
and the CbCr plane following the Y plane in the first buffer. The
display controller has always fetched it from there, ignoring
offsets[1] and pitches[1], and existing userspace depends on it: turnip
reports offset 0 for both planes. Note that P010 stores 16-bit samples,
unlike the packed V4L2 QC10C format.

The layout is stricter than the display controller or the camera need,
as they can address the metadata and the data of each plane separately,
but other users depend on it. The video firmware takes a single address
per frame and places all four sections itself, and the Adreno texture
descriptor for multi-planar YUV has only one address per plane, finding
the data after the metadata. Buffers shared with these devices have
to follow it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 54 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0bb049f91524..4b6a4a827f6b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -820,13 +820,53 @@ extern "C" {
 /*
  * Qualcomm Compressed Format
  *
- * Refers to a compressed variant of the base format that is compressed.
- * Implementation may be platform and base-format specific.
- *
- * Each macrotile consists of m x n (mostly 4 x 4) tiles.
- * Pixel data pitch/stride is aligned with macrotile width.
- * Pixel data height is aligned with macrotile height.
- * Entire pixel data buffer is aligned with 4k(bytes).
+ * Universal Bandwidth Compression (UBWC), a lossless compression used by the
+ * GPU, display controller, video accelerators and camera. The compressed
+ * contents depend on the UBWC version and memory configuration of the
+ * platform and are only meant to be accessed by the hardware. The layout of
+ * the buffer depends only on the format and the size.
+ *
+ * Each plane consists of a metadata section followed by a data section, and
+ * the planes follow each other, all in the buffer referenced by handles[0],
+ * starting at offsets[0]. Each section starts on a 4096-byte boundary and its
+ * size is rounded up to a multiple of 4096 bytes. The metadata holds one byte
+ * for each tile of the data. pitches[0] is the stride of the first plane's
+ * data and must match the value below; all other strides and offsets are
+ * computed from the width and height of the framebuffer.
+ *
+ * For a width x height framebuffer, with subsampled planes being
+ * DIV_ROUND_UP(width, 2) x DIV_ROUND_UP(height, 2) samples:
+ *
+ * RGB formats with 2 or 4 bytes per pixel (cpp), one plane:
+ *   data: pitch ALIGN(width * cpp, 256), ALIGN(height, 16) lines
+ *   metadata: 16x4 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 16), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 4), 16) lines
+ *
+ * DRM_FORMAT_NV12, two planes, Y then CbCr (V4L2_PIX_FMT_QC08C):
+ *   Y data: pitch ALIGN(width, 128), ALIGN(height, 32) lines
+ *   Y metadata: 32x8 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 32), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 8), 16) lines
+ *   CbCr data: pitch ALIGN(width, 128),
+ *   ALIGN(DIV_ROUND_UP(height, 2), 32) lines
+ *   CbCr metadata: 16x8 sample tiles,
+ *   stride ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64),
+ *   ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 8), 16) lines
+ *
+ * DRM_FORMAT_P010, two planes, Y then CbCr, 16 bits per sample:
+ *   Y data: pitch ALIGN(width * 2, 256), ALIGN(height, 16) lines
+ *   Y metadata: 32x4 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 32), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 4), 16) lines
+ *   CbCr data: pitch ALIGN(width * 2, 256),
+ *   ALIGN(DIV_ROUND_UP(height, 2), 16) lines
+ *   CbCr metadata: 16x4 sample tiles,
+ *   stride ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64),
+ *   ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 4), 16) lines
+ *
+ * Two-plane images are allocated as a single buffer holding both planes,
+ * with the CbCr metadata following the Y data, so the CbCr plane starts at
+ * offsets[0] + Y metadata size + Y data size. handles[1] must refer to the
+ * same buffer as handles[0]; offsets[1] and pitches[1] are ignored, userspace
+ * should set them to the CbCr plane offset and the CbCr data stride.
  */
 #define DRM_FORMAT_MOD_QCOM_COMPRESSED	fourcc_mod_code(QCOM, 1)
 

-- 
2.47.3

