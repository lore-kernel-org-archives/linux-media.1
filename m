Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779864;
	b=d5t+4UhYLFMH9jbHwNslURh7lXU9uJXr17Q1VpcQZTOe1IaUFRdS6Pmx2tZlHWOfI7Jd
	 +l4T+VCHlzoRATViPFJDjglw3XuMLbPkNHs1Y1W89hcV+zJ4UwwphP6U/kNRRJXIBQ6XW
	 k7uIowGzF8yKiEarU1H0YT1kcG7lKoHUDQleLj0e5yYTn3znRViszesCzt1QtmlKcfA83
	 mnKoZsBNM5jTBN8o73pf3AqsvWp1kNx7tgL8NC1pJtPncdC8LTPDehF7d2d4eqDf5gbCD
	 BM17RfWZbxhP/BBdxhT8W9do6T2EyEohoRYbR39QYXesOHV2kl5ouPMaZ6X3yR0RJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
	b=Lwoji+5NRCZ/JBjbGGFYYO0QG0NxHSNu3l2xD78ZVGqJPxgetodCVIsjEDAOEwdAZLW9
	 4YphzW2En3Cvib4CwuuZUZoa40xSFAGOhkQ+BubqIMz635NuQNo7OQ6EltabnEN+dOR8U
	 9KpWU9c0pouoGe53atJ5ABKW8fQ8AT5l14jJO1zvLztY+Tlv3740c0w0S4vaGZJGlkPhs
	 CL3yZWb+dwBemCsNsA356Qrv7KmugDFzdpdjMMXrW6EH4tQTRYHsVRWcT0q3qRghJJNhO
	 AQ0cK/+ed4dqI/6l4p1VgJufKWAI6kDC9P8wr3Jj/3IKi4DrMgSW6YUdmVD6Od0eN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E69606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FI6tTpRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONbZeZ0H
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2ol1047040
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=; b=FI6tTpRrl2APtsrf
	FWwkmMW5FBuOJ2srE0EuzaMzp1Hi+ZjfR5yNKUdUUmvriG/AC3BEuLbd4Irc6JvA
	ntJXUMxympMhGdUmCkxuSPtLb7duDa0+1ZhZqBoye1SIbrh4jqUwkboXutDoj0nR
	v7Lsgsu2Ep0C5zfxQvcaW80Ev66Hqyn9eo0JRDGMGvggKQzBZVR5SJzM9vd3nIyQ
	Phh48k5jSd5dNQWhmV5q5eCL7qg1Srv6NLo4aZXnM+Px5OoFtnZS9ErfxxYbBbLa
	GaYkjwhidqaLjBDhA7zsajZ7YEXDzwZzM0zTdaxoYEDIFGp/sMFGJlleBXjmbJgf
	UqSt/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqksmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:44:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so9215538a91.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779863; x=1796384663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=ONbZeZ0Hd57Wg2h3dlKF1qYNUpjpfvEigTgIhKNmCxt88+K67fNUApAyzoto4n7wqU
         cgxcPMu8qf7uSW3H9AIULjJQ3spM6y06MC7u9UZa2wQFXHzzUucDkmMtIYuFhv0zHFJO
         Qe1v8pSHXk8Dnp+xtN/43AGgLTz5uoCKcCZB/zNeVw6M7MwZJr43mSqfVRFGcC9DLARm
         djatmEF2p806rYvu6UvoqZSNAkrR2C58/WQXcWZIg8Ol5yA4by86waF0y5jrT9ecZ34S
         GPv0+WRdIa04m82WblVbjEuODCIrwXBLf3c+vfPzdWTZva9rLcplm8hNmlJCNWVjQXxT
         XRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779863; x=1796384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJPyYpIYmrR4ZHeGVfNDne7NhRPR7qG67vM1M/zaXQw=;
        b=oXKW7vs2PnbfsFwt3QBoF3e7jB5EQeEHoT5YR3HE9dg4OnCoFRWw8l46g1cZGxHLtr
         nmcLlv5aajWslfnq/S9/Au/7sdjdOSulYvxICJrGmwgcMMrtIJIePyjk+kGEkhWXFUvP
         NnWqMgriEEj46fzTrY8yTOmXIPRARtz7HA4DMp8VnzK3BgCyp1l8gYLgD1SVsWPvMxev
         a2ALHC/TjTcvisSa3gUfpSOCpRRZT1p1k+Hj5fUJSxYBq6KjizjZ+OKcOrodU7rn+nFA
         L+iEbpbOChY0Q+sOuC6X586WJYm0si2l5v4Rk8UyyiQk/rDImHxJz14RKnc1ZdCY84GH
         mp8A==
