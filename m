Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00A49D5A3
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161488; cv=none; b=KW9Bm3W4oRndRxwMwQ5jx0gHtigp4qxy0twha7/rkPoN/5i1NG5SfR8SDHKyJ7ej+t5pqufLA66cry2pBx7EESfjKjApbaXuVOdww+e9UeABEj4F4CLhmM/o+yS9T+bv7ObHTwDWemeAmSeq2ZvTwYwiE0tTGTGDkliqY008tDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161488; c=relaxed/simple;
	bh=4ydu2ccoL7r4dmhIwMdua1R5h3XcqKfINUhETugo8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PktnO0FT9AiHWq2TFY0s5Y8jfGGG4NMAxr5LqVt1eoit83IbivxITDf1GWlGWap8y2I3IYWgUvlXanNw7k5PmTtaZfP+TclbNNcjBI2xTbTbWDKOPpjGRdBxm1XqNdGsMdgog23brY6oxMvC0OAtNOn/UvZfdEf/ZUEw5F3seho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC+hjRuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6+JE8py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC+hjRuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6+JE8py"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3g9I1623761
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=; b=iC+hjRucKRqaHWoX
	cvJTMHAEiu4LoU5IGldYmRXjTt9wEoL1CjXPk0r9ziRLbHhmWiPKBk8WEFZmaRQ+
	0isthONNDsOLbriT5sfBp8614zDVsdUFSIjlJQfatr6ZQQwwkq3o+1gW2aC1I0ge
	lSoUrcD0OC9RL0VJF6Jbfk+WxZhwziIaaDOxgIvVjya41n4L7BJQGjf3crP422uA
	2lWgwA2CI2s19UJSpac50MNR+oulI8UQCGIhIxE0+9mDR5DwOIwGVaB3kAsNPDMW
	4VFXlU9tDsfkSsvagMiTHyzUmStR/JyeLknurP26GoNNDjI2Ei1j5tTbHM/CWb7I
	e2rxlQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3hpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:04:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso1153955c88.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161480; x=1790766280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=F6+JE8pytOQy7jQBFLHPWoN15nvqjKOkMnX6uVo9gEdeh65kVVhBrMoPFbhEHbaSQC
         MvT1F7Uhu3DuVYEuuVmD6MSx2XnFgfLntw83X9e7pvWjNhXPMea5wDQq3BcWPB6ha/aQ
         yqXr9/wvkELABUVJjyw0GOmT63Ag7A5MqpysGeDuJIvqRD9wVNCJjoW8AtKba1bKjEjp
         8VgcbknRneAf6Pxza6bW1D2voCWlIqUHdIwzCmuDHWfUwpFDHjM6byCr9jsjciW6pU53
         YZuCwLgyBWeyphA3+jm+EMnzXsgeND6v+5WfXo4FCOhqNbwjjd2jYRC4BS3x/mFDM6ss
         37Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161480; x=1790766280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=oaBOOvo68C3idbXwaoYbKCeQe0dXgY1ok8jIIi88ZQo2dgWS+rTpQdie1IMG2a93gm
         fFeFFWBC6ymn1K0x/3IUiSVbZLdDRVy96zgi0WV65t3SixLpU9YS0/46U3cCCzFyBRiD
         w2dleZ7MlBpkUDelY//pH4DGr9eWUE2nlXP8njTiMoIqAi9R3pZqQj41l5xTI859KR4U
         pIqbPUWh3AFOlDyKkwkkySLZ0S4jQRqSE5eW9OHE77IfAOp8NIzD4tMt/ZmjT770c0nd
         Oe1DZV+fzIVOqqd0Jc7FkyNl340pi7J7X/x1M0VrA13HVgoCzzbSRV1Y739dhU6R+++O
         vVmQ==
X-Forwarded-Encrypted: i=1; AKwUvByNtZ7BwTbk9GuMZIn9eIzjDJ11Uk6gleCfKALBy7KShBTFjI2LyLicvoSuHWXrvJ0cytGL489HGE8qPw==@vger.kernel.org
X-Gm-Message-State: AFuF++mUDvr6yLZgvovORt2yb0wuUJrc+84uBN/kMVUuYM+hwDZwnKCV
	XWsSSaMmWvoruirxzc1eZ8g2eXgF5sIxZQ8AYxYdtX2/i32K7QmXRXiUWMzcZAthEYm0XQySuNi
	nB7o6eBVPBp5mrvBNRtZh1b4mYJu0gnB4Rn2wBRasOIVMI8YbyN04zs1WWWOEUXPHaQ==
