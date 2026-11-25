Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587959;
	b=X1q2pMyw19hr+MHz9seCJ8/8tEM7sgzk99DJ9mCDtcVXzYJUN9oRpPOqvLIUKKgMj/gH
	 m6TeEX2jFRiYQL0CB6SAKDu1Aiq68wK2V/xJKxsEB1K5YlZAu3kF942idxviQPw6/HXFK
	 srbA2ryekPgHuisR5f5i/OX0B+edHVADtH4y/sPh6+TwWy8RqMJsVli8bVW8orHks3/4Q
	 t+kfu2iK8+dRYn4Hb+FdPihmEalIc6l/RgqOEkxKJkrEyOycWMHbs5SD+U4z7b9DS/RVB
	 ic8LiUHwlzqQh2LMGXgF45gHXcBCWnGsDDgsBXl9XHmFP5M33h7XykIfT11vvGxQxXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
	b=ayVeqKDAbPfIq3EH50dyNzezT5qwVmX+7py7LNDwQESkdHy0pyj/yz5D2mbbot2j+et9
	 jMPwV0HJsUlEDYu5Etn1qYdLnOVv/z3EzUTPMa755Nv8N261ZBVk1eI7y/hTf1qO46Ua3
	 nJK9Pp+5vIhH1o80VvO2NNcxR+eHYwNNlIekLtKIkxNv28SQ86Q5VkBDC9FpkZw7L6Bnl
	 52DSe8PgP+ZQfkoiCgD60aGUlfWt/jjpDEHaByQ8YHzaA6SKjM95mIRnBsOSaFGfuica+
	 jmK1GftfpGlmnOEFWGzMz6q2QNYkTDJEzs5h+8guUSmytxk5r4Ze6EPHFWNzum11O8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0F606A686
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B0F606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpZ7ykoS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jZySGB+T
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69uUr1006364
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=; b=MpZ7ykoSA7/sjKor
	fhs3LtxAA4aCOH/GysYC2AxowpPRmlTm5zMFGhEF1UsE1+LDAJ4cPAaORCe8hTTj
	3jLRSUFAT8A0WYN4NrBTqGkq3XQdsAXSpb5NcWzWc+kkVB3FcyW4JHNsP/J26k88
	LwbhHlCylKB2n0njRhvHioNEN5TvPfxe9MsTy++GkI0PUXJaP2MnKrwzMedg23mS
	pniWcsd7+8+Ox0/sgvARTLo70rR/5gVoy3epBzj5Q4kEboPai8vuJC0kbBCQfUJK
	rQ7+fWYJmu3Xi3MPf0DRx2Du9gBCbRSe7H4PhkyABjiZny23Xpzxlyl2XFDlw2AP
	auk/tA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28ntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:25:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e05d31e54so3748612b3a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795587956; x=1796192756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=jZySGB+TmT/P0rELUQthBGfT0SDgiZlB3vTkpwgZui/DHvnXNuRZ/5KVAA6v1p8aBE
         jYizTgRM2sbrD1RszvY2U2mnq0S8hOfe2zM4koMzvXsyjjLP7U5EbRll6Xv6V0JjP1lh
         ktkrcrijoBuoIooIO41zYfUNy5iqc9uhYLGwBZhJKUqDpu0wNDd+beuhDF5Gj4ffciXL
         QgXCVm5ppZrJfgggpAHY3MXVoUyzWZE/G4ogCxeFxeYp6cANDSOrH5x27DD5ehfjR6Iu
         UKj6hxtBVx3iCFVGdW3HxacHngkhnoLK8ZXs4ndbvO2AWEguWYwmTbAPWbfA9l/m0BiC
         p/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587956; x=1796192756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmawXRSR283Ucc1PSnIiqX8eAjPfNtrwEJ7cQLdMyUA=;
        b=B+oD0BC8JLLNigSIQAyAQU8cixYvfGxcQVUNznEXnvO1UZ0en5OB+6wYOs4a3qRub/
         usgZRVUXa/SkEYSCmYLveFtVQhwgwnUO/9C6bmL1sYRyT35+tm/Kd6iwwOSGVLiq8pBT
         mYAXSVMNzm+I16kJuw28yjYyavz7XWK4Kp9qMbPbbf1w8Q1dgesAlJYePta2a5uL8FRk
         5jMvVOJ1mJoxMaB7Fiwu96kVqKwyjhks3ZjYQe8BS9ycksGX6CxZPoRxoiWtucNJ6S9m
         +q600J73bnP4bH8ieOjbYlO10S89NrsTLZ6R+2e78a3tyhBn0Cr9B64L2+76u2UaNhLl
         OYVw==
