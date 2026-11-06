Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972690;
	b=pu8UM3VTjZnjIc/vwmDPf7zguCMXQ5HTb08OUCsmo5DHZHhfwx+TJgVO/idS4nHG3ome
	 IZ4Bw4JuN+DGK7rsiHmCvoNoqFDpfoaJ/P4lMIMWEzHNEqXqkDnFArmZZ78h3sOd1lCIE
	 UM8S1rzaCXrsycpwZ6BBnzp1E2uczKSjaaxPZiDpeehAUvHxXpTJpxSwxf7UnXpAUB5Bk
	 w85Pmq8uHiXknEZV3n8SM8RaY9KJ6hZNxlUlOV8Hv9xNOYS8Z+evbKS/qVsTDfBKcfc22
	 twov1gDyiGBRxTFpBedu8CRpTHQ4bFXePslRwvyImObX1OYtPjkODP89+tWw4RB8+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
	b=Ygz0oBUu6PofYBXAaYFuqjtAbXAgSPj+qN5QSWpq3xQottcrYCswLrrQaGhKAMm3czRJ
	 hz5ob637TG5VYoLIpgl19exeEprjWfzO0oJoLijLF9U7bzObFxG552aNx+7veA2VqoERD
	 11i8H3NHRRc4SWbaQSJzyFJed76loR5sBY0mFI2piSUsVGs9xix1yvkdiVAA2DET+4T8W
	 Eb3+XBpupGES9lGP0p3rZntWw5daPdLKAEY28usiYPvGrnJu8bS7RgXk+Brgo+TDfymCt
	 9x3o813I/Cq56cMSUvk7fPvjjc4CBpsm8YcxwGmoi/LvEGRTDqx6pgWYrqO7EOaC9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tzq6u5mM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgzvYeY+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD26082BD0
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDD26082BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tzq6u5mM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgzvYeY+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APFhE444341
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=; b=Tzq6u5mMsJ9yzKJx
	10rfn7hWFlrl+4uV5O7yRbkf5OFW1QMdWTQcnAiBpTUCIVj2aH95BFJMGli27USs
	E0JqDVuUhWw3NYWH90IEGLBRblSKSoCB2GTDiPabFQvSA8pRny74HAQ8/nLhukDx
	FkRKe2881SuQrtuQDn4NlXLOeli0wp/JXjObNnkkvTJXmY36WwsAq93r6EYa94Xj
	HLhn0CYjFQdl3sM+dSxMIk0AO6GAgfUNQpV1yrqxI7RCuUi4X2ubhrhy8z5aGcHe
	k0dpAUU8DLGDQXB9myTxKBuK3hkQfjFNERTjfssf2HCaXMXeOZSVAWj9ata1r3Q6
	7Nie9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u1gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so142322785a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972689; x=1794577489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
        b=JgzvYeY+EpKXnIpGgag4ia6ezORglat0VWP/LUzrMqYRN9+S06/Jr5K1FOc2np3Vj1
         TfpZEGCHmy5yAPyxGuEOHcyGXBd9EYqQ2hemGFG/bq92xyR6qQsunPMZzbBY2WsbjQwF
         jq3z7HjwDUyCpBAYqZKS8Nf5wYQQ6vSA6/idYWasBUvpJ/UfxBJ4SoHY+1fKv05vVpuf
         LaopUz5m24+NUh0+ovylhwY0tTgMg70HdthNsmvBTlVLbLeC0NCAXWheCulOz7X3ecjO
         yB3k0hyvZu3CiJdjsMQvvLKqf3o59qOoV2xdsMTd0bzv75QixFl2N3Oli1NtZNyRV33B
         leQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972689; x=1794577489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMGWArbInFfU56ZSuyy57z76nw1Q/B0mKQVzCGj4gek=;
        b=NDm0NX7ngmjrqu4k+Vk0nPSq9xpIdcnNeNWS1GBcIbbONAgY1MUTosAN+vC5MrPoV7
         gbMDAFbI5nlLAcIlMRoFCg1kM0wsATpxhp+A9aV3qOdFRQfNhh5R3PfuinOXQOmx9L08
         U8J9pb3IP5YGsQe7kc5oOQk6c49HElk7cQdFZSqI+PXrHE2JxRWeX4SqVd54POqKNGcT
         c8lXtnmyHJOLRuPc3CmFY5cGBYb6hUL6ZNVvdrHWwODEJUl6nZwW400x68kLmYlUSgnE
         IGKYblJDllZLzZw93HwSK8mQKyfjvqnMdEjad8WBNSmsZcaqFy+ZDYCri4tiYaowsysC
         LGuQ==
