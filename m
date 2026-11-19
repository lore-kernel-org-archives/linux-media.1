Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065219;
	b=J5zhRLoUafCsAcM80h6Tz8HDshATodgcyMFvjewgib5xv/ULrL9AhiMinElYLImepEcC
	 1Dn0hBTySBSX+X60Qo5e7718YOw0lpjBTxVvqUEodrrnDuHAQT7WqIL+fUsN6PJxdPAiH
	 4+6+K9ll5jgzI7qEH7+KSxi2eEV6mKkpnvbRVjNm54du+tyMdli0wee8c10f2h6rDUUR/
	 2ugC41xMtEGySoIYPWrs1V2zyzac9LpmZEnsN+RtuBSMknHODvrFtctiAbCEgYUoJ66lC
	 Sf1KzVcsd6LYSm/vW3QMS0f4+L22Y5tF2w3ADkvTpwqnhvjgHNBzeyjf+zg4qS3WaEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
	b=s7ArrYBE94bukdCCCZH+Qcp3xWIGRBPkLi1rJe0fMZmPQjZHvqWjMWQQXAxy0ofRHdt1
	 hdF+NLeteSc1q2jrKW2dcHnzw4ohKgq5CcQTRlSozhOLbVTNmv0deNk64tDhMLHiTqQ6I
	 cGmIn6X9ynTPBRJSUqbRTFUrI2iUxwgN1dsW1KMQwdHSbX0se+i1qdVkIttJgkQkPcw+e
	 82G+3A2ffZbuxrgv/HHT3ZmfYXJhFPI5cuPDG8Z6haHB5iWk0+7HXv4hyqFEmMIS9mZMx
	 PShr/fkdbyKf/eEtjAAn3kLY/c5hloYvgq0IihR3Q9M7WqRd9ZkDrvRhiNnySxyqvqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gPG2qj/e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552660A260B
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3552660A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gPG2qj/e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PK9eUgVV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1BAoH786470
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=; b=gPG2qj/e+y1JI1Y3
	aVYT7ZDagZLbG+jsOohIBnb/6uFw9XSmF7zUet8qAZu3uM276S50aGW6p4GPidoE
	IVdaG32wZ8LOQyiTbBqpDLNZj/PDcbXS8ireBt9li/ChNMquIC/9CC+8XR8m8TBk
	PLUtZeb6vMEMHXCF2063wOYPP/kCPvTNgufLC36I7efbhho+JS3huFVrqXrhDLG9
	E+vMiVtzi5xEqxQhqEHb28MiMJ//nU1k3cOFs6jPPtrSzKZ3xjHiMMUh/QsdAary
	ake8Wbtgy7H9cr7jvsxwOO4QmE61kRXIkHAAf28B8SU15qVsx6ph4orckXklS2ND
	Hfzpyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbcw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efdd509c6bso22993995ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 21:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065218; x=1795670018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=PK9eUgVVWbsfCTaGzOgFqXcCUx0G63I4+a8P3opRW0MHlApndDWcKbAwyzaMyvSc1X
         R88oeMt6tlKGkE04bQQt9BesG7ePeRUD+QDYMUc5iStew4B4IYvnqxAhCbMZoQzwn40z
         QLo5xThfjFQ6SbMkkep1XRlb7kdSJrrZp/vkfc+h5LTHlUpx6Mm+erlXyLqiCFr+qu/y
         nSH0sRDkGU1tXPJsZ8YCp16/jZzD5VTVhnxPZk8pLUmPdoSZhZ4X7rKbU6Z3wrPdfkOZ
         RI5fQ6wC6Tx0mnVQ4s2bQ2f/eihLIB1c7jz+E2jWBUFYSVbfXKnEae0o6EMX7ZIHVw+A
         +vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065218; x=1795670018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNGeX0yPS5rH6fZiczxmSQEFAyKjoqqOiYpeLK2KJnQ=;
        b=Hx2K9llGDz14OOlu6olSAvNKQh9D8DIHbjxYWhMgRRF5GXpgGCmTpHuqf5A+NDlJL2
         VAgwDleB/P6kLLPZLzDJ75Ektpnl+XX/h+8o922hHluey9NWRR9ASeiHQnGRWTkX5ywB
         y3fReuvSWeAXBcGIlKqoOXfVCrnSp5tfNZaBoijiR+bDJyq0c5MSUXQkCkCvV8MiTdwI
         djmhacoYqqx6l6Dt1CC05vJn0DnvU6PDV4JtEKt+vT1ZJvBVwObFMsfAAuDIUvXT6sk1
         7hT+og2QJ7al9HIXw9oS0HTxRnrRaOGNc29Ivrwt6UOGL4iTtn3ujgzBOq/f4KeNShoB
         3Abw==
