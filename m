Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947870;
	b=dV3iKmmonR/ON15M0TZ8WQKfwXu+vE5K3cBmWGV/WOhtSrssenfTtE1jP20t20sUnhF0
	 DsYxAWIas3BZZQYOAQ8oWdsAfzQ+se9nCaQ5UjNHtM1DJNWUnl+zeyCrR0FE/KVKeGwtd
	 J6kEZlnhSUTSOAtDXOc2QQTcqEz9vcc+U3V4eO054ZO50MCml+u7mghSB1Ws+9FegqOYA
	 qJkeJXh99M9MM5klgyAvDL6T2U22mDu3JV9TqewJWjHvSBK7UjUOcFMSsSoM5uO8cPyxX
	 L++G83Ta/idxbrUEad4qMleyynPo0zwTYK1keXzegmBN7JrBrvxJR6wfWihehKAvB5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=iNZHq89k8NPaWU614PItny4iQ6V4f3EU97/DOVA9U+TrrECvlQGxMbbKu8tuNrzydsVU
	 5bNhfJSLel60ljhRrNMzoNao9wAl9926LxsD1miJFLzKIVYdqyS7PfxBxYRyfUioEuuu+
	 giYMB0VFzcFJCd5luPVpl1GpfXp8kN0eDKqwLpBWZCzVIzSJGcyx0vCZ7cmfSloIJFEgC
	 g/jJ1boDxgAZxmKPcu5XMzUxNLf//V7paHW3F/3xXDZlcqKvoqUQK/AlVRIfHm6zKhOjt
	 g7Tjjm26T4L0L9vNzlxxGV1T3WCOaKVjeEwWrCa9a+zYvsFn0vMeJCbUN2t4LMEqZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B891606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 06:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B891606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406pp3440601
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 06:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=Pllk6hPCzbgjTS4L
	Lb3qhY1U4RExnpmitgxHB4Acq9kf+EW1lSTEYMFPkm31u77F7GgpkWshZJnUDL4k
	DrfKbBkj4uoVQBY+6JissiFCgAxJjdLtIVEmPaH5+HUZ5mUOp/upOiN+sPHLxmt9
	EPdf+bdPg0zUfYMc383hHEps9/5lZnYvXzXi6MpIPs0CwAVv3kjr6ckwM0nK5NtA
	SaQ9pdftVfLPd+oKZCPdCuhW7oCVdL3k3UxNvhaHy4W7ERyyaiX8uz1/ZUcXQUOn
	JgDs/sVMpkjF3dhVG2WjiyXW4eik8Mugx7LpxdceZQ6kUH7vdhbFd4Mx6uZuvjXt
	mvlm3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paseha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 06:51:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so382959a91.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947867; x=1794552667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=frBOfoIqLFhb0tr5lzaLQSMpMDYTPUe+Fxakj37QjglurscRcrbnyVG/77gjVpkCIa
         DgeQMpGpQn0EtQRA9ALXPKvgVy+Bj+BGF7zdPECukaIj/yLzgJZnqOq0IBuJh8CLBHc1
         lnaHH+IROQgwCnBzPh8qsc3J1iRFFTKeHTBWrPLGdWi+8/ZMqfPKpPFNgSW3DPe/yG1R
         vC5qUeuNQda8SKbVyKptd92TvfvRuRc6OiiY3s1i+5V+J+OIGgpsyk6ibbuN6br61FmT
         p/X7mVl8b2IxRiZk0+SeiyDlR5HnaAdMwEz8jWx5f48AmuLI4ToxEq9i+8qSZav0WhJP
         heJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947867; x=1794552667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=IWBNhPO7JsDdz13FvbJPeKdjTI3ktNZiKnZuu7cWXLLIZzZ2fUvlaJKYEy8bMkF+r8
         +EnVciZ2io1fARN01GJa1mYkNZ3oYXOpw05HEjhjnkR0ri8C796O5IerlxIPW6F1BlHm
         XRhU118LrpAufK1smtQveiOI/+6MXAnLID+U/Qj+UV/92QLVgiQPqGYevmG2DLPA3b0w
         gdhpI91G1hbHFfmffLdtDYyirrY5laCKekhn86+LMq56jvfi7pL6snJkXHdZWXdce3QC
         lIv+D0k/dXnmin53+7HpgAiBorg4YqfiYL4d9xLVef+uDeYe4FRpw0HTajyaMUbFqtMz
         BG9A==
