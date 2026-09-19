Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B842C3255
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793198; cv=none; b=uncp9bvX73O0BhXn0zSuDgPh4EJJYz16AzC3Deb0BO0JB1vBdSAdJM+viRmgsKaHToBlvIFGQgD6RIbMX//HQYZe2p2tYcK2ig2/pUkQJ9FiD4B5jF5JtYjqHVRaS3F5QmbPwqO8P9g7GWe3FKpRdKFsx5p1pwNVrETAg+SHWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793198; c=relaxed/simple;
	bh=BQQxLILovActXhqPE1A/OvEVONecyV1ncI8gnzZasIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4QodonbBnbYCIfcBKlp7cG+n6meM/TWzkKmeq5MJEySLC4hoQJ6x9CoEeg5bG5ClsvaPf+UNvAEgQEIdf+KgHEI6+iAw4+hGbagfP9kxbxVAxzx8cqvKy9Tq6hZaxN7ixWADvK4BulnEtcQE8bHXPb1LrV7bGSppctOlSxTntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpCVwG72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJjqEH2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpCVwG72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJjqEH2D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3jfII1966802
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=; b=dpCVwG72DifJiz6t
	pJBm2vI6GCoW0Uk1DwN4mC3HP3Ko92YhvD2hKFyzJbYe8fuwqy0mRvdHlqm9nRCq
	QIoZoeNj+PggEdFn5m1r/D9coK07WJHTHY6oPG1L76lGLHVoTeSOmNAjqeZZBg+Q
	lea3Ua2einxR+VifdE28a8GOUoGHgcd8/qMN2XQiWzu8RLzKDI4VfYG+7g3VuK9P
	sCvJYxn/VZMhkJYGCaTV7trMKdc/QDmtRtHnLJYxFliZ5YM52kdl4Vs32gDmRHkG
	ZnzuYLSileGawQlEGgyW24Bd1de4SXygMWswQ+CawEg1S3yfT7p4kt2Jf9qgDgCw
	SL8Jzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs803pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso2623318a91.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793195; x=1790397995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=;
        b=GJjqEH2DvGBlg4topHPKzfg2b4Tar7N7Cl9AzQkVr2tUI8mxpI5TQrWnEGJ5i1fp9K
         EmUKKCILu81iFXRI+uZpGtwN3M9vwzPOjoYxRnzAsRfqzIKNQMz6Xfq12pBMe9bEbAMz
         hgxJ6DOxBVnuum1kRVjNh3TUjRRjzZ3BqCv5sR7e/yXkwOBqLwYQsNU7MYYdVaTaPoR3
         aRy47tntxLF+ANWl1xgbDw6G4DP72pKhwy87ZutazqgVdNO4aPKtxFWVQRLD9qYmdQHv
         5k04FTvtyZHWOX5HlxAdzQj/HZ4EA9IFhegmulBcBUQhOIisglquiWE2w6WyCrPRB61m
         sO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793195; x=1790397995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=;
        b=IGDnRrE77q+KpmLjYBRfQiIIG4EVnyvz90wmEs14NjWs7BahmuijL+VBccuSW3fK1W
         5rTstAH9DhHLt+Tp+YCyvKo6031Ez2zspdplwPCilS7ePZhjN1SvJVdPu7+d1MJm/np7
         xMLDdO8u2ug/PU8dHaWVHuJzr0ZSLZtptxzSRhR91beaI1mzYt6OTa3ehwoqkLCCdjYc
         ay63Lxfjoexe81SKTplI974Yswewf9REukKdeFKjBWlyNBjEmmIAMD1VhW9tMKIz9mV2
         M3DXcFdsekJLB419ZNxfxGTnxCSIySnfeEnVFj2/7uq4sjGw8tjWLp3cvO3oaYYnLZFT
         Z8ZA==
X-Gm-Message-State: AFuF++kr18mnEeNnSaPpbC8GK8ZimFRRvDyEfjU3vR/F9t5nR8MzfBM0
	F1YBYVDuRJhD+OFHt/HItfjFpXNA07ZZwwhWZFT3ansIY8ppBHIRKXULnx1/jvTbqpcg09eKgG/
	kdaRpDAuvFlr09Z0M8lJ9fDvU7i4khPVKxQKgVcTfFeMm5i/P0DA9hcfD5RiGAUxEmw==
