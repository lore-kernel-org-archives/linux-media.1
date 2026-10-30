Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364209;
	b=TI1XJsTymgJKn3JMS60hUkYee1fRcAF1hWuubkuQqv3rrOs5EmrXzOqne/CGjYRb+96r
	 6xF69o3Y3XRbQ4yMsfw3GF4EXYsnbfYEZZHKYqFEMXJKQ6qBXhU2O/dJ6AXxSnJQCWpXr
	 w14IjkZHdhC2oR4NZNg+bwUrx5DBdkCtj2GSuauDZinTHxgtD5VtnjhavrAbZhtSdPIQd
	 HNgEokeqB/PBVwe9CTnlUPK8/8fIuTD6Kwp6dxR4lDBOohgoWCFdQvNjLDYZ1Yj6dvs6e
	 b3tJj60qktABgVMbn0qHeAsRTRo5egbmIZPqS9s+Cui73MlwVWY25gCSzwUUgkKtCRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
	b=K5oXDZRaEA6/tMEEtju6hHxOXQN5HbWikqHPdY5LXBHi7XY2Xt0zitYgPr1Zi+EKja38
	 4C9qmjLPwOsUkEE4XMJocSCP1bs2RlrlzBzMM2D9+x1ObJv8v5R+ctwG0QkKeRPkjGfJx
	 2ebPzDH5arQuLEhmaEMVdyUDdLPl94MDsNAX1fM75Kh2VoN1jCCV+0rYpvZECrwTVGRdy
	 335DSGAgMelH4D1uEgUF5+hsKukX5ylUIVqmLhQktMJRqukJj2EARlZhQ7ui/bAEauAuO
	 h0/BCIGWlpUDg+QWSgKJNaxJILqjEXSEjLNNZeT0uOifE7hInF4IcYivz/QTdlh4KuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F500606A32F
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F500606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGA4T2169877
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=; b=W6gj7HQGhDXp+iG7
	4V/LGVwlaJPU8X0isqrWeqcDf2mGwKFBxnhoJ/HcvsjrANqd8rQDEY+d8I+nDAE8
	P1P6nUPSsfO3DJe7APIFi92tkM/W7oMI0ShSPrSJQIzcm8raY6k6x7bQ3cvkoJ1u
	A6z+3/OBfxLUy6e+McQYDJIZB3U8EtBSjPZ+8oDhRHQoSQQ2vJIRbasGxToEiYtJ
	RtySHqm8kd7s+DkTwIwhdGv6tIVbkPmuXEj8lvPykq+xCEsXNNtekCg0n3S0Ku+9
	PgIwpJqKxLHYaqP/BqKK0IVMcr8jBgtUxKdrmRFl9i1dHwmf+2GYo+8jnHkLhubu
	8K7E8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb229-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:43:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93f67358eso8705405ad.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364208; x=1793969008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=cnRfjBSvvjPJz/9kBPn2anfFh/+Q2iyZ5Dj8C3Viye1Gwp2pC0IuLvKWGBAovG6pPN
         GfugOArVMvbOT/HmluJ8b8qUhjFyWkaRW0en2VmBFoEP685gq2oks1BrackWlUxwSlxi
         v1JcxJTJbi51aHhWWlcFpYIJnS0v7SBdq/fC/VSAQASEUs+D6ppMnrBSEZpkxke9TFEW
         hH+hbCGw1oEsalOH/FYykUMh0stQ/R9Z8v9kyacDtQH4WNtftuDuKOGua8XlvssMSLQU
         r48+rSVN2jXBJHTp6immlpFBBPP8Jb0Fv88i++rSPTCXTKox70RnehBUUy3qC22W87eP
         Fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364208; x=1793969008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=HlO/9DvEErpv7nWc7Mr1nu8GXmbGfrdR4KBRxeWCt1JSdGHsrGX+H31e2e1ze8hsuM
         hBj+XZgT9n9qqEf+pz1akUsUir8/0CQrDZeVHo05jDJb/d+CAIpB4uxri9/SYpVW9wte
         q01EiDo9uqpn5uBzsZ+E8BaZViOHhtaMqPoElZhMArIvnF+h4nIHtoToSl8R6HCi6bJf
         ok52+K3agGl8dswJYEbyOH+mbhoxTU7dzC0B49+y/q20vO70txMOgduZgEBKYKd0kQEE
         iTxZDJNIVNIdEvNMoESTQL/i5WxM9ebut9lzV/LSqe1rom0O9UFd8Lr29z7ffKSEYh6/
         Orzg==
