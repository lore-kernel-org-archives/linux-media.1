Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D2480DF3
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390852; cv=none; b=aXMZlTITQgzyqqU2HLYDO8uOnNF6oglVC0ec3NmaxFhVDSwAAd1srjT63Wpkdn8wyG0Y4Zt/3R1N7IxVrWj6+h1+fYz7VjnhjRcASq1GfeGo0RTUDGqFS/Bt55tIsn0PeHR6u14E0R1TJxdZA9Azcx3fh/3wR63BeKzljhIHoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390852; c=relaxed/simple;
	bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m075qskHtdz8etjzBh0oWULGybp5u4Q6DgRerId4Adz5fuX84zqyRlNjILWsbGuNG3hL4+p7GUqrme4cjMaCrdRiq94z8AaBheOXMWBEfnaYEiBNcPjePYWvzwxWegnSNqQeBnFm1k0XgPQ3D+eeyMm7bpUFYZMhzvDss8zFHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNojXurg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLVUKMPx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNojXurg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLVUKMPx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xin674511
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=; b=cNojXurgA9MU+bRR
	Y+drk5sC+6uKxo9U3KWD6nWH5P+ximBn88815WdQl4ilNmVCF3NKpzZsGclrZQmf
	mlpNKGGPlm9a5fLwG412NlnobA0fLhIBYJwym/PPF4XU0hAqGUgINC/NBgGtf1x4
	yjzwJPjrICk/+KyJL2BFMl67XTpuldavuF7731wtbF95D3G7IovZKFguuw/6ms47
	16SgkD5bj3PbgTfgN/GN6WPobhOU/kBjG87wTtLiu38QGLYuQJSPjNLWk3iqIILb
	IofDQ5qAHdBzWjkBo48SG8XepjFaXeVnJVQhl01KKFk3ng1wXlnTt/MYIkS3hNqq
	nCZV6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8rk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3d832827so40502725ad.2
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390849; x=1789995649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=GLVUKMPxkKjLZD2HUSYtELjMiKUdbTcSYxZbMuMtwTiLuE8sfC8y8AACiDW5ym+bZ7
         tzihALyWZ2JX3t17qeDHknwIDAQS7O99NVLvSRwLesgl3/oh0I4mOgnFvZNI4qOcArn6
         dqhaTxpNptvWyPaI2DaoT+lm6N8SNBcwSqp4Dqfy9nTSBNVCTqw6e6CTiQwYKIRJ8jsE
         dXw59wBThG6vlXx307WEspPoepYXPgTZhZ5KOZWrdW47rDj29PGwLSEWlt53qLPvwfYH
         ZxI0Sma7FVzDstiXgPd+2wuy1kxC/ejQabMOqJBnQ+O/HUnvn6EAux9xxcvxu7O5CZUw
         392A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390849; x=1789995649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=sBHQ6QZKQvoJhSkVOkxYqIQasiEh0mcIR02ZIoaqsfRXRyvBPHIGb1XK6fzgdT8Ya5
         oarUqJeAjkNm5go4lY7Ximu5X/hziCq7KzlRqwdpRoGvMAgzI4WunMnHQ4WSwFzBzD9t
         bOdLOFRL5J1+iu19AIbsG9p6MrkqKx1jyTyRulq9xryxAremppVAs90XyC7fOzjbjTCq
         Lbu+ZQyGnsIgU38CTPgttGnvkYowvxfqpFAnfVUVTk9rIKPvM3xXt3GKzFLizP2nq9If
         68nOm8VqQEg8xyUXhpboJe1OHK9U/NqU3HD98Rd3B4y61MVmqCZeqRbzb9atx3NJeMts
         x6Qg==
X-Gm-Message-State: AFuF++mb44JDaDw0BBc/jJ+j1FR5HdsZK+RXEY0L0peDnDx4okVPw3NH
	PG1qxzaNYMiVAHFVxJVMg68G2yN7R1vkorTNfhfh0vVkC+yQDxeeqyd7VazuUjZqGSpvWQoxZnn
	UTOv8eJ8iUd8+N00IbJwxuTn769IQwkAtn8buE71kOgydhbIY8IUXb3sLxgRqYFsEWQ==
