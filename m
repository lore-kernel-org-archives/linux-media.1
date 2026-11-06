Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947862;
	b=IMFo29QcQxuZFIF98bzkz2IS0WMfOUoEzG756B1p3U7782RnEWnr+0Sn9m+fJWTBqz7o
	 hFqVkQm0QbY5boEElWcH+jx+EcLvNhFzoq7TOy2P9r4rpC2lZ73hoWaGeBJu2jN2oGB6C
	 A6a3jzLSYUP2b/FFAbn8cInMSzKzoCkaYG9hsPPhUxDbbdgsh2sU85dJKk6MsRY7XCfrq
	 1pvQNQhDzCiyCbF0d2DNp4W47IjFrgQ7LbkqhaRDfRV1nhg5+9AIlY9YpyL8RSLnyxXqY
	 MLMaYF4/DEQDwfwLkVkFKl8D8E8omxjjI+hxqvx0il4aI3zsVCOraiZPGOnIxfanHfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
	b=lI33+GVMnEVPOSPBjv6PYBiKGs90VP/ZnCs2ULgHFg9kW8dd6mMN9Qe8yoZOwvxEc/tk
	 KSkc1bwLo0zcU+rn7iCm0CvVsIP7todr8PSLeSmuvKTltFsnGWz92a6v0mJ/Ki/wnsrPl
	 5x3xyBObv4AddrGAcjZlkUQ7Mc2+kYMeus0Zf7yA2RMjYY43KnSL/g+032HfHfKKHHHOq
	 HAR04qrkkGalOTz0QY6Wi5b6Nhh+UD4/Nuwvjs76OhYTrIYGEL9FAs9gL8gnmo+VTDzA2
	 36ZuT5RlwJKj50oK0nVpB71n63JKhJFlsr1JI+r9S4ixBOF2SWK7pxsdVSb/RB3u2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OXHBAo/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D8A606A33E
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 06:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D8A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXHBAo/n
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6403F51727726
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 06:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=; b=eaD9UBMAJSVOeRHv
	67OKVKTURwH+iv7egpQZoCg5G3IHE7svYA9zTwuWAMBk2L8ieDGEQnyNDBRieRT8
	e/0L7AvJgHxui7qK/WTCwNpYQfYw9ZwBPBJlfnY2cLYjujLqQuYEi7zvubKFvEPY
	U66nqGI4vlO/vEwfZXqM1N3U8Ak8obddu3W1Ol7EjBHZyF/l7P74qh8BfeTpVJzY
	bGP90fmouxQCKsUedjwT3THlU+b1RiqUE2GLgh/9EFfBvRzet5e2W3BCSz+LMJUS
	r07rfw5NJTBIRRd8QG66cI89PIXu0evuHwVfS4tEwMOWRbR5wO9uhZa+28HihK2p
	SepOiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa9e3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 06:51:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso303236a91.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947859; x=1794552659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=OXHBAo/nMVK2RWzgd3FivT7QEhJoS5LlQP7BrPyVEs7sNY1gj9q0J4tdNdXTweANbC
         8DWzW/HGClaiELMQCuCWLdJrMmb0gr9+Vpe0TKJWejFRnlD0I0x/0JPsA/AzQREzVbj8
         l8l6tKtLjjtPbevRc6TKCon3pGSXE4IpSqEsl3gBLQfpwa45Clk3sB0lImkEH3woehyj
         i273VTee5Gnm3hfU+dub66cWbF/Te4XK7D2hs/hyDA7BKpW6K1b3fNz6O+xJ2UQOOyAe
         MIzbfk4LNQw2e/8DZQkWxvSOVBl+0XxGIW7YMrLZLoyDMtA20MfoIpzgs1xTMBXr0gnq
         DEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947859; x=1794552659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=Zx0cIhpmI1gSNbsOawDv1ZaPz5dLeEG4KICtknw6xeffBbFdtl7Ed6/YbNtbfU0J70
         MghWar/3H9JXNqGXkF3RC/u63Ic7OwJdGnjjYs2iUmHJkT1rHRw4wHKsyjY8fMox7v1t
         hpSOxkyyV7SH7Ba9CtyK6dDGZ9Lvc0UBIl6/W800qptBoCkiRrNCEVvpJHGrWdGECV19
         9VMUeDV96h6OP5avBPG7M4iSxW/La0UF/yJJbiHgeZA31XZDW177qo5GmRRP49Jc4yxy
         3uQMH3F/EJugWJyvZPXl7ZNb0kDVh1Jb89BfZBEy4seHwd2iJJIZkOxO1/kFOSiu+A/H
         baKg==
