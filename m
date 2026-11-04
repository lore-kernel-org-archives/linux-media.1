Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810194;
	b=Yh37xkETST3qKTZ+bTO0T0PyC2fn3qRndUPm9BLFODKwHCVA08CqxpjBXpa6ldvoFOaU
	 5efJytPP0ipeIJpserjZVIC5PYg6li+YON+g4TgI4QN+EeAZwEYRdn/QRhXwblUGwS2rS
	 bqsZJuoJfjqBvfujaEmOqdma1IjZHJ2f21pbJI7vhnBHNfV7T6Ajl7BZak0aMfGpppWZQ
	 /ItpQBoxVI5ocBbhOS7k9XbNqMeZM8C2CBxwwJOVukIl5UTj/kPKmfM8QhOFMNLIQVH8t
	 RPvGrz1ua7KmvLK4X90lAxxEcJFQwy010PHsA3bLlD+KKR+PZUvHBchzFwUEfnvw27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
	b=WeCsucTquaVCaTuS8B6otBlm7YFXTG1WgyeZOmengzUUiLlD3Ajuj/tfDx5xpRl8fG6R
	 oW1rk8PDzz3V+S4u0mw86ALLstCSCwvvg1eNBigeDkwRgpCcEyoZf0A156IirxGsrbYC0
	 cM7pnoGL21ei/KirDh+JDKWJStiURZewjgX7o0M3jA2hittfWKz8QTvf7vCQZ5Leuf6iU
	 gN0e10yKYc1z8VGeIXJW8AJkU6AnO3W2IWoSyQISVLxWCZp1IQbhxgKS0fh/Rih+4vXfE
	 YwXUrIl60zFsDiOQAfcC0fntSG4kw03ujKdEY1+/KtA3i20sSOWxgElrFHA4AIfQ3oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865C606EE91
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B865C606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FisaA2210743
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=; b=UPinxDa4Nt2UZpDl
	TulAVH8nVYovHQv8fzAwCsFuXWeZMNZBhUR08kP3gZo0c0P7cyhzuhQLLTk+nZeU
	yiZ1LwoNHZJvHqa74xHsBXe8QCAMRcuGRJrK3uY82QAya+vCtBk9bYpBXTBGKmRG
	UJqnQCcJIQ02x8mF6aj4WSd8c3gPbSRBJNmbeWqiEQp0Eg3I4ZAn3yxPAX0Fn+oK
	3N8JeOsyhJqlbOrG/0G3o2mfYzxqJHmqC47MhKpPIemBzSuC4w9B8db6YIIUQiQx
	8UnXCThSmdBDFj/kazThMI+FfKOqbSJ1STJQkW9IcpMM4N6KSwqD3OU7RuBG2wdE
	cfVasw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdrjch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so160611185a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810192; x=1794414992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=Yptl6ZB8cZpRJli8EqKpUemjXR9ou+Qk1/ebLnrtTxG8c5w9ZgrXp+Fm0QVBdxOItf
         X6wITRKqm4QVxyIORl1Qh9jl06HL9XO62Jn/kgT1ZtwUuwMB9Ra3I9G5lIv4vaEe4ZBO
         CLaN1hkFGdlqu/uMwY5FjUkQKUJnmvDh8VANpHh5j5VmfT8Vca0Qq/IKe9ysM2HMVZAJ
         kawkNsroO/9trdvWyQZomR11HOKNHdGOzaDAyRZQoSGzlbWuHSZ+iZS5v2nzV8V1ugZa
         emDNxMPWAKnVIBXhcfr+0p2yKNjLi4B58ofhrsFrqF+vmv3OcUgtVCHXZAcL0FvHYb+u
         o8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810192; x=1794414992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=JczQCMaqeExwFp92YxqcVxhvGHllKPZXyj2ep2PjXZbdbruDneEc6Kv4I5zdiKYIVZ
         K9ektIAAB/zvFL9/UEuLdOM3a5hYDEdhXr56DS98pRGd4tXt/D3skDhSy2lhM5kKtT6K
         vuR0pA/EY95iEfzSzlGIpmwY/uG9D0luiXTcOjAUgaH6Ym5Opq7JaTBfPGFd5DUDyvwP
         IuJAHqSiDKb1J/imOmHMeMqYbagTqeqBrZ7qTsZmvT/SR0rP2UIni+fAGnOFSjW8xUqL
         XFFgFTTRuOZFe8bc3v7lzOS6PC+LJiyLxA0PO4FRHxljoTkrzJPIHblVzACoufLz27m6
         eNZA==
