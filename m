Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609470;
	b=kGSA1fPoGMUGJb+8bUZECRI+i9F5DI5yv2rV35c0tGKaYlT8CCLILUObMmW9uWRQLyNK
	 MMW5CggnEl/Mwe/1Dviwtv598/htrW/OKEhNBafJ3rjwZGB/hc/siEIhCR3igvN4/0mRK
	 SfsPH8UaB1HzSeGGPsiSPXvYwnWbHnvDFjNyQWJasKlZ4fu4rovfOaeeJnpJnr1NVV6yi
	 blZxyoB2sAIAqH2qFDHRL5DvZbqPRZMPhlgT8PMhZUHkhmibNdz9DCvFybEQ/nc/Q1Nwo
	 GlvmNGSEP9bNtq4hDPUGLU92V3Imde1fm0H3P65UwNwOhAC/p4tZMwIaA/rpTQa8fkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
	b=RxGdff82pa3S30zcxGawofrtUXtBWtAbJ/STcYRoJCQy31NZ/ukSMSAkpFS9yxoCI/ip
	 dN7PUznLxRM94ZRknvzYVK9218xxM2Itr7x7I6viJ9zxp97QOqwFKHZfNl0nCqz7CG/g5
	 YEQddxo9IpJSoRUo5ESQdhZTgVC40V9VIWPHnmLldpgHvauMM3ByiuMDAjT8grbMFoipP
	 EBr613h1uHRXKmX3XzFdA8hR0Y5Kshxnsm/oJl7J8D1YpIHWC1Nd86Jmym5CfTC+CopJj
	 vMWqxrUz6vaua7xXCJMNlyVs9UV7YRY+vdjlMvFOeAVEGYC+91fKH7ZBR3q86eWtqBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE47606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 08:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE47606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vAMV3768705
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 08:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=; b=D1eG3YBepu9GuT4B
	g/Lr126+Oh+BM/btJeMgekD28b1ipXi5ghJauTZ+/k3buKWNXdF29UbiIQ2dDSxx
	xgfEXItVUUcVdJ2RL0jTnLznQgPW9bi9Y0j/y8H0eXM0uRPpsDcqtjTJbmQNCswo
	HkQu97o4NPz3+IPkl7tB6VhZG7xcGbQ0UweNIBDbKGlXxIVaMUsyMQluB3p2DXg+
	6oHAz1KjFXGyQx2G71QpAchSfRcQrlBXumgm3YamOSCE+N1vXH98lei9tylKMBze
	T0broC7HzPpat9ODS3vsNgONgbZnDaaVTXiqtqV8Cn9eTaj7jyoZZBPa0n1Tuslw
	dVKw9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rx4gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 08:51:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2682054b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609469; x=1794214269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=OTiaX0AzpxUg6T6v/Q5I4zEDbAdW4ZMYJp19jzvq6qWZyOcAtcRzLrSeoh8pZ/QveI
         fCr9INo7OfcTJKvOYe6u5V8bzA+0gkzUV6Bv+3hWuwkQChOmJWpt5Y2q3vZX7RQJYd1W
         6Ca0QvJZ2XBrC4TDuTZZr5zIoYxtQeMma2rqjjPuROb7SsPOEib6/jXp6E7NcfVn5o0v
         T9wq0RIJyYNRDwSgDLjtjtv5b5FLXCmY3ki4qwt0GpF0maA5i16OHNI/zv/71pY4cSs9
         LVpKUG90nKfYXCUqaKqKUY84fvLJBChNpT4Eyz8zvi2xFl5z5hv7cVEnhUk7xw+TA3EG
         KCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609469; x=1794214269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=qh1+jXasbj4WoepsYRla6VDmyR8aHVC1X+bC0OuKSHZX+QuZQwZTq9Kr24CqntmBrW
         sx6wPuRWu3VZOccAkcEJDtq304VlURMGOpptHzShPg6+y8BD0ev506+W0djBMrlhW7OC
         4xRIqDLIu/hXxwzF1NgDAiqGx5pP8tfdhWGjUfcF9Vb4iGGjRs8BzgrtpObQrj8eT8uO
         hUq0Xh1h6gTxDjzLTEG0OgTko5XYUzwewE1fhT6xwAmB1FYSZn3ZTm3Lb7N7qaIpKMu6
         w6dNcnLgYIQrCbyLjnYZoODruCaEztrKqi39rxBs5AbBDMrCw/wJp7mZXjBxju1X0Sx/
         eVkg==
