Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D473470431
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778299; cv=none; b=RIgc8OxcrMLsmMNHDYkTzWN+JWwLyWECGurSZoDR4AEWVfywwqCBJdBe5bKMueB3yOoOZzj3buWCVB2MVMeSjME1N4F1cBRb3PeQT1OmH+eqKglG68IZEnAructrU4EgipTs35RAD7nRkT1q9lTljt/eoHYP9xG9qOr00UZzaYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778299; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNy+4p6jOGvXnXw2sQHDtPyyXBTrpkrPeT3gIzQo+XKlHk/Tl7E9tmCVG7j1o8Dw3lP4uoq3tJt4t/6bUSTatXofDDrSEBjqCIPuqjIkwyVlAzTZFvN3ZMhgJb0ZtN8KydjTJpRXVVI9+2sSymrZelyxROCyFBZMKxD/64f87us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnv4DWm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4PhuG9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnv4DWm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4PhuG9z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amx5M810032
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=mnv4DWm7lUIjYC0m
	1NpUGTYcRsRUhjgsEFdcrG60wh6k7akZ3QUT8+2Xvdb/VspS2uaPdXeWQ760SaAa
	KJW8QkR3JI7OnNu2LNaW49ydQHuNnm8h+g6rlkQjXlsyCeHre4gSIGeAPa+B5vVM
	SIbejZRUQjORITbNFGCE5Wcu2b3MLpYQ2V/Je9lFtOITNZdnlBXzLvnz0u+w22HI
	o6/rHA2xVPQ5Zk6sstDb8ZQ7JdclrduyJdnyr9gWAKgfHh5PHBr0JzBEMiAnIdRV
	EGv0XksXXUIN2I4Cu3ZBXPLmqWugV1zhORV3hc5qmZ0d8Uy6LbKfSaDsuQ1YuvNH
	7c3Vww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua91e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:51:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so640270685a.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778290; x=1789383090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=g4PhuG9zqQYUVKYsnYtY6qdL1nn457/SJwNd/qFjNJghDwQxBorywWasQvcUXz/Nod
         wDiCRokNb48H32hm4rVU7j0EzxHhfLdmjy1Y3jTdOzFd1aEBOwcH7HXiHEsxo3qbpEjZ
         ghA13ylhhISJXHDIfErNqldBdlSehvOp4DYaADqyqJkLaIyeJjG6xWdeySETmzsz7Jbx
         Gd2wikG5D8hB0hPWjitH+SU3ApeJPyXszsLxXrMT56NDA8PoUAIzJAg77tlPslR4EgNo
         xm4RTYAqh9GRLR3m0r/plFnwQCAuq8Pod0lzS5PaDyk28XSDJyvf7d24ZLr+MxhP7GY5
         UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778290; x=1789383090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=PGWiRJiNS6xig4lS1N/KotDNmNooBP77fExRCd+jgmpBssn1x2UYLUfnkr+ebYxbkF
         xjPcEHcq+/XvuvXjmBbz0AR/lEu/pNhYgypxzH8cfRuomNhGS/+ZkOXaMh+dA+EnR5+l
         Aasw8jb1Sas15+Cpnob5PZt/i3MSFd5WMgXmJCJV7RmtyN108Iv7GQF1Z1rO9U1pLQlj
         ErQd5u32A/KOHTJnRm16PrwZiPnqVkvABusrk8fTiS0g8do5Y6QDDgvcRdNi6n+Cdo8y
         9OR3uPgfv+NsGi3EC0ZQHDKrymY+Q7q4DoqXP/gC++FAasGZeuclNqfoHK4Dat+jb1FK
         FY3Q==
X-Gm-Message-State: AFuF++mqxhOHPr+g5VvduCfbAevdCVocO+q55u0thksrscayUiOO3HOx
	k0C9OaU/82084CO9tHpoT01T11jPnvyOO6HQIINtv0WE8uS7m6FkRfIGdQl0b6U9lz5+DYguThU
	Iu+xBAUvne2hIzxLzWrB4/gstLVJYdKst912vDTFq2bUc9XYpL+YZCgx3RJ75nEe7lQ==
X-Gm-Gg: AYBFou18jHBPlVWybIXiYkf9alN1jSBaK4UgvDUzYSy+SiO0D7RXddgpN4Czxq2OJwd
	CJloj20+51tJhMg/97Batsd2DBGyiWcVKn5H46LJXPaDWheWhezdFbbtH/kKWJKP5viA+t8OeoW
	jXgCY9VEA+Qma7+wySSHjU654bf5iFfk7RDNKoawBJY9HLppuHce9cwjDniXpmRziim5e6DRw67
	Ui35o7vcAyPlhUB6nOYlCiE+E8mySvlUtQ3+PtzK50qGEC9TwD3vEZXxsA3KXstipOpUvQv67tQ
	jptGKo4z/hQv9DBXse6sNRkwVH0ynAQgRGXFs3FbvgoaNpoUSDarbVyysTSzx8PlvPuwKptTXwB
	vQG2wJihhmjhSRtV7qtaTTAvdDgczNbDje1+l333oafc5KLI1CG1N6LPLCxtwBGkrv6FcPwyBu6
	620ZIrbaCUX6PCJSw3raM+eOEy5G07OpOWYLCx8tbdbpK3kJ2MUx8=
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002577785a.32.1788778290121;
        Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002574085a.32.1788778289725;
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:18 +0200
Subject: [PATCH v6 8/8] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-8-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kF-CUdrMfhlhUPy-pF3HNgtO7LwuhRd_
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e9733 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kF-CUdrMfhlhUPy-pF3HNgtO7LwuhRd_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX8fdG+0gbMGcB
 PqEOmgB70mKueTz+mUSd9FPYWebnEG3Jo2uhu5yQD9trmUOJO9Ft3FHSFZLtb8UvPHn2yq9DO/M
 6HVCWkXuB2Y4K7DB20yYtBZL6Ydt/dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXzdyLr5XW7wAr
 81XSIG4C4NGM1bkgW/6A03GhaTgdIORbW035rD2BZtJ2CjB+jMBT+Yq4DxzSjEE3uaG3qgrMfKc
 C/XBr3ptZbKLRveGrPc223f/wYei76F1XVp3bK3GGBcNPS9/buEeHK9tded2HhbrckFSWGUUXkg
 J9ve+udppMKr+6dqACrXDn94A9sllF+FsexxBSfjLILEkynEEMMa+t/rXWaRF5XDsD+vc3QoQLh
 wXYAZLV1RR2qzJH5XJdc80jFE1D6pBCxHkN9A/FmPqiw1W9O4dnx8ZtKHGWm8jGb3BXRYXhm+pa
 Z+RtIpMVsvM+a3i/HLgmNOzEAEySvOvi2UPtCCXjCqPRW1+BOxQDkc9ecFwk65qe3v2ZhOBePa2
 AxmjxotV5kkS1Z0jaGTSIo3xb/89q6MuwPl/XVIzI+7RPZgcmMfYUYviKpxe2udptvJUxBTUlmB
 rgtaEPx/XJXJwJPu+lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

