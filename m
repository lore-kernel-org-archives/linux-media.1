Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364218;
	b=UCVs0HZeZ/qzzd7GVFqcPqTjM4c0zuJUYn5kSm9DAIOih8Lyx3YYT2Qbx00/PZt8XAQK
	 0NtxJW3UaVEfZrNrNwGCIKczpF9k+iTaQUhh81A9FCkK4P6uNQT337HqU+ujCy7cQf0VB
	 J2sZvvdDZBuritlmw4ikIEcOII3pnCr6J9DmThz2d524f2T70BdvMFKCRDvCIH7FkBSg8
	 eWht4FcQCTI8CTruLVISTtzg7HouaWAhClg8fd2xcdeX8AV8JFGUshmmK1tNVk0V6VxLt
	 gI+RevCg0iVR+PWLUzEqTmF53/37E+dPUgRpniFrZDYvcNNuos3ITsA2Ouros+jK0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=Xp9dHah3+4LsR2NPuTLIX4rqRhHwMqehycOg3FgFGn5VMYIouHUgppGA0/wObn0NAumT
	 u9hsmPTjTDoPv/SJtICWrxn3LKxX8gi2GgefIzjXqpUg+nfAbsG6YyRk+YVMMnvIxUMhs
	 0yZW6RU2nA3zthzaTAQqs12kM+xywQHtOMOj6PfCcyZ1YzJFWIYGUvCu4dS6dbN3+D+hX
	 veE38OcwA1P0NU/3oHw0+Sqk3sBzeH1+mMfgMn58QBobLJdPxWnuQYkUkRPLmzlMZDQ1M
	 N1dWdksK7NuPpcvDszfnHUk6a1qUr5v8FNccCuR+Zb+3mPlHCmo6/7i5O5IcztTPi6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E96606A31C
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxLh4143798
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=aA9iACs4OIHPhKAx
	z3tAtDDkGHfnj0GwoaR/slfHPfGvqOuHHRebmCPc0vKZEmRLfCL/kkd2mYx7yypf
	mesFwnqXeolYDZbXWyw/2WJjzZkxDcivijWVA++Mw8Kc5Okcsd27AgNxMT3BV2gY
	foM4Gw5Y4Pm/oOzO+AaEpUt6VN3nUyG/s2+1PpwxmsmWbTRPH9ouxdMYB8gQ+P4C
	y43RHRj3CDalDugNjW3SGsw3hANONVoRAf4evoN5NA+pddkVW5N+yacfjWiLVdKZ
	RjC5uy6qBeyo7JPIvNfKdebTPOl7dQz/pGAaA1PSeMWoQq04xPyi3HRiVUXdGvIf
	yX3C9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7531jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9572e892dso5402355ad.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364217; x=1793969017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=MT6f40vE9No5RHTEIrzbyLe18caae6v1PI5eYbcp0c13AIhzo2HAn0prZ7dIn7nUYi
         KugvKwv8OLcGnsRTTcbZitX5K0+rnG98YONIsOGEOPg3pUAzNhjPNlMN7XYncgoQhvEF
         6bA3WC7l8TLPLYWWP6/LQpiG4o4TNIBagzq1u1tQQ38nBLt4UPsu4kHYRbNsmvCQc7LB
         gU/1kC8KWMguEAXnmnFUBc56m+OsqIml4+G85NkCsxtqwpa7zT4U+qXVbwKVkzJXZSb8
         Op7O4vfwCunprQ6aIOXIcFZ9RMseMQta/8QnilIf8ZQ+iBLmb+qCxGhQqEGhqwxCrSmb
         q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364217; x=1793969017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=S0XbKPkjQgGtGyD7aLRcwTSnjmW/EeBDyZTPJJLTRQGJRb6SsRAXFpFLCPAJ9D+L3Q
         6ETxwomuQMTtwkMgqAaOM88eCa2H9G6BN8GtnyTAIjRXb3ZgwHjaSne5Tn0eZYdwHDwP
         ZkJmy4UciTHFbouUjzOgu2N+M2ugxsmC9rB5mOQF1RzU8QM9cuA896Gok5A5UV1tZ0q6
         GEB0GH0WwHSWRMGNgNaYGo7dqGTYC6e11NELJbj/0vr/ggMcVm+MFfZ5LGD2fGIi5T9o
         HDdKEW5b7WnHC3DFG8IwaUr2YiwlzhX+KD55FK7IdIS6lgIntC2m1XgwoN5fR2NRjM2u
         Evvg==
