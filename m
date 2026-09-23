Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724449EC76
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161512; cv=none; b=TJ0jN55f6k8VeGpw7Ho8KgBAi9AMg4GOXg+qdNtQdqHqeUOK7peZD67I1BxKPNpnd2QxqEhANOIq528TehBumd9JC3cTvetR5p0Wg5gVFK3iZuF0lmuM1RxdfaCxTBuvsamhSBJ40Xv3WU8VGQsEfZM2QqMhBls7FOihnKmm5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161512; c=relaxed/simple;
	bh=npxXC/2A3nQUucjpT0p08dcGaxkVim326juc3Mpe3ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQWPRXfjP6Bf/81qKnUBPYbZK9vfPhGPMVyCkmTRJl5GpzQP42j79MyDvcFKU75HytKCFC/DlNTjWWLKNBxZGbk9FugoT+nHHz+ZvVSgVyrMFbDUMo+yKgglD7983WA1wofBnm+eYwlAZM1/zijC2sG/Iaa3DT5Jt3Y/hUloYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4VripW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9reFQUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4VripW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9reFQUX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2iV23208452
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=; b=G4VripW4A6ljkhaC
	4C3PuwSs9z0k4I1GrfAA5khZt0Z8cjP2xuFP6AYGbrk1W6dTS3OBqnRyQ1uPzEgs
	3Hyi5ZFyxnGDj7GLPGNsjGZ2cWa6ehRpkOC3ut/DzLJBQjY/GmilDAf1goEdEV7r
	iIoracOj+DmuecE9F5H+tkQVR7qrEV+/S9vYGYiS3wA5VW1j8mtXbnM+OgOb3lBN
	ns/QlVouxNZkLmLftsEbnkb9klwMSBWDVYi9t/yO6Rl1dpLWCWwnX2aEDZtgMQsI
	831Aeso47xmUCQEwHaFFM0YtCbqsJWuXFaCHwiMIZZ4rMd7FjtSzA6bmkT3Dxs91
	pUSVXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1mwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-331b2ec616fso2937629eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161502; x=1790766302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=;
        b=Z9reFQUX6KrYwIwTvlZLa8Kf1P5PNZCWMTQptQ1T/zMwrYjyALxwInDYMqMhDw7Q06
         HP3PZSNoZvJfqHK1dXvFQY6OXOvJn1X741noQhFwopwjqmz0jr44UrS0pQnT/JSfWoP1
         Bg8LADLI8BvdczxisoaFoi5b/N/yvR7ByRfYT4KA6XcV7cP/C2LFb4U5gm5T7hzEh6yB
         MLyVFrUZUFn2FUlO5riRJFBeNcDE8nf/VvIz5bZDj+zm75hjuEvbddFhLSY8Q6vvO95a
         AlEwLyJTpYIeTnawcoFMuwgGNgEcRPQS9Mp8SKG2ts42XK7ZfZ2d18IWTvUYdPdiPpxn
         JP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161502; x=1790766302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dD+VmVixjFFrk3iHvh8FDxDS/komPYN3IGSBgS08bOY=;
        b=v7OnLFCa9aVzg9cbed7dfhW7na9XGAaQl2fLxm0+MMy9ZN967vmS/AMrUeFdekeMLI
         pPLFrQmBYmuTVl7Vf0HBA9+jRpb+5O3ycmMhfDjT2DwY36c1lWp4F2gNG29dokc7Rl/l
         XzDi4amxdsInfofYKtGQgHAu3iPxq6iCnvqaUkEP0/RykijZ6d4ZSXQb4RPZ0IXLMbkJ
         AvWnXQae6yADv1PPC4cSWhc8ft4eeCjV13u6+cHioNWAspvg0Q3B+qj+gohW5cQt4V0o
         JUCwWa6rdrfhO4pOB1f1v4/D68/yV7W9GyWyEljYkrHP2piQwMN+kN3rDkl+yXKYsgbU
         3W8A==
X-Forwarded-Encrypted: i=1; AKwUvByiW3bfVpAYEfO0zjqqPN/Ff/hvi0C4BxTnmT8Prh0lomvmDcWPk42G0kyAQiYVLBVjUNikTd5munB1bQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lHeGK+QEmsW+NQkFvIUs68+DzMGN9Z3nOUmqKp8SyuJBF7SZAc
	UJRJQQF5HB1m1T5QPFNK37QwheA9sxZwdKfINJ0zFN5ZIRGuaK76hsmdpNurLVE5P8SkhfvHgJ2
	qvgqtG9DDF0YV4ZdsHQBYpvfG/qh19nRJ7lFYK5R7O4HUMiIlqWmEWgJIkhADJLTjbu8tCvMG0Q
	==