X-Forwarded-Encrypted: i=1; AKwUvBweTil0VEadFE5TcgXNM66EVC84gYcActB0rc0ybXjrSCJctLuelE+l1uE71UpwmiUpy4aoig6hohWdDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CN0axAq1zep43vq8XEpjnkRohTIOaBT06rMgtaACUTbOhrMCk
	XxmANdpi9OGiY8H7405SayW4cCRp/TEGK/fU4de8FKtW4/MEWkJjYUqZ3fswkWoFW1ijfe1Pntp
	SAo9Jz3mPWQvU2geWjQlthWjZe17kwk11HOocbRKA94pr3/OfLoUKkAypdV+oRyAxAw==
X-Gm-Gg: AYBFou3T2ehkHanL3aT2wzp+UzrceOfZpW0a1Ju6yPyGmOxBp51oQ2U5kwxySeqCf2o
	csr1YF+K1yUNXW70hz0hL2o25l0V3F4a+4kBkGhT5hv8ymExZTwiaPN255wkLE7oZeHtml3NSzN
	EI5hb9qeMVQNKiU2z3YuV1oxW0CaE10U9bcn8o24Rzz1WfLeXcAr6G+lzZ72HDpl0l857Jg9QOn
	g1btLFcX3idwviuWnXsMKxyuOVnRR7hiwu8a834066Mr6kTnLxZ+WQ650JBgHtO9mLE0OvkuJC/
	Ia0eKOPPoe6BA+I5MfcZSS5ke7PuV/LVkZDfvsKdTFDUALP01DZr0fry4i63WP/1rS47NaXCQ7e
	yipcb38vonNxLhd7B9z6/FgIq81ej+r18dIg/JA4jCQMelC3l7lzXBuj9eUUiV4UWJeWQk8DPUX
	7O+ZqZgje1uT4H1FncwuePAsiC5wYUCe2jf21LP2tbevhnyfvyoqS+5Ce8vfNngQ==
X-Received: by 2002:a05:620a:271a:b0:93e:c12c:f12f with SMTP id af79cd13be357-945f3631799mr344949785a.74.1793972688175;
        Fri, 06 Nov 2026 05:44:48 -0800 (PST)
X-Received: by 2002:a05:620a:271a:b0:93e:c12c:f12f with SMTP id af79cd13be357-945f3631799mr344947285a.74.1793972687619;
        Fri, 06 Nov 2026 05:44:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:12 +0200
Subject: [PATCH v2 6/8] media: docs: pixfmt-reserved: describe the QC08C
 and QC10C layout
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
Message-Id: <20261106-ubwc-format-docs-v2-6-82949f88f030@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5342;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oufDthB7YeDdLirPSwGJfiDiJMRXmbblsnYc5GIVcCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm6s+PXrSOIvYkMo0otYumwJstunDxuMg8An
 mz9B+Mnhd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZugAKCRCLPIo+Aiko
 1c2QCACoHzDU8tM05kGPtQOJguY/awpHZnGl4M1B6ngb6r5IY6yedWDjfHCVdiWrKwpjHTReknn
 ZBZMYt7o0pTBEIFJC7FeB3iX5fGSR2auFc9/3WbG7RLc4H+s9651VWxPyniD/pjHIO1Y7MhCvk5
 2Xacpzuu90iX4Y0hQWDvgEJfZK5I8NpFR4ws0YpZ/q2V4EkputE8TyYD92q7/UVbuT7R0Pfbng3
 CSISTsDI8Ir5nVHpRJOywmK7ZAR8KY/lmH4g5pZZOIU9mUTk5LFhJragEjgxl/hfT0hln6wfHyt
 6p2qhXN20Uv3Vz80P9sPw0ZgB7suipVCTNBnGuzHE2bmQlk1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXzwgjU0jC7Exg
 S3NIjzjoZdB3almnoN9Xf96pSTG8oi3YrTIwMifrxoVCW1l61yfTkMKfDGd0HmOztsTxrD7xEcB
 Tm4YHiA+8QnyGymDc/2V/jj3O3HVZVY=
X-Proofpoint-GUID: dY4YhtT5NuTzfLdHjjrWDCU36fqOr5OL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX8410ga96GGyS
 AS3a1SD++xQUnhKaP6FGsWyln4G4SOnaZavcVoY3OgZzoXavU+s8ph07ay04o0pdP32TxnkGlqd
 xKc5sy+CVQF4OOxYgAlNUaze4sdpIX/OkeQ1A4bmlJRbZs+RhLF295wqK3wQU3uV72qXWRFG3mN
 0Uyi7hS4sAeA4m5WsDXq2Tj/fqfzZ/Ml7FKjPZA1xsxAqdCGO5/vnMRkClWAAqdaXzB8MdAtRuI
 qNevNVd7hlC9aqEwis/X9tt81sURYOviSn996W8K/jlIej4x053hkLMkY4OOCbSnxfpPPrUZR85
 q/uhG4Bav6RhfK3OfvSVkJunm1/HhvjjFcBI14OVHSqqtxo018pKncoaNMHEF+9FNUf/tnpYOEB
 gBTAsDi8xtfMeaPLA+enpu/vHGWj98bVwzg+/sihUJ19LmI6opMPompD5wG5o+RVjboXXGezzt+
 AgPKAkCxdeTKXXYpKdQ==