X-Forwarded-Encrypted: i=1; AL+hErFo2x9aR55jyywauXsfbto8Dq07kl+bNIkNxkUsySaDWKTH2djDLIVsh9pohTpgZdabW+zJtl+xdKKbCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SGSSmKi5wRBg+xCSC3U70+vH28DclGHcLNU+K3AgREYDPJ57c
	vGoV7rOy7/QIha6pyRrh3sEX8k/rMj6sm5usynxFWu6jQZGNTaLEnEzWMx2Vue1YVjheUpocQ9q
	/ts54Grln6krN4FAX/jOol9WaOiUka52i3QOnaVvvco+veWjzE90IOvvHxGnpSHeZHw==
X-Gm-Gg: AZFdTZc9iY91O3jFDI0YZxyHytowF37EyJvWqr/tU29s44jIYpEPRoJP1BI9cZN7ZZ1
	WOO0PpTJ8KJc7G86egwgXEzVV9wj/0YCBPeczvYbl8cq6B2Wa5h8dosz9qj3FIzN1iaIO1d3l1U
	vXNE9LwdyuM5r6jjN8PUR6IdWPSMWKXnejo5P3fTcqsUTz5NG9I404dqZ0sXjfNsuAgreM2VhpA
	ndbSKUuUYlfwcr9LGV1jlhTjiDUcczAP5rxRCyUlYY89baXQvMTcsTV9t9XEtLjUoCWHpynbbU5
	hApHg5hbZmypIyrgM6Rs2AyFPJ4Wp/mdpZjB6Ylx8E8YPTfxBhZ9EDi6xA+Oa3Yb8aqT9bFQ+fH
	mDS2X8+G90qpql4BSHNwmCQbIF7/7iYVbhTjHHFmjQFPGZYpyQnHO3iGaLUrbpKtLFJaz2af4q6
	qvPJNn
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189377a91.63.1795779863111;
        Fri, 27 Nov 2026 03:44:23 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr23189329a91.63.1795779862628;
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm40480933a91.16.2026.11.27.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:22 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:14:02 +0530
Subject: [PATCH v6 2/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
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
Message-Id: <20261127-hawi-maili-camss-v6-2-0f4844eb63b3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795779843; l=1527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VrCho42XU53GTqUrn16AUx0FovtMl7rE/ickbc+QQAU=;
 b=W5uq9E750RzUKhnaGzYYrCYRSi1zcSdV41r8VtcB9zOLrSDHmR229EBNX0VaZHK74x3ZUv/YG
 H/qLd+NcDIiByN4CvMriKujttm9KK3BN5LrjdhPHnwZU7c+Bx915XLv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: U3xjJU01SxH-m15YJTe7XssJYEtGciWc
X-Proofpoint-ORIG-GUID: U3xjJU01SxH-m15YJTe7XssJYEtGciWc
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b096d17 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX6l+Y4ZCH83Ht
 zFJpjSAueCB+9z2yjaTYHSjzhUjcVVs2ObnUnl2hT7zfkXrZGlLMtxKAOuGgSputFWD8cFDGc7H
 ud15TIbxrFRFbhNOu9x22CKQS0BjmoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX5TRUcQtCwt/m
 C5Z2MdgvyEt8QQ2J6LaJA7bTyQmd/Y4KTNmQH95wiUQihvVoVv1uLRIH5IBPpXMGJLfsAv0JEmP
 7uG/AHEorZtO7bzosm+8hR/Po2eoFfYVapSJFd9nIRnRQlHIy/x7VA91LPuDyTcjK//aAes4i/8
 0tL9f6voVKCAmQjliR+1zWtGUzlE0uFzIsXF0Tz81jzPOIX14qXgf6+Mkge4uly95+SNFEdzH9l
 9q02ua5QW/e8SIWlgDmTUmrhK05UlU4GoyyMmFPLC23Z9kVDszyj2LY7rVq7Na9XJFNbJDqdNOI
 qhRDbD7X7z9NfSB7k329ADC3j2jEF3C9plkU0bHj2PsvuURC4bILewaTETPA0VOJz/sI55scfwt
 XTIUMMd/6qzmQBf5YKu1nvvs1Y43rJK0YNzCo1fS1QpKVREJyqrednAGPFZnC8n9UwAWDrGXELu
 ujdHYaDGzDPkk0XAwYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

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

