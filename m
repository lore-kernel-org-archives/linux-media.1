Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634811;
	b=cS97mdIhdGvY2NcC4jXO8Vtaj0o7vl3wlbr6/wXB2jFs1CXUuyI2Ch4qJQvjb3kiSHLE
	 mZKy4XnhgauLlkAa75mqknPY0u0syZbgPbFIayrE4rqa8+syZqG9Ujwy9yUK/4Bgdhp6n
	 94PBpSrYcPxS0Rvag1vmpUqEeMxrlE6rCb3R2c+haMPnsk5qXuDJLpX7n4AMx/JEHQ+OZ
	 He35E9+UkHAxSS0teR8KxbdGcbXOLnSc+9+NACHaiPQ7u3m+yDLGZMifcssemnVOldyTd
	 tn876FQ7MDg03hmPMuFtuC9BamGBkWz97BQSjpJerT3cKnhckQyQrNqab+V2NqvGaSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=VFg+3qx2575iE9rbKGPtdHWuTPl2gajG65JusX5Iy3LjL4mKOSwmNaO/28s23yr8/hG3
	 Li3JYO9ipRXA0rnJQWi1t1D9r8CSI6/0hvUpCs4GiT8DIK5ieWPeV5nlFtPzc0TlFwFBx
	 VL0zLCXu/o/vxXT8OH26SmHDpT+YB7HLjBns/krumYpjjuwBAuKqwOvjvrBgMoin1JHm+
	 W6BO+cvGfUWePWDxdcp3Tpi35KZCl0tO+pNnVbR7NWjilYN+7TIhD5FapSHBR28Um6dSs
	 26RgleRduYBCKfcVV/hyhQNXU7C2cnu40bWNfajgzZ1g5YMs9zDxeeFnQZ3IHLg2qTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B160A8C33
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163B160A8C33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DppfK3716250
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=Pa4dKkB7FS/RPmpr
	4MycTztlI2IEOMbUxMKoE2U1BIwIGcXTEhWZNav9AXAMbgLRbuRh+o/ePhzk7WPV
	a4W0EslWihwIAtEmhhwdd9WdslD+aiWIihz02+FIcEAgQg9GWA/Fyqo68zdpH8wu
	A2Gmx1UG5SkR5lkjYGPMJfCpE+nO+XiihC9unReG17IpHCJUgxLlZ4poWXV1w6i5
	FA2MZCew5ueXmQE6l5YH8bxX3asLSvLvBtz9ce0zRvLCvpu96UvdNrD7ea6fc5rf
	Y9tcrqfL6qSSKGN6nyMTDt3D9y/QFdZG7h7i0Q6mOc/qyLNqKhuh44qcH9bYq0EB
	Ctd9Pg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62ntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:53:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99082f450bfso2495212241.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634804; x=1794239604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=Ea8nyh+XA0oeddX0lth30wFRUuW7ZmkKz4W3zjE5qGRXar+E81WnGSphha+OGvCyMt
         jLXmm9ncRWjHDlrK71ILiEiLeer59jxAzVT1IS9tki5RTwzh7PItCMHVtNGtesoCnhDt
         z8ckrzGzIgQUBs2wxo94d0z5tMQqdwpi7NKxV3x7NqAvZI1lJiOhWUVCEiOlW0V6NSzI
         +LOuAJbarJ9HtRrk40B2UEz75iz28kH2W41tufUeENumJPX2prqAYcgI/reF+CeLzTOs
         ocThDgh2Deq+e0px6F72jlRw2jib+mphad1eUacauBNPqwps27Yo2Uol+XexUd6tMJkX
         9Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634804; x=1794239604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=P08HJNrKKMkqUO+880bmqfK3e311tTGP3kCqCdvCTmj0kmABmrWpZFvvm9PV7PnCdl
         w7Ci1NGPLjjRST26ACBKcrOTMWeEV1QIVjlIlITcmNweO057io14lm9Q/Mz7n0JDL0aU
         Jhyf2zfQKqAvl3Uijz6uBd4eoeFNBP5Jt7+geV/w+vJwpoG/Yu4ipBTwilLbhWS8f18i
         Si8g/rpiwnruUmjNi/L+i53H4lUyaamuqdWwLAG5d/FV7A2ahtLBlvlOwpGhnjHIikuj
         9/n/lkKHKTuU3gn0xFQO4/NWE8IiHHzNe/SJaBJPB+kzOnupx4cxJue7wUM2JN34Sz1k
         TmHg==