X-Gm-Gg: AYBFou2do8FvU3+Zzb3Fpw9nAUTLsM11ecvwodYhujkzmqrZx/IrbLXnr5ZkkgAOs6/
	bZbKdGnIXFGvr/6upu/3oM3wH+gg1dKf+30qU6+2zeokYTsDev9l99Hu3ZuI1vC6bYDemTCcIZ9
	oDH8CAcrkgGjnU/1vtA4pf5EwzMs8neXjyEhdeEt0eUQS5L8OV1LMfsyBvctEqiZSe0tmgGHPez
	Ltne9OPEFsCnWzCiLxXatr10ph9ejPLsCBZMlhP4YMqEsmmyNNCVUsw6mz1miFNOi/xJZAoPykg
	rTVPCZQPomf+qP3W0DjdrC3cvEc8Ub9OEhN1FneT9eUsjVyjOfkzvB8qB6Loo8BtiBUg8WgCsDf
	9yaZSHvcPg/G0sS35tvWSIvV2U2+CXMzQbZ5YI4AR
X-Received: by 2002:a05:7301:5414:b0:33b:de43:4aa with SMTP id 5a478bee46e88-33e8c442e35mr2309704eec.12.1790161501984;
        Wed, 23 Sep 2026 04:05:01 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:33b:de43:4aa with SMTP id 5a478bee46e88-33e8c442e35mr2309638eec.12.1790161500470;
        Wed, 23 Sep 2026 04:05:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:05:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:44 +0530
Subject: [PATCH RFC 13/15] arm64: dts: qcom: maili: Add camera MCLK pinctrl
 for Maili
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=1581;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=npxXC/2A3nQUucjpT0p08dcGaxkVim326juc3Mpe3ls=;
 b=YsYtcU86DYgWmwtIhOPKFQ62Yj6nln8+PucIgx2mqT1gc9z47yTmOl7/J0PAAk8yQROqGKfV5
 +iJtYg1/j+QBMO/CAZX3SWdow7ORIcqZnKmRkF67Le+COWyQv1Ltlc1
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX1BEQe9AS/7LF
 IapcCqW/r7QvzOEIx1P88iIcE2BywdQv9O463Qud71LghS76mvREXgT8w8JlEW6k/sP0lckYHhT
 COhlnX3Mw3I8jh4D9/RkpkqLFDirUdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXwZY4EibPZoes
 WpJJjT13j2I+YqoNQTMCtbjJbu4zGAvdNELJ/glZcJlEihOGZnk3bAXkUeBX8UaJVLrKfDg5SCd
 JGeCFEq10ai8T5IRUsHK3CpQCfqtcei6F4h7+R1VYrW08HQyD/anZASFGYCvY7I90v5GVsH9PhI
 Ekpxcrkot+oEpVxNmtkc51res4kincHvtnxTyBCuOHEzyStBi/tn3M0M10BpGXXyCe7aNwx8Wfz
 A1wvsD/CguO03soprj+bipYQGMRzt63FG5b0RIFgbW4oPdPLkPaGol14MKBWi0oKjh1EeVe3Y0m
 sneEdkKSzW2KG1nGuClkNG8c06d2xdhg3FJ8KpZm2f/Y7F6jtHrJ+n0wcF1lYSpdhgvr39pmTO0
 tGKOGWP2YS1eH7Bb1CnMOIeJiz7HKP284VPknB7hh1jf5VJQsUIqY5H4As4wh3qwaYLL3+k8ix7
 0csToNSXRB428BTafng==
X-Proofpoint-ORIG-GUID: jfg8A0M6VnbVdo8kFQuLBW2Y-uUD9pRe
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b25f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-5ruBYKNFaXfuGS5u4wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: jfg8A0M6VnbVdo8kFQuLBW2Y-uUD9pRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Define pinctrl definitions to enable camera master clocks on Maili.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 8d5d64a23642cbde51ecb6c7377a5eed355f0d65..a73e0548f9ae32f64b3429c05187f9529bead616 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -5748,6 +5748,48 @@ qup_spi0_cs: qup-spi0-cs-state {
 				bias-disable;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk4_default: mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk5_default: mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 		};
 
 		sram@14680000 {

-- 
2.34.1

