Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674714;
	b=4gIm9CTD/6HQlBVQjpytZIj9r1Fju7XKTIrGb4C8RRx3g4gOg3p5Y8ltC9PFDmohBYJQ
	 hyL2b/1U+SNICt74M5KXwg0RiGsfftg3tXcfZRTykaJY8PyYV3UiS3YcEgCyO+BXOEYzZ
	 At1vLoWspRX6WkeKGy3OAKPuUMLGmyn4Tij+JEcqpVT889Q6LF/wPvtBWqUNpVPACvret
	 1Olw6r/kRcvqpoWGFYSnGrX2MNnWZeD4xV6kSpQVt896ie9K5ud4aa9IDFKVm1BIslJ3R
	 jYGVK57lqDilAfsGNzC2sSvKdU5Sqsb2xwMNGb2aHpsCE9jtfkhr8YHn+RJokCBrJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
	b=aLoWewsq/spU/yNwZ2bOhj54YJYxqwhbuk5x1X2BpGBHamrR9NmV0TvkmMG+tDN3H7/G
	 qX6fHHGsFb0OqR8ybcMAJpn2JmIogvr2MpxSgRLcmI3ljUc9HrOL2GnAc+GbNQPLlN1/3
	 Ahn2dLA1JDe/ocUBA6P9ZWcLBJKi7OSxntUFWOyPqVV75MlZEk/4TFI4mBdFwopvMqLso
	 jOxvFbfGP+1Xd1yV0lC9+NSLxnQ6IGt1IogZE8HeCcx2WKAFS+H6CaP3lRm8acYlfGECk
	 KZKnSuV94sjzH1spTB1XJdrI0ZWkXiYItapB2v65CQxbv7VvmweZBK1RKSjqVQs8Ezw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1F606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2BL9GBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXZh3xYW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ69sgT2749800
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=; b=l2BL9GBKLXs887F2
	sLqje7Dq6r9V4WZ5Xnvv1YrGUb9S/WkxwzcCEQau3Uacff//5mVTuLHAtxBoA6n5
	El3q6WkqxpLGOjsUkIM4ZqMBvy0wWWk8DfWlQ9/HjYSD0M1uZzaxORxyHG90mDwL
	MfXx41rkB5N+CjNvefQYLiyZ+kOFhZSOIfDb5tGmZX5s7nICFRkA/4ITUFoSSyb4
	FzUt1xJFPg8w87az5Y8gy66E2i5GuMJ6QEeBCn6ALmkSKzrGK514d5XX28jZzRY/
	kBJjAkLanu5P7Ty0JdJhT1rCqrw5yRiZDxs/XHq3COxZ7/27q/f6YOQ8pqtsNSFX
	iQnJLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rg2ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0717e54b0so45091925ad.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674713; x=1796279513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=AXZh3xYWvpotSMsqiKqzf/q4VrePNeO7i1gXziRCkbHkthUJF6JQ4anRKGFD3HDAn2
         kgcvCwgV9VZtODDvemtmFUBDVMY0G60jK2XNHTjvu5yxBC3g3/9WiM3xZJzSZJlJiGCI
         h2PZQ9AX8808QHWl7f/oIycC8ZQS2igWi9TCiuKvP8rfDrEHySUSSTXK3jJE8ojRwq75
         F5qYY5ot5WrOdg/KRTHqUV1BbvDe6/6kfJZj+ecPUYudMA+wAZdzwVkIZFI8BS+yzcny
         UaMkSjoolvSSqBP6MIYFn/Pm9xBuwPb1eusJNWkE4Ng5z2t4ac0TJ90xZM82BbWL4JWG
         lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674713; x=1796279513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obwlnMkjoC3GVhuJ8eqS1mhshuqTDQ7x+oKEZyK4Nbw=;
        b=p+v/JeAUYRN+WKnEvcIXYrVTsMAvNj5i9QCNHgEN6z+IxE0soqnIUab45L+2lyzgKH
         YopgEKe542OCNPrqaUM+Okr/dyMByM+i0xTUgA67prAb95zzk5U+j9FBN99gxEXCSbS0
         KjhRueUvtaPSQawTNdE0YPe9Pd6bzwjBs/Rke84bUDw4JcpO/4TG5RT1X6QV8pBQCgNX
         TAKLmlswY933/eiddX8x5OcMV0nG4z5UyDxkd8FR4nQ8JrW6AKVBBVfj2yuTPOXw2Lcb
         kyaiso7SKlx8d0gIfVQ4vHRm1t7iBt5dcjxJC80YPAkYlveKEzPLFxapaagrlZiVa405
         KNUw==
X-Forwarded-Encrypted: i=1; AL+hErHl+vU3Q8JYxwAl+v43wDDla5Oogs2Y9nnIbNU8Qeeh9Lv9aPW1NtIjn7oSmvyeO9PqwZ9PoeQyC/jjZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LAyfHTvsprF5RWwKH5WvwkNyLnxDj0ArsNHUbgVopDeHyAHvg
	5F+hc1AxfF7poZplXIZZs43tH+23lxqis5firgJnbg/ZfNkI23zhCTsbk/sK0vxkCDrwu7M+Ar1
	lf1W688Y5t0Ypb7/N2A7EZ381rQLfTLxH/Iu5zQ+N2Vb3mnCTjO52N5sEljizMIcfSA==
