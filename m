Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200900;
	b=mK7HTJAm+QrZCcV92nz5r0GwqYhuC989bG5MpIdUd0MY5L3FEVq8TFvudGEf2FtKB52V
	 ze5oNRw64r8RIlA8YUo55auZ4r+e9IRQ/idbEC9KT4vdvG5uGktVNUR2yGZvOzo1o56bm
	 scRIQcTEjtib1Ax1UIaVzaGWOQxl/IK4YiBxMgRqbkGsBrj35rdDSx5DO3l4CPs4IFKFf
	 VGXAJsnQwIvXgKT3crqwLaPVUtu5SVy8L0SJJ4xH/NE3PvS8RP35bULFdbB1pXRd39oAh
	 hhBwwCqOl5Xdy67yudzU4NoMsMvNSjnYqHT7TCZzTFP0BlDTxMYcpaGOk8ili04lSvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
	b=GX0uZz1QlzvuV2Y/etwtpz2aYDT775Ib+irr32okxOzm38YloJ2o+89TfzMyaRhQksYb
	 uyWIhNkYlJdM0Jp8e/IJhilxWxwywV/gMFWAiwfCAEnhW5zKrtZs+YnTm7VD1dfw8OIMk
	 bWOM2XL37l4/ov4zge1YLfMYh7/E0F7yRpNuaNGtYVzFu7sV5qRmfAVlHjuEMvf7oO37Y
	 aNnLx3aPmGcifpSaw0XZriqqccgQeKnn8dDfEwL2OR+Ugw2ZbILE4ogu7F/CEgLSg95aA
	 fwnrCSXqK1VSTk2E9O4uaXCYcKmkFWS/0EGBBJXfvYDId4gHQWlLJjE3bpWYTKaPHZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j0kWkV8/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3D606A32E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C3D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0kWkV8/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA7pS1471918
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=; b=KYyPY4uIeIylLUO6
	z4yl5UozBPzx75kR5b4cgzHeRjWUzq06WCeh/XZ1uQPyTDRpawcbiNdmaM0Irv4O
	ktiealJqOSjYchvjImimcMVMrae2FCG+3frWh8VWOUXetMsWrnTURN49mqxu31uY
	EjTa3drCuebJaazLeiGtFR1utGzzEBcLix7HcvBQyAP3RWZFixGaRfKRQzhIGA8S
	/YA4ctkItgAjlzuh1tq9hB0PB9m1o67eoKdVH2ERkERNRS2TbrwDtQVNX6ocImlo
	sG+gveqs/Nbi2THtYvaxjxqTOGoaoWqBC53Lzdnhtw63LgCYNhiwkPvo1rcfhDZ0
	miUwaA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh4aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:39 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67682d4d684so1787420d50.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200899; x=1793805699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=j0kWkV8/4ndvCiqF5CpN/gUlszjVhI8oXJbj4KAbb5/zd5O19IBb6FVnzRWR+Nw/Ul
         a6RZOrqvyCkprwIuNgtUkO3unbsoXT38m/ocZplImDuBFMzr6WZ/vgzcBLpIhfUMu68x
         cDs3ChyGfDneSbUvkDiFAmpVdsD8z7ycPsIG9gx2IBA0UZZ8TUDdpugcrebiGPkXxhPw
         DYkXFbFS8cfzITIngQQ4EeAPdQNRI5fq6Y2X/Y2yDjIRWAdHUPIaVS4aKni7ol7QLrsy
         swFVze7yoQQ2sxkUQ1REbRXs4q/fVI6Lv43ALIbcSEa3D9Va9DoQ6f37mp9GYdFinQn8
         80kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200899; x=1793805699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=az2dgylzwA24y/izomt16TIYv3wWJeHm4cQwNU3G3f1bNNQbnRTUfk3AdXetGEsLtb
         QM9dVJjYkn7ptsfDnuG4wK9Te9u20sy8LtqwOuhV52O8tCPr3f+2QSLCNwau5Rr5sC4l
         NguQpf9VrnfxiFAfGg/F4/tozE9tm5bY+1Qsp9VFT5wUPnRdL75xSnrr34rgZODPb/ho
         ia+KT3kwA3xxph1fhziJB8O6ura8BgVSa7DQIL45cbzXv1OFNojRowLwFsuKwYRWiaTy
         hsgbkyumZ/RWW+WoLJ/33Mud3vyTQqn1cJtoq6GLBJJF0c/XqEHPLKdTfY8aQvLIVsI5
         9URQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2bY7pbexwI96u0KJTSuU5CmLlndgeIUaypa3e90jcdzgt51Wcy9DjiLuRnO/Fo+nfOlIKm3qzWyXzoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI++bbHVAXgSKeBQJ9O+d4bMk1J8ow7Rx4YbOC+Tp1wEH6iYg5r
	K4kpEmsseClyXBuEaMyFQEsc0p55lKAiYvJ9eRY8eCkcaHLjB/i6zqDXjgEc4keWskFdAZzzS4n
	xXpZhHTU4NUjJBJrGdic4aFgUZveT1x5GIZKmeUH+5qAI8AEv6Twk4uWTd+U2ut8eNg==
