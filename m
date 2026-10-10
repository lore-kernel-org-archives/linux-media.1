Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3814A206B
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648099; cv=none; b=UM3LK8yswPugoT3hUgtSxStQDnQOgtJKPnflhNTMW1oERGZ4REpJ3BqAWs/iL8nsr69ogXK0t45HlAcbAcafqYDP8nCWr8mTFics5d3QdFpr0YpT6vqwVT8+KmRlD2P3Hc8iCbwjwXhZ83s3xPz20Fobalzf0a7eBjMiQSaPejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648099; c=relaxed/simple;
	bh=pxHyg/jfZ7eJ6o8uVk7w4Q38gLsjYlwkLC67UQT1/wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pq52dYDlxUHxsFMhjdXUZQvfF+Wcven+zeuYxwwgOrvi7gdRJC+fMhZ51Yhs7Xp+M02G21dsjpV2N2oBAwB5aBlRxCq+EOAmEMJtqJgQmHDohKa0m74aOauHXlsOYrZFpi4eztt6UZScsOfnYmoLQ02bL13T1B+NAPHfBhgFQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8i/hsyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brWy0h+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8i/hsyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brWy0h+X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPxII796741
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=; b=h8i/hsyInNhm3QPh
	nh3+34tnMSsNLNX6z6DzVq28hObujikHmP1pUDbbXSt0C98tb5jdWUqawLo+gtqF
	b/zwoquChDDL9R8PeJLjuuZG0umPyJnAc+wCqQWvVXNmthbG9aWBiSF+02VtxS59
	SLvfkBMvjLjegTOl6ABVTNft+GcdDr/0AJKDT5OfWwm0E5RolXRhxMRzptDeeL9u
	aZeL7e716BKuvpR5B/furPqQh863mPFKENHjM0qmWWvpHexFXaOcb636gQtYFSQl
	35AOMFJw3YTJf9p0LlL5L0REBVg4QuD1UqH3SqlZ8VLjKHmmIVnAK/x9W2nYg7Ub
	F22+Yg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsr2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so1358465eec.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648095; x=1792252895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=brWy0h+XT9Nla6JNaRxd14L02c9stJUXkMIk/l7NxJiD69BFK7Q4oXnCx6ftC/sCRH
         gsOXi3hrQsIfyKJL+MD4vhq41CObRv2MHqAXmmj/iVEhHEtALqKHRyVU51LvJw1iauso
         NKjL9bmG3pA/hcSfKuBaSUsWquTiYKQ5h+ldKdlR5rguHqUpOZXrlgZrws+ZIgHvsyJy
         tnqZfeFQgU2YCvMoV1wsLuRtWYFLrIzQVCC1Q3dPfjdVt1C95DOB2P1cgu5+V17Cndu9
         rh54bouK+0E74WGpBMjr17aZ8K5DoAqqYvYnQHQLJzV3PpJmIdvg7lo1SYkdDysS+Fat
         tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648095; x=1792252895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=gfSqFIlyNYsbfXVmhC28FjMt0XJbGamHlwGCURzNbBwM7R6ZuHej5XT19XvjmvbwvF
         uVKVuwZRBFcuJ/RIncbl8/xe7FCkUIFGTe50lJOSXlu5yWRZEOkuLruVi03tlwHQzc8x
         HelWoALva8yT4I+gG0Q/DjQ/19o2aWM3vLsKs10yM9GCCPs6Gov+zvYnZl9QgAAINhTF
         h7viBV65midWx8yOAU7yCrlAdA0SDZAm1zLIwQQ58bnFM9p7Z2zA+sGeUFTVw7/39GyM
         Vd8aORDdcTInEkq3YQTjMFY4A/Ee4cQEh2IkQW4tKITvtL3jst7Fm7jMBRoMtgCHISWK
         8r+A==
X-Forwarded-Encrypted: i=1; AKwUvByovjraE55COLgDB0/r8JoIcOheP3oWaezZ/hkn/cJR88v7Wa2CVLu5b4sbRmOrRpi4+mcUbC8QqleyMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZmtd3fY/XlEBQE3QBBgesvDE2pdBh9+E+RityIKPvq3bk52Be
	yFlc163bsS7veauV4pZmvVmfli6G7LQLJxMMgay2qHhIgj7DubpgsNazwD5WwxZRksASxbwjskr
	DhZZnI9xC7W68qfJ5Y1Ntnedd8quFip7Irn5/ptiUAu0nwZCw8BP51lj+4zMVRJ8QAg==
X-Gm-Gg: AYBFou0Ncmxvj/piP3fl9cCxXAu0RHxcswFxlYfJsSigJXZjvwu1TjkZGRyynSnJSUj
	bHOINBODCERzUvPIOYxuF9I0+UmKpRTJpXQ1BinVUMBC7YlVSEQcWCok5SQ9Vug7cfeUJi5fIZL
	kY7HfkLNw8tb9o/RbM4KiqjLHPvmXIGachB+OC4Ey3pL1UmjUN9Atz22autGlU3zCizKv9XflCS
	9aVO4YMtRghzvMbo5Oyljh5p3eWnpT456MGlcDPcxZEgj8q63ofYgQuUtOJmJk//MJKtgLwzvV/
	zEmWXYWSzjpYywDpGXjkcKkl1ulfmYvr8D/HaDnH0gfTGgDKIBwiKfunKYRZUFXRwN1JO/ccE3K
	rP4q+zNXYskeYtAfgA6E5juruXyC1oJFrFPMfOu5d1TGLRG3WcY7rJ15mp2xQcMCU20o0JJjL1Z
	WBUjp+I14UHg==
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420838c88.31.1791648095064;
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420791c88.31.1791648094402;
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:17 -0700
Subject: [PATCH v20 12/13] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-12-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX4cvUt2kJPUd1
 AzSa74ZV79ls/jbVFhY2nDcEYFAK6+obnLvPShAkoPgL09w3exa5KSeqQqLJNK3ETheoL4Mb0dN
 9z/8b/kFMeki71gS381K3fJpHbH4PbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX/ktW4TBZvK0r
 qDn+2++SHWdjksjLw2+VLG5AbBwnb468EhW8AQIYNTtTg++hKnxnbRpDEi+3IbS4vOXemFCJzrv
 RTg3fvuUvO6W62hAaQJmnYPSlz0lRQ4BySfCB5v/HHrOVe1W9WfKhhas0TKyiRsi3gfwSKsinyX
 56giE08fp960bLujZDQk0GuynkaTFJMoOUSGHh85D8MNaRoErjv5k5AQFZyi62JgMc68v9RLJHb
 vNRIVaBO0PA9Sg8xC1aQWgLbPVX6iQRqS8u0G5q5WEbc3LJisNvylAjIaKYY1bDEDdVdmjH4lV2
 iO81jSqbh+OcnZCJ6pW/NxQ34b5bNhJdmNmD4zbWCO6otODaAMAQlikicb3WQzIQpCJUXn+S09r
 UqCCvgljKf98MTookwGIvEcSDbMAwuea/2M4zO7MLMjFsmWnBTIfcNxrAk67niuONYK+9EIMjLV
 AsIKYAGuG9JbBjJ9xMg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca6160 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5N2Qd23Kvg1DNgHG83mkPWqqz14S2TFJ
X-Proofpoint-GUID: 5N2Qd23Kvg1DNgHG83mkPWqqz14S2TFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 62f02bff0227..63fae1bbfe66 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4648,6 +4648,62 @@ tlmm: pinctrl@f100000 {
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
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
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

