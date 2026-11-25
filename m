Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587965;
	b=4fkSN15PaX6erig26XndidBSg7nGjFjkLD1UHUjvscT9/BsH4mhHqbiwEC9KZ2EHxIIw
	 cRvWBs6Q5zKPBeXuvxdojt4Akdcpi4e2m03RNr9w+9nLq+E8CL3JMKS3PvSw2XpbK/Ovx
	 rhFYWaOl1B1ItfxM7FT2VNyepMiqls18QKker2n97JRHvrPBFMxbE0Y2OMD1EvMT6Wvxj
	 GZvs4ZlUn/FWue28hqTZMdJ87o3zyffuXQ60SkNSPPJSRbWfu9rMNy8QVgVR+gPx3hP0o
	 6P6m7XEGoPJ/TFluP2QyWI1MoRSrb1n560NHoYkjFhF7ggd802sn4cb3FtjmcjXyR0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
	b=KYIHyQVpjZ1VQ4/njpStFa4oBSMt9HDdyIKMNQUOZSCVclw9e0iBxQ0PyH8emyj0SMkS
	 +QMCa1rsqvA9OuSnKy6DDjyn2yL4JvTEK5Lx4l+QS57uIC81FhQVPEIpGBfHQqZbkj/Be
	 HV/nDGIyGV4ZjZKVTg+CUSidFFmaScaWAqhe49bBIqi6kHGo4bcD9oMRO1mpQtEX3ujvL
	 avCJyUFnSatZAeYKtpoMGU1ZTVLG36cd5f+Gcmx3Gh3oDbIWWpk1Iha6Ns6uOAjzjQwhR
	 J91YOBQApASfuFflYuXHhKotaDbleCtM5/xSWKWbYvYv7uM6IYdN0okuG4sOY9c+BOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k9k/1y9/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZltZnwe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AE606A331
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174AE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9k/1y9/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZltZnwe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68b5o1860485
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=; b=k9k/1y9/scGSD5jT
	3WN+RtahfOXWzDXTqjN2A8K6ArnqV2qejClx7c7yThaRV6T3bPacjxj7S4GTxUwk
	/IEedcfwm17JhioUL6GBT2y2BwVFGLpNEQVk+Vl4RP1Q4DNrk3jwBvwRBrhHePEs
	yaUVVhHvLcDV044yf2b+C3UODQIjufitYttABSM6CGW1GoqPCIRxh2GjZXAPkj/9
	H36BJbvzrPioox5jHi7ugTHEZ/wv5MUoS1zNHGt3hgctjhUdvJWwlhcNv6jGEZHS
	KFBH7kMo8yfFpHCwBAwKsHh8Lgs+ZiZ/0sYnTC9EqgWxFDCfOvDj9O/dmtkMDOXB
	zENvjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu68yfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:26:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso4146548b3a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 22:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587963; x=1796192763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=PZltZnwenFPle/3ZeYb+xLZuSFHVK5rPZHh0wTugriQCllDMg9cRfgoFoNIsay7hec
         flB/KYwSdNt/H8upEQM/PaQresTSOBrK7W+h6h2XDtqerRdxAUYUy2IOsfYJC4S7Kwf7
         onLh2OYxmbmKidw69tVs0KQJM+EpS7gRjIVm0A0ojfd2DU9XeHbkFtwNYEKxk9OyWyQm
         +gijsLRbUQph+RHyRWpMiUERqgMrJgF8ZW4e7B2TnTp0x84yGO3YWrE+FXR//F9W3Rh7
         s2kP0HTy9hW8AtxmcgSFXWQZRcwGB4ktyOYh0BT0IjsDu/uOe8UGevk3ZzyQl4heSeCG
         0BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587963; x=1796192763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=P9bSWXXt1BvciAXC9d3kmgITyUsbapS/bOOqpRu2JHWzMcyuBjAVPm9jhI7DgQxgKv
         BXHBcsxKUIW9fym+EsX6zw9Mv6Q45fue9Lq41t2vgTGPQ1NKz8+uDEbO4f972wFaZswU
         YYPlbDKYkXlFqf4BByc7jHRk5KIt42r77Px0Yg82XZf436gMv77r417GeGyohsqmmYQf
         Ito7+qPkTwAeCme+z+onaGRxUosmp3hzFS9VYBuoUnzzHTk8wE3ghp5VGEykhYJTejHl
         Xn6MEmrJqW/dNCLd01L/2vD02bhKUWyB2xMdSkUAhW1DAeke4n1HLwLV1JhzR5dDjMnj
         nJKg==
