Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A8713B293
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793216; cv=none; b=cl31raci6H5L0ys/GFj59orVbo+lwh5VqVcpPE+9SxuSuO3GogZOICgkmpX7mZCVmAF/lUBJpJssQh1aUL87ZIwCzYCkVAjUmh7NJ+doj10ulmsirut5nIvXPJnqyelUc1S0OZXaLAuAQw4xHqUEmas/xvxh841RdBKxGpem0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793216; c=relaxed/simple;
	bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG09OWzZOLfzmXhg4Lz+sqrkMC8j3UPnHYoIzTdYqbT68u7B/h3bbxqyybC4TmJ2O2SNvtAAZkpQgME4RepEitCBHS8tOyyqaLLb0jOWVo9sx29EIoukqO8Vx0F6jE6SHpmCPNR0M42LV5Oynflvzorxw4SYFgQgeqzGZI8/2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8ZWVrfW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPDwvHQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8ZWVrfW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPDwvHQo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3LXBd2564710
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=; b=H8ZWVrfWRk20RPm+
	nowfsn07nncdCIV1BOgN/tFQbt2O9GiXwJjDBletXPPGBK6eLDaxbFgJqkOfJItI
	osgy6FdFV7MmKbyUV2Mn7nPV39AfQJqaqOm+CcZcFMtCObn1aziz6/1MuMLQuiiG
	0e+uU5UVdqy1k/q56F1ASA+nreMMm82ufEl5rbgL7cFO3xOR9ttKEG4Z6aBzXTTr
	Gd9VtSOeQhEOMON6YzhRqgaqpWtzDm13TjV+Cz0+LPPG3Vscb98MZKueC1cMxKDW
	ztxFOk4yWkuqt6hrVr2fVejnfYxmdDeZc1InTLO8z3qcxBFIUVzuqn6VsnH4P/5W
	kc5gMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnrgea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso2521317a12.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793212; x=1790398012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=SPDwvHQo+j4M5YyRzWRZBslDIDkmXg3NgDtIzqPqg+NAri7t/D4ZiXLpLoC1wbcA0j
         f7PVPjHquLr9+sc8UpBpp6Ut0luk+R51nabfXtfJFqx2c5HUfKHk9rBsDXAa85lpAp+s
         5glED6QiXzpu6nHj5JT0ggipT8pAiMjj9Nj9WjKCqESn2V/Ct71JIsSp/vADgIS9xSvc
         W589SKeygwalCgfi4opB2kUEY5x3Ci5epPfYOKGEDJuT3C8JdP+rOPae4q+ClVv3ZZ6M
         SKx26J/uI14p8q/C68wqS1A6Mf3vVV0rg/ezXftVQ/8LwnUXBcYkyPhvDBpko57cL6eM
         /L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793212; x=1790398012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=GTXGddRotRim81QCFDc2M8s407OqM9fq5SUAbNBui1u8QV3156Ukh+8vN3v9lulFrZ
         0sqeqVs5vQnRsK0W9bj8rzZerDGJNlRyZY2zGuJRZ/ycpSeSzvBebQ/Ivj7dR2QO+s2E
         I8/LdGUEYtLSUF84Cf3zvgQyYf+LfD6hNHa5wMSlTr2xi6KQbzKB84LX0WKSbt9zd5Bg
         w9Znik+hPeiwNDSd8SbPvMnHOIi3xfN2Ihdd2jRnvUnfVMuqb3EGMzYu0VcgUXxrGq/q
         avv7sdZM/DHBg7kcC7x2bDhDwc2/ntB3elTkKQHfsGmS0pMvTCYFNUjjGzJyNIErDii9
         4hyQ==
X-Gm-Message-State: AFuF++nqI+k+1edKiiJa0/QxLk6osI9DVjpX+TguJ7b6E76uBcCCUU6g
	zGUH39O4ai36QstVHVumOyqGh0M++LOVCwJPy6f84ax4ep1p1Ryqhy77Obaz61KjqSqFTj0xKor
	rDXFowJqFTMveC2W5drWns8jZ/3MC1YI9+8Jg6qu66BZ74tI9nCyFN++Kv12w6EkORg==
X-Gm-Gg: AYBFou2MU4FovQF0y0FlC6tE63M6Bfa9EKziaz9TWz3j7xQTCxkk4XenCRbtdfBQsOy
	e1O+1yuMS3T5PXlU6sD9e0mRje4oUOQTckk2B4mXmkTjadEUc/JV9rd9g2Hx2A1BfK8rc3Xbcnd
	ExF9IWw+xrIjr2Wm4PsYcSObi6Fio3FiKPdn+OV7kknjM9oL4QrX00FuEeBbtMm14LQ8FeKTgGJ
	7tLDE2PSb2vGmEth07fYDNZNWtHG2kDK1xztDHMOeaNO+/voSShJh8LJ69WyGgb+n7zer9iAWFb
	yFqCvmHr17gvS5ObN/lsJAW9Evrh/aN5Iax1bO5dcPKMMP0qhNyHQqMbyqXb/sx6AJrOBLO+bJL
	y2mIaBFE8sgEBjcV5N4hPgF08setT27fi
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506816637.60.1789793211808;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506798637.60.1789793211451;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:58 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=722;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
 b=D0ZjnZIo+eVMA1MLgdiKSpQUDOrmVryJMUpspf+xga7RikKcNGirtO9wKIPfOGFKgHaJOUf56
 qYnvLzjH1fXBtsOb1JoTogm0F9rzWujrlTINgCFm37rxz0M48TbRwZD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aae13bc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX4OBYIwvQH7BI
 2dv12EtCNMAN+zU4KRK4t+vEkQbfV3PasPZhul4omiXPsvtWExVvSrsVRhR6hy5BwUC+iP3v33q
 W81SLbE7NE/onMvaBsueQezNRf0qClM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXx8ZZk7A6yW+4
 Ed0BVBF9/Eezbx2FBHNmNkFs6iGy+TdP5Y8KdqxZGMadXDbrBXada6GfqJgCj86nO+CWv1z8Vmz
 RXmahLMTJBh4F/lPJ0lsaqNz1UGtHuYhiBPp9KHrvuZciweO/UKF+AN2a0wq3taLKQKh+cG4hfY
 hfPtVz9C0jv6lkb1MmgLD/WW6kIig4btM6OcOC3Nmr5HBdhN5cVn5sCRxHIjpG1uxHRzGaizcEZ
 tUCBJuVjyIJgAUfqQXnfdaeXAF1YCnlPnzgRyg0mgE+HGPRsuD4MEY7rKHl5Eg2xJTS2CSp13yA
 4D+jIm738+ZjH6I8Snmsdzg5M5HmX+qibS9aH7WE1BhPd201LnHG+F1G1EWc2msQXzoE3gJailf
 3yTDpg0ITLH5m0Bb8xZ4CIiy6q9pTwxsYYduGqpiSNyKLiEk8Vr36+Rac1UdRtj4fQb9+6ntbWw
 ufqttQwDtyTbGqYrz9w==
X-Proofpoint-ORIG-GUID: BiLI97PaRQxr__wGr3Ya_ark7WpTCS-W
X-Proofpoint-GUID: BiLI97PaRQxr__wGr3Ya_ark7WpTCS-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 802987da3cfd..6e0b7a54523f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -415,6 +415,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