X-Forwarded-Encrypted: i=1; AL+hErEbbNSUvcMWmb0XkJA54eySxdNpxvTYa39IPtV4+TGNFNybwWvUvh073+qFJR+SddUZcI48HcwFdqnUTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++mHPjjj+bpk6mKPJixZ2lSn3NgFKzY/Q0oQuc7ybDkG/51apY
	bIjvvRrCAlHn1w61X9TzcQIZeHH/WcNtOmdbflNpWFkxSnhyLoMLKNLetsVfWFGdkOzaqvSoJLW
	Y13wC0O4W15HMOu/F2ywj8M4n9tVtw0cJ5NwacHaUkuPJ0jtBv7r5k6jPuyr8HRVZZg==
X-Gm-Gg: AYBFou28qdHKtRKmfd2sK0qO55zE6cwD9op3lAUo2s0qQhCC1eX3prE4yyqwmk4G99d
	zQ/6N30uJvBWNoUTrARyGukRcILLNRCxqhcaML8xjMGNjLgrf1/zidaMhWryLAoWQLkquCVqfV0
	j2/Q8Zv+6pFjYgMCUrhtvv0mh2xg4BhWsEG2J98kHG74nedBJu1ndHkfXOZvYSYXOev3VI8zEGC
	RksHQWKfdPvyp3wha59KTeqVRPzaHlvtIG/grkqcdS9bILbJamirfy/AMyjFQMVZmksAP4y+PA0
	tl5D9bz4T6/hqDYu2HCTF3AMJDjoae0KhjgJufvMawL1BEohVh62aTHuAdsaVHRoe/SfN5rOrpT
	sfzFD1i/+zDjFOqEeYrFOe9B+KXLJSjWtanM1iKfLSV0DGr0tNzgiYrLK7AxXL2aVUwDDjGYrPR
	70qsbJ
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388259a91.20.1793947866847;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388239a91.20.1793947866358;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:43 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
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
Message-Id: <20261106-hawi-maili-camss-v4-2-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=0J78F37O0f9bKC6fbPmKMswzabA2px9rj+Plc3qcxMWcxeMS/pTc9HKNtYs+5MrbeLGZVuuNx
 8WyPRjLiTw9D3UZX5eeVL7ax7VaLBS58JgE1DW4/yo7qd9ebMIaIoQ6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX7Z9lNt9ruoRP
 HozwI8G4tKpBAQK5AlSJZYRQlikJc66EZQp/uCPg92oZH91QnMo//jj0blQhEe4xAzZDqsXaYp0
 KvyrwLsqjgYlSSnCYrLmSlECcRIy2BnjXKCs/mognqut4QtEYIsJ1bJS+iGuz3Ntq71DoCDw2aZ
 nqmWK98Er/LcdsSpUBED+3eaLhhalZJg5Dig2pqeUgB43LgiT0N/KEeOteqY4ItNCrWv/wxnrrj
 tcx/eLIiyZjRyiuHbxNoD1ejuPHlwLqYq1x6R4TVK+5sPyD5ITH08uFUvJldZ/7gcIajgnqsRfA
 nqJKCClA+bngzn1D7BpH7iLaxZtrhDFOZMoLwm1iQQoVXyzOl1cIPBPVqRS83BRFqYBixmPI7pL
 zetT2P1gfhjppkLGZ5zIxZIKjsgVJW0absta/1+e7u8x0GRk9khZMRq/uapKv9UXlZLTNIhhYY9
 7jd1/t+WXC7LlvWlzLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX79TerbyuSq3J
 3jE44wDcVAriiopxT0EZFWeAuHyK+hZfoAhalAA3x2NtQi4nTAJqjQS2Da9Z4KrDEm2aOg0Mfvc
 CuQbyeGbqX5qGSUCymsAK/OasScQ3R8=
X-Proofpoint-GUID: t0PJlKm4f8BtfCBUkvkFo3Da4rX7fPdI
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed78db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: t0PJlKm4f8BtfCBUkvkFo3Da4rX7fPdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060027

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