X-Forwarded-Encrypted: i=1; AKwUvBx+iosBLkPv0HzcFTiYAPPxh2GXJO5vtbj21+MOzo4Zoh/s6XscrteVZlE3A2tz0iqNvkmE2vc5HO62dA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tg5Aw5PknreH7DcJr61D6G46DINw2HjAyaiaeP+nptWJZNzr3
	BKf6NLzJebBffIOo0pfoPZ+4C0iBRTTNPXxZBvsExQWcMsoK5RI6y8BA2Sl6yZH+XaChVNeFveX
	Q/wyyfi6E/RVfixtfG0lKCtQLhDBDzuUC68b5f3K1DyurXi8AJ3fA+DuqtejxsYtXAg==
X-Gm-Gg: AYBFou3h/eX57z0onG3a2tnLkjbcYjp6aeL9pimFpGUJsvnJvxyySFJuqveJFj+YQ2A
	9bgRWaXhcuJmylxkxBLzHFUxhtnTWA0BWs50M45buVCLGhL5h4Udp1gOHXiD6hDqiHskczOSPI5
	DPk3i2IfPG7+YKI40655xGTgklBQ2heiFWRE7OvxEL/dQ/+s7dQqKXpGHkYFS2koFWGsK+MIfxX
	UrAsq/+fPlAKixpxWEtaintR1udEeOyxh3MsbmtXdrO79iOROANjM206egNRLAb+wMnSaU4v5Ic
	KbrPrUBpu6Rfo4k5UE1twUrT3FttE0KntR3IRhQbTL8+k6aGiDkXeaNKUYhfkF2C40Bs3Z3h+9O
	jKg5wLyBXNg7+a29ewY7QT4chkMbfxNEOo7puzn49zx6E4OQsvYfJUHHaO7iu8P63naglYke5fS
	tsYmdT9wYXfF8GRUyCbDSSCqaXcBrgkEBtjF63SbnT+KNQ+klsyEX+yTfFrjz+ag==
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr445985a.13.1793810191804;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr438885a.13.1793810191159;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:06 +0200
Subject: [PATCH 2/7] drm/msm: move the UBWC plane size calculation out of
 DPU
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
Message-Id: <20261104-ubwc-format-docs-v1-2-389044012b4e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8736;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AmdZZg62etbzqZIgQV9PfBSP69nkwN0xIASVNbPOxK8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq617+1qF+R24xmUAxP2TrQLUwrFxFuOgmulHi4
 q+hyZuqzDOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute/gAKCRCLPIo+Aiko
 1VhKB/407uGmM/srEr7Xg12peHhJqPs7IvflofwSqDUSAHpCjEkv2nnWGoXqOXZ7YKXL8m3F1gS
 bAxd4PsxhqbAAjs174xGvVx/IS3Vpx0soEM04oSGvToWxLM2T8AAkjDF2rV+f/jrbgIhQiMNiLa
 zVXlTtX7U/BTu2WmHVdo6HykTJR5BgcL7C/CI/oExjTg1MQgiGJ4J/ZbcZbm8T98WGTbsYPXA6v
 92EsAOO5xaC2FjUU5rgsA7Ukjyy5APjya8pPCklsW2TidqrfZm8CcW0ctR5w73TSkIj9k/FmGy8
 v2N1w8DQHcmyh9+4gSrp3YZ/UU1+ZR/zYI44q65GSHvqy8OU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX8dVktJU6bFEo
 UaG64WMVNcknsuZKJPSlos+/Fkmf7fZyQC1pS9tF8mgu6OTx61cv9gxlg046s2m0lt+KMydSbg3
 mSIh8R5PrEnf1Ia6/RG/ruJxiJoj+DI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXztqsNYVnFYAJ
 3AHvyTcOgTqE5H9CnzxUVkhhzwliIs3/zb+vg3knOJD7kEiJbwS8zU4WWD9gC45Emkl88BRrlPs
 yc6qJvnaCkSRqLsRzScJ5zTUMbWKOwx53LOrZE2Wh1zHK+gkpifvqOHx91bZEmdMUBDifB1oPDT
 kW7aSSWIku1yJCxp82vuMO/mcwibojgoF8avgSErVabOweijFdD/Ns7NJ1g33F4suYL/5HWKmNw
 9n5jDkMs5HCnirJtYXinVBcN+UwLNtWa+6edmFL91SIwGlZ2WKBMBO+5gn7rXxTUVRUkLeoiE75
 aIzJVoLFJQ0FmIv+1Yb3msHPphyaUuMzaesz2AzbirmiqxGd0O9UcW7H/QGqj4Wf3rgdTgJdSaV
 QXflOOpixoNUloxyocJU+B0J8D43Bp3LSnZfhikSlwQ03zS/JADLI7PN476DaSAYtKEOWUKGowm
 nEm4l1HT4t+hUrcuXNQ==
