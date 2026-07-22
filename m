Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDA3546F3
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727711; cv=none; b=iwXuC5cIiGe7ir3dc5cQ4la8cJqyWLlpKRlRYQzEZZhrn6r9ZYt88pvzxxZPvqPWuk8yJ/s4OQRA+RhzwF/22l1S15ReLwYhjnicqHwt8GAyA5K0xBIlzCjnk5X/iqNWdUuLyOWU8NTIFtaDoUVtWGDVpVbXKaOZO5mVJ2LlEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727711; c=relaxed/simple;
	bh=0RZ/cmSKSH9U0WD9OpnNl4ffXUKSWrkyYXISWAMieUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5ANIwc43qZF2acev3Et51YIIiH+NJIm2+S9Wfy2SAE+8jD/6QJoRkFAbY2pVuux719tWQlcg9XSoVm1ookkqPg/QvS04l7lq9SEdBBXLEtBH/N2c3c2GdQK8VE2WfG6EsG7Vx6xFqw9Tpv4TUK/c1dURy7lvAYgQrEFGAb/OGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTb4NSMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyzvKllo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTb4NSMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyzvKllo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWW0L765362
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=; b=bTb4NSMo10QTThY7
	Nm4FpiNyJjaQLmtsRv6B9sk6NSv7H0mrGcyyu+JJERZrNIfyiGhyoS7x2MjwY/Pm
	1BpRZuf85vd0bsmprxmD+kKiGDFSRaQBzOpBqAaAOsZikam0VdFlr5fxPIl6c27t
	/aPlMhsFC4OckniI0cAHwnBFGHmMD11breY4jUqfS7zGh1N0E+BNcv+TZvomAlXH
	J3JlgYAD1an0WxL8Vmf1lGdR9163DqhIXcMdW5Dav4HC1N8+Jg/W7ZlG1Tbqp26x
	92um45ezjFffMpoJuwhZEu/07tJvffu40g01CoIIyD0uZRcGK3RtktqEg7b9Vscw
	tO4EMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2s5pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:41:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso305848205ad.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727707; x=1785332507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=;
        b=VyzvKllo6XpQAOmFQAX3gcrHxqer+Z+/U4q6JLC7oKaztmFTTUE0GpC1XqoykhKJ0j
         AafAwUQHnOVKr/n5mXATuKGrAIEiZueM2HqU9Poho9aeJD/lRSIMrmFRjBQTXJJJU8MI
         4me78Fn/mURRDPKGc+OEz2K7fuOc+RKyBUVvzNUlDpw1lw/POAqRkWI0TCYgn04dLFVc
         t7s81U31sxyaeQPeKPnn/5AxIf7y1I1NVE2oLmv7CRE8q3MQs8OPGoXNPYog4JQK42vS
         BSUBvlUx7hqmDrcmKDQ0jIjvIxEfMRk/25I1NG8qi+pn7ZZUaTHHtA0QawCNBI1Yndnp
         ss2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727707; x=1785332507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pU1maESxsWIi4KN527jr8n19yqSRn7601a0BdQfJzxo=;
        b=cMI9F6H2XWdqWjvewNtZ2D09CmEf3s4rZLehzFSVKrPQXv2S2NnrmBw/0ry1uKyLOv
         j5IU8A/lUb+81DWcPevlz7ehV1AeExDAS1LIrVsfCVQmWfV8iBS31eT+BqUVluiBlZaj
         wWAu3NoN/4a7I3nG+z4r6+vBtOpdw++Vq48WpW2nEiPDiyVxmrNld8CC0Lg/QPdGU51q
         u0oGd3Gb/Wt8dLk2GizOCSw1764P8Lxnq/SJ70Ct7fBA8z5n2ykCEx9tynvgyo0lvGUx
         Q5UCQC3i7KcwIUyq973T0XcQM1GnF6T4zzrFLuiNlAm26gj6E57ZyLcnCVQ4a/CQT67s
         7rrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTTCjQP95/cBsGdjXHlGi49vogT2hSAgLU2mV8D/UqMuesT60TQCWaz4BLgE4afb+84WBRLkgdLiC39g==@vger.kernel.org
