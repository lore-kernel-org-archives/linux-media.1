Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736374;
	b=BgUy1BYkAOmVfi6p+30SQfn53I/EaT1yJHijf8gbISGAVyy1AdCMJtHntLVi2EclEnm4
	 SJrB10E7QONula+nP1FDuuTtAH5D3/+xZtWP89MckqpmphPr9J+8rfC2Y95gUXUM4VZrq
	 lDkpzDNqHPFVgu+iGGIwqEHkatrEDY8yj3qeRaDiBSDoLGo9zdeb4+jIbmbk9XSjrAi+/
	 e+y73bB163CmG+TmIYelzV4WpLn8QTRWnpunnt4ae0YGxhNKUCQb2XhjrU6Vr5d/6KH5X
	 j7ANyn44ETzMzoXsjeabSJtVJEuaItrZQz+fohHTr93UU/BavoCh2wGHM6QKqtCEV1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=fRAxQv8PDAbwdTJn+8kPqGEPLcyc5kbvtnBNupePwuOZxhTAJmNBYi77IADp9xpRDSMx
	 jzbrxwQx+44I/RAZzLWlGvsK9kCnnYNEF56mmz3empeDEsh/qrJj8JdlfNTaK3EGOZX4U
	 ohJdZv9hZxNx1KYGfoXnxVokCmCB7JngSe3QC+gS5YtBwJWEcpyQJRij0AsSWR8ZjTYtP
	 OffbFMSyZmi8grEFMJO6WNnv0WcGdRFHAL7bbusodDjRkaA+p+vHS3qhcmytiwU3yA7+t
	 y5lkZkqvSEQvH8tqZfDCWXDPuDlFy3kHgIDJigjY1xJDL7DUB8p8ttUHQR2Kimev1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFB606EE87
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCFB606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ4oB2586397
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 20:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=dTPtOJ+frAPEorJS
	bZEoMEy5MLagE9LydR1o2a5KL8mOWL5LJGPzqQozeomkGsOkzzPZfAU1TZ1I20jo
	fAzhG+f5J6G5mWL8NWHg2NcmWT6SvcdqLZK184nFS2ZCg4Tgt1EBpIEFcCoX7i5z
	U5FsxG9HRlL3OqhSE2ZyJkx7Thy83SSmbuSc1q+cEnZNz+U7a0U55AtObRsyYvcX
	2xI10a3ohK5rNmDnMO9qcKPSNLE/z9OxIUFADrdcxCCyloKtxvy6pJkQuagPm+iO
	0oEYWbdgIStIQLWe8cOtOVmyB8RC2N8psgTGg+uPgC4qatSD7jAvAsoRc+smEpzv
	1qIIuA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrf89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:06:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so3289996137.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736372; x=1794341172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=iUjeFRwumnTO7C4i+M6RvgCYXOdfIWovdu7k/uKP/4gkQQT3SO9jzivQls+UTvNI6S
         rgUq05Yja4QeEFZlIjoXp8EnQ2yY6DCK2HPjg9tzNJ0mYJCIaHN/divs0CCEE53pc5G8
         UzWW7S77IkifsxLzpdLYjj2mhLZM+73yRMxGztohsusaV3nz6dCV89cyTPP59R0BdFeJ
         jmh4L+Sf5o14yYycRTDq3/OnuHO+/7YeNJZSdUXQ/TE5eGBO4ZAxwuBc7eyJEOTIseOw
         vdRgk6FM2LjGHKDC2uqwxFxXO8C6gCkxS1Ta+t8bv/v6TyRhNL2G/ZNs8QZ1Sl4jPNH4
         mOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736372; x=1794341172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=gov48vYOXJc6POPt7Iuc4x92eAIYu+eQKuF0UVg58fj2fcejqH2h1a20eljOjTB6k4
         CGSrA9ygmSgHyTmrmmIcYp+11+DJAemPXISt/e58ycxPP/qMHTBIiMsduRz8SFxliWVf
         YSHq5SRoU31LD0Evm8E9i4ADGrOGGoQPurviBJ1SZVEA2X1z4D8IvEunP2P3GkVpbENh
         xD0H6B/JYE1Q6k+KEm3DkfBSNFzybVAF6y2CEzl0bt1/Jk9EZTTa0cYfOvwMrxA/xfLh
         M4lGS/CxgGg2b+4GohSOIiPg4Fze6BoSVbVdNLxDiGE3V/VPQGHZrOr4so5302wGKq/u
         HsGg==