X-Gm-Gg: AZFdTZfEwjVZqA9+31FU//g55yJLqY2v1tHu+N5FMwVsbKUgNBvn9r0AYgo+OeTcA7+
	1UI/A4Soq52etWMAUUdj0UtmJS3mxvEXOVJ6C76slarzpE3Bf+k+sICcxoOwxiLZ9WWeZzSARdp
	OHobJ3eu9pvUle38eSGFy6aMBanVS2EFGBzoZaU4SC4uKqAWY0iZwZyiHvFEW8+nKKo6upRtnoo
	Ym2yZh2+N3bDcaJNHyxkE5T25Z5bfS7unzXoNmsD51tujCg4ODD29V3w0hdP3aURt4GUWFgJrGq
	Gk7+L85yvCJUAKKDMES/OMaL6n/YehmhHBlCRiaOC1ZOwxRjGNYuT3AawJzY9c4vdlZX2t25ECF
	tiQhtixAYojXydbegmpA9BZT10kSlzS1epPsihI3UylxHxtvRVKtdlqF4eT4Dm6X976m94i9mx6
	dsGNZiADKJ
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216411965ad.24.1795674713032;
        Wed, 25 Nov 2026 22:31:53 -0800 (PST)
X-Received: by 2002:a17:902:cec4:b0:2ef:f392:38b7 with SMTP id d9443c01a7336-2f03f1a1841mr216411775ad.24.1795674712566;
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:52 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:25 +0530
Subject: [PATCH v3 17/21] drm/msm: Export GPU component matching helper
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-17-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1633;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=+kHZ6OP8gcD8pNbmCuB0Bs0MumxiGgHxobreJFpOXLw=;
 b=3pGTZXEIQomPo58QAYimRvl0pzI/Q2Jyk4johiZeBLOcZi0M1YjrV3Vw/j14XFIzbrcxTGQhe
 bv/vtYoQfOGBxQWGelLfLKDlhbSG/r1lhDKz6ZbhAoi+3cZ6ozveD4j
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX5kcmELigx7Uh
 RRe+SsEaLc8XDIrkhRbj2KQq/c5TMqX0pfpkR0/W+GEC2bZG3g8O+BOVXw4vsCti76Hzt/spGWR
 Oicjeer0rnroYzPKqgRX75SRUsv8TSPd7n8Ug3MJWuZhrNfb2huZHe1DNfleUjGoK7zj//nE5+N
 hEnWDqztPbMZb+Pd8JhU9Rk3gVClQRm637KSFSgQdIxHPIxmZe3vnT6+K8BcfcTKo1qdo5FzddA
 Euuvj/knDSjPowfRCMiB3mVh+y1uvW0/1HbCduPKju3mRJTBgEsG08zA65hFFdUt9VWR0myf0Cn
 Eq51Ux8uu6x8gxZPpJkBI1LxJf17yo38qi0iqDMmlk79u0EscJlHQdeuFhOYJrbCiYtORVrhXeT
 h9ohx33EWYOcolZx9mEoD6omyHfJPbbaCI1PGiXf1zOtyCxBhmif9KSNo+EoheUKhgHiKvOStSQ
 eEiuhOPz4OmARetWyFA==
X-Proofpoint-GUID: Bhprxs0IQplroeXNhkWdY079h8tvFCW2
X-Proofpoint-ORIG-GUID: Bhprxs0IQplroeXNhkWdY079h8tvFCW2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx5kp9Xkb97s0
 SIkvtD8blyz8cV2oc4BBzE2UHRyhEeol5zlcc9Y9OteCrQy82F6BuO3r7pbTBaIi9i+EB0U8dTi
 fx5g7gRbNkM7mLULkPJGzpSjP2IRFBw=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07d259 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a_sH-KrDn922EyEOKHQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP DRM master needs to reuse MSM's GPU-component matching logic.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +++---
 drivers/gpu/drm/msm/msm_drv.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..bb383bb0fe8e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1094,8 +1094,8 @@ static const struct of_device_id msm_gpu_match[] = {
 	{ },
 };
 
-static int add_gpu_components(struct device *dev,
-			      struct component_match **matchptr)
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr)
 {
 	struct device_node *np;
 
@@ -1154,7 +1154,7 @@ int msm_drv_probe(struct device *master_dev,
 	}
 
 	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, &match);
+		ret = msm_add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..aa5dfd82ac6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -523,6 +523,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 /* Driver helpers */
 
 extern const struct component_master_ops msm_drm_ops;
+int msm_add_gpu_components(struct device *dev,
+			   struct component_match **matchptr);
 
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);

-- 
2.43.0

