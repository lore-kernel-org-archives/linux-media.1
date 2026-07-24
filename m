Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA48432BE8
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896942; cv=none; b=rslcjKtmZ15hzBGw/f2cMEBiHFiI9g3+N9FU+bcOQZvuhXLCpAujLIw1JPHms0R5K28sCu98mt8E1YnliUNzmOiUtPtiTYsPGOAoMKoXuUiIO8k7BMNf+CeX9eS3sKjO2vb0tB243JTiQtQ646Ii1L100cEESBsPJ2DYG+gVfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896942; c=relaxed/simple;
	bh=wPkzhur/NK1jDuLBYAFWPkrcGSJqVdt0NxnLJdG8vTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0Og8IEXSssDpb1F58IuTh//7M9ACNhgNxYB8P5NK7uHIJ+3B4ZL8dJHNGZa4tmnR88a6wWu6zXBwDINjR3XZFFhXpM41uol1y0Fn6XBF+QdvYtn0gw1QJ5BF+ndNPMJsyQwE0ExTAEeG+AOAmTdH+78YnUUL2JHq0wb8Z5lOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXWqa59H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPT74PI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXWqa59H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPT74PI0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsWI2616247
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=; b=XXWqa59HcE4zdB9t
	53Ft4S3nfR9aSQaSjhCNKd93KFtCQ1ToeWjv5y/C+vd+2OuNb5r7GPfRGG+HAARe
	hoMOqASymbB8a5U15AG5mZ9ENuClGcwNrLUiExzW0/9neLmRKMJv+rZtIyoEJ5Tl
	3ViWB7WaBeASY86E5bLwfm5FCNgGRmMbjWxSNkwLUP7LU6EDzndHCk7rkJ6zxlwb
	vH02sgTBiNgm3y7qLaFF+9Gv6SiId9c00xdnC9hKPvawep9dzZkN45JUFFTYhiAk
	rrGva/6IvFjW3Vl25sxIWcbyG6OlAkl2qS/tmHeZcgSBJkOXyaL4VlKzspjHPUXL
	CVMZ/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9skr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso4114641cf.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896939; x=1785501739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=BPT74PI0Kl4PopkwDWDLK8JUckGjD2Qm9Jh/VqjSWchD4nTNLUuxZTjeUft2UMNKEt
         TMeEdo6zE7ldXPwbz6jLPw6waqZxwddFQl4Ba6ncgGtDfG8AsJ6VvRqZBQYJKrOSybA2
         72SfX1JZbYUshr7XYZY5GZkkvxJIFLUX/30rH/gpSkFcB1YpP9rIGWKjPIeZGL0vTWD/
         /Iu26t9vvfYHN66NEOYcjcyXl+c2CqmNDcBhYvcz8ZgUdLfT/g8DgQweoOClrWoRWFwE
         1v3sCpOQY9MMUVVHM98ph3u1F8i2vXHDle6Q6bY2MIvQwcg1Bh6VBd6dwoqdLamg234b
         NREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896939; x=1785501739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=kI3l9IzAw4V9j9B3iqRREpuSzfMxLfgUm5qfEghw0kQnYb2N6hKgo9I8LiQW5wcPzt
         9kTMchCwy0T1T4WM0ABcUdW/x0r/9Twcz2dBI5ZWJGFnlMGIBY0Jb0ScBN3xNbCZhSCL
         6vrs0hsWBiD6e6ns72VONRKfakaIpwJhI75HjItBJxpyAlE3q5Sch5NsjdFLxgVn8srz
         P3+Wz19icM9ajFxmkzZfFs6Go9eamEjzC4hAAYPhFhlOfozhqhHDQNpbvZQHWv1V3bx9
         psiKxBTybaPSkH+kS50I3aIidu3nQtMB6DDh0cZ/fvACuUyVmd21iLWwbEjdoWMrrqib
         Oi5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1PWkLXk1W77bzPvfDDgsM6fv5gQQbWJb8DNUfPWlqhn4t3fKY57ntTbDUk3GVdc5lCB2od2ViGJHmlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bK21aEuDiTwm41FLJ76u9BjbMncL3NSCV86T1QtTToTztRye
	8PCKUh/YZfTtSZmh8qyQ6a3BED0JgQrjDb7/u4K/JQkWYnAG3Nv+qAeVryWh7bLbGj1f3PdvP0O
	hVaDR0FV6O+IXewCvI9fh3oMReo8artGNtFegO0osOUqarwz/u1tz9z4zNmBVYyTrIQ==
X-Gm-Gg: AR+sD13Mzr5rO0f/bOG0J5Fx4N/RSxmm456p69VZK25vtPhFC0mqwviU7lN6jYeswAL
	lxA+Tk00b/IQ3vrTDcQ4iXUd5BsuozZPQFyqjjstvXBSxB12Uk7I0HeiT19MJNNu+1ZvUJSzoEs
	Oy9aXsqgln/8fyADFLVhxiKCQyACgxAIABMI3bJfn9fX1afS/OA1yXWTAXA0gLmd9hWlCmki0OV
	ZDEVeU7ipDFVqhUAs8aiiTHNiXKpyETGu1ec9aGzAq7F1ZV9m1j01UYOrb9ZHQsjGPWpUom4O4V
	NLjL0raeJzQmfvxi7SiH9BdUNMVis9ZS5ZyWLDfW3aIR4aqlvt7Wtb8Nr3wjolct2aNwYD4GiqD
	y7/VDEj2Cl5xHpe4opAoYvYxNpjVDG3OmZnCRqcbsVabe2qp4BqEMMKDT/yfaZR60mxZ1Cga3+E
	+6Crhx6ywJm6wJWDXMbqFHq9AIfbwqyviiTzNYWLV8Fs2YD4itGA==
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64663091cf.32.1784896938621;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64662651cf.32.1784896938025;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:09 +0200
Subject: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX3sj1LL9zMmyq
 FrbdEzEL+uRdVIZvCEWncLALRCqRC0XZ2EN1CgtjhdIkg6NtOZv5ZOnBuxmg0LbTZls6Cl3w4Jy
 HSnmCDKLiOLVjSehMXA0KmKPEsKJzJKz95DNL2SIHNfTbvLDGUjYhcjQiafq2MnT3l2HntwL7qQ
 +DAr2XSQS8HRYc1ilGC+AA2jEWPGCrRsuo01gKE38Mz1+KYuI2ns3h0GbshD0Wy82fNnWPEOMHD
 SZ3ZhFsT0ixmvbSwYF9CW8J5WBK2TMu96nUV5sgNl/7z+xmjFSsizlUUnObgRTkcjbopAKCcaEu
 RrkXynARXCVyEk6iVsxf/l5B0KPJ/A1rt58lJtxham5WGVyjnROle80DuKUwn55c7ql/vVel+XF
 4gfD30h2m0GYeALlGNpPOGZmfFuTzHkSObMbltXRJAunoUXvbnRhhnOjyBm1iIs+MlCEw9+vQwE
 pn9g3XScgGk2P959SXw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a635dab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ta8EUq0YlvYZ0OLiJSd0eCvqHTX9B05Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX+ybRd0sQ2pkn
 jTYckssfFxuySRGccdIM0SPXsd+Vd93jqZmHjXh6x+jz+dmAyhWw84hmAuKsA9bhfZDs20Y5GyJ
 LMqKbC0CcHF857spyCbjoDNa/3nqcas=
X-Proofpoint-GUID: ta8EUq0YlvYZ0OLiJSd0eCvqHTX9B05Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

