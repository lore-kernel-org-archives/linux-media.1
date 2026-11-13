Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548065;
	b=VVlhek/58WvRCFvU+IMBv4uLa+IWn65iRfFr3BaJ5mUujdOPWzAAefcgqIWCw9W4L+b2
	 ooMviKfg8o8/RMQiNSBa0eAmoF/p8MqlBbkFL9I4sxi74OozDrsJh+hphJe3nNW/dZq0T
	 nra2O73qBlnf4ZfirxXEAvuB5g2wa/4JXgEi8RLLs+5QdwSTLy8kyVx6NKXGTQvfLwvLX
	 z7+cB8Q2FArXVBkn/H8dpXa4eCJjPMmQZduNxhg3XDxuDo1pbv1lki0OvtoBI3gH/zGh/
	 i4SN9WFMUjx7rQa4fychDMlr0QTV+30oFAsOQJSOwgku7vUt4f1tj1Pcyki1R25ABZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
	b=XmHq5QXl3amiJwTbSaz+h7dTHbVPQkWtyfWcgf4LskJQ+GSYUf3ngduudgsKUg2QGRbB
	 3ajXOR1JhssDShzVF0fpcit45cUtErUnDpsD4nstdcIfZ1ShQGABQhCD6FxgYYagupMZp
	 fJli1RFDFHAtP3dzkF2G8pkBIZEAnaEAawDQjEE/4nGBVCK5xeCGRj1xnyM8Jxr8wsZa5
	 EndCV8ZBCP69cpe4tcWC0SA+2zVddAzECuuuqq1/aagCRlw/Gf8pmPc7hrEz7Ne0P3AS1
	 x3jqbkUPb3fjNKUW07r/hk7UH/R6+zhSsEL4XVIXtQxmUR1DQg9QNIXpGeNuRLC1Taw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA411606CBCD
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA411606CBCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0DydbRI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcRJ0GTK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57ZkT980027
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=; b=Y0DydbRICd6VfJxi
	wjL5DVVFUYeE4tgWndVMMVkjwvXSdFHl84VMV61V0bsHm3uwhTsCIcwi5Xu2OH+V
	G/xZyjBSLULkBCGGz0anfipn1ETxvO0brGhm+zLLWpm6GxngaGphwX+5fwtBzsPB
	3gZOND19WDlSoaimiAUnV/Ggy9kqsClW0GIBLR9FLVgi0E7PEfoHlQSnPSST129k
	yGdG/qL/PfBD8KIwMRzT4kaGxqFQQrS+V5rKoFb7VmoxO+xbxK9NQY7FC/vHprGS
	CDMpGfKAMXN9hQe1OFFZakaoASQ9PqHz+f8PLnGESOvcGkYMBAFIf1A7+jeNFvyc
	AXFhvg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j3h7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:23 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso627873fac.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548063; x=1795152863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=UcRJ0GTK0uCIuVe3J9kowV4zd6yA6naU0eqO3ExGqYe4IoZ4kJ3eTXCRdZMoW+YDaC
         H5tz2QfiZW6AAx2g7XoqBkxPUVa5H6KAKJfnWapoQs86tIyKRBxwSZkwFkn+PN1PrLPl
         Kyi2d/UJDqDjhWig1ky266qN7temx/1D76nmXA9/9Vv3Vp0a8v6mPCKl64wNYA9xBTpv
         i+xFuPzq0WsRqGJP1G7lxjifEppPbNm9udcifxkJXndOKNhsGRIG7v3GYM1sqOexx988
         40cRIOmAhFbjOL9BQGdaME8J0jlCMZV4coqxmOyKasAAIeoP2e2o08Zcbl+NZ3Tnh0Ah
         m4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548063; x=1795152863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAVzkOF6jO6BAOmuh3rbkMOms6rYjdBmafGplJihrXg=;
        b=nbjvCFM7PgUfmlb50GZzgmJ4/pM7EWNxUBqq7aVtkw9gCUGBiZYDmc9N+U+ktvc4F1
         lrEgKaU4xK80r+2w7bsVYKegoIEPxBG2Se/e83z2hSw3QHxMAdPEE28QV8aw2EMFdYUd
         g/k8FUTvOMsGXYi0ZDMHscLVobcf9jSUbWao/YxzDZce/seWEWez2k4o/xevqt898UVP
         z3a5qxyA/ZxKp7QyTVCRxUY8xbq8Nd48FPp8QzOpcXDrGQR7NmSizxHoM3RuDhVe6e2a
         kHGT36Ep7LEmbFVh8NQLC4wTJVSkK7UU93CXAYuZArFwlDbY/+QAc2Yq5RpxJRR+0Ev/
         Hk8A==
