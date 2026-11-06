Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972688;
	b=Q5oqwWaMgCxWXrRu7BhC3Cpc0QxiXhuXzs1dTSjEuWO7ZJWZbTOK5YJYwMd8MBM19r8Z
	 QPgBx3IYN4axsYlyNPGiOYVdFuoL8Na29uPjx/Wa7nr1tn4g0yPR4Xox2Yf7jIeX1llSv
	 n72DAfCOWMF+P05w6X2DLZJukk+rbV5RCxRhxsYiEyutAnPHjtiEEaDT2cXZC53OXSOGF
	 edHmstHx+a2KALiTAebUwter/+TikPEG8Iyb6yRqp5Mz/eCdpkVIOZwIjtlBuBecSZW3w
	 xMa3xRAUfKFbFGODK6V6OQiTgt03ORl+6Zotk68hbpkQYF6rPedziZbZHK2uVFmvHwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T1R6BuIc6DXQGz75sImpTyNUbfCE2LnmujKp5A9+yb4=;
	b=Mc6pkCF0ZZV/C5SV7fh/mslQdRaRaJgqN/cRdLhiak/jnzExJggaDSom0fl5PB4mI6xG
	 2fVIcPwgFOib3SOmsF9yxuMwSakkx3lQnvC4iEpIZOAG05v0hGd0JkKtx6bw7/YbHpIfJ
	 akIiKxcjmwrngP03mFPvI855MvJC41qp9cfcfgtyG/uPe5Uxt9pGtm4S/SYmI+ogKZ82y
	 OuIalFP/xtCWVdaPNJaryBDaUCIw1I48ZS1xTRLzgRL5vm/gE/X6Lr1ZgkIVnt2ZOrvTx
	 9XqjtDGLgn7J7AqEO/fBJnCyqQr/OkHRKrffxvKSef0a+JrK9UZnNz+CS3H5XPWBV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EeQM/4kW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNedRq4H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6B606EE94
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B6B606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeQM/4kW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNedRq4H
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APL89114720
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T1R6BuIc6DXQGz75sImpTyNUbfCE2LnmujKp5A9+yb4=; b=EeQM/4kWhFmOJuwe
	PcaNygUpWGunYh1Mf9T4qVZvMW/qajo+zbGNycZemiUV+mb2LW/W92nVqxyNzi4S
	+q8Q++hDwx3V7UcsJ5+yRX+iWA1MXrB4Ey4m3GNoDB1p/a0gJRnAhLpaN3q02Bkn
	iZed9h2i4K/C7bLJvI3upAb40DuZL9Gq9JTWEYbn0H9PiXtWg5h8k+GpIdCUmNiZ
	118LSYTGGWXuTfYHB9JMHvHUOwk0IBAD2iygGw4PNIYKe7RgpeMbApj+hEoSF4BV
	m/OYzV7nV06BbQtRwzlZkJsD9P9P6uFRflxNYDydoZQYNa2HuCbngaeIaFhTyyRf
	Oa6ipg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3patyw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso120318785a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972686; x=1794577486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1R6BuIc6DXQGz75sImpTyNUbfCE2LnmujKp5A9+yb4=;
        b=QNedRq4Hl+tpTIfazygtO+yUxphQGC/R/YrzEB6EkqaPH6cVMylVoG/FwuDycLoHgR
         J6NxUlwZ8Ezexy9lEn8E6tIdiKo7MkjeWn8So4/5SBK9LWalvjZ84zo7Mg50YMPe6g1X
         FRBtAXuZ2bqAf7ulHf42IhC1o7727s7TPpmIL2L1hDwwlc+Dt3phTgQz9a2Hqv8SEz+i
         CBLI8cbf9lTM1jXS1nUiI+2p9rS40H1Jv1Nx50FscRUrn8qfr38/6UJmKH1BQoDFPJXw
         LZw/YVsKcGN2V56bGmtAX9fu6ACodjkePB4RPFL3qOP3np3oj9mGbcdTUi4gKnqEBu5P
         6onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972686; x=1794577486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1R6BuIc6DXQGz75sImpTyNUbfCE2LnmujKp5A9+yb4=;
        b=Tj5QYCsFZmxwaNsCozgkunB819OYl2iV7isooH8RbVkYuagcZ25t58l04AaGxfAlis
         w3BlmVd+hrDfvIH2cEcLL71NqEJs+Yv7TiYvnHShrgo4MYYKQ2eTMjvq1YgQkfStHDWh
         3vO251ux/71ohLpKMWaYE2YfWM5MUShYqzCJMlx0JezFGdhoXCiNJYtRh7ey3jO4jv1v
         Q+xSrpejTmHixKZYUGCC4WYhJ+XCDvYtiRe6StCBv26my4GyP3X3FJOJmqGGnyKEuFBY
         AvcecAMMmRg88eOk70ftCB/AJfDgUdzkEHKduHK3TIz+fyZX7z19h2aNtpIODFtuGBv9
         BgOw==