X-Gm-Gg: AYBFou33yj/DAJl+RRlwYjNbAHewiwqHGhcLiLtIfmxxAtF8CX5gbHaOG6ZW5O+41Vf
	xgS3H08HHdp8u3qHLMYLjkln34OPb/Oynq0VcoymdKTl4AAGErhFrjtyIocoB8dKnMqYW5izQ2F
	zCW/vdDwHkGdOyxxOnWqKDf/AaCcD+9akTRArYaEO68qPJKjpjkVIc9RUz8jBqoLKZN9LgiNG0F
	HWEV6Rqx2HrdcltlslPolc48NSrkJ3eTfBosABRj4vBqkow1tRIANmGFXuS6QdCXyHf0NUXUCf8
	2KXg36JDXLP1+pxEGJPu/ufXJPHj4Q2W6aXFJjLEtGelJpOZC9Z85zmlSniUU01AZrRmXjyua7A
	VLIj1pNZR/mg5LKJsqtozuLy1SBXPyNbT
X-Received: by 2002:a17:90b:3b8d:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-39e6c69362cmr2322967a91.57.1789793195389;
        Fri, 18 Sep 2026 21:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-39e6c69362cmr2322951a91.57.1789793194977;
        Fri, 18 Sep 2026 21:46:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:55 +0530
Subject: [PATCH 1/4] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=1062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BQQxLILovActXhqPE1A/OvEVONecyV1ncI8gnzZasIE=;
 b=l9nC25NOZVwv4fkln5mf3yA3vziH1+ZkEkTeouwJcbmiXfDhhug4iKuQ8XkRsB2GN9fu9w4ab
 RbKI105ii6QClLBdLoM9fT7VX7qNao2OVrFazgOeNV+w/yUDgmpYe8j
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: K70PHn6XSaQkyp7RdccS-e5CINVMxhVp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX3UwOn8Y59/qO
 GE3yCqzC2aOX8lTGlWbyyH2AApcWYExvCB0DToi817qDXFMMOgMGj0Mt6HFKt9E9EJ08k3dNTet
 q2cTcNbzjWnabQYklWLczz9HM9x1nVs=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aae13ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ba9tQSLWzef1rn2_u0MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX3UYmf4VA0PDT
 yAmakAisUeVyOK0Seia11RU41ODbyej7oBJDL1C7aGNbowhugq2QmS29Axh/jVW6D20WNmmt4bo
 jjWL1k+L0Q+7nTM7FqTlLaYp93/GcSda7Ai63bEFXHpPbq8qhazuJ+cPBMYx7CXCX96BLONpS0p
 ujyGhQRSQHAWzWElKZbh39ac4NQ959LVuCx5u9g3hGG5nxK6SHa92Bz9dkVWQN5EkhiAp8KfXZR
 ZCFBAaAz0Ud6S9UBwrrR44dPY9tTgNunZWLKGyZ9z8wqG0V/g4ODcEIrX9LyQn8cKnAbnwIcGng
 DkwYZPJhiSuXaH/+4mfqTi/GZi51bwpaGlnk+cMWbTuBvM/g1SpPPnsB2+R1RqeBC+cBjTOdGuB
 +R3aI9aCgA7i/8hVE9BfhhfEkP/rzowxDMdRBB48Xwy/wNpQXLWIbcuFXtzMDZJttMNPAXDATrP
 N2YVUUj4OT+PBLQ1n+Q==
X-Proofpoint-GUID: K70PHn6XSaQkyp7RdccS-e5CINVMxhVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The nord platform uses the same dual-core iris video codec hardware as
glymur, with matching clocks and power domains. Add a qcom,nord-iris
compatible string that falls back to qcom,glymur-iris, allowing nord to
reuse the existing glymur iris devicetree schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
index de4792f3b658..558b85ef9ea0 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,glymur-iris
+    oneOf:
+      - items:
+          - const: qcom,nord-iris
+          - const: qcom,glymur-iris
+      - const: qcom,glymur-iris
 
   clocks:
     maxItems: 9

-- 
2.34.1