X-Gm-Message-State: APuU4Z/lq5q5LJEqnu5DaoNs1gDMxo+y/7cuRiEa7cNzwoBY8mInRlBJ
	ahbHTZLMHKCa4USk2BbLf0LwqXM02ZvBc6lvOt9hJi4G2oLyWSBZ7v+SLr4EsGJPNj1xdt++gQq
	QrwuLR5SgnlR8SJvtE8XJWlf04aRHwR4OEIhUpMOd0ALRZfUn98M8IW7xXdtW8436cg==
X-Gm-Gg: AYBFou20mcUdmaYIm6X2DIf50vJ4VJNeQ4HtrGWAV7qgeC+QJ9NirOHfj2kvMyiEdw1
	Rv7uXPd9Bk0JSCPw7mgXEbWj3xjaRb7qeoP5iTaUhRh9PG4U6wHuziYQpMoOyxURksjr+mvGvS9
	/c00hmw0DZ5+fk3bLWZlrm3kowRZRvNNw+62vnt03cXXhEaXjujdh4WPl1pw0IhLudYB1iq5X8r
	HUL+4VZB5STmSSuVojqyvEVwzbsea08k/F5i+sIVGr+ddRJ1nHohRXJWIyZBMKauS0z/N8rtPLi
	FqVOHrqQ2fV1c8if0lp9yMkMGIrseNlWui7XwGU8WLyxCnYMg2OnI7GWDNR6KSP2O6UDQhF/kZR
	YDUtYIT8oDq83O0ThE1Zl6LGD86s7TohsI5A1Hax6xKeEvCZ4dNS2IC5OiAGtqO1pO+XPIaIcO4
	0bE4udm9Bhts3t6n7eZ8mfrP3cxsPaIM1yTHkslya1jzk4cbQSs9GwacROKjPNXPkKlzNf4VYfR
	W2GD51l1Nz4Pc+8NVRRPiJuHhbG
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143652137.4.1793634804358;
        Mon, 02 Nov 2026 07:53:24 -0800 (PST)
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143636137.4.1793634803840;
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:34 +0100
Subject: [PATCH v12 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
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
Message-Id: <20261102-camss-isp-ope-v12-3-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: c-aJUxfRzmInCro8ucY3gkUEK3baTuuD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXz6/h51XwJgFD
 BU67m58TIaiDbVJv6QQWjdrkY7Rrsf5kQbcw4yr+mqIaIeI/cu0yUSAkoWWNBUgSs2NRV8Fu5Yd
 8h154RefrBeOGwUUuqtvIjAZ5gh4YYk=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8b1f5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXwELFhuqKnBXi
 LpsuSPpCzJTScFjCMgQ/hymLSbbjw8EFXHjbZJ0gAykKQ7QWnL0yM0t4PdV6zLRXoRWNaJVMFfq
 gwFKu42gAiV5U3ry2vqQoPgkSM57QacE0+XbHVY6iTiOTtxJJSkf6XH/9qJbQr6pR/+/WqU6Lbh
 HvAoN3v8cIEklefUyNY1rxkUZEZfM7CPMUxKLhiAtsdaQFywOspLiRWszQBFRxg5t/tD3ojB1QO
 8Bk11AhQ+gsclop5FCZc3VaJMeiIO9O3ZOAYojyW/mHXVtHsRXSNnMhCiO52MJehwxBNf4NAL7+
 e8E7D17/mlUEhukKg41ZOIP1T1HQvXAwIOruBbwG5ftBDzWkqTWA/WZTyzRTdRQuuw+2FXSm8Go
 Ziq4h0mZxQfUB6lFHez3QNXeypqhs0ga3C+EZUSBKbhkjVJZyj3/FeqWgoHz76tBS2qbN/192Dw
 wTOSueaC/pFvbJiSMoA==
X-Proofpoint-GUID: c-aJUxfRzmInCro8ucY3gkUEK3baTuuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020063

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