X-Gm-Gg: AYBFou3ZqKp3t/ewD2zcXMhnDyDGQRxLExsiYoecT9DQXehtALs5CjpAFpE2Ptof0pd
	aJLrYbI51UT7zm+vzrScEa/jzXR/f7gVwtHzF2niJYALk/k+0uRjA4ehetGAjr1RFRLkQKGD9gL
	2lBJueuh7Tzu96OO/Hx5G6tMwokeipQ7Cju4jXhSYUpn+va27jCIk4v3f505gfIi4aGrZDV7YU+
	5oNZnr4U/1YrGKxuBtyB9lGb3GfexRzt3jPMVtdgFhJX8mVXtRA4LRNSZJFCreYnxXfEpBGnOnU
	EuB7Lxa3+5PSvxphA2EkyI1aaN6nwHk4WGTOgorscQr1+5ncnSCguljOZ7PY6CV61xI1codThFE
	KsvswzaetMZuNjlwUJjOS1kuh4xBxZ2nPDuxcme6YfTDpW4HQ5MH7H/XpA9KGBiRL7Zk0KHfELE
	dnWK7e3Ugl5Z2pks6c/sxxOca9nb59QQYu+rzFb9cWhRZKpgGcRqMb4kH1K0ek
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147887d50.39.1793200897115;
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147801d50.39.1793200895124;
        Wed, 28 Oct 2026 08:21:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:48 -0700
Subject: [PATCH v23 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
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
Message-Id: <20261028-kaanapali-camss-v23-14-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0Ah8iEDTYc8f
 5ENV4EVzfHEj9vxVZ2t2Qbcg45+94SwpaajyOHL//NxAFeYw4s2YBLTQbCsZoJ4s+7DkYGF3LlY
 g3dWsoQyn21Ddms6flPQxvrJuhkQVyMfptoc9kV+G/HsTLFedSEtHurTF5Dm/ubpWXcYEnDyzES
 coUKrxx6cavyghz0sZI0w2QeXFq3w0mnyNgIRsQU2bjDQMZ5sjb5IUZORQM2aOl5uaI45SDedEe
 iv6PNhjtC2SxSlUknAB7EgpGqrDcHJekje/wHDrCnMRs8/SovSJJdFOrNxDhIfrh99ECoNM9EVU
 gPJz7MUYMP1tTMyX5wbSIxJuGQFslb4iDIsI2AXdWKnvPBcBR2c4BZyiyY+GHuf19cy2C+LjTyP
 aJg9Wp512iwGbIXY8OwAHdvzLN9KCdNeVnATMSEHTtZe5N/154DD2u6bFAY6qMJLgUrz/ngJ+Ff
 WvWkCwUI2quFP/88NPw==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae21303 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RxJf0XaTuV4u9XQUv9ZTF7JehFbT4zij
X-Proofpoint-GUID: RxJf0XaTuV4u9XQUv9ZTF7JehFbT4zij
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7QCT3v2dcula
 Lnbc84G9TsuiPOGpBsDswrZDdjI6yb0+Zwaw5zoOwJy3lf7k43gM3cK2s3cpFked8Jt7Rh/rsAn
 w3rl4jKDJ1ArZCvHymjl9Y3HoNy7f/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bf3922f0ffb3..3f28f279e4e0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4647,6 +4647,62 @@ tlmm: pinctrl@f100000 {
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