X-Gm-Gg: AYBFou1E/H73/UF/FdOWrfH5xvAb3KYILUW9N2VE3pr9YQsKZZTnOD8KaKG0TIaTVjj
	et2wbSPwUuEVys87MdvcVPR+ax7UyA0kcKVqq/8by2+X3Iam/vUr1QRSLb8HqOGuTtSZ24XfimF
	VreV8a97abOAToKFBJCb7nb+5meyJI0kXMT6TqMswNCvHfzgIH93KCikUzOQWQmfqMky9/fGuJX
	M2oNA98yDMzsIsduKgnl80zQkOLRkL0Rf2/ozqwBdmAXg+zDxTsNx5PKJydlCHW35uWJHHY8PxU
	p5q0Vj4myanDQ0Efe34GLXw5s/8HNDFGZs3V9yZt+k5gaxQi7cIqDawYWPfVfnQjBvbalzqDVpd
	dNS1ncEA4lDFYijTQ8lED3rFqUuH+Fvi3s88C8S0xNEGlqjTIl+vaDsWaLI4mOpVfWos7knJrvt
	o=
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45496205ad.15.1789390847650;
        Mon, 14 Sep 2026 06:00:47 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45491345ad.15.1789390844637;
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:24 +0800
Subject: [PATCH 1/5] dt-bindings: media: venus,common: Extend clocks and
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=1679;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
 b=iwSNuOPqbJv6D+SAiDEBHreRUNDZk+Ew/pQIyqqMSmmBcRmRvQFx8uGMijxycCtrhJkTwDgqa
 oygkshC8yPgD3YxXiTvlzNniyUi3PJrp78lXAPC/2S7xtz8gG19epPF
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX8knsBnADuIFY
 dUWVL799jUJspQUlMxhEfvndsEnhGVEe7XZ3CpLelZjzyiTnIvnWLuh6GOHvmwF2UcZpKwHL5nK
 ahPvi/iT1PYC5rZT5food+nY/8srVbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX3i/y4D5x1bbl
 NDxjXIaQyx5jtSIpeXCtyHn+eZWTTIKQo8lyM7jmj4vFFXQ+vE+yW5rbz1azVGN4qiY1pxhlpzW
 cNXYifEFRfH0N8r2CLYKLJtAaUDT7SEIB1AgTZoBRn1oi+5RuqkRbPZadQHwWVR+6CdGk9FpKRD
 lQjMnkTNlquX/I166gzKzOggDxMIsC4fpLXqdGJujhsHDd2zTPOWSmMAH/URH+JaMWQ+C+O6rau
 RF2NJcf/EiumjH+Xltxye8H1WA+xDKI8YJJI4y7muWf3lyj+eQCFYvJRscFTwSl5QnxlasQgfkw
 MLJ9447tiAz0v5Vzb7i2usozNFg3guG1C06pP0nbEfkre4KjTmyiOQfVLdXNjBPILw5TalNPcNT
 WBO0wcoNsWB2WvCrXpX5Vp1LvFKZxRijiG2icVs8Yh+FoUPCM5HzCpQSdiVbdxMpxSJcYMxpNOA
 KTLDqD+fHBHgSdNsueA==
X-Proofpoint-GUID: IOTxYuOsl-n94bWdYtEYhGW-JhiGOY-U
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7f001 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t3Xd9w1G4aITJWInbQMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: IOTxYuOsl-n94bWdYtEYhGW-JhiGOY-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

Upcoming SoC platforms require more clocks, power domain entries, and
IOMMU mappings than the current limits allow. Relax the common schema
constraints to accommodate these platforms:

- clocks/clock-names: increase maxItems from 7 to 8
- power-domains/power-domain-names: increase maxItems from 4 to 5
- non-pixel context bank: add minItems and increase iommus maxItems to 3

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..795ecca21bd6bd05b5e0dd610c749857d22ad1cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
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

