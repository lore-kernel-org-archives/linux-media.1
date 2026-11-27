Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779859;
	b=CLyLJxFYDD/jbyHc+fgKLFl1XFrOdmZOw6uTI8zBeRzy0L1P004RBTsPE4JdvHzLceDh
	 NR3T0y5V6/mbZvEmUUHmyhS9GbU2rGj3C/EcDw8WCxbzsSfMOCR0zqlW2ajqZxDo4Bl4k
	 OZy/8NxdLoukWoqajjdgMFhyKXdDH6TB4/j32JVDN2D7IbQPGdXisMNmObimEKJXBlavL
	 MMJOYmo8tiyffWaHluM7xqjvZBq9cBE+/kXyjbyiDtebHaHzIJqYK+TOvOibxKBwUq+3T
	 RF9Sll6RHsh6kt15HE3ugQhXGT0BQky0QeVbyLeCdppsyRFzMIFfoQ0ytpgI/CrJnLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=y0zADDoxDIab7iQ+914H+OI6Gnzslaryu7QSiDb1GiPotZ4+x8N/ISHoi6HJYSxhlwH6
	 zC/cJ7mEFgGigQxH6CawuS6oT+Awuw6RYdvEdl+rQ0oH/Ya5e+CzRRTvUz/Bdty7ocIcc
	 6U341dXaDBTTvAmGS1A9vwz0OqMPh4pkCTw3nhJtKVEXh/pnzXt+GJujRoNy9jmfgdO7J
	 sE5BdNDJo+3ZPcVs/ceXtdioRissN1IklJ6mBLz45hNbmfVR8HS4mw1x4DzOmU0QruyL0
	 2IYYyQwoZyR5G54166caCSrlnfgUEir5TAWlccCrfmxa2EpcWoLbQcKaGFuGOp0eqmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94A606A324
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF94A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBJS62rl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkAODmPX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApXRM052756
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=dBJS62rlsuED/DG1
	i78emq4hKj8H6+mhm64WNWUuIK6yv3k5Q+ImF+Rg1xgdvNYWi0PqHeCvH4O8JZgJ
	wnyeneyFKDJkmMOgbK2Wa9jgyPbn7KZePKZxmdvaayGeKvMyzIjCXpIahCEOLfua
	X58GM2BzgRtxltYL88RxBMUY5LAs9FgqM/zD/DQmEl1ggiL4NEJOJKkFewPr+v6I
	iB5moLuw6cO6naPdIrzRUkBVW6DqK4+SMLJCR7jv5j7qbHbOxYOaVIISZvi9+fFU
	/2m+QM28yWN8Xk4Pe//kqe0Gh+yR2CD4rKMr3AGZApUsK0NnGXq4v85QhfizMRSv
	E0875g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s8ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so7714037a12.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779857; x=1796384657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=PkAODmPXjF1/fRy6BgTKi93BYrgym+VcinhmQMsBJvJrh64GgnBnYrMFNP5q7xfgqN
         ZPpAcyff9quKRKLYKb6VyjKdtBScyPaggeWnP93xQ5mGqAknYUgVkR1aSFdn6MCcJXLy
         +LW40g2ZQZd79AtTrqjLtVRgPGmFmO5quMKnSONUMfmjLekPvFFuik4JT15qB5XAlrQ+
         uhTXJQMQ7Gt9SdMBkGNiC07NQieaZQuyxiR3pVdR5qJTUT6xLP2UK+ScxNYRL4Yo+5R8
         6FuhatIIltTUwQ8oPR0XarKtWy05rs1uMW/rkuhQJ1OqQsPNzx0FiL/kwGe1QqHqVbA0
         SSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779857; x=1796384657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=CewW/StnZowww00HzFPBiC6LTm99lSldPOR0m3d0p2kNuTeOW2SXs22AmGCB9EoBj3
         TxbkYe/Ue9UnXvQ2eV/HzJ5CVTFjha4bLwwyy/3Fa+SO5gSNlVip/mznX7MSqToDilM/
         jFgzGtrO0VqfZfRfC2WKRO4JWi8u0vvVJhRZbDxU4eRv7X+op9EVvEj/Yxkux+DrkYOr
         FKwWWG0MxlqT8Hml1iEDtDFQBArAQacT31sitrzZRcC6YhUByV7TEPwzj4DQfygonQCQ
         IzTVyoMFUosHU7KO96WPVJgH8/ZY5OoggLaH+CASlZ/4wb/ParTW+hVhP33kDFq8J4iw
         5tdw==