X-Forwarded-Encrypted: i=1; AL+hErFImt5ijzezXbxvUkqMYgj4EbV8z6haQIW8k0LpyPCE6zXGEaXW/8sfmQBAi5MiluXYg/r3QQ3qpaRBWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RvpqSkasqS4yM/O4nHOVPqq0ANbKmrvlBG9HeGy8SQORg+aFn
	DHiAOC+kiZqVFbR4X9S79Y5HzQmQb3Ig+uN9o/GftXqLt6zyvQ7GxT47OVQMwdCSgVSHDqg3ds7
	9L3HnAkjb81AeLE3UJWNE099XdmJr9hviM/m7QKV6+nyRuh4pcEFnQ/Ntkd0biMCKaA==
X-Gm-Gg: AYBFou1IUN0TL3rGBpisEJ+F4erxuNCZPr6linwzds4AyR/8aqSQt5kHtvcSNKFloBy
	ujxT1WwyB6HKS1/lcjKM7tHOdY0vEyCvd5KirehpYyId/DYYpAu+JXGhrVorA0S6Oj5+DHkkTh7
	NZZJ9fYcgoK3OM2ho61pF4tJDxKt9UyaIaB5gt5UUA1c/BwYgzNL2BapPy0Q+bf5wbeTFPr++bs
	HfFEpqOZzq0QkNnOK8ZdaPYjyMOqeCrPhY7LpNlTymdtO8J1pgPm3NUE5HkBUBvnSYc3hqT+uJx
	djx+oZMHZ+sGWGTs6E/POXcJFIzh9518EgayWTjX9kLGLqrG1od3PAowtpx/7qSzUbrmhdMNhCs
	0cOYvmdy6go5Eyo1SKN/yYAogJ7s8UY6ovn9wlEDpWnGnkw3oglHFE8V9GzsnCfnYazFOwvfVjR
	VZnWnW
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318373a91.61.1793947859428;
        Thu, 05 Nov 2026 22:50:59 -0800 (PST)
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318343a91.61.1793947858870;
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:42 +0530
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1414;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Of5la7TwZQ/Mgddi78WKNJ7A1AYscECPq7KHX0+sZaY=;
 b=oc0WJiOjPuecbdNW1PjeNotzAGfBEPLfXzNtndxTCk2cf10DpBvORLSkKxuww98qe+zxAI9A8
 lfekXCGU7PsCp9YWcgzQ1PxbW4ejGV5eowPCbBGqQ/1I2hpLJV7nV60
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: -W6SjH6TcVnB_tKRhOPM37qy3FcIXqqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXy/OjzqE6APRI
 6o+LVnMdfMfaCPwmOinoSoSx8OJMAZrdHB5FLnPik1RvG5LljPwolWfEhjRywTu0V9KUMlfElEU
 JCjkLEwqvd8Y74TIVSMlX6XPTi4VFVjpgYxH+chI87GB0c9QNvKFCpvuOjBdeRhCZn05mLZ1W9l
 9fdc2XHGjlSuH4Tdp0AFAZSjhO7Er02U+vH9jVHcoeHfw6Cxpp+GYn9xpHd9ZD2M4r1a4RGXCgA
 j6dW+Ofux45c62J58VxsSEvpU/bkhsQvu6Ft/YjwZM4qoKup4w0C6md2o6CBzLgQTycoVREjcSF
 68Z9w/ecageIULGsC1CoXmMqAGDhiqOsRa0HAU3uJa/TlzN9HfZtNoZyql/e5I1NQs8uu56mSo5
 h3o+HPOKOjKggcdJBMbRff26T9sF0yXud37ATYUcAY0c7m9llwA30UwzZT+9CUkkkFx4F2KVY9z
 O1dfwU+4lMm7GMTUxmg==
X-Proofpoint-ORIG-GUID: -W6SjH6TcVnB_tKRhOPM37qy3FcIXqqq
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed78d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXyNUlcbpzbBju
 sRj6H1+Sb5VCcQPEGEQWFKQZMI91a+zm5daT9TinUaC8pcQLFE0I1lLLsYp/N2fDZHerwzHfeiQ
 DAn4bBfGQJ0qURwVa8COkW/kakjg9eg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