X-Proofpoint-ORIG-GUID: dY4YhtT5NuTzfLdHjjrWDCU36fqOr5OL
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd9d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Eh1Ucz_HWyYK4_jupWgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

QC08C and QC10C are documented as opaque formats with four planes, or
eight for interlaced video. Neither is true for the drivers: Venus and
Iris use a single memory plane, nothing produces interlaced buffers, and
the display controller and the GPU import these buffers, so the layout
is part of the contract between them.

Describe the sections of the buffer, their order, strides, line counts
and alignment. The compressed contents stay opaque, they depend on the
UBWC configuration of the platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/pixfmt-reserved.rst    | 64 +++++++++++++++++++---
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 1cf6c59f4bc4..ec67a1bd7743 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -245,20 +245,66 @@ please make a proposal on the linux-media mailing list.
       - ``V4L2_PIX_FMT_QC08C``
       - 'QC08C'
       - Compressed Macro-tile 8-Bit YUV420 format used by Qualcomm platforms.
-        It is an opaque intermediate format. The used compression is lossless
-        and it is used by various multimedia hardware blocks like GPU, display
-        controllers, ISP and video accelerators.
-        It contains four planes for progressive video and eight planes for
-        interlaced video.
+        This is NV12 compressed with Universal Bandwidth Compression (UBWC),
+        a lossless compression used by the video accelerators, GPU, display
+        controller and camera. The compressed contents depend on the UBWC
+        version and memory configuration of the platform and are only meant
+        to be accessed by the hardware; the layout of the buffer is defined
+        below.
+
+        The format uses a single memory plane that holds four sections in
+        this order: Y metadata, Y data, CbCr metadata and CbCr data. Each
+        section starts at the beginning of the previous section plus its
+        size, which is rounded up to a multiple of 4096 bytes. The metadata
+        holds one byte for each tile of the data. ``bytesperline`` is the
+        stride of the Y and CbCr data. For a ``width`` x ``height`` buffer,
+        with the CbCr plane being ``DIV_ROUND_UP(width, 2)`` x
+        ``DIV_ROUND_UP(height, 2)`` samples:
+
+        - Y data: stride ``ALIGN(width, 128)`` bytes,
+          ``ALIGN(height, 32)`` lines.
+        - CbCr data: stride ``ALIGN(width, 128)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 2), 32)`` lines.
+        - Y metadata: 32x8 pixel tiles, stride
+          ``ALIGN(DIV_ROUND_UP(width, 32), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 8), 16)`` lines.
+        - CbCr metadata: 16x8 sample tiles, stride
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 16), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 8), 16)`` lines.
+
+        ``sizeimage`` may be larger than the sum of the sections.
+        The same layout is described by ``DRM_FORMAT_NV12`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier, with both DRM planes
+        referring to the same buffer and the Y metadata at ``offsets[0]``.
     * .. _V4L2-PIX-FMT-QC10C:
 
       - ``V4L2_PIX_FMT_QC10C``
       - 'QC10C'
       - Compressed Macro-tile 10-Bit YUV420 format used by Qualcomm platforms.
-        It is an opaque intermediate format. The used compression is lossless
-        and it is used by various multimedia hardware blocks like GPU, display
-        controllers, ISP and video accelerators.
-        It contains four planes for progressive video.
+        This is the P030 (TP10) format, YUV420 with three 10-bit samples
+        packed in each 32-bit word, in both the Y plane and the interleaved
+        CbCr plane, compressed with UBWC as described for
+        ``V4L2_PIX_FMT_QC08C``. Each 192 samples of a line take 256 bytes.
+
+        The format uses a single memory plane with the same four sections as
+        ``V4L2_PIX_FMT_QC08C``. ``bytesperline`` is the stride of the Y and
+        CbCr data. For a ``width`` x ``height`` buffer:
+
+        - Y data: stride ``DIV_ROUND_UP(width, 192) * 256`` bytes,
+          ``ALIGN(height, 16)`` lines.
+        - CbCr data: stride ``DIV_ROUND_UP(width, 192) * 256`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 2), 16)`` lines.
+        - Y metadata: 48x4 pixel tiles, stride
+          ``ALIGN(DIV_ROUND_UP(width, 48), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(height, 4), 16)`` lines.
+        - CbCr metadata: 24x4 sample tiles, stride
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(width, 2), 24), 64)`` bytes,
+          ``ALIGN(DIV_ROUND_UP(DIV_ROUND_UP(height, 2), 4), 16)`` lines.
+
+        ``sizeimage`` may be larger than the sum of the sections.
+        The same layout is described by ``DRM_FORMAT_P030`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier, with both DRM planes
+        referring to the same buffer and the Y metadata at ``offsets[0]``.
     * .. _V4L2-PIX-FMT-AJPG:
 
       - ``V4L2_PIX_FMT_AJPG``

-- 
2.47.3

