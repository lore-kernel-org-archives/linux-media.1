Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A03783A1
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768845; cv=none; b=lvuMK74xODUA51y0G8AVIqpdGx2sqPDwo5E2kSY1W4sgmaqnCJGpL4+KQ5k+2pdFfqMastnzh/r1d06ojXQ15XFVMVP3fN1OoxSDZrpa8L5u0Xtws8I1+iuvWxrR5a9PizwgAIfx390lnm9ef5mdW34tIqLz9cQQ+7lNTHeX6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768845; c=relaxed/simple;
	bh=Fe4SJDubEcKN/aVqB2Y6QQJBZVxKn0hGP2YKnt+P5cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQsHD1IaNYpiP1IAmwjmIqdYD5mvPH5cAztvgIkBMhtkGXdwyeOaUHj/TEZmAxSX0JdGBvAzdc/tKgVFngtODm/Sk4g0/KJRsZRC1W0OyTSGopDLhXKvCtL0wAgonIG4Ir2OtkBqUi1pmIY9Q89lbh63rlz9Z+CxQ5QUKrPO9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpmkfczR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSiIW5Tf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpmkfczR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSiIW5Tf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877oseN3657422
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 08:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=; b=kpmkfczRzIYDU7cZ
	zDm9dSeahAVejyIz48TzxKZQCamFgZd4JmB0N8mBsOg/3kB0fCZOEwQaCvVLoZZO
	fWBQxw8TpnPTgn+we+aVkHv6sj/OeP8iqSX6ct8fsjjbukSuF35lH6lwS4yxAlIU
	w5+HtRzxJ+81mnR/78vkUFCnyJhXmkU291+s9RuH+Ni2jbeg5QsMqWQnpqZXrQle
	Ny4ErBVvrHcxeZOCoLC7Il1KrDu3veYHUEvy5+/iBaJ6jBEe6OQ5lLCG7C78LOD7
	LKG1tBA5W8+3B7pZc5gMEeGYMX7i5t+uNAhYQM6zvLKS4/EQAUEaCrxLWbz9VZJq
	K1odEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r376-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 08:14:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso4462244a91.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768842; x=1789373642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=;
        b=hSiIW5TfbUTZdeuk+V1W2yaPnBUTivz/XA9Pk24aJJrXBkvdQplRCeKDjWwvR1wFsA
         b9xgcS6TC7hQIz0eKrgCPgRUaNVkQmNNCIDKM6v2Am9v57zfNYF/Y7OfxuCtyVkGAzDk
         oKdydlThpEYVaZoBoWYilcvSE0Cs9x7/9oOBXC03dgq+1n55pKcF0r6eNFx2NnjLJlpo
         hXgKL9jX1CSz49RNQOIfJqzq4EqCJ/WIKQNTIinhIUz42dlrXKDqpBME0HEVSVtJMk3S
         05MmZA6ZM4hEHLtyWsfDge1qnZ2YI6X/HjGjrv3Lb8DHYaHwLdrNoCbbWuhNqmBqE5Xv
         l9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768842; x=1789373642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbUhSdJqfU4j3cBjHfJ68H8KQt4qtDpaXXeLuXeVgGM=;
        b=jXOlstD2AH5Lzks3aQGWcepcCaXlQ5jdNjyP2hTdhJwiSeBt4m7VVe0/aUlx/WTnDq
         juKnOgsk4psNlP+DKo/wbsuQNM9xXTD2OG3FSDeOeDd6SbYv7SsWap/7kQWKucTNLSMa
         /QCpmt30Czoqu4mwXWuzcD5PREQZ5CNAkCkoV1Iit7SVxL8/zJkISxxVtTl+md0u8lw9
         Dkb0sXZcOGKmdzLsbM5V04eaHR1OzS4cB4t5bSJxiq/amlAqG7Joxdhz2EIJwiCvhpgN
         xtqWNIcOQSus3DGO2L4UwqheMR3N1Jjq3S7Uw6G/PR+RbtytM21W7Mr0NY2I30v5kBpI
         BT3g==
