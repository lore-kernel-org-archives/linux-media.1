Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B5493654
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467034; cv=none; b=f8Wt1yQYkOkqD91sEsVcrLt91T01eQit/uMLYqlsoeRdZ7p1RD8Bb4YxUH4LgXkXCidWqCua8Cmi9gthC6uuXNcb0RtRqGCZmWNe0mIakHCmuWD5R/PLPpSJjwBu674JFwGvgFMtpu7xlgfMWpN+YIRyTv+G3RHqAzM09FXTEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467034; c=relaxed/simple;
	bh=r4/qj5nTuW+nCMOgKMizWOrGyBMhe4g4e7dRumSsf1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcubHpnlUkN0uq/jYnlNJGQyY1luTl4Hl8OcOQAp2eM72wvcAxEojFFjUPXJmecUuF+7gSacTW+pMtTjKLTQE8K8By9uH9EUk4ji69XG/kAZExekreaaDpPIkD0Q5q2YMezotAWXF6R2UL63fGxTamqGo2dWtB8JRE0I2w/9b4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtyDQlca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFcKC4ft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtyDQlca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFcKC4ft"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h02g3415582
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=; b=mtyDQlcavY5//1KV
	uHU7TqkuPzQf4sCNmIrqUuwvT/d7QP/2oa2TXT40nRNY39khiJiPRc+2Jif6e71o
	d9rUNbt5wmota7UlAUpEhad2GZst7lAzEIacEKKIvwHTngBFrxMMLSgeZ56lXgKq
	kOedHYMIBm3IVo8Hx6059anjddNkDmLKJPHTOYjbtFZsa6dl1SJxdQ+WsYIhFt7z
	1yzUsJhYWsRkRqNDI+WhiQMEte4D95f1FhMEmzw5/R8Cbd05HJYX2W7jbqkrbcpH
	cBYfvDF8RnYCSjMGxylaxJ9ZCEem5FS+FBErbOoEi/V4axyK33RzLOTyU49LtwYw
	xRqKxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so3562086a12.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467028; x=1790071828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=WFcKC4ftaRVNHjut5wVMf5coyvgbvVUNv+1F5RHbtdrVy1JsBcDFRDWIHaTrKOvsft
         FPn9Bygqlq+cseMEn7wMvH611Qj6XxOkqsOlVOU3wB89F79JFJ64JKp0eJ6j5FVIyaLt
         4a0JKlPm/2rXK90MBW92IzYeSNmPN/vE2KaWHhdthqDA6SI3BqCnXiCkDIDo9AU26WiU
         LTUncghHskQp/ptKv9f4qbMEnEDPC2MPrJUy8KHnwPuKeNsW4P9Tf93lV+999IQ0wqSm
         sWnXgH1qyBnkkh9497LEET9kjPoNLR7BdqKiaNnn9M8khohE9ldyVFOQpsKjyVm4pHDL
         4cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467028; x=1790071828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=AYzG9YRkvxGHur9J1bB7X8/IBXBI9Wi3/YGVUSUi9NZgbZJnwKa3rrTRZQUczTS9s4
         ESX15PpMuoBnBgL7PL0aYAhBUT/js00DQrPOqJxEoeOxvm/SCNvDGCFRzmTK3OsWccbY
         dpV6EJF4yTbB4OKuE1XjDp23VTMwuN4Gz0keANzQRgkqBi9u/3DkWiG6VGPXjq/bh6ds
         lQc+4o0ADu01Ns53okNpsfHXIqFmF/xSHVGV4DIOFk9D7fDPFEIi1NTb76BHXflXkCvp
         NohVYZdfWAIzdok7hCsOgP7P1EQgE90hS6OfcjQ0XT1EXDaDBM3PLOQF772k5+8k0hG0
         8rdw==
X-Forwarded-Encrypted: i=1; AKwUvBwWFKBtiLr6QASm25k4Y36bDJ7QQFEV5yY1Uk61YCVQm5958bO+v66LAPZ9cTg+pt4kGwXkwZ/OdY2Q/A==@vger.kernel.org
X-Gm-Message-State: AFuF++nvUjm/vXUCFq8LTXe2KGOM0tjcWZGpUh4Zaw2cq3qiuCZne4Du
	pOQI9p92V29Xcicm/+HQ4JNnwIB4VA3kRbDYK3MavT8tV/WPKnLaXnAkVB+l39YlACE8Q3xCJVO
	oCxVQJ7CJPryOvStvQWgApbHGqYBTzwS6Cb5PJYDRdACg14c6I+BFtH8lck7FXZiORA==
X-Gm-Gg: AYBFou2gWAjj9CRV0lnEp5swFAwvqhUb/tGL2DzOOP/JpMBabWNuYZNmr9fzR/5Xzaw
	bNAM1KpHZEi9GpUY4uhqmC0LBdx4Gw23ZZHOjBF5sHNLPBntYByu8KoKq4OaUpJrZc6BUfo/xSc
	sGId4i8L08teRS7PZd6EIrrIe4i8vprHyWwd8NxEMSBh+E80d+PSPa44oxnsZVNkRzVnDJmKeqO
	FO/T+fOiX504jh3Z2dcyOLzV2Vdoy7KE4GLC79R8g4RT3XOqlg3ZEBvB0rZkzDx0QN8CsH0YUWJ
	xEEnpzHtYHJJyxWJ7mQtB5rBt84xCyqb7w4Dwtfc3jwZ83BOeGGW3zadpNcZjMs/s8WWikhtG1J
	WbDOYCzsDXL+R4I2KqzgF7ytW4sMDd1egaqYfI/p2mqQW8vm/Pk+pw0N4GBQby33UkDLxOX5zZU
	I+arHx78jZJMY=
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958666637.23.1789467027624;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958589637.23.1789467027159;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:06 -0700
Subject: [PATCH v16 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-11-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 6UFtDIvW1Zv-6T1tRSexsrdfulYov6C6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX1FNKtVKWOSeV
 1az/uV6xsQjaAbENsAngZYC/YlSzZ2bvloXRS/p43PodXunodO65EfC+/Sderj5OLZu9D3sz0u1
 q9J5I9cZ3u35KfmIZOcbj6n7LdrCtiw=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91994 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX2Xr/jbkE6Lkt
 ONe6EtfpElot2tuo5gL5klxZKqSm2MA6aVzrV0GRIhBTv12X+g17r4nYkXp9o5SKCEGw9xzuqQ3
 YXouEV7OcwaBYtJCk8yUdXxRayBhRLD6jNPKHmtCGY60yfTvESgUG7np3xfrloD8e8Bxy7P8Fu+
 Y9QNPU629sv6ZW1RTWtmJMwLdHvNGHiwzHZ35h/jhujsnnXdptjhMKOGp8T+koGTqNj9vakherM
 uLrkDkwWvuzK/ZHCNq4zk3HyneK8BHqcfmOEaiJRrjBNj1ttI7vcO9n0lCw8/xBWDzzXurFsmET
 BfXHvfgEnlqRDVQ91bWqWwvfB46znZF9KDQ2DU1uXrYdBK8ZWUCL4WPV1ZevioxSqjL9Vur3Q0a
 D1PcexrCW2wD1HvFhSVsFICCs5QAQ3yE26o+2Jv0XwxwA/RrINTFbwY7/KV2ein01+JmBfgasc9
 LINfqzlzz5sYfnWj2gA==
X-Proofpoint-GUID: 6UFtDIvW1Zv-6T1tRSexsrdfulYov6C6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 02f8dab30b91..44fb673185cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4335,6 +4335,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam_mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam_mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam_mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam_mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam_mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

