Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736359;
	b=G8Ww7enXVvhcw2D5I+pTdxi9OTQrasZtFgC0JsNLBSYgXbCEbtElxCzE2uid+70B6LGo
	 zW37w8oJ50s10TqgsnsUcYdkxS5NPT30SIOoLdHnREX+Uva73N9ZughX65cV/YlPlFzvR
	 yrTjHnSKVHqkmP0Y/jhWR7Y1qOt23opMfNw2WLi0nNBhoR4fN2SmWIGgwYmxjsWY2puXC
	 61CNDym/KoLA5LpeUj6gDsNJ0oN9jPRFNGsKf2wp1A1ITnUXkYhPS8GfF0TKxfMOarHRk
	 nBeeVFei4MQV5OzLk6kl1Tz8ess54LjkkkDzqhudTC6oQUlIfYIadUwjaIP3YBeAooA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=Pc1YSM0P6jfcpPPEchPisMwYP/orjBS6vDrj59zkRnoCiqkDKvygjRSYBY6KCRWqlJX3
	 YTeP7PoEiFs9b8UyRZq85NylKO9m/zbV9D5btZ/fH0/fhxVVix8AWkcXY1/9WXrl6byHI
	 b7HBqR/Kgj98uGB6hjlybZhdKa9u/GUXIGchzdRSHwZwe/lGSTsDuU6w0T4LcPxAMYYAs
	 sathwWE5JqAGntihfKPag/WvV28Uj8QxFB3YAB+B9YRXUf9wB2SNPlydY0vFfCNf1aeQj
	 wntheOSKhbrDNz7VKDfUTwKI9UMZJ6+lZQnMI8J9XRTiSuF1aoddC0/q7L/twOvQawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D0606A335
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15D0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZIM63666648
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=d5Iv1CnwTgATZ5kn
	F2knie7kyfihVHGZ45g6zCc5TeK6vVdIDTuBIlPZaKgw7W/k5PCd0iB9gMIbXP+s
	H5yYfg6mwWxb31EFFRDeoIjIfv7JJwuL0QC+WTvlsstRD/fAsjVklLA87IPucSl4
	NiWYUlOiLnalFyDo930YH9B6uCFUSzvXuYBA7iTu3784Be31kmkfRtdv8bAtS3P7
	Is9DawMStKYd0+jZ3HopCEXbtkf+Y0j3WnI7+aBHH5G7ssyFsMJo3T/IN+06KBPc
	J61tnRAxyDhNhkJBgPvqprvtodC5t1qBH4EdxORCqAyumOWGWtdGxa6DWjVkOm5Q
	+RpWZQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubh272-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:05:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc175cb172so3935975137.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736357; x=1794341157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=OaepFRxHOzH8r+4ygD/AlHzH47tHJ1o746zasJWN6N2zTh91YFgfazPWcfv9qgTzTZ
         POeO9ury4U7PQRD8ZJyr8XCOvvl7Jd1VWHRgqKF+oa2mLbnqyvx+K5Kre/wvvKAODq+E
         pcYIWgyF1T8nqacnD+wS+hEa4SfegBJV9Rb0VhbJFX45NpbHxtCXDovURo3Je7uVxQOu
         +c1clA6cefc/N4NSlj0YWzdJa6pK5oNN8HwrL6vM9xL4l26IVATZlOZ3XTHDK8FvUozl
         8VhYVveewaYQ5+vgepzl6gZv5liGe/z3LmZ/kLQCH6nf2OuQ25MJ+LcsG7hYBglrbQtH
         en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736357; x=1794341157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=BArX41ZTmPChiVauDAQgTsdc06wMIRHPV38SZMR5Qsdk0eEVYodFni11/t658U5RBm
         CF8t2x60JdHIG/W6sGh9MgA+74isgzeAiThlMuGbNA80JqvG72gc0Nvvzjqoojzz78vB
         DYieJmK1vQgA6Fw3InCB8+RekspC3wutO7UmTUMcTUWR5n412YLVizTg92D924TFXrGL
         TJPwLSP9NVMPNS17Jau/7EfehPSFgdMeTFty0aheCrq3DFLtlAwqSd/GYEiJ4wvix9JZ
         aVjKV/dcRvSvBQYoUHl1cN4a7TKF2NJCVsyrR5qGxIuV3OSk77anPYnBxVGi3awNzxFv
         Agow==
