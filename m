Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C2C4052B1
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661667; cv=none; b=c2VlKd77q2wv0Y9JOTfFBZFONsd031uan/nrbZZbOIaHZkQWrG6xS+TuiUAisTvqb4Qt7bjD1o190HKmA/RaBkJbGVFaBb+68jYAI6Ol0yKYPu6H5G+RiXyuZ/e6yEsfKtrNrwoRmyfE5QbxAA9MkULxeMciNWSZ7e5lWgm6ucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661667; c=relaxed/simple;
	bh=iovijArgB318a7l3xUFUNAzpCzIiXp8ZrUo/Hjik6/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjYYKLfsa3N1QY+DqibtbcFyzyv1bSg+U7p7QgSyGGOS6akbkl9f+Wqyv7iZNbleEwxRh5ewwQ+qmyNlOxm6vBFOUtUoZyzL9IQNykBy0hNatK3NXjJTcrOfYuVHgGfeRWFK015xfWIJbkWXXeSamrLfr1T2kuHU8reX7aK/UJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCRmQjQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjTtaiiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCRmQjQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjTtaiiS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47fuP4052905
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42TkaMUzlkxSZ0MxjEoP6YIqSL8IySzV2mmsgo+QOd0=; b=QCRmQjQVXY0prCwO
	vgFfizRSfu7WUjbf57GDoT3gnsZRBw72+oolVkoSNaAn1igAya3k1E6Q7DM9RRx3
	p5jiOy9VQpAsbCTySwgCCqG2IDT4YxX9YvpQrCeQTYzakE7ao5pYP5z2L830nMFw
	ZmaWj2q4FPTvyT2ET8zAkrkZnYlHFYlfhALQO3cw+qEfKuiOPCcVcaaKulJMI2bn
	GEYcrJrUTAfqSXDjvWx9JPNXKXMHdWdwWdekdr5ETwkDd3dfmeKbcJM6BRxPYRiq
	dVq9rqW7l+mmNO7qF05M6ryL5wqoOrp6FIn7gIY0SQQz5/jGr6VEXrYt5/oGS4rh
	PMd4HA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxgcdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:01:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so5436741a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661659; x=1791266459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42TkaMUzlkxSZ0MxjEoP6YIqSL8IySzV2mmsgo+QOd0=;
        b=OjTtaiiSCraRKzbShhYmxwf/eGB/zo/EmPrv2mzBBYBtY9jjBa0AnpMtWa6oKBRLyd
         uLrwFGwZuAzfoqxx7rhQvdxYJPd+636cvaNEN90kHMWpthOmMd+lfE9kOKGPx87hx+ke
         wVvU9neEBt5+DPMEe27DVSVQun5R4J7qUDB+dTPU3dSui7ogks/NasbrWyuH3YsTXMJl
         gPObmoyABqS3ozU9fzvf2FwQsvuCL9zuEFXGNdsYmtrKlGj9WJm+5q0e3SCpxXumORFQ
         hfBuPy6NSBwB2wdxTEQcekw4ziOoHegxOxfJfv1TykGXU9ffAJyENN8LJ8SgDXGTAp5B
         ClWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661659; x=1791266459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42TkaMUzlkxSZ0MxjEoP6YIqSL8IySzV2mmsgo+QOd0=;
        b=U1xefiNDfW9S6EBQ8IVE0gPDZZ6Gm38El+JNQJxVqJkN4AKO8srwUpRGIlRqzJR2by
         4oUuWXPIRKGZaQt7nM3zgY/V2iofy++GhTE9pOOO2uQuiVUbfkqP5HVFK+2hTcMJMyjG
         gmbNwnLumqdw1ch2H/G9p35CnN7y7d73b37N+5BXlB3x6gdZWIgUtI+CiWCTNhUz2OCO
         YQn06yzKfkId3Li0ZmViocjY/5+pa99zSZTFOA3gD8IvFW0X15ip47YmZyQZ1APbv3mn
         owygWLQDxDawzrUlsxwk5t2bkSj0II1OBNVqrwfEqZww1KTNHu7AGp4j+6yE033dBWoi
         5kXA==
