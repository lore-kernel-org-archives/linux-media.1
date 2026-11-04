Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810199;
	b=LMoCMyM/WHDp4azaiWfqWRB0daRD8bmZs+EdOOMUni7MlMvOSuBK2KX3B78bK1+/H8vs
	 c5+VIacq8kj/iBzJKHsFi0M4D47SK7p2hERhRva2UU2npx3VAmKBiH6URcR/PMqBbnVnc
	 wiXiO2eTICguueaW+DPoCxLIwgb/Kh2Ly+4NrZ+csfTYuYYuS/b9gTm/ibrKniHgADkDs
	 vPaWWaVGa5zmEzHc6LY9XtMG7SGy5zgOMfKGdjA5xbilZDKwPAGcTz76TxDLzWK/gRFLP
	 89g2QEaWQjpx/vFiuLPTuvfdx306Z0FvBMvWCayk0ytJUkOWsF4Y3YPay28gAr1hWGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
	b=Gxh6/Oke2fzpgLqccUnyAuZ8LiXCwVGlGxLWI4fjr1pwyfTDu37WQ68pcy/41q8B0Lda
	 4VJM7/WDIjNAcdHAaQYx21jZCw+3Jdr4XPZwDrIBN5RrpSeF0F9DOrTfy7nKfq0RtTto+
	 258SoAl/hmUGD3nxmZpPPWxi+eoJnf2RkQhzo5wDWVIV5h13VDiqVw9Kyb8BmBt61eiTB
	 ECDy3nXGRqy357jA5QnY/3Hj2ImjmhgtBpycCyHn4p6+Si6JwFlcVOU+3i/Zka8/fr4cE
	 b5EwwD1/DOxpPfHzYDyeiTHnh7aIwZm5YvTCixFLUrVIO9AAy6YxZHLlQCkgUB3g28g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m56zB3s/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9uMX0Jx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F56082BD6
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876F56082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m56zB3s/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9uMX0Jx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj8mQ1692528
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=; b=m56zB3s/GIp3aK0n
	HaOL6N2dPtpScSklVRfq9cXQe975Jw+9JBLeOADAB/o6/nr9F6EJTopuRgBAPjCe
	tdkz3U0smPlO22yX/+m4I6JhV4B0cS4fkfqZhuzA3wgSvvCK2zGCEQL4Rjs4gMj8
	jlL49/lEn9HIbmPJtRqUgb06IOm51xD2F7YPgp00E7AOqHhKzuKDfNraC59xwzA+
	4jLg/U9mAoDV0jhnc3lb1UhLdF4G2j5hlboqFB8WIb6orMaTyOGopcNTKdFCl5vg
	/eOv7WhMjImyRztmxOd5Xx26P9xoSOpSGTxrFe76rfffZccFsje2m+Ra+poM9tCV
	ykdizA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so140945285a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810197; x=1794414997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
        b=Z9uMX0JxiyPoPUjERrk1Dr2WXSk+N4Tubi0bsIavDOKnE93SOWI/S0v1+AQUp3I26F
         +wWdr0HUf6NsQzA73kXcbaYqTsz7Hex87kpMoKz68O2ksF2tVi5RhOfvJ+zDn1bt4oVD
         9EmqntknpBjTbx5DqXW0oDJyKeVGLZFlkrEFpc/7cCxlDIbVWX/6LhaZFr5o7UNmzjux
         q0GAXoil3eHJVh8avln7iND+QR6hgcukL1cjXj5D90t4tn1mNjQClzChPZTkOowjd4yU
         uc2wWjCED5YjoQy6lW+x6wqXoMSjlrxv810JeE6GvXwtcsYhLLFS3EY0vAlqPUociUpl
         3FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810197; x=1794414997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmnctkQOqSlcJNDZpI/f3GW8bFHAo86SA9tyubOGVL4=;
        b=AbMIIOE6Vd6FEca0W6qInzcuCnaOLdtOdbGmQns7pHSxwhE4wQGRD6KVUFNTN+D7nC
         /cBbcDUmtJ6bcftLLpdGnwuOVICt21fguqHXKG1BQOK4gpaVSAKKDJPXUd/E6uNTc9yL
         DjFQz0DlDzLqJ9/js3/6+PMhKh4LPh8b7q8ZwQPqhqxQEXmumFNPN0D+7C4uotZv8mme
         oWpZJCckSAW2Dj3N7RREj7Ecbn/GoxLvyPkcUsIOnJ/U/j7h2+5SXN78bABWOrrd2rm9
         BWnU8WGi9ey2400aXlBmIzFbxkv466C1fnaoSSrmV4dCM3vt3IWnuEvwaOlGt8A3gBcj
         585A==
X-Forwarded-Encrypted: i=1; AKwUvBxh8Th2KmXchIw7O/XGa7irHmsIF4r4KZ5xmdxKRhxgPqW8in55N+lVgXa3lnqm36REAbjpQBF2vPNNYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z88+NJQXcaamNr0weGH/eJF/jNKMqr5jyj8auv1uU5LhhPQe0VM
	Xfck9UWNydYum6oR9gTQg2eUj8ARQEDni3MX54+J3uP5gKSfJ0I9BbcoyMDYVuNRiC0MtbnJxv4
	GgOD5J6vTtob0GLTMDjOvYeroDAXBo6+Y2lXLu/YyBFQMSF+D3Sts4oLo88cpXJqRAA==