X-Gm-Gg: AYBFou3odPbXd8oCT+CqH+tCmTsj+jZCqLjqpizfgTN0goNHP5EBq3UVgYfRUC77LNT
	e/ovRnjg3DNCym6RsNKB+8sS0RPgCTuDaTTfnGWS1tH04PPxwr2d5nxDxLJIuCCTOwpUKLJlYvP
	XW4sXvYWlfLWebj03kwHnmKP3dBrk1hMvOymbWfjeCw2q1yjeqA57rE8nEoxWQPeI6Ll5t+XCsz
	X0paYHDOGpn80QSsGyXmCOQ36kV422ROLePVEBUUrlcx2hP/OnrkaSsWIBiJNkVqsk63X9vJtYQ
	4n2ZuxWxe39yKyk+QkAbDxfyP/9DOQb4lBpYMj/5GiqwjJXCEuaqQc5JbeH00MmhcwI+anqXK0Y
	G18RSooPYN5au5BnSZDNCOZlxODjnjQ==
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2109005c88.30.1790161480442;
        Wed, 23 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2108980c88.30.1790161479765;
        Wed, 23 Sep 2026 04:04:39 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:41 +0530
Subject: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2682;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=V6exmN7k6wtdOoCYYQmAPRf23Vw79t137APmgsQGhOg=;
 b=L94jv+35gQv7GLk5poLrS5WPX8QqX7ygy1v5q0nUlk0ekJaN+3ASE1+kmvFyU3ggoIRuwGlbK
 b0RwcPbBxKCACpGfZWv5tQ+fJ3jmPzpTQ+3DxXHgEPqWG60au7zLOfz
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: u-ZyezLQAm48OPONoZAqt2FxHMM-maFl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX49kJYRV0etFv
 mk7mpMHJXulEoegd1CEtGk4ZG5e9KufUbY752GkktoQYbalA2x0hBAMd23BRtuTGynT19hwioKN
 Ar/uRrlZARI0ixB9cYQ0gU/JdKpHfEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX6cKttYCiPpmo
 NRDR6zXDVpMgiw0NEj6FEh1KDdMWWNxEA7FtdmzGD8UPr7pwO0zKMW2TqkbWsgZaLY+E34CZZOW
 BCb3wPvq34zlTN6FMpC70ZjZrPx0Q0on66uRVaWs62jukBfkMRMRpj7Vvv7fXrYYjfbIvp6R52e
 Rvn4s4JT1cNNucSKn6ZcQ3IW4yrhOEd7bVz20Nx1CL4EqLMdHivKzshTa5sSiTnGr/OAdBuIp8f
 N0KhzeHdPNpVRh2yGfCaLTaw0WYumuykyBeTe2wfJ3QiotCxuqTTo1tg4sFsFrtGBRhuHkJcLl1
 TvEQUwzED5rUJ6B5aY+0mpudkDgwY2PwocZ/9FJgoHZttwx4aiubDyalBWN4KpueCzPBiUSxpjN
 Wg3HsCiXaeg6iDbtD11pCpGfo5N9AX3hqRVhZoMqSm8yAFoqRpzYgXtOkDc/kPFoL5/T2dvhNT3
 AG1y4XJXZAhr34EEJJw==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b249 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: u-ZyezLQAm48OPONoZAqt2FxHMM-maFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
sensor reset pin states on the TLMM GPIOs.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9d426886a6afced6d3706b629e620..183c0c7a7595703113cb709b0e9f39ea5dc339b1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -781,6 +782,60 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default &cam2_reset>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		afvdd-supply = <&vreg_l5m_2p8>;
+		vdda-supply = <&vreg_l7m_2p2>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+
+		port {
+			s5kjn5_ep: endpoint {
+				link-frequencies = /bits/ 64 <1248000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l1i_0p8>;
+	vdda-1p2-supply = <&vreg_l3d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&s5kjn5_ep>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -937,6 +992,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 2>; /* CXM UART */
 
+	cam2_reset: cam2-reset-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.34.1

