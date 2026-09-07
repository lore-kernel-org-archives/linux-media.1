Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5443E079
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768861; cv=none; b=WIy/W1NbIAz2HnvkzQAAWY8UKutTftN/PHv1Ddj1CrnxbWGg3CuM7azlThaFviQeWNYdLbJItzMMfw8edCDj/LaIy7jsaJY3dS5FocJryLKf8/vGlB7NG7ofQZ2m+cH8vUgXOMFOw9hNXul3MBTGI1PAOOWm9t+eY2sLkM46m2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768861; c=relaxed/simple;
	bh=9YSmccNbUMCCBO0gPcnFhs0JL6BQ7ZKinOfjmTBUCww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVInEVlBCpMZlpr0oWeD44kCF2zKms4GsXZec6f4xGqZRmsb+Xuq0AsTGMy3VsAn3cWQejt6KMMuYQGRGFlp3U1G9cw+wNHfi9ubD3hnYTQUon2392OpfQ7k+/of/LqhhVpT5GhorKZ4s31TPEKH2/QcKFk+PQzGA6QCT2f3oRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPdRNTV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4818V8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPdRNTV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4818V8i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777OOa3352529
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=; b=lPdRNTV+dWlRj+5N
	PGrIJWBpuEKNamXlcieEIhfWBV3zGwuviEhN0QhTZY515MD8Fkbgdgz94dh5zDzL
	cRVJQrVWPKFtV/9ns9YnUropcpZ62zTNF7eyb4YglxEgErJ8xJSD5gEOPG/1Dkzn
	CZsQ0m6jfsF4sqpC854WExdy/AhkFipPF43se0zxUfZsgJ2mFGJI+n2rTJ0Z7Qko
	ud7NSNOeWluQftmVPXlB+N8SX8/4PQ2lh0NNRECUWhDX4jigcwDRbY7HzUU5vMkB
	zu5L1h4cjbwzOL2rdbGP5Wc35jUDtXLOaWUgaLGXu05lA+q2U1rVpzKDzIhn+Qtg
	xQLAEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gr5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 08:14:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6235201a91.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768857; x=1789373657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=g4818V8ieqZI5gaQ3LP9v8scQdmKwX2SMqzH2x4L1BnM4USqGb1R1eFRXaB9f/ok5u
         9lY+rFzXbneOzDFjscr+mOXjzjuEAkbQWc+tvVQ0UYdlkdfECDj4Eh+lQ36HgzWtr8D8
         +czJZCQqbVjTa50t3QrU1xxNp9NmIVk3rH8UY/emRw9p5hdVL7c8nar9r3151Au+yJPf
         XgGpAgRKEZnTuVSIKyDPQIXV7aiTYcGu+hTBIkJOIQyxH683rHsp5OfotgkeETnco327
         nic/7eE64gCBXPbRV2cqAC9vV0DrZItn5KJPNEikX5LgITE4ecEbS+qDRIVoewy4OQH3
         GIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768857; x=1789373657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=M3xk0ZuybFudN2LlFcraHe4n1QvSFnCzSaYcfwZgjg61A7UgsJB4Y0ZahLU4xztIaV
         LVkzC4qS+GXrMnqBt5ts8oHcIHh/5julOLG1X80g+sUAarSlQpmTMaWyqq3z28jN+Cai
         2/h3fqQhJkZXj/tmN4VreXbiGvoBu2vKrQ+Nbb7FRSBCxc/3tdE75W9F6Ma7J+ZTAwMA
         yZy9+EvBSwb7v3ez9E2vB66dTPpjJd4fA9FPhP/OYYhS9JEs6CnKq+0amkvRKU4w+EF0
         FS4mT9bHcT9a4lBgnGOQyCOyEfUFdwxuZBsEnpaONmR7ktI/KqWiQ2FvahYudi771vbe
         Y2Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxbtpU7GH+sy2+de7a/tXx2ZSjvPJD1Au7/3l/QY+BTn9+Xcc4cyZRmocyfPoRjzw93DONPAe7daozudA==@vger.kernel.org
X-Gm-Message-State: AFuF++mr+rvMMyV7sIuxRkLru9QZ8KBXyIQH2xeS0ehqD6ujUTc4wO93
	VyXXlPbJ8RveT3hwbUa3qx3W7W+nZJnlB8Valk/seNBJzDgAWu4ueN1yZgcGaRvkcQEfrmxMS68
	3AwZwl+60WcxywrvUoxaYSFi4TbVUklqOG+ODHkd2YXV+FpDl2/OoWa+FPcoVnuRFyQ==