X-Forwarded-Encrypted: i=1; AL+hErFdwVu/r7bGC+S1DyLL7iMV1FEVJpwQHQs0M6XDtVJdyy2LIGGyBm5+OxuitLPA0nk2OuMbKdoraMcQcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hUAeUPOv143mS4SF1Te+BhV1gAZ8zHDQPzo9UXxqBYM6cS+i+
	nWqU3f2k2YPF09jZ3tK8XmHUdDdXBGEbCvuO4lErHfKL+ErXk/9riwg1jdUhb6jhKMZsDsi2ntt
	8pOfrGLKjIpHolz3ZUNzRtU9H/A4pCuEHaLSxX5j/iwVJgAROsT0WDUwYV+i48c1zjg==
X-Gm-Gg: AYBFou1jKV907I4SV59F8hYOB2QMcNIfyXKl3rCwmOCxZKtu98vcabpNYQQKB2bl7bo
	+rDiPZJouMqyEdj11A9kxuzlUPgqBfHOsjiExM4b0BKUCRPFc6Muahak26ylUDBigK9xlchHJGb
	bAecrq9ozxYnw6yT+O1kKx6XT7qW/D+auW053VcJaGqFK4kCVokEPb90no6/QLnatbwXDDyOfli
	ju158GJDuoj6Y1qEhx04wHs00vg1gtPyLhyr/3K/VUyiCP4Uxyik2zKlLFpabA5CCk/wIOnxud/
	rG6prIT4AZUeLf1t4KNC4okiBB4vxW/TusC92fL/xfAOyxFDXLAo3UcoFkgnwEdPegN32gdpdAS
	qKPTUIDskXCtRKB1CU8J7+P5yXU67wXD2ewV29TMJEiEAe4NcFio+ifqX4P0Rzc4SAyTgQXjGt9
	qTp7FJqI3BCH4Vutopym6ihXfCgYvAS4tWAIsjKSHcEgGgtNkP2W6S445riAEq
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846692fac.11.1794548062816;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
X-Received: by 2002:a05:6871:2e96:b0:4a6:d447:c07d with SMTP id 586e51a60fabf-4afdf2a858fmr1846679fac.11.1794548062344;
        Thu, 12 Nov 2026 21:34:22 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:46 -0800
Subject: [PATCH v25 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261112-kaanapali-camss-v25-14-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX0EZ81pqx1iUG
 /ksOhXVV7RR1hX5wdaDYjAVk/fa6CjmdfxyH8G080J3ATiaEUVxZXHlENpVsCLmYYS5CvXfyf26
 PQSRfgn+8FdCTVIRkgrf1rGWoZCjPc0=
X-Proofpoint-ORIG-GUID: 0Gl4VexQMzOzmPCsgUTPC2MCjeX1GKAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4xDsLGE2U8mw
 uKyS/9qj0vw4zbDg3AhZdS2pychMlYY4XZmJxQfJ9PMVnRs4xXIjj816krjonCTBVJ/y7kLjN7w
 nH68tRVnKI/WNJKG6so5TPCUCSdHxqOKzRTWgsIgxh7vCTvz0hkPJ8m8w3ikXtN60v603FhB+gI
 2cnknXaxxhy5ffdQjR7Ee08necDxkmeaDizH//GbzsQlad3QGAT7ixetaUm1otq1l0jTKGzMGkG
 oAkO+6YqkDvq7lKILTWKQe9WwUz+PJymhjKHfkCyW75IELHJqZidEFBUhBUlbYbUMBv2BA3JPM3
 20/MiiNkxKWIOihFzdBF4AjhsZE0q+W5LgFIzvcZiDMvjD/UquJYYBrz5Y7I6DapsXcZJmuqCFc
 EBdsHC7J9igHuWayQ/fgD/B5BCzYOy2qiUz3FHrLfmnu8zuinb9hks99lNCYhDPU7Hl9K5boAju
 z+vjtf5qsxfGVdLLpjQ==
X-Proofpoint-GUID: 0Gl4VexQMzOzmPCsgUTPC2MCjeX1GKAi
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af6a15f cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 1662ebdfe729..3c9c97a553a2 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4663,6 +4663,62 @@ tlmm: pinctrl@f100000 {
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