X-Proofpoint-ORIG-GUID: 55Yb2bRMxoy1U-dmR9TaIY0udTiLDlTk
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb5f11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iK4Z-rw_lK1HlppuerAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 55Yb2bRMxoy1U-dmR9TaIY0udTiLDlTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The layout of a UBWC framebuffer is only known to the DPU, which computes
it from the framebuffer at atomic check time.  msm_framebuffer_init()
cannot check such a framebuffer against its layout, so it applies the
linear size check instead, which neither matches what the DPU fetches
nor what userspace allocates.

Move the calculation next to mdp_get_format() and make it take the
format and the image size instead of the framebuffer, so that it can be
used before the framebuffer is created.  No functional change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c |  84 ++---------------------
 drivers/gpu/drm/msm/disp/mdp_format.c       | 100 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |   3 +
 3 files changed, 107 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index a8e9a69834af..06903325e7e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,8 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
@@ -58,87 +56,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	bool meta = MSM_FORMAT_IS_UBWC(fmt);
-
-	if (MSM_FORMAT_IS_YUV(fmt)) {
-		unsigned int stride, y_sclines, uv_sclines;
-		unsigned int y_tile_width, y_tile_height;
-		unsigned int y_meta_stride, y_meta_scanlines;
-		unsigned int uv_meta_stride, uv_meta_scanlines;
-
-		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				/* can't use round_up() here because 192 is NPoT */
-				stride = roundup(fb->width, 192);
-				stride = round_up(stride * 4 / 3, 256);
-				y_tile_width = 48;
-			} else {
-				stride = round_up(fb->width * 2, 256);
-				y_tile_width = 32;
-			}
-
-			y_sclines = round_up(fb->height, 16);
-			uv_sclines = round_up((fb->height+1)>>1, 16);
-			y_tile_height = 4;
-		} else {
-			stride = round_up(fb->width, 128);
-			y_tile_width = 32;
-
-			y_sclines = round_up(fb->height, 32);
-			uv_sclines = round_up((fb->height+1)>>1, 32);
-			y_tile_height = 8;
-		}
-
-		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
-			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
+	mdp_format_ubwc_plane_sizes(fmt, fb->width, fb->height,
+				    layout->plane_pitch, layout->plane_size);
 
