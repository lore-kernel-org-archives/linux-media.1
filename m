Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995926;
	b=oTOIZkbcp3nvLbXi2uP0bnawuhjivvO9abt1w9X9XXTCzffXxq92UzDadLTyCSzx0UBi
	 LXVrr8tV5f8dgux7POgb3z9tdWBsEzG6QMAy1GWLtIJWNUyqQxYAJzaMH7cGwNrAMjEdt
	 TDvvbtl2s6JTHO2fZ+xCDClkk5yUQZLa99XY4HIfrrUuADCsLi2Nnp4BGDS4N+5jwYTS4
	 7e8isYYQD6lUJSQ7uABr/zXvsbGYldLk596HFTHC+GsbLxzrKjEoIchH6fdI1wyUHg0VD
	 JscoGPE1hngzQoipLwkqcqQ8/toIb2IZFBxZTxM3FA077L/dJXN6cHokenGXmHMK/Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
	b=wm0VuH65EBrrRSiTshbM/R094hmzZEkNCbQuaDaVovTJ7sdOmSB2Gi/BSTWG8E8NzcD2
	 Xwf8uMRgmXqFkFIK1Oh11NbAngLZ3umpe2TxMYtJvA+oDKhnVjT/GHNnMmNOV/XCsMkuP
	 D4A+p+wYnzWTYe/d/fMyST996ajDoOAOJjtiL7VS+nYSP+cD47mTtnRMiEJJYpYstSnIE
	 7bvW1Xbm1DHRiWsX3tiJj3x6US6MIseMlu9setqIfvWjBRv5/wcOkn6OQDmu46lK4stED
	 iGLBSdbnMA0SjR/TJCNf2+VMUIFUDeCGWpIjjgAG4OaVpkFwFm/NRWt48QKhnGBMKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EDD606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EDD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arHZ3303617
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=; b=Mdi22M0D0/nX8L8+
	EgIDzXe9Pn4OtwYwlygs/rQOkwznYAJuyISW+R0zkTb09HRmG2w7+CB+dkJ9x3QR
	wROQ2NmY8nxl7d1yrZMAVqeWJtn+OzG0IczwEdfpNHwmuBl4EE+59e38mNe1lefK
	7G4heGBp4GKNN6l0SWxwhsd8B6tw59IiSHlRmZJwi2ajbD0Akb8X0fn6z97ssX0z
	/TOvU/98EJugFgGmR2ANrhqnvA8CA/ikTJl44fYLf2376Z6U8u+/5Ffdx/aQj1RH
	t6H72W7/4ug8+6iR81IVbR/hg9yJ/+ZD4skdctIaqJqMX9rPHhQssTIQZ59oT6XI
	YIo3KQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsd5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4449020a91.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995925; x=1793600725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=N1WezxPJXcVVRCG2le4phpp/rmEq1k1zvze7NpL0g7UctSh/xzyqyNtAQLTA+7tG1e
         SdKDgfHwUDdNhCcr9G2aathfIe546zfgayGhUKjPmbq6rJRPjgIEZ0A00Ynfa3rUcf3E
         t0nABwveSeCabR3G+UGWoXeEy6b74kdyH2eONRPhB+QCO0cH2xUDRxOcWx25CB1iXUWd
         W2rm2OKLoYY6S93AfV4sR95Q77MXg5k3TL5LvvHpsjj54Iu81iIQIWSfL85tioAYyM7o
         y2N1urkZyZH9+Y+XUKqhWjx1gGSv0ta21U+K8u68dDDk9rgrxthv1nWWEvmXifkpZq2S
         kiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995925; x=1793600725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=VQN61LXPG0efnUP9ujZ4fzdRGWsK6Pg4rT1KQeWU+qXDnYzwzPE3etdEW+ms31yVXY
         zw3veCCcW3jJXpSSW3mKYmzfdAq/lFAG/DeYaKEiU2sDtN4AyVnLCd2EBcokV0QcMISB
         aU7QsJsw8tD/V2qVNCBTnmdhN07+hXb7Np0J2oCNXdGstTM4ceL+ydh0fWL01kKkW4Q2
         KUCdg8fQ+zJDzQywF+JXNIb9h+GBwijbtV4/wLN4hsaEz0rtf9nKGLrl8pWLAWh+PR5E
         aJLs31qBQrkPshuD5ycEZejfVKr0pekRaL0aMSNIiOvYhoI1astCdR73T5l8TFCHVD09
         NNNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXJmSoDcJF+0m/HM/We61UJF+FNgkJAK2VzRTnYDlPJ/LPoY+ji2pMWuWAd3ymAYI3zKZ2qxwaa6EdKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwMWq2KMdG7PereqIMeQX1l5HfkiNf9CnDE8Cf2omiJqz8wOBA
	D3kKCUtPBPLq8pPWDB/DXnB9umD1cHtJCywEzVYGkWCM3B9QKux5FIfchSkxv0+gWOqycmPgZgW
	Lhpesv2u9eR7wKtcjldqL1KA/jMjPI0tq4Q6rTvylP/XcFr8CFPGkD/iZba+pNCoxfg==