X-Gm-Message-State: APuU4Z+KsoTQncZUeS6zDM52xHcL/dOxwYs4exxOG241vkliFXWG35Oq
	TTMUyVZFmL9HYjR1eUo+bj6wSPr+LoS7lOFHerpeEetk7TBMAVSJlDTveZDQbvsJaZiM9f8J7en
	N2OcBs1bhIJJwOyCK7QpEWnQmuGvv2XG9feKqbOJGmRr5r4O80g3LXm98AG1+SqfypQ==
X-Gm-Gg: AYBFou28JAPmoCLj09FkU3e/D5U9wpY0LFgT0M5ha3jfdG55Sg/LUGjn3yZiu9NpK14
	Ufb96U6V8f1ekbrmQAYZ3nZfZd9ZJEOkfNxFeAfufWT/kff0DrPiQxV1OS1+KX16Ao2H97DoZjK
	mlCJzBCZCFiKxaRYFiRLQH1Dl868pWCJPcPjZEtjI6E486wpRLlBucfHYZY/P9N/Tf4gUe6lDVy
	szxD0YDgkkJEXbDUeX+TTHdHWqEKIZLADbJR8dogL7pHkNYD4bSlXeeOv7Ul8nVQfxFFE8kjSDE
	QtreSfZoMip3aLB+RgB3UoL500xPQtsFN7oc4xt/3kPPmTAIBpJZq7Q5fWiyKShmpvlLa31w+7i
	/n4rSkV85S8nfhHmeJfP6AlhHimLbusSvfk504QC+UUhna30Opwjdlb8BtstHMmLSow5yafd43W
	Vl2ViLgnoAxj5NVWG+CQQ+JvzGa7A5SfonW/yXJXl6th3Ni7R8hzo6ohJeZKvxPCuydCr6X1p/8
	CzC9IbAmRmSlmK4lAmrjhttLEyE
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895188137.8.1793736371762;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895172137.8.1793736371275;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:53 +0100
Subject: [PATCH v13 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: L4riNSNZqmV3jELeZv2PDJCY4b60CnrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXzbA94Az4Dr66
 wNjZbG0B0NVDTMKu7dwZ7x27X3zhaH41veXOd1Y8OzZXjc4JOCHH+AT5J8R3q7oEaur8aiXxHFW
 /Vs1nbC7IYaezBMX7soBhEUbwkDGpD0Az8luBVTffMb5V+84BmDra+IFit3T6o3huJs1E1QwH8y
 U9ETsdey+X1QrM2FJRUZ+FLHgZ70jGtcPRGgGtIMTVaW2MtDYPQ2qv7rTwyzIdNG0QXTfW9XyrP
 /PIG6mGCIUvjwgPEba4xXJAwbOOmHI/tOx/oAR0Cl5PezUGj5w+U1iXok8bwFfWkFxJAFdSkg4C
 KXhqK8vQLjlDHn5low6xjBbgMRCP9ZN13hxAVReUGo2TGh6hJqlnpYRCwnPIqDYLgC1SBp1FCvg
 9HloNwKCHCSByAUv3xWgubSvGBXgeY8ZeI3oN6e1o0ZQ7QcJjIpP6gvMTzLZ1zkAnAzhTZZudsL
 P6c0vZzOIfdbriPeoAg==
X-Proofpoint-ORIG-GUID: L4riNSNZqmV3jELeZv2PDJCY4b60CnrD
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea3eb4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2Fs7v1bsBqV9
 Pd5z8NiwpZb+GrcPfL4FBbWNNfi7TOWPE2GIBVkfCfDi0Wjxbvuvd7Zw4iYld53XeqgoiVrxV6K
 ocR7FjBHI3lq2s8r+5wTvBdF0zWoubI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