X-Forwarded-Encrypted: i=1; AKwUvBwNKwBLQFBqByj+Ut9QZst7Z7DhhdHZIqyVXnVrKk1dCZ7lKqmGce7/ow++yuc/oV0BSve1AHVAH+14YQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJG1pXgL9VAY5jLL0VPsOQdzKjJBJh/DUNNkKpNbWaD5NpFbCwp
	76MIV37dkJPNMZ+svQQ5jMC9Zm9cRMvcOX3/460fwRqv6NlPXF1wDZjcZRE75rF0AMpqQP3BmuG
	4vuqkJXAl0GTjlNjiNlaFrjx4r3K223TVe/h6tVzD+ycPbvwDlZRS/DpOcPARZQrVow==
X-Gm-Gg: AYBFou3guBF0dKK2J6lUxAlnbDPkG48e9zo21rG1vc8sAEeHiKMZqDnphaAxAMoJCrA
	24Td5c11Zy2Jr5BKaF6KL39HW1xO02Mbq7Kr4oSZslCumhxxwDyHqkUgIgz6HZaOtFDuZ8/X+6j
	qmkvLqJ8PQKT1P1No7hOo7/FdTLS3un3qdeqnCdDrmUTytLd2MstZqsPLpctSk9Djce8qH3ES+n
	v/+f7LyHUFnf177vjISkKLrnGNcsWbqFLj17WFmA8PcDukTYf8jcKGjM03PdKfc7gaE88mU2iC7
	NATtaFuuqhcCukk4o1c7Snm/n6qugSUm3zlBGP5YH4uBXhzNWo7mmKl74CoypzaUAIr1Bf5cuy+
	UN/X+t6iTFWPwTo8y0eZje8hfHp18hLI9338WwcK966yHa1TX5s9zgw2IW8MBtnD48ozq137Vlb
	3jLqOO/uTohQ==
X-Received: by 2002:a17:90b:1a88:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a098d47682mr13226993a91.7.1790661659319;
        Mon, 28 Sep 2026 23:00:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1a88:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3a098d47682mr13226952a91.7.1790661658584;
        Mon, 28 Sep 2026 23:00:58 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:36 -0700
Subject: [PATCH v17 10/11] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-10-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX9iTb7M4eZqH1
 Awku6qRIwoeb2EZzgckPyhZaLxiDqUwn55lXaFc6ZZ9HxsgsrRr975+j5KzMpP/gaG96RKSHule
 jBCdv/OipLHGxKgh+dt3XlR6COK7dTU=
X-Proofpoint-GUID: ogiiVCzQchTwbnEy4u4pNtDCOAEqwxOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX6b6W9FSPiUAh
 AU190fez5FJzbqVM7q4UKpMETvVjpT9pZFsxSpzAM06ELOkgSFi79myXhdE0Ik5ZDXZVUqWKzXp
 Cx0z2TSPP4Q444klHFt4D0V5rJY74cJAYMdI0IZ/Kp30plHOC/OPdUnPFYEBbaIvwMU1NBKxeeT
 JOW4fMipmBA2vWBh9MwnNqXz7aOf3cXRj3SWex4wp1XjFRd4XqxtcPxR09n+71v3nV+/MTf3aJ9
 kxXo2keKAlNxeHUq+O9CunQOy5jHXZkYZtv/T9w9QrbZPTxQRfu7lkmOJpWX0UluYnP+ZqPTVBA
 knuDm9N6luJsaI+qyIVFpDHoDXwxcgp+monP1+GEaTGZhtaq+NF+0cyl0bDcUuP4qVHU4Fkw5X0
 k22WvIKUvH4iIqd1HbhxHgJZkAmR0mblL//dmRXd83vr2WNbqwwkLGQAfQJlN5gWD4kkOhAR+0l
 32lEEDRUUAu425MGu4Q==
X-Proofpoint-ORIG-GUID: ogiiVCzQchTwbnEy4u4pNtDCOAEqwxOt
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb541c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7a80438bde57..c19945bc438e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3747,6 +3747,117 @@ port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4457,6 +4568,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