X-Forwarded-Encrypted: i=1; AKwUvBzgWRGjfycgRS18/VRebxNZUP3BhsoRMQyZYJrN2ix9QElpwMQH5KZqEagflDiJeQMeAcN3rQJlGAF+ww==@vger.kernel.org
X-Gm-Message-State: AFuF++mIkxQRK689C43iP+8l9Dm7uR92ubiQ2OI1m0f6OIOk7pcpc+SL
	0MdGeMEk6KYQt4lZ8k7drl3TIh6OoM4U+R1B1pFLU8+GorwZ8flZUTDNw8FV8j0e2hvGT/FQF9C
	qHHjSUgzeDK1dMjbK619S2QFfhIQ/lYUdj5LQNZSY7rKBORBfptKbatNASGw//dPMXA==
X-Gm-Gg: AYBFou24HF1zfVkpG7gUkkNuIM0bRTbxPQgDDgJ1C/1Pp33PqMznvgp98jTpDyqNWIk
	DD90VBdqPGCi1w2V9A6yZ2zfeodEaIUc1HqCUAGXjV8NOE6AaA0e0ZuAdoduUf4bILEd68G2R4q
	ikCdLQy9Ana7if8r4HCbK8N5n9oX7titrxXqiH6XBfzoZ5XnKltwlPt/kEmD+gto/cuhX0saRu4
	s6uqBvbZ1txood1vTZbM/Q6sh7E5yzCRlaisUUYLvuSc1LsE/u9wniBGoRMggWELIRNbu3Bf6hS
	4D87BG6x6aCOB19FHdwrGd+a+wY/vueBnjOrqsOCtRG8O9eDrLDH1AjB1UewxZxCYbNzEuGA5SU
	Ujxx8qWjC9xM9FtyfVKK1Bjm87g8kY5Y=
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr31357109a91.32.1788768842017;
        Mon, 07 Sep 2026 01:14:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr31357045a91.32.1788768841617;
        Mon, 07 Sep 2026 01:14:01 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:37 +0530
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1015;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Fe4SJDubEcKN/aVqB2Y6QQJBZVxKn0hGP2YKnt+P5cA=;
 b=C6f6eCb69VSjSIpprg/cZqIZcNdnr08lgFgORs8EYRXbE/vBS71KrdBNMSs+THW2q6wYB+N5M
 bgsuP2N7wV/CWu4hb2fTF03amDOrOJVgLdfyrnXyPOGK+4qlJc59lWy
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: wDZ1TgXOr2JPXewnmQOaKvCfeN3Nw_M6
X-Proofpoint-ORIG-GUID: wDZ1TgXOr2JPXewnmQOaKvCfeN3Nw_M6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXzQxmF8UMTtK5
 5WMkj/VrQ0kpyPnSChV812qBvFGCHjJQL+NqHYXMEqjwcBCHz9IzryYrb86KNiceYP4pMK0W5HA
 WEgLtrJaH6KMlmutsIhhR2xMcN1Fq5M=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e724b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WdnH5iIHsr78bD39pAYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX1RQ2gwyAW4p3
 07Yw/F3WeXZXUxKm+2vaa0ykdRxo1YCtYEAn4P6A48Zl8zh2LCB7fnVGEuXu0cA9Qn5taVVrASd
 OYL85IoXBnvDLSx8qvEseIPyhq/iKvbceXbh9o8aPYIH1K9dISVf4YMqAO9qoqXFV6/lA5v+P55
 tQS+9hUtc8NfQJKinHyK0hEw16Kq1sOATYnGJYdNB8PQAg6qGXuKbTEVM3PfKDWRmnrBhEmK7Vn
 V9RWoyl2y6VaZMM5eJuJCrj45nxVEBFZmXoefJLUnNZEvbDNVX4Dh7Ee+LvVXqHEMRKb0oHVlje
 wtqwiEZruiRZucWX5D5uJ5qBEYWWZIeRhf4tntzGAZ7xpqOlwilHCbipGdWUTsYDr5i8pS/Y/KN
 JfKGlczcazKk6DaslTl3idhayH4sgFijDkdFlYXxVX7ZRbMM2ha7H9OxVSilO41iQrXzZz2LjHI
 204LHtD0ZL9wDNLZGhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