X-Forwarded-Encrypted: i=1; AKwUvBwIIsDf/UprM/lQ25D35r62tv4qWxtYjmMiL0d9PzVFhfRvXOXlDwhMj4vzj2dJiWVqd+B9K9NoDoVuvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQoP7q2QLHJdeoxEdJADhKVWyOjz1dAqaTlKk4cSGBT3vQ67A5
	v0vnudiaZXER1E/+eQbZCvyYINEmFXKpiDYLVjc8QxE2/0V1JTBQII+4OiXW94BuYJCVBVnw7GJ
	zEw2nacvPFDjWePjxHScf7p3Pu3zzABIBkR6FbvyQ4sOuHk7CDsYL1Si1DaQWYiFiYVkFfhZ9Zg
	==
X-Gm-Gg: AYBFou3eT9oDfQ/5cl5isDqiluX5WFRxlOpAZXN2dYDgtJ/k8wZI2bs5YyFNM6mRhz6
	HACqkoE9XF9dICQWmEymrEA1ToLQPi/lZZAJENQZdqp8IXUWPsJsuKmBP4vDnoNu47xExugxVXK
	ADnKYbJySZqGG+6aVQaPS6EE9sdIhIteH7mVTjsNdNb79q3BtLPUluttr3yHxHTSOaf0Ist/zaR
	TJomJpUyhYShJbpWolQw7mJQ+2SFmMaQfWYjerVPFV84qmr6S6NQllDd4/NAbidUstGecuovUDU
	+Lz+2a7HCrIrfLggDKRwTmBxpuVR4zjJ7GhDzgilFDnCMVIdksBAS/ZmflwUR6Zqafsh8dWtdDx
	IhmKuVyJI2Ime1zgiHFrixwRnjiKOWoUU+WZtFKlqju2tJ9pyd2sLr/tZuKuDRObEiYKtJFrtop
	a3KCc=
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829755ad.21.1793364208191;
        Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829325ad.21.1793364207726;
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:01 +0530
Subject: [PATCH v3 1/5] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
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
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1341;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dX6MizZIA1isQ45cxUBsZgjrz8paPsRmmoOT/a2mOUA=;
 b=Goh1WlR0jf3fQOa50V3RiuKdBhpRNJIYT9f0lf6o9kErrJURx/R22pq/QSA0hNNZQXuLu61u+
 0vJJ+wrFvk4B5FV65gAwLZK0YrGFNAfIBqv5N7RItutaBxCQK+0/fx/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXzxJtEJKxeFcr
 bo3Nem0mEW6KPxNrJXp6lxNpEWq7e7AgLJ3Hhf5LnXGrs7+iXpCTVIcZzy8EBj5sQlz0FtcHXTa
 UjmaF9AMskvHbtGResYrxWe32NW4LQPPpro9VtxHJE1kDL7IYLetRzxtl/ZK1JL0biaS6Nlp6lw
 W4QO5hnLQiK9NFy1vX/9vBEWZGArcvfGMeP6CD+odN6t5SPxYhwLGGtJdLLpbah4USD+4tnxLts
 5k1dOEBPN5GHHuR/WLF2MfGbbx3W6pKNaFWzb6AFtu9oYRo6dxWdyayMF+nRp6ilpyo/+na7VN2
 4Uz3787qvs4hc+xpOp/hSHM4hmYrjwLAa0yDD9rxGH3u2VRBv9mz7wskU9u+trNnCnnMd3ZXUf5
 BXU1TEiM7PvZiEi2qXYiG4O0CJ5bkqIqLMoakbJOLpzGfYkUkncnoSncJH4mE3jGE0KOJNo/gZw
 mhqfH9yfGrxu0yjeXqg==
X-Proofpoint-GUID: AmvQYBIljqKAOT5YuRvzVDl9x6rnWLy1
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae490f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EFwTI_IBlkk_uzUYZfIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AmvQYBIljqKAOT5YuRvzVDl9x6rnWLy1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX7Vv9bbxG1W37
 KjS2Ujl4hMBrcB4v1991fhBkqcyGMvAco9JamzTHPCXtb/+ffaNpqEa18aPXV+QkVIz8sHj4Z3q
 0YJZC9p2Xh6k1XyMMoF6g3EiWD6eLKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
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