X-Gm-Message-State: APuU4Z913AKN632tlACTM5ZgAUed25j1koPlH4RigUXKVlNU538g0u4H
	kjvoah0TwggBfSRhj+pEutQwdaspUkHNLLD6+OzoIULwK4G+BnLzOA+4m4CqtRlI3MYH2057YPs
	tbxNZmcQMLVzbJKsm8PKF04cDOLpQVMs7ZkjZCH77auiMlSf9l4a93sN6tAAM3f2eIw==
X-Gm-Gg: AZFdTZc7+etSFBCcB0NMeGGTUYbnlJAkVc58dsZZFF5X75waMnHkP2M2iB/UbagHAt1
	Q8ztEDBi/VR9Ij3J60yccXq0idiZ5RmuSc5w3ksfdtDRs/GoC7AjI+fDJ0guqArSNHQD72a/t7b
	+hm5vsUcx5tzvna2SmzqMbRp6dzmGgWW15vGekHvkxXXaxLXkPyUPUorp2dwFGZym8BtTXPnnZR
	27aXTQp0AGLG6gbKvA6j8qyxlsBGrAO+Zz/05QfIxTDQr6qYo9KFfiLidLHlh7fAgmFOGSxpBMh
	gGmELtN4SRe+OKnqss1W+NslJalex/2aYB823QI3m7ejoCw+kqC00X0VLazZF1KNCvbzt8K/5iq
	cL75kdUYHqBVTfDfNYSjGCqNiLHKa/ASZ7+ywqJZN6U5HQ1S2ua6UFeo0XGlA/LGljjDFsnxBEI
	5/W6/mJBYh4zJUoGBBmiQCG259pje1KSZMTwaSV6u7n6dy1I8=
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306715ad.46.1795065217810;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr51306435ad.46.1795065217360;
        Wed, 18 Nov 2026 21:13:37 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:36 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:24 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: venus,common: relax
 clock/power-domain/iommu limits
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
Message-Id: <20261119-add_iris_for_maili-v3-1-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=1484;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z4w/efAzsLElawBC0itHg6/jRqhONxnL9NTi97sv2Sw=;
 b=hk9Y00LCsEcX8bq6mIJrgePHBCHPIEcDLByixiBwPAQidz2O7Px0J65BDw67MCnbQMmulFC+Z
 asdb6XZuSTbAk6/cY8s/1X+VsBZZUoFPe1Evwl8IturuKM/ixThtEXh
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe8582 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HhAAYa2kYXLYgDpgJ-QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX2pnSwRyDpqBB
 sn0Kycti4vUmFG3lK+BN3GVSjia8BGD5dN5RW9LPPF/l8WF8zf2Qg8UG5YYQXKacaIyLcRZDewB
 SgHQjgKM7j6i4Z+fa31B9KX/qWh9eczv8elZIrYbqHqXuSINzHJTzUzm/kqvKJAgo8g7x5g/jGF
 e1THTDrVeyTAq4gBTiKiA5VymKIlgfdT8UUm7N6mhqVLXjU+m5UtNheEcgMjxCSMy7XjpREy/7N
 SXAUr5p7ouoClywYTWWfnmumJ7d4h8UPYWclp51a+fkSrfEDdpVCcwbnQBpNIU+DC+EyTuKsl79
 NnDgjg/oSnRzV62e+TcdwnGEBwJVQvf7MHdNkiPAEanvOAvntxJNQwSE5rUC18uUOGw21WekYRW
 wrm9vAMU3KUQEkct4Z03JTAok40hUlvsbddx3uFSv3j8hNqgPLGvle7TNf/p0u1bqg/QpCHdtTl
 yShMIqLhz+4emyY0FxA==
X-Proofpoint-ORIG-GUID: UYgowZjOzE8fG3hMwge3ETdbnzAEIXEN
X-Proofpoint-GUID: UYgowZjOzE8fG3hMwge3ETdbnzAEIXEN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX8KW+dPcIMUd/
 SA2tYKVV1YS5an1cpu2fDculpOSHhTz4ninFtje3ZvVbWBpFtwVxGzNz/XZ2HrCa4D3qSFfE5GK
 wSAGPm1O1TAsoGsvn+YQWKDJEN9b8h0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190020

Upcoming Soc's Iris4/5 video codec requires more clocks, power domain
entries and IOMMU mappings than the current limits allow. Relax the
common schema constraints to accommodate it.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 6c205077bea4d729335d7a5690a57bc1bb43ed9f..48f2bb5eafe3c2818a7d361b9e0459ce656459a4 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 13
 
   firmware-name:
     maxItems: 1
@@ -44,11 +44,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 9
 
   '#address-cells':
     const: 1
@@ -67,9 +67,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

