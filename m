Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B546AEF2
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459886; cv=none; b=G52s5U3rJzVIiD6Y+5KzMJBGHCdSu3viMKD1cP1knPvD7QM0oCGkg4Z9GcgWnuyVK5ovYcadJCJ/KS4M8TwHCTxM5sZb0EqOQEC0LhD1goKPI7dRp20gTCSXEGh+zlCOuDkA3lC8DDshwFHUS9iMNJfhHKQz+ApBhlnVIh1Jcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459886; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0VxlwiE5Mu7C5uICTZmaJSvsQMt7adf2upd294PSnLMXV4cOKjYCW3r5JJtzRkJr53VQgOkXlnSb6+eTEW5xE/SCwF75A6+l10lFYPKcgdOeGsS3rQJiDdV8i1cHatFgznGoquxJZoL+Uxuro0PmzehD92yXxOpvXfOJ7LG60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwi/azVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJhFv0G4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwi/azVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJhFv0G4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZTaB3316461
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=dwi/azVliZVgSa0O
	lPcr/d3/Its4D6WIkE+zrWZhWONfpCzzyY1p5QPEdV3vpDIjY+GvcEQZVy73s69f
	93OMamrRWINQ3hxecPRqxs+YIOzNKEXfI5nPpji4jo+hXWuUtGUnctrLmceer19L
	XKxEL1hdgYbUz6+cW05duHvrWetoYfzU8I/UtAOIhpXobSaGOJSn80tedhbdqgQL
	45WoX2iqzKprZa7ia6RkBw+SmS8OsXjFZ0jXp/QKBRkwxnrTZA7Au/SOlJx7+7h4
	WPNkZNGc1ngccuhEnt5pl67CazBrjJdta2XS5Iw8dRcpigakPV/iftI3mzn/G2h3
	BJ1sag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux0ne1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so782756485a.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459881; x=1790064681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=gJhFv0G45ZPQGOWRJujt5ewrgGQlBCQel/rrmRwFh9CrWmw6x8tqGa3nDad7sh+vED
         E7O+jLNd9VnXiDHSdfwURNm9coOK+NLBwhPFRSZvHuZWpDYYkoTwLIVGlwbTkpBjI1wk
         QOjIHlJI8eKSjFA/izX07tyqOr+dMB7g6RnSDGiAQCM5btKvRPMvwFPCFVnItcPxC0xQ
         1ksvq/hk7I9HHy25SKHdmnt/4qAug+RlhilCXq9EaNjtqT4eVupgKNgi/qmFK9ncl6Zw
         ntrXKx6K9XUY5HCwKdTUBRsgiXKdSjqgmE6DEezImdD22NZyE9hofWNUi3J2yud1MljG
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459881; x=1790064681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=Tllrm6265uVrrPadig0hdnIagFQ80s5YA98OtFyMgTV9DKXbSy+m29W4eNJEOs4oDK
         /Dao1z90cw3aMh4H+xFZvOou88UXwfqe7P2dDazwuDXcIkEL30eGjbDtZ6epcAmJJI6H
         YJuivHQWR6hdf0NDUCWFPLnXNDtClmkD+CRwD07W2/Lkvzh+sFCSkrRe+yBX4ScNKhHj
         dhXGSXy2twRsfbQMokAy2an9n2H/8siqXRqVC/if6NaUUWYXljoN6B+wC34oBBH0MXua
         cewhvrneFfkUQ3/2NyMINXkK9qVqculDCa2nAm4SSo5Da6M916q9gRhdSy3lxL9eLwQj
         ZUMg==
X-Gm-Message-State: AFuF++mroGOyAREcIJYmg1XOnDYnhFZ2dujMKqg30Oy9VPsmMobfSKU7
	rmBJxVQt8stvfiYfEM7kmmF3HO8ZaxpeHMmPLr47RNqI+qvBi3VBNjOeiAiZY1ZyXgvKZgFint7
	sdfIojnTYVOO3O+tpUUBd5ieFeoQ3nyEPKYi3ojOYXB3h6biCMEGXyn8xcynlsQ+DoQ==
X-Gm-Gg: AYBFou32m4NpEUWObq/fLDQTnY0OVNvyqRspV+4YTilOHHU74yHG9wPhhb3fQAHz12r
	U2kNub2GdNOMnOrcNqG+3BhcIT5DDF/y67auQ89KBxC1truEm1N+Jcoipp2g7SzO6iF3G2A/qaI
	MTiABO04MuHpOhUYvM1iW1VH82HtXXyAOODPBNM/KLYKKZ4T5WPUTFaYEh9pqO01ZYdZePDozB+
	UvVY2jjzK1oeR5keIyw8DpHGcBTJbrHB/cgJ9pLks1hn2gnhtxf3GcxFC2AAnfY/zHi6FNIDxuH
	dgsXwH8Nxres0UJ07rj9a6/KGVxDq3xPNA1qY5yvTaJAntKfL9+JH4ux4XTCaXL4dDdXcfJSsmt
	+yBAJnEJRo6XeGg2+C1orKJV2nHQGX/ZmSYcTgr4MS8hFQ0+OB+HEvft4Re6DSuaPglRVfWH84e
	XuRbzY5NzxF9UyFINDdiVUGdIY+NUKIEdWiUf8oKALfYeAUrLNdps=
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906735585a.38.1789459880941;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906734085a.38.1789459880580;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:12 +0200
Subject: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3BgsMjdnHfAT
 8ofyW6NekdaHjqr0I0GVni44S7oeuttNV9QDu9iUV7Duzdl4VWjCpABGzzbD6moWKNdEA5/6NMR
 awB8cjvH+2fTYYUatlsQdqpVlOaNWDCNYdJrJWaSfx90hQKymv3Q65MHLqpyKF1Lm1goa8P1rEb
 hEAzS2Dx/avVtHa9/Q2FQ5et67GVoDdU9mVu/vqSEJrdmjtGxT3gPz1Qnper05/d2jYuj9/5JD0
 liklfYpOsKdTNWqApVPEB5jDwFbdBSpsyN8dIU0dGDaHTwLfTPfRFC6cI7N0F3L5kqVn7pi0voT
 PHPoBJkgawRbrZX5uWmGqMCtjGKMTmgtTIeSsrQVuVOKeXz8aRIBmhJFCGl286Z43ew5RK1nTf7
 rDbWbITKaYR2Vi+U9azvlGaytT8kFSPJlrT8WGhpLMs32WmoAS+sTsvG4CAv72hl1626yJ7Xq+f
 XbTJ7kJcpTC+mThNMxg==
X-Proofpoint-ORIG-GUID: kB_f0CTSWzQMGdQBeb4nuO4_rYzcLDDj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX2xH8ub7HLyeO
 qQe7XjvvrDdn44AIbc1movgaIgAQlQj0fDjpKujwJZ23tfWxGuVzPyYxDSX6TkifvP7jkOAalqF
 Cc+7dC3FgwD3Me69bK61XcWteTX4unU=
X-Proofpoint-GUID: kB_f0CTSWzQMGdQBeb4nuO4_rYzcLDDj
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa8fda9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

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