X-Forwarded-Encrypted: i=1; AKwUvByDoRgzgDR/uxvIBXPg2uCi28/WyRvHE3QlDaoSTmKL1opkwkItVyw7qPP8e6d04TjhYIqdzi5E5iwWkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BDiFAaT1ocEcKSlhQFA3TgCge3QjwY0BhwmMXru9stx+h3hbs
	kEZWOv+nodvm6PwwUsWNl9MLaP3IehphE92WshxKr1fGgraqjm6UCw/269YiPPHV2hXppauYvAE
	BitfQCEefTGVDalFbU35AdLBGvtDqvpIsQkwgtpfgn8n7Kq+4n7IxeONl8BLNooRa4Q==
X-Gm-Gg: AYBFou0HYaMO+5RgQU1neW9HVp54bA4AzonPGh2f9weKUJop2/xuKUZihySFXzPNkFe
	TnYasY4fXLI5m45HWAsIEKvAvFhjq0AEoNUyoblsRFgEPQAK30K9uKQEknrioelTa1yIC8IXorb
	SfAiyEZRvJTdDkopgunvLjz164dOaVsjhOU1+Q+Q0JsXpEt9pYdCbCrFrTyt3KfVFXsvpUAjCBH
	ZUzNEFvwpq1aEsVxLBcPrpheKVJ2+K9tm/Wd8PZjf0chvq2n95c4JuBNgyLj2QzFXvi0Sgn2nim
	UO3jpKuwnYSAcevbJxSl1/jttmu94stADm2739RTlIb2aHRb5gza2Aym+8VKd2C95sEQSHqsYXU
	2aC372D4kLFuXUHkJuFGZ9f05vIhyImuydB3jQkml2UP7kieViH6t3rja8jfVusshb5zViKPIxx
	Bk5yk=
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632561b3a.3.1793609468915;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632541b3a.3.1793609468428;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:20:57 +0530
Subject: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
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
Message-Id: <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
In-Reply-To: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1468;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PVBskeWsn2aBW+z13AhEQSc8ykpvKqmkxJeX0F/rLbM=;
 b=bvyZ9DEICXEEEClHl6as+NYWVk3DjPBGziT1v5yO+W+9NMPFMFJzgMOCperfl56zVrTBKMFdA
 E2GFnYiBQInBNWBoCpPad0r50Ga4BAV/X2Pq9fZEcj5B2WcGMNqx+1j
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: e_nA-Mknq6YFmZT2h6Iah9u19RRZ10PO
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae84efd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3Q3I_TTnfSvQyUT7B4wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX/YyYTrUHmEux
 n7TPl/VdDOAp5rrUWdR3iXqhD5iYWYP8xEL+bGLZDDrQyAtnvjYuPAl4CWp3Zug2UT45gyONlg7
 ygjIkWWi+4pnFSgS96A2+oFh214WkDE=
X-Proofpoint-GUID: e_nA-Mknq6YFmZT2h6Iah9u19RRZ10PO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX8ppYDFmiFklX
 G71jxIKPsv+5wFj/MZp2aWdeIREwZb1IoVucDdFVjOw3kBompg01oiWXzx6zY0iGE6R2LAvbgBC
 +EBShFZgR8C69bC4qQ+Hpr08gmK1j8jlUHHbDgGzy3ciEtLDK7Qzj3U9gS1ZdPxRvCGFTZ/0Hra
 Ot4Rivq63ZP5NliEk6ieYYzpN0FO7vPetwRjY19Q4TEIYV+9rBRaiRYoidM9HPd1G7MOKQNtjXd
 HSiHuFHolcEuoJ1ShtGBbd2oEya39on7JRZDACQ40vtl1nEBvhMRDkyfhH63BBvMUsDMT9kCNbZ
 /T5xiWUUpMy+ADvLOx8rlD1Lny327Cr0ycXGZ1F4wn2Fa+i5U9pFjVQOs+EavHDtYtnGR1A7p86
 56sBWOI25ku63VgCvyr2I3APZrV+I0KdfVYEdDFXqsxQSOieD8Hwur317C9DCatpa+LQtA3Q1Mt
 t/JGeT2R1H+GAj60Ekg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
where entry 3 carried CSIPHY id 4.

Describe the hardware connection directly by allowing ports 0, 1 and 4,
and using port@4 for CSIPHY4.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..e23f43dfa4b51c1e44e57f31dc22b4312476365c 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[014]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@4 {
+                    reg = <4>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