X-Gm-Gg: AYBFou25/WCeadIL6fa4mY/3pZhAgtJf5nD71Z9znjkejchOE3KNOAC0KToLSU3t3UA
	X06BtBCvexS91vTWvFdN9IS7R42r9K7JXt9VrsXKsFBsBG3aJL3APCw9R8rhF2jztu9Kn1CncQC
	ni2GPw4H2D2hMsKxGD5hNkkMChevf65KOCgBCOjKeGsx8BlK8MI+bsf6vjxM31h+TXkA/WzseU6
	lky1oSDGCYHMBNX1E9z8g9tJTIR12KpyCLzVgh5l3wfuPd0KB0MABSOSXCYlrk8LgA0ohWRMTO9
	upivUlQjE1ivV6suvRxNSDmtcWfurD6aNh5zjE9+Fd6CGjAW1GNRDh//jR/40xXcdUL/83m2lik
	jZR5FMB5eWlAh8LrH6Dd92Xw+CaGv/+Y=
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120679a91.21.1788768857245;
        Mon, 07 Sep 2026 01:14:17 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120623a91.21.1788768856764;
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:39 +0530
Subject: [PATCH v2 3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-3-75f7982dc983@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1891;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AoJ46bykjinzi5CHRfxJnkzB4gRLtxmI2zMTEfoIMCg=;
 b=L9u/5sqhOByy8TAubk9xjK7ku91RoQuKj7maUFkahZ+hPZWBHmj6uxWnCX4BR8irYpKvnI2tW
 7np6GjGCQ73ADe2IFtIdJHFBzQAKZKAxGYoUhcH5OYwQF8f3Sesrax6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e725a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5mci5dHc59FVrb-tom8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: A80UNR_9CSCjyP1pbzNn7d4t6ZyAQ7DD
X-Proofpoint-ORIG-GUID: A80UNR_9CSCjyP1pbzNn7d4t6ZyAQ7DD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX7MfJ0XyqGQtJ
 heDSzolk1KLQo3p95i9gIm49z49iVietKa5jIDav8CtGu3OFSoz0KpFQWMEzThYdW94dE/VYfUG
 /6U3OYZSaj1yVUgouWKXDffBmGW9KSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX5cC1YFjxf7QL
 EYlgmbZKe0YxUFnTeop7Ixa6D9HWps5QXRwNFXVkDiwH2Dz7rQ4q5aW5WzwYDNf7OagrHFSyQjr
 K56Ls5ZDi+CZtSCeoMNDb481vm7roPgguV+8WTuq1PQeVAT3whAo8AbsSp+RQqNOIg4ZCoRCrrR
 8LpS7EdGe7E8g43ZSSdgY3M4e1ttckxX2aLQSbO00DEFjWy5TDS3sr0jEYVM2JDyx54qZHFQt72
 SI0rCF/BOz1czs3zsjrCQqwvgbeNlJeXw0sjb5JWg7uzdQmehVQFZq1f7BYBDeHMctIYwzO/j5P
 f92k68VDkg50CRPZwuMWMhvpRvmdZ6952dynZBZY7wCoyVE8XK4tx3g8jeD5Fdc82h2k2HYGrgK
 8CusKHvjkljRi/o/mj/Zm4HzNqCEQzzOvBgHWYR9ojuKr/Ovx+yaMMreSBpAfxJfVyjUizJpnD8
 VJuXuE5QFlxcr6XUxxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Some designs integrate the PM8008/PM8010 with the interrupt pin left
unconnected, deliberately. That compromises some functionality, but
the core function of programming the voltage regulators remains
available, so make interrupts (and the interrupt-controller
properties that depend on it) optional.

PM8010 can communicate over either SPMI or I2C, depending on whether
GPIO1 is pulled high or low. Since qcom,pm8010 is already used by the
SPMI PMIC bindings, whose properties are tailored to SPMI, add a
separate qcom,pm8010-i2c compatible for the I2C case.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1dc571af668c37655017cefe82e139..2f439ff9805d253bdd815bc85ac206ed1be964b6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1
@@ -88,18 +90,14 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
   - vdd-l6-supply
   - vdd-l7-supply
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
-  - "#thermal-sensor-cells"
+
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
 
 additionalProperties: false
 

-- 
2.34.1