X-Forwarded-Encrypted: i=1; AKwUvBy+ip60lnmBJK/AU4fN+xrgLDL9zlta56CwqU2j6prya36aad0mVW11/4YfPI2/muoSAT22xxlayE/rlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLn3YcShNXAPxX1ufATiOqV1/hk6FdtJZbZ4PKbRQnGTaRMLisw
	zNXYgfRb4Bo3nrmcBLoKdY9kbenHF2bbq6o7mpY0QA15fgxP0pjLMmDmsCmV0sePz/ZrsleOzik
	aaQn6a2gUc3gOe/Bjb+qWDDPEgcrVIRiszTHM+tUWYLouXsvXiI0VhJckr3hHVXwB2t77V/esqA
	==
X-Gm-Gg: AYBFou3ddMRl31p5KxCKKHkUmr87VLbmVsZVmP6HKufIc7S6vaPLbp56YjJJeZzS0uA
	P/0AMPsRkfhNPaeirR1ocBCp3/7yB8oFPeRsGfUAEn+vv5dJ9EWhJPkZqAnYL5uUtVe2UnoYury
	19JAAi3jP2GDZypE/U12adJiXkmRVNuvK4gbIuEusNHVo3KLMqIrYqEUNk3clel0bRRg33IcE3W
	QFroyluDdEWrAzEnQ28fjZBYbhyF2yaeuT+r3l1bJY3MJ4aTEsNqZSQJ5Z7NDQjwiIpsInEYb/P
	XzzvTgtRIuUEgc2ravFiSqZM6Vfk8EpkmiewFz10afevf7gcC22jX1tuYZHktfvHgNdW9jPr7v6
	wDpHC9YeP5gJHyZBdGFWf2cZoRkpNXdcqyjcRMaHAioHRHN9eR+GTUyVn6BleSMoP545VAscb0p
	1TKRc=
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525525ad.60.1793364216740;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525265ad.60.1793364216294;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:02 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
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
Message-Id: <20261030-hawi-maili-camss-v3-2-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=3q6SA79to3LhfP25KLgv4CM/jRHI+Eaug863piJVxiwfuCDVLNdBFSp3qPp+LcZTmyL2pUt1c
 Wpi0ylH0f72AaZBoTsPa+f9i/u7hEkQPP2ONknjq1ttyu4rISfN1TDl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: Vd8u3QX5T7rB2hYkpAWQDWxHc6QJIvMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX7V9F8ouQM819
 Kdh3hh+DTRj+cKetMNx9NbtXcYRPkILLqLSoow2DpNGLX+ukMxW9PRnJDy/GFsEL+WLWPpks8Cx
 c37xfO3LwCQamr+48KA8QGcgO0i0RPfeW9ZuvGFs75sRGuOMdmdHIAqezIi/Oy5SOTp/LaZSftX
 xIc847msa7U4dohp/IuztH3n5hdsIFZQKIEEDaTE5Z4/uoocF8uA4zwQ2BDBSiZV7eKu2uIUPi5
 LM3FPfokEgNj74D1CyKDOj6NOi+82si/bJ0+qIyFdUsj0tmenht6RFjBBW25O9Ja3fIFAnsU1Nt
 z0AQJgrKM103uaolVVGeDACO83N4PSpTahBhUj/DzNvuKEMs22sQYRd4vFryKUNKRsvBpUMACtD
 mJyj6NuT5nmZQHmZthaAZlqrtMSvV8Eosi6O+tGZxRNKVecSIWrlHBEeuy3j4qZVe+5fQKqcJo4
 9kobKtN7GoK23nZBihQ==
X-Proofpoint-ORIG-GUID: Vd8u3QX5T7rB2hYkpAWQDWxHc6QJIvMc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX6f5cKXziCHMt
 bkoO2dEi6/uAoL3+rJzSlKJGI2nAnTXDItzNqjUpUWMwqbX96RfnSCw4c1U1Qt4shI4OKkRpBjg
 rMNHOuNTmV7M16nTpW0swQehkY8vMRE=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae490f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

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