X-Gm-Message-State: APuU4Z/G8dCAyMweoNlYmU4VFJEOypfuMUMn4K1R913JblPrO06w2TcR
	+0u1ZQv9+MsOaDE4A9qgWXbDNSKWs0GEECHG1ZjC2eIZQN41hbKp5W6FjcOVk9Mm0Ia6ZameLJM
	vyI7XJFMa287p9gUFJlVuRUEdRL/LIr6spiTk/hT7ra4vQYUvIjFWwChh2DjAPWn0uVxm+aG5a2
	D1
X-Gm-Gg: AYBFou1SCjOxGVxPNjMXV7hCmSRoENGcgUqBnWVs2NZCPGjGdZF6gArLM6Py0WXgdB4
	gkgMwilry8uLglnU9vFx32oDiYXnALCi8FD8Nhdfud38kG/rdauFRfgszfSk2ZKZLDcG5S7Bm9b
	J2Pfo+PiFm4/bBmB29gHvOAcrtXHQDjTvaQuSwDq8btY5604lA1y0q2r3RlYqKVPSCFNrzD5z3h
	pAsPkqVWX6U95T0eM/JJ17aA0JBnIA6PizpKZeGIazK906HFltEQnSyGkTd3nJ7tBNi/ogH5QKX
	6fnOCIwz92NSDQJ5Pf10sxvhhpdmJgAwdncbDVe8B6x0eWZApQMwdT2MRX1b4p+te7TwyEQRsmp
	vO8WkNBrY4NOFeHSfXCAbJym3LWuks3G7EHjuw0/Na9XgBxG8XcD7Fo1vSG90e91o7OEBWLB3Xa
	3iPwL6gzmYXXGJ5MWMQL334j+HmX72HQWZS4hw1y/esF1CTQATcOeRvboKJGwr2DvfEsZ4zZGI+
	YYQsEpbc0eXnJWlTaq+AXzhMRCi
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266290137.1.1793736357075;
        Tue, 03 Nov 2026 12:05:57 -0800 (PST)
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266274137.1.1793736356506;
        Tue, 03 Nov 2026 12:05:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:47 +0100
Subject: [PATCH v13 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261103-camss-isp-ope-v13-3-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX9Il0wAj93jZr
 f6S/mqztLsJIbGafg869V2Vgz4Tnb3aU9bPASec60Ubhsg3LwJG3FcoC+I6jXd9k8p5TYOWo9dV
 3fw04MSVE1IBFptGHdMLLOm0Kn/pz5s=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea3ea5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 5jz4hYA330v7wkdqJMlWAMxLi-qkC75r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX9DenTpMT2ZS6
 tvxnQsgUa81l52P/lVCkkWaqq1mOnGW8qK9etvDObaIM9vqB8wV0D4EcsETxpeVuMnJp1cTFDrX
 NPP3MK8PW/GhwK8qIm/kPzmzuLoZPOO/rqBEuUr/f/4hAowCJSndVWhaAJ19hxFNLykoCIKAwzd
 NtCyH9EGauLgDoDdMFXwMfhglseKzh+ZJuj18MPbszRwhzFJLA0GwRQdMpy2qlbTdi18lGkEO1A
 e5aELGL5gznqS8H/uBfx1a3R9sPeYRWEoi6la3vcs4w05fHxPSbmVcHFYMbQO6Tdbe7evYfM4MR
 uMJRxY5Qi6YdfgbJWOW4kW9a3GjoTkvZ+Ze7p5wkx7OHm6+eGB0rQ7j0/yOr0WDh/EYYVQI+rzV
 vq755fF8eu9h7ARUCi5bZhpPAvZhETUOuFSL0I1BtWxm4V1lsK8vPWJLxXN8Q2LO9/IUVL6n7PW
 P861WosWgLpIh0dyWeg==
X-Proofpoint-ORIG-GUID: 5jz4hYA330v7wkdqJMlWAMxLi-qkC75r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