X-Forwarded-Encrypted: i=1; AL+hErF9R02NUThBrfd/DlDAMYSK5BP+GquMhRs+3u5PzJv0bhNxYIFm1wMdtEoJU/LgmDDykipbwgB7Ocmqqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8n4a4Wnbrnwn2qMamSlI+EpVofKwx5v/6k6h1PTOqQVORg/5om
	1Z4omqsrt7cPbQ8yhApYhJgiQXEslL2T2l0MaeNbxYzNlls5uZxJfmueFroUOUsNcq4rCtwR7oa
	F1ppAcWtPBU9eDRi/ZKfZYh8Zt5mHDJKL0zyGXmRNVTArrny3p5ImITX9O1kiIvGwAg==
X-Gm-Gg: AZFdTZcehxEEpwGMF8f5VBsiBg64+U9bnQCi5C2sJqAQazTq2DF7KBZIdl8r37fEio9
	GBeEGf0Za/e2WNtxFHiVx26ldV6TgkHvdwUJG0eNbacnJqBl9SB9YYt/rhvas97WnJrAPLLQffJ
	7jURiipX0BikT22L4EnuQPk/GEN8BCZmbr3T2Ej0jGYYSz2luYTAOhCLUIcEMm2RCeZ/4I/nW0f
	j1ATrL3tgwtkqSOmUj9Rj/jhA3CHE4cM5XlABqE069UKRQ9yfV4daw0BIBoWuZpiNCHzYPB0YOI
	3Sm4qO4b27KE1lhd2Pov74h1fmqC6Do02/fDipQfQXeHEIVGELsOaQwlNjVhO+5+hXk/ihIO88g
	YnPnoHzZfuW7uwmLOmnLjVWdrwzkxRNuHJ6ZQopWPbTyAAku+gtn4jhhqtIv6wDYlWzi4X6oF2Z
	KMA6bO
X-Received: by 2002:a05:6a20:244f:b0:3e0:c102:33d8 with SMTP id adf61e73a8af0-4014c253b58mr17767002637.56.1795587962761;
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
X-Received: by 2002:a05:6a20:244f:b0:3e0:c102:33d8 with SMTP id adf61e73a8af0-4014c253b58mr17766970637.56.1795587962325;
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:26:02 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:42 +0530
Subject: [PATCH v5 2/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261125-hawi-maili-camss-v5-2-1483b7f68dce@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=1527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VrCho42XU53GTqUrn16AUx0FovtMl7rE/ickbc+QQAU=;
 b=z0AQLIDcrEmb0ZyhtN/DXrU7OlKamWSznS3tZAfWhcgeGbzMYpkrP6UHnd1TOfgA7nIQd6dgp
 +tkoDTZa8nBDptYhxqQy+JOmHu0E16q0Wl05A/mRlpvZIx4w2iBj/+J
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: wOszVEiF2lchq_qFoV8n--nM7daCjIqT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX9kbz7Eubu45F
 yoXdfAaRWNacmTYgP7ECyn/5R43voO6iuno97yddwmI0sAWiLds43NHlu8ZkPkObOEIOwiUSddi
 hrqBSpd65t0zzLwkOQV8rXJah5OJEiE=
X-Proofpoint-GUID: wOszVEiF2lchq_qFoV8n--nM7daCjIqT
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b067f7b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX6M8kDvc32GIN
 Kaa3N6sFzuiJ7oE2oVpZP6flGxfVQIu11FG8v9Argcqj1j31jW9Gick2PP3DrEmug+17M10Efll
 2iGi8e3Xpo44hGD/WhqfmVTLKIUKf9zwdR5lZ/LHaW6EA/YwEdtKY7uUMLKEcZ0/0s8tYJb/RJY
 g/Ri7gcKVHhqpRyiLyjt8x4+w8zOv9IExeYQsSMVRV9TCQTPgu5VQlWkwnhgWxoO/bYsHBCaNr7
 MgcaxDlh33bDyIhKghHmm7NPBkC6F0qu/AV6BJ+jjOaQAfejzZXbMRUc6I07yKT496rZ9NB/FT4
 xdqaD0Y9xpdtew43N5rwlJDmyZVX00asROvEs5ctx7EWAfMeUtZxRc5CnNZBS8g/fWlbw1ZSp0F
 vc8dZ9T1dFipfUUMiFfhcfQkISZvG9A+5E7lREqWFWasmRydtkDz+M6SoW4yOX217lqJEHKnOws
 e+cmAxt21zgtsS6Q0gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250025

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 0dc8b7859447f378282732813aa6886bdb1ea4b5..40e9a1725d57644e480c2d25a5f1c0ee7e1f5dd3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
@@ -25,6 +26,10 @@ properties:
               - qcom,glymur-csi2-phy
               - qcom,sm8450-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