X-Forwarded-Encrypted: i=1; AL+hErFls9cjEnD4NK9AYYfACWPVXST3Qcg8Mvkg3yiCsZxP0Tqf4BlIBvbrRytG7o9Ztn4FtKERD9qAwiG/gA==@vger.kernel.org
X-Gm-Message-State: APuU4Z83rl5X8Q0wcRb2ZY5Ey4H7pR48nraVu/rH8t8t+MrbnogSwR0l
	rGOpo+x2hUfhtG+FYuS3TvErqSiXm0qxF6ZpKH1t2MdKpNfu/orHUxJFquMrxhJ+kguwPkPPLOI
	SfJkEmpbAELDBObN2eBePSDk3G11aMEVAbYJzZmN01UogS4UTAwhyOkqY+czOk0kATA==
X-Gm-Gg: AZFdTZd1sEXtRTKBtqWrsPcGDdtuChREbiPRDAvzkIODNgzovxEgzYHGFjo7781OO+y
	bH6qkd8RKOVeZUnVQ31uRGEqaxB0Fp4xPqK3NCrSz8wjXk+8uHbbRbGVs4mWUaebKhmJBNmC8NP
	kIf3kRR7NuKPY3zY1XPXwuP4MgjGAyEQ+u86da0vB7T37EP0HSgIkVr/01XNX0GBLJqNhgKaF9i
	SBv0tz3R2d4TBNjxX+grNLNPgToQVElHqghdiYMtNahwaU5UBfikwLz2i0XZHsAhPkE3nUXlQS9
	obr/dgSPfgK87WNBaQxOQ6mPv1UxndguNpuCXwt86qwPCnEps4H1prnHbcHQc/RZwwi8bHZWESQ
	8tpomwekIydcgg5CW7Sm2Og6O2P/CcVjz8mQbrG7aNG8JsDq6lUf61JINmlWwBK+0+rMR/9BTh6
	DndWGq
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601698b3a.36.1795587956317;
        Tue, 24 Nov 2026 22:25:56 -0800 (PST)
X-Received: by 2002:a05:6a00:94f4:b0:89f:c441:580a with SMTP id d2e1a72fcca58-8c87ca522a0mr14601682b3a.36.1795587955918;
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm8385066b3a.2.2026.11.24.22.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:25:55 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:55:41 +0530
Subject: [PATCH v5 1/3] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261125-hawi-maili-camss-v5-1-1483b7f68dce@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795587942; l=1476;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BTDhy4Hj9RCXelLYOtQYezLS7KR1Rsj0YchhEiP5678=;
 b=JJ7++Y37/ybPg6xYkSO8GXSgnBGrAyv+rXXF2osM/rznJEoenCuk1M+2TlUaPQdogEIt3/ino
 hdkz2L+nvH6CnKCXfVEbGONlEbDBOzbv3PQo0TSb82cLrdMDuKHn3vP
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: RXEOA4tUOm5ScOEKo1zGBZfEBj0K_Ohw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX/6o80V/bPCNR
 Ush8pjX01tPhBwESDCzslLKEL27joySqdwugZ6XACgNsFf3H6uJnPMe+PTx1M4qWURoBw8WPTZ+
 eDq9BLrvgtZWuM8xK8T6f6PUxEFaAlg=
X-Proofpoint-GUID: RXEOA4tUOm5ScOEKo1zGBZfEBj0K_Ohw
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b067f75 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyNSBTYWx0ZWRfX9U1mTav/TJC2
 mE38VZw3V4bC1s49hj/cEOm1AX37P11yUOfzuMJVIQdGpkHqHtFCySaG6xcE8EL1KoT+618v049
 G8U8GHa6UPaxgfbbehhkw+g5N4jIuxLUVrzpdsP5k85OM/UoHnCnkWluqxpDlVd1NDrD6WW3Lvt
 1if4oZBMmXbkDJVFCucMGaPTvE/FYvaO/uaCqLRJR0kzqiKO1OvNSJ41+ff0MEmkq2snrADW5Gi
 19Yz0Na9X3SlL4J19p+oZpw5WtMnFMfd/5hILQgkxBLtIvr1AFQSQqRHQAdigDmQkkzvDqb0viz
 wYE47eDkiOadJAlqfrZzyrrNZCtu11G1nRqWiieEEVpsHFfpavU/3dx6ESrkMa2+olBGdIDZboW
 7NOFvJeKi/j9Z5lYPpAvNieNeJAgcpxiAVYklzv+Hy3DelKNqdppofLizFOl7pHiTXGy6SE6G3P
 7yiqe+ZuV5FvOyCAw0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250025

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