X-Forwarded-Encrypted: i=1; AL+hErHMxHCa1V7b9RSqwjJGMeaLf79ZNr++XU0aPvsPCQ5YJQ4mF/zK9jfTD6BcEmUv//6xk/XaApqk7+4rMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hARSmNt82SFtZHtPBiQcqReiLBzLD4/m7Pe2C+Xs3haMsh+67
	lcReBX6MXoPDahuDWFJ56ogZ4KH/uB8cXBe/VUkvp7TN3xxu/5Bw0gFC/X5usa01v123CSboZc1
	a255ijR9V1ntKyAcjet/KFplcVdbEaU4PiR/EvgfeB0ubQbE5ju8B2zRD/uGRIg8vMQ==
X-Gm-Gg: AZFdTZdeJgTTvCwo/6i59yH2ULRKS9BxZXEMSLBq/gmIi8gLhh6kfK70o3gfxQO1L4E
	cQjfmTEKwJaToqhOluzfZ6LXVBHnB826JRiKDTrLbCUMMLRyu77aV6GQ+VtRzTt0E35Em0V17fb
	+PtTOmowWkHjcFqZar0mxGZ7sv6CTHXPqgDQ3EfmYB3DLY2bv3x02ge08dIarEwznsEvwXSQM4U
	lA7TOs7+jr4gbsJDqAGxrpBLpF4DrKXCWpb8jrwM4dxZbezhXhDYFluZmWybdZKUI3NM+iEtrsU
	WdALoGODbMc3v5yCeSC1yF7/PLWl/pUNivVo+EAeq2d4zF+lPKfZKmIoJHBxmH2TA7l/oJUu6ci
	Rvw7GAI/9nufAK8MDfeJv+2U0gjwPdvZ9kKXwemorkEba3NehPbm2zu09kGmqJ1m4gIZeOaPsBD
	HhdUZL
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643528a91.53.1795779856724;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b41c95b7femr23643480a91.53.1795779856250;
        Fri, 27 Nov 2026 03:44:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:15 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:01 +0530
Subject: [PATCH v6 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261127-hawi-maili-camss-v6-1-0f4844eb63b3@oss.qualcomm.com>
References: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
In-Reply-To: <20261127-hawi-maili-camss-v6-0-0f4844eb63b3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=rZ37/Dykad1gUgWkePEK4ua5jVhBcm3T2Lx5wifTU22AKkzobNwh7SmlpOFwcEJqJsLvINRXJ
 qiDvisd2FMKD3dK8zMLrc/vaoMNTITRU+1dVBsO61/rl+XrMfL5girf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: kaJcX_qsom18o615NPRBvhJYC23oF5ML
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096d11 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXyxS42Fzkln5H
 3LrBti+CKZ/xYPjYE3sVGdWklOuHn+2TFU0H3egbp3Jus4LnXPBiCzGphXZGE6K8+XqARYJZDEA
 dyQQ5xVB9crCVFVueAddVC++ZwEjeIQ=
X-Proofpoint-GUID: kaJcX_qsom18o615NPRBvhJYC23oF5ML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXz0uamnYTGhvi
 +P93N2/t+i8CmcUOjIqivOWoegxygg6EsvGxKe+4S8sqPScmOKqjIFGrLVV+3Z6N+kMABtqBB60
 y4pwTx4BpuXApQTKpI+vjrf34q9erRG/3Fun2Wkyw5nATs/tYD56uI/Odu41H6Rrd3O8TrLzaG+
 peXhcp5ccqVrS+Kr/zqhy5cqarEglU5Oct5A8EzFwEvyo22KkPrwsfFh11IrGE2z2Oll043fKEB
 FsRZ9siA7C//3j0S1xaLx9ShO4+X2GM4yHoSma2b92dlWchQt46v7LloiO1U4WabWaGpv+BUMGP
 oU3nCP+NDJERlsjpwWxKdsVNrADv5XMJ6rjPRSga0+kNW276xlurPJpBAAuObUl8lPZ6ernL6e3
 EESHacKR7GuWZfxPciw4BkoTRdmXgqdct4MytHQzOwoOGDYrE1azKz0/3/4n7KTx6zulzuLe6fZ
 AO3F8oan9Ux0JxKWuAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