X-Forwarded-Encrypted: i=1; AKwUvBzwoHV5lW0ea7MNHoXsdRMo8SKKswHeWbD3Bc5nEA21N2++34uW1qYkEey/IAnFL4SD+U+GZUf4S7aZwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8mqmNbPP7PgbJVzQxATJ52coYk29+/DcPXIFxK7K4YgQwH7UUq
	kfdDgftBAoHWhUk5zez0xax3sReD3P1tuwe7qYNGpQSKsOKrUCgF2McHBc6+b1Qbt+fG5rBsD2X
	LrUuYM8U0MoO03Uw93W5atDQk8y2HoyK3V7lVr2XdiSL7/Q50WS12Lmyz1gfF8HkIHQ==
X-Gm-Gg: AYBFou0LF4AcK7p+QIGt0XM0TNPsv9Uv1VqYI8EAYb6kYyGE77ZKrBtfWrcPy/yC439
	IFuUsxIfGnWT4bCM13l+ozfl2eOyHuH+JgovPWPSSa2GziFv63gtnTwrqam0b98/kJLnj3i8Slm
	TBrin9cazTkb5irwnu+tOMzYc5ZMWmszfyN8eEMhvqulPIvmECeUc6o6eCwDGhJBnvQj/JLkelM
	fYhcAim9FHHLKdC2KssgaOyoihWhcpbWue/zn0CyaU2RIX0udoRZdvMRj6nDvAoh1HTmOloKLWZ
	vqjSRYCbjXvOJ38GlmSwFIKheyjGCtf//PNk3J0gDBWcCz5Gskvo0JZxUppO6jY73KFkl/MIdNq
	CCJ1CV6dy1rI2+uJYngMkconI8WwWSKDwlX/5Rflsij7TMIEyTB3L98tGldPwD4mfbhWOxv9dyC
	RceLWfo9BnBVVAgklM+TTwz6usm+8X2JbnW27Da21rwl5hdUVWbUenEL1kkZx1tw==
X-Received: by 2002:a05:620a:4397:b0:93f:2941:6b8d with SMTP id af79cd13be357-945f33aa172mr297781885a.6.1793972686160;
        Fri, 06 Nov 2026 05:44:46 -0800 (PST)
X-Received: by 2002:a05:620a:4397:b0:93f:2941:6b8d with SMTP id af79cd13be357-945f33aa172mr297777385a.6.1793972685536;
        Fri, 06 Nov 2026 05:44:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:11 +0200