X-Gm-Gg: AYBFou2Ixgqv2pmTRsuDScX2KwqX57xDKbUyFRca8gchRNQ3ViWpe/zbOtWxgw2Ri/s
	QQ8voRPTRTUq4YDB9tKv9ny40wGHoJBgOMcBS/BHUJgKv0qXa++AvQo1c+FOsqpHIpKXAPm0MA4
	E3pS1t0SDI50xGQ0z3iwL7A8NDmhMRDuh729dvt1AQKOY8VgxJYeArRCzi/fKR/eBOdaOlsMXIQ
	m5wN3J8toTAyyJj9+AsfWo2bW1WLEe5+nLUywV+WOjeok4T0UJEZT2SnBMT3w9VoX9UAUyLk350
	cheh+gRJyVvAgdLk/fyH8UAVHgi56dB79XE87PGiRBwvbhormNF+LK5eRL/Zs2p9gWkibJ7+unP
	acprgjBK2N3wwpXuwwU5L2x/oX7JFo48VzEiBbfrTQd3/cSNAO2KSaSkbnUdoDSz6L4MR7lgI+v
	HhvudPCCttjJiY8YrWROQxMhJZAl+I5o/+uprac0wKdqSzwXRshMvlQt73/Q6OnQ==
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr3099620485a.23.1793810196561;
        Wed, 04 Nov 2026 08:36:36 -0800 (PST)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr3099612885a.23.1793810196023;
        Wed, 04 Nov 2026 08:36:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:09 +0200
Subject: [PATCH 5/7] media: docs: pixfmt-reserved: describe the QC08C and
 QC10C layout
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
Message-Id: <20261104-ubwc-format-docs-v1-5-389044012b4e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1OfyeKpg9SI28jpOvwv81zI2qbKFoyNRZrDSfeIXOIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618FUrwLTtJam1l5ngbz7ZqLghcNF67hlfAGQ
 LmaO//9uzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfBQAKCRCLPIo+Aiko
 1SqdB/48JOwOXGgB6EFrl/RBSNn5kwXfc2kHX+HSIMrob0xEG2LypCY5LwWmH9Uo7hJqHSk9Aj3
 QsRKbRqbqKuCM6z1nu03b7x+L7lj5Yi2uhYzFhQQF60hLQZya5qkEzUImUCXCQCzc17cT6yGpa1
 SU1yDT65cBLQ9YV1qFJ2J3mN2ruVM8wMjItAjpXGxFGXKTVnENuvgnH7VQpL5sltFYpuER2A2iW
 wwx79ASinjlez0l+Ev5y2ZCFlzT7uGzSc63iuJVMVxmXCxoDSXi3lPbrqRwep85zsYY085f6jkA
 ONgoRUTxdwBGgJzKLTP1Ar7z7G1QBIvrkv0OsB57uZqrbyiy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX2rAyU3eg6SjY
 eX7enuWIQNLSAUgL5ac5W2vLHJiUgjxgkwh3QxKQEB4dxLuMWIl54W15mufZ2G52f2YXjzIZpnf
 56eTNknJKw+UoZwjfN+QhQQaMbxtvur1ofm8j8Bn4WWGnzro9sxTJ0evYRT99PJAVMCM0VpelUS
 SYDWitqttOqWq2Bppvhpd0YfYlZrHMgbs9zMYKhzhP9nBYxEWBJdwnD/0t0OKS3bFHKIlstzPcU
 UsIPxF4mMwGQlH7cqMmvJ8TGPj1UtMrssN/VxHLLR2kMRj1s/kjeF+/J96RQD/azulfckYVkq4Q
 weS2jdU0SX7Bzy/ecrck2loQ/vrbFcI266wqzGFAIXeDymp2cvr7JpNtko0ZpwYNEf6chsJHdVb
 i+CqQcm+HZzYENnSNDoa8eIwCWN5UwMXNS+VAK/uzevhH6QVx4WyOfkyQyUJ5DW+1bwyGSB8Mag
 T5Dtr16BRzqYcQ2DXzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX2/Q1ssacQ2Pc
 SuT9VIadA/rZFKBIVrfMsolEX886qBzwCi8lCf/6x1ENvt/QoSBzEJ7/Gzo8+ogLU/4o8jBZXfq
 pxTwHMAI/w8sWbdnWCfrHSolZknFC6g=
X-Proofpoint-GUID: PEYOPWao7WpGt_73Ai7k_jCrT1aPGZU2
X-Proofpoint-ORIG-GUID: PEYOPWao7WpGt_73Ai7k_jCrT1aPGZU2
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Eh1Ucz_HWyYK4_jupWgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

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
 .../userspace-api/media/v4l/pixfmt-reserved.rst    | 63 ++++++++++++++++++----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 1cf6c59f4bc4..3ff6499970e1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -245,20 +245,65 @@ please make a proposal on the linux-media mailing list.
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
+        This is the TP10 format, YUV420 with three 10-bit samples tightly
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
+        ``sizeimage`` may be larger than the sum of the sections. There is
+        no DRM equivalent: ``DRM_FORMAT_P010`` with the
+        ``DRM_FORMAT_MOD_QCOM_COMPRESSED`` modifier stores 16-bit samples.
     * .. _V4L2-PIX-FMT-AJPG:
 
       - ``V4L2_PIX_FMT_AJPG``

-- 
2.47.3