X-Gm-Gg: AYBFou0TE016ONIP919JnTluOkSIZ6B57Rdjgp0jT+qi3XuU+4EKJJrp2bSa78nEkTq
	l3Y74davXabwZVbq/ZhiudgJ8/B2iL7hN2EQ4bAQED7EGNb6XvLaB6Gs/MJKgj3vsOte5l4WAco
	2Db6wne1E4w/CiRYzA0rKMR/QgqACS2wMOm4dT3wwc0BFc8tQxeY83OfdrbGYPBFBBzK/S/bE7o
	8kHmhPcsQiaoqeqTWPCM8HHf2Qnu72iBdGOZ1lj9/edEj9ccS1Mrn6GhrAvHeNQt2KDu+VhNwTA
	UsEi2FSw3JFmq60nMqjcWBPSJFHsXy59sQ5VStA8Kpkn6UFOQ1SdSTQwHHy6Hu0Wp4Y5PTkF2Pr
	Nt0eJtsQOYN2QA2sqG/2qHKCsU8jvYsYsOQ==
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744311a91.47.1792995924555;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744280a91.47.1792995924114;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:23 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:31 +0530
Subject: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1124;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DKmn9i1vJXXvP4IBsacfVZJPAx62TejKYArKw6N1S7c=;
 b=vcNZ0ngyibDuHfRXl+gMTdO0b/EpAD7rv0lv4FUaHdf/+mqY8ImRpBvwiZcSIeoQwYeo9vdXJ
 yc8Y5UbPo6uDgvAYRMfqwFRHOii6CxjBVS2R+enurNuUEuwobPHtCor
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 1iJ0tHJXu5o1uupMbxJ0O_5YbIlsDr4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX4FBaUcW2VZBA
 +oqyErAD/O0dgGGcvu7t0skzKz2vEswWQ+voaIghAL/y+ULHPDYyywMwDDyd4mNLI5H5le8a02S
 6fYfe6CsfOUamN40uho7hezHMFvRV2WwfPGAXjo1zVFHztcLAS5iqL2LaCbykNERyijDWHBwYNi
 qfYiR1RupORoIU+NgEa2Kj360uEF/YqIpVcFz9odQ0YbDMVi4cWKfX4FtkEZbxe9lN+AIBgHRC2
 ZyCjh0CgM5hd8p6nItmRkNqQoVf4b21HqiMKyLRRxOwD5T7R5NLoyWUqTKdQkv9BeghKEwOj2W6
 xG2RCjNb6+Iz1grZGKWBWyWrMqjMdsphhBWDxc3u20egYO6aGdvZyJ/AgV/eOR27yZFjr1SYUYH
 dfOdS+LRAYgzRFKP+uzCdx948u/R900WNuhyMt8kOSWYhH7M9uKq+fxNaJc7mQqcmXiHID8JJem
 EFba3e63IIiepadlXWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX6T+DyQmPYfrm
 DeMe2FI9IePjPCG5fkTZBsJYX07uvq1y236Gbtq7UkSfcPHHHH+FjMSKCj+uPI3C2JGbwyRP4Of
 f6s4sqzf2GETnNvOQMSlwX6CBLC3pig=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adef255 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1iJ0tHJXu5o1uupMbxJ0O_5YbIlsDr4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Some MSM KMS backends receive display events through firmware or
another transport and therefore have no host-visible display interrupt.
Rejecting such a backend during common KMS initialization prevents
it from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..1870a7008ead 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