Subject: [PATCH v2 5/8] drm/fourcc: describe the Qualcomm UBWC layout
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
Message-Id: <20261106-ubwc-format-docs-v2-5-82949f88f030@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5526;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PBEbayVdH87klbKtk5JOaPGn9vN61SzfT+b4Hydj4Zc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm4K3gdV0YxTzrffH3VlVj75NZoqa3yzqEaQ
 a9GxW2OtPqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZuAAKCRCLPIo+Aiko
 1TvCCACZKz5loZofq82owJSku5llc757ammPyLgmm0rXElo0OADaT0aD3SruDuNtNJpWCQroA8y
 oHrCGBz2fJjxdCrxIhQEA1qMZ/yoeRfRMShwqLN/d+8MdRtNuhpWhlhToB2KmVvBRmi7uDNSDqp
 WT6I4JhhR6edEeW+sOuTxWgMoYResv+ZDakPhqmr/YzkvcmTNLQOujrlIySARsCbT35Pu65si8L
 uZqcNf4Fj+eES6fIKRtEsRbpMlYRGU9L63hcX7w6DUEeVUR/ZZlsRfVNQcv9N9qznrMooNv1Sf6
 BUozs0duG3j+G3ppFiKX2a8fjlsE/ZDAxmy5ypJLz/eDs+yW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXxhrZjNDvHF/b
 kxQorsHnaXWqji03XSWhOx/WAsHapiJmuhmhj1lPUMM1ntdOmSC7SSRu7QwojaNGZcp4R8SrgUy
 HiBB9RM7sDCxYdw5goXUw1/cGz07V/YKsDV9DfGzSewI9AXhbvH6i9uQzuNGd/RG2BqyrDuMT2Y
 x+870slIQpnA7kZy2l4I34DJwcdsJCdOlhybn9e/JzhoMl8zbCZXIGHjOZU7XQ69dxg4bdHU3HE
 JPl2culqEmsAA57M6/QalTty457JeKi4WryCLEO5suSrxkSgROT3B/LHKmfgzK73jau/gvRhzwH
 TpPSnt4s+dVvaA3sPmLNrmTbK50eWO8HDvB5SwA1CFm0TFREfUzkdNS4tNrKcflUhVkSgoadeVU
 Q9+/+ei8Ym7UJRoom7mIzMO6t7lKGoDu8s4wmNSl++f8O5ZCsjbgHK4T5ZvzlElYTqg8LcR2LCO
 huzQCSLKSU8B4v4rqAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX04ghJmvXYulx
 K+c70hyzHPpplTrFCbPpbGs5OacMztOfte2P5dXQao5wZ0TDYB1gD7OX1zIihP3Sop9bcLcMG2b
 nbjyWpiNz3QG1flkfUSxtEIqPR3Fnk8=
X-Proofpoint-GUID: vIGV9O5ITxtsVhEY2m_YsjjYf1-tBk8U
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedd9ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=U_HTlJNxgaGUaFeKA3EA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vIGV9O5ITxtsVhEY2m_YsjjYf1-tBk8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060054

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
reports offset 0 for both planes. V4L2_PIX_FMT_QC08C and
V4L2_PIX_FMT_QC10C are the same layouts for NV12 and P030.

The layout is stricter than the display controller or the camera need,
as they can address the metadata and the data of each plane separately,
but other users depend on it. The video firmware takes a single address
per frame and places all four sections itself, and the Adreno texture
descriptor for multi-planar YUV has only one address per plane, finding
the data after the metadata. Buffers shared with these devices have
to follow it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 64 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0bb049f91524..2c9f56df64c0 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -820,13 +820,63 @@ extern "C" {
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
+ * DRM_FORMAT_P030, two planes, Y then CbCr (V4L2_PIX_FMT_QC10C):
+ *   Y data: pitch DIV_ROUND_UP(width, 192) * 256, ALIGN(height, 16) lines
+ *   Y metadata: 48x4 pixel tiles, stride ALIGN(DIV_ROUND_UP(width, 48), 64),
+ *   ALIGN(DIV_ROUND_UP(height, 4), 16) lines
+ *   CbCr data: pitch DIV_ROUND_UP(width, 192) * 256,
+ *   ALIGN(DIV_ROUND_UP(height, 2), 16) lines
+ *   CbCr metadata: 24x4 sample tiles,
+ *   stride ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 24), 64),
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