-		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
-		y_meta_scanlines = round_up(y_meta_scanlines, 16);
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
-
-		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
-		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
-			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	} else {
-		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
-
-		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
-		rgb_scanlines = round_up(fb->height, 16);
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	if (!MSM_FORMAT_IS_YUV(fmt) && MSM_FORMAT_IS_UBWC(fmt))
 		layout->num_planes += 1;
 
-		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
-		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
-
-		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
-		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
-
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 33da569eae5e..c0121d709110 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -650,6 +650,106 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 	return NULL;
 }
 
+#define MSM_UBWC_PLANE_SIZE_ALIGNMENT	4096
+
+/**
+ * mdp_format_ubwc_plane_sizes - compute the layout of a UBWC or tiled buffer
+ * @fmt: format, which must use MDP_FETCH_UBWC
+ * @width: image width
+ * @height: image height
+ * @pitch: per-plane pitches
+ * @size: per-plane sizes
+ *
+ * Plane indices follow the hardware: 0 is the Y or RGB data, 1 the CbCr data,
+ * 2 the Y or RGB metadata and 3 the CbCr metadata.  Planes not used by the
+ * format are set to zero.
+ */
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4])
+{
+	bool meta = MSM_FORMAT_IS_UBWC(fmt);
+
+	memset(pitch, 0, 4 * sizeof(*pitch));
+	memset(size, 0, 4 * sizeof(*size));
+
+	if (MSM_FORMAT_IS_YUV(fmt)) {
+		unsigned int stride, y_sclines, uv_sclines;
+		unsigned int y_tile_width, y_tile_height;
+		unsigned int y_meta_stride, y_meta_scanlines;
+		unsigned int uv_meta_stride, uv_meta_scanlines;
+
+		if (MSM_FORMAT_IS_DX(fmt)) {
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(width, 192);
+				stride = round_up(stride * 4 / 3, 256);
+				y_tile_width = 48;
+			} else {
+				stride = round_up(width * 2, 256);
+				y_tile_width = 32;
+			}
+
+			y_sclines = round_up(height, 16);
+			uv_sclines = round_up((height + 1) >> 1, 16);
+			y_tile_height = 4;
+		} else {
+			stride = round_up(width, 128);
+			y_tile_width = 32;
+
+			y_sclines = round_up(height, 32);
+			uv_sclines = round_up((height + 1) >> 1, 32);
+			y_tile_height = 8;
+		}
+
+		pitch[0] = stride;
+		size[0] = round_up(pitch[0] * y_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		pitch[1] = stride;
+		size[1] = round_up(pitch[1] * uv_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		y_meta_stride = DIV_ROUND_UP(width, y_tile_width);
+		pitch[2] = round_up(y_meta_stride, 64);
+
+		y_meta_scanlines = DIV_ROUND_UP(height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		size[2] = round_up(pitch[2] * y_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		uv_meta_stride = DIV_ROUND_UP((width + 1) >> 1, y_tile_width / 2);
+		pitch[3] = round_up(uv_meta_stride, 64);
+
+		uv_meta_scanlines = DIV_ROUND_UP((height + 1) >> 1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		size[3] = round_up(pitch[3] * uv_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	} else {
+		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
+
+		pitch[0] = round_up(width * fmt->bpp, 256);
+		rgb_scanlines = round_up(height, 16);
+		size[0] = round_up(pitch[0] * rgb_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		rgb_meta_stride = DIV_ROUND_UP(width, 16);
+		pitch[2] = round_up(rgb_meta_stride, 64);
+
+		rgb_meta_scanlines = DIV_ROUND_UP(height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
+
+		size[2] = round_up(pitch[2] * rgb_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	}
+}
+
 struct csc_cfg *mdp_get_default_csc_cfg(enum csc_type type)
 {
 	if (WARN_ON(type >= CSC_MAX))
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..02fde07eb6f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -204,6 +204,9 @@ struct msm_drm_private {
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4]);
 
 struct msm_pending_timer;
 

-- 
2.47.3