X-Gm-Message-State: AOJu0YynpZbA1oKa1PavBHEh1wjsX6bn1gYUJU7CooVe6hPGLYx6V1HV
	goTkp5k8T0qH9X2Veqzfh3tt8PAMlTIkke90RZhywGuhpxiXNKg6Ku7veIqXZdU0+iQXTAM8XO5
	yRaHnmsZTQWB0UUEmymOSYGNa5Xao0DyZi/aQgoItk6uMwU8R6LewfIMutfTCaTksnQx9EF4PjQ
	==
X-Gm-Gg: AR+sD128gssD3zlhZ2vpNq7LkcwmKYlLhNE/D8hIRKalczPemPCslqmpDlggsliRw+l
	+YWvu0oqG1DeNS1KPOsGIXPQoe7cgafZIe2im36s1ZVDvltlj4tlJNb3EEmKmhMlNS3Ko0fYmaD
	2Zohhydl+89F0MOawRqVze3oMmbfrkVvI+Wxg4puUZs280Upm9kXPEZntZF30FrUhsRrj1sB1V+
	Gd9bgX3vZ7x/KSzo4hgs83SG362MvRr4HjQlekKGhjOzTV3g2GcJZuFyBtlDF6uuAn7AhrvTXew
	NVEgmS519mG1WjDH2gOsFopC6GGYcWPsR2rAtW9e8hxyvUGR+HNMBr2eGvwLG1mIj5NLf+VH7LK
	i0XCpSy3afPGRwjYvSfPhI9XGXhp5geKBJaw=
X-Received: by 2002:a17:903:228b:b0:2ca:e0ff:e696 with SMTP id d9443c01a7336-2cf34836235mr236756325ad.9.1784727707455;
        Wed, 22 Jul 2026 06:41:47 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2ca:e0ff:e696 with SMTP id d9443c01a7336-2cf34836235mr236755735ad.9.1784727706869;
        Wed, 22 Jul 2026 06:41:46 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:46 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:19 +0530
Subject: [PATCH v5 2/4] dt-bindings: media: qcom,qcm2290-venus: document
 shikra venus compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-2-3d80babd4672@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=2515;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=0RZ/cmSKSH9U0WD9OpnNl4ffXUKSWrkyYXISWAMieUw=;
 b=RYmm4lB6O5bF81ZbrhAreuYXdxtyDlmJ8mXIa6qbwKaxWIguPl1F+B/GIwvnOOnl65lEk3iKd
 xd1D+hlz7SpCsZJh/oeQxum+oen1mdPj7BCyCB1V+gnl+zrhDHdF2xe
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXwd38RydmSDvX
 PwfhDzxCZUGNu5muvHevjzzE0oVzZOXeWYMm68DAquG/KZnzuNsSbvU1o9cm9GrrgCLh7LEsNEP
 TV+SE3Hoq7hWZUCzyRotdd9tzLw5CeW7wiJW0sLRKFbipwPGG2zOAq81UlikIy1SQHadMwpnzrC
 YEVFyJ4eC0v5hrKd5ifuZXn0O3ad3N1Qhr0q+OvdE04M+O7rxMDXPygtyBFCMS437AnF++yJxIo
 sn3/Sr7ps6kKKs+qWFN8ByQK9SJy2Dam7CdoNVeeuGH4HAofTvSsGExjIAnog5JzzgawAYOmVhq
 pkOdM4+GXahWBVS2lFzIRl83zJ5FCXy5a+Akls3LifC+7WYX3B9dwX2wLvFN5ssNjnGh3WI3VOv
 0+FoKxUtLFIqp2eLATZqj2Z5kf2950ta1yhLBTeKiQdr1+cSQThThixBV6tNnBQ96HMX+5kXT7t
 o9Xi5hU9qgMeM5hDqtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX0rBNSGcjvxAK
 TzbLsmslessRYFshyAIxZHP53TEwo89UWSM0DtZ2gP621qc1z8yIUjAeRGBN8k0lnJIxUbl7P18
 Bv4l0CbmaoudswuX5C8Jsgq/VvEu7G0=
X-Proofpoint-GUID: ShNe6Xhq56csWXcjUmB8QrL8kZYD6Dnw
X-Proofpoint-ORIG-GUID: ShNe6Xhq56csWXcjUmB8QrL8kZYD6Dnw
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60c89c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Document the venus video accelerator used on shikra platforms by adding
the qcom,shikra-venus compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290's SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

