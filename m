Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655978;
	b=3hnK53ExzB+f+tGOaCbL2EG2odnEa/SQLTolcEFqZTnw/GITjnAGB9sX5+g0Fm1cO0Pr
	 M5f6CeKt8VUX2TKxMtfrd7p/z6Gta92G5wAVX34SEoIME9E/FkPIxHo7EK+rpHSzwQ6ik
	 kaS9OdwxzAdZgSIPruyzK3GAWgqlsKAQopzecf/MbC4AgR2fo6pDM0sUdG9dlLyO3gmHX
	 d24IcmPv5vFgcw9wd9yKdYhbQrOB1nsD7va91Bnf9+khooGDm5UMMGDtWzGv2Qsm9yz/2
	 av9iLnUaQcj9FbogGyN3Tu4si7c/Q///mDz0BbAvQKua244nQKixhdOIqbEMHvNnqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u4Oly2ccZ0M2EddE7iLjGix5zbXSWGoTjOlAUxiJPBQ=;
	b=a1SLuhqksJbfBv5GMbYrk56SOWTdMFE/4X0N0WYx4R1fj/8xfq92x1usjPnf3gqwknr7
	 EnkyVnJL4k1ZBhPilyr2NTyVReld+RK3ljjOxQFUHjkfeVgP58eFLgXGMz/ig7jnhRmQX
	 XFd+d9fgBtVx8cZZ/De4m8NXFlKS3FAsuXRLNkYswPuSBcZnEZwzMmU4XOSG9H038CC+w
	 1oH13ywrpsOBxiMdYYPUv05e8PgVLFH1V5P11R7z7gYdA5WoHBU9tTnjwBrFcPIkW7yiP
	 s9GvgCvmQY3vIDe/czxOlLfXAPmHcYHCbol3RpdX2va6UqHUvHr+DMRHOOfnbdhw/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O76SxMxb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V6p4NkzA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B7606A332
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920B7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O76SxMxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V6p4NkzA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w4JZ3164174
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4Oly2ccZ0M2EddE7iLjGix5zbXSWGoTjOlAUxiJPBQ=; b=O76SxMxbxeqlf+/s
	J5QM94qjLwegqGbaM40Cw7rgwsy57fIpr56y21gmRl9DNlFjO6/tNMNE6zDPs5VW
	zVajAGdTmtJR4WV6wAEev7xuWLHEMtATm9wf0D/sKSfo8EdjjhjfQYt+0bpXadHB
	iHsDnic3pLaNFyZuor4ev4l7so6IlKkz49BuZs22q3MxFLiEj9TTxVPswETOmKS2
	o3rQJFMSO0RM/uiwxhnDQH/CUyYMrZFRL0aOUoc0vnKsJa69M5dvzvQRYAy37wHl
	Pr+33+V5M6WeB/nBktPzS/Ow3nTxdIGkZcVMuPSfITkwCc5QVAJ36I+rIfaWzuHN
	ngsWlQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8m4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54af6c38092so20318891cf.0
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655976; x=1795260776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4Oly2ccZ0M2EddE7iLjGix5zbXSWGoTjOlAUxiJPBQ=;
        b=V6p4NkzAR77VuRzJMp+WfbDPEnA3B9a9PuooUvBGVR6VsTEFtbnW61oFNNWF2WEFAA
         orms+EkxFlKu1S4pNSfZCi5s3sykuToCpVopESdwIAx7AtXbN9C5sWGz5ylbKhVUvJfI
         sGv2JEt0nN8GLZvMQrHSSw4j400TVIujRE556NvNfpD7g94BPnVrMhjUjKkUgrQhARJV
         M1jLkX9ZovvfJbsJI9vWk3HJ1bVek6Ntq6EwFWguSbT3X8ycJtYZZBz02B3LOPvMIeQj
         TAdDoOxcYdeCADsWpO86+mYtOn1KaXHdhrKmC/QsPEv+uaatxwpPAxsfwMY/NtY3UR8I
         F8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655976; x=1795260776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4Oly2ccZ0M2EddE7iLjGix5zbXSWGoTjOlAUxiJPBQ=;
        b=KDJ8QVYUzigRXZpZveOCkEmZDrfV5M9lSn6SYjp38ByVqk6DAxCjuLCOcymxG3LD90
         J9/g1oTLShH2mOKWEb23ULFi6Z6vaXeAOGHn4IWHE17TYieWJldsr9zsZqqyWG+bf3iG
         xw+uW/ZZpNRKDI7AeLH1nIg3DbnmD8A2DftxLSpmb6Zo6e0j5RoKyP3DRLmnyH3SzHCc
         3rm+FH5D4JrE9vogsXw0m/7pCGCigxJqgpLiq6nuhLiOqgrTws0FVLB/VBLQwQ1c3nDf
         KcS3OXqagj31gWIEe3ddkGD1kSTZNHGK2167SS26nP7yVQWYLyBVOKIj6881ytZ4jv7l
         kg9w==
X-Forwarded-Encrypted: i=1; AL+hErE/+0EaJVsEXl5yFhEFNiqPd5V9DL5wd493JG7VJ1Hc115xJzuyDDaqT/Q++wyV6b8dzfVfvs2AtbpIPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JzkclBBm9p+MOCXGwjwbwKa1a0zCkq+gQiDOMB8jiwLIUYBxP
	pXfT2LPg9niPZXKVv2QwczRVbmqeSMDyAY2PruN2upBBqnB/r84jaDmqUagQ9lHc3neyAv4hibU
	ybF7CO4mzM6ExHtQA/mtcExwfS+lCf3bWZJB5W9waavnfuJlmqOfeT9tES8/8FsyA+g==
X-Gm-Gg: AYBFou0UZ4fcT+LewgO0vMuwgaIcEK94U0vS1MPhKApsomioPWsud+y4OZUHN0AyfO4
	Jeey1e2ilRtNbCIYon98teUlN+aTE4tcY+ArVjx5rycFw1feoPmHMOtAjHRdY8DxseF+DZ1fNMK
	wHNMIomiIISeLnLtYa0vMbOea7LGxCSRy4ZQmjCRNiZ0Zz9DJT5aB5smhbCtf9k+cA2B2pfuLVs
	XikzmcR7WJzQhnAIsBjL+bqiBRgc8P93++d7kNukbFA8JBVVVRxZcveC7oEd08DAgwHptrwJkBy
	tY4wmX2CAMAj8GB8tWwvPhHtxg4n0sccKuK8OqPOG9QNN66RCGntv5Nm9AT+ikHya1/lWM9qj/u
	fQU0HSztovOF2CQiXg3RKR3+RLA2Djo3IB3R1TtR9NCqjMqBrDYUADpIJoiSv4ktzldHXvtM1OI
	c9NBiuqQafS37yIqQVTusObIEyHb76uAcWz7nkuO3y
X-Received: by 2002:ac8:5ad3:0:b0:536:3600:f0af with SMTP id d75a77b69052e-55ac4287a80mr83819681cf.7.1794655975594;
        Sat, 14 Nov 2026 03:32:55 -0800 (PST)
X-Received: by 2002:ac8:5ad3:0:b0:536:3600:f0af with SMTP id d75a77b69052e-55ac4287a80mr83819451cf.7.1794655975113;
        Sat, 14 Nov 2026 03:32:55 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:54 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:38 +0800
Subject: [PATCH v7 21/23] arm64: dts: qcom: eliza-mtp: Add PM8010 PMICs
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-21-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=6334;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=qEA/VOZEPJj9FtavWPFngGillqdti7IGX6O1SVnmft0=;
 b=kbxzQ1RziT+LGmz0Ob2zzYDFbcTHIesR5ElhBnfStyGUmFJukhp8flA+Wb/U16I6rVwR92MUq
 6B2Ut4Cu1vVAMopCz/TUd+3A6BK9sBSnBYOoZNcxME7KAFxLrl1JsUY
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX1GIShS7eNmsf
 tc7Xia4DbDITKHh6MMlmLwBkfx5mIFkj2ZVw+ByxIVPhdWotwm7BYUN2K6M9Lzg5OOSyx+a5p8e
 JwVsEbazbNtfwJAIb8tWuT4zjZltdfaQ/jO1AaUyMeomaOb6Q9M+RUnkpShR1L4aABgNVin7oGs
 8C9km6HIBJfiQS2KFJxom0Yl1he1z/C0gmaPo10LSNgf5yzSpM2nLnm577LWQgYOemQ9yX3Jzbo
 qzNHgq3Z47jY8XDY6RGzmG4ifaHYYxddKzuA3j8Py4vdHOPID4hhDeh4kA/O8qI1t/VsH6U1uIX
 43xDIPPj1Q8VUwJxbt2nTOoXIZo/x0pd0e59xxHukIKf0028bfb51i1FQ0UJ3Mjtwxp31/Oi7Cc
 PHXsbmrZOuluO00dUG3dtKYEYK/PAnFW0SsgMlR+OQo91VIY9i0lujQpfhLNt4g7jXOrTY41MJc
 2NYuxsV4rvh1e4DlJPQ==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af846e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=THGDsv6KT5CLo26r1dMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: akjHqXTezNqAyL0-c6rp3byMwLA8MwAR
X-Proofpoint-ORIG-GUID: akjHqXTezNqAyL0-c6rp3byMwLA8MwAR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXzw3S/QoIHQcf
 zTg4qNZIer5JwQeEoMfn4mR/1j/ScrObk03VPs8gdwHQuN604d3KIg0bM9a/mJ+PQp2GPBLRok3
 lqWyPLWbkULWhGTwjaU0YF5SWGj6Rv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

The Eliza MTP carries two PM8010 PMICs (IDs "m" and "n") that supply the
camera rails. Add the pm8010-eliza.dtsi describing both PMICs and their
thermal zones, and instantiate their RPMh regulators on the MTP.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts     | 116 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010-eliza.dtsi |  81 ++++++++++++++++++++
 2 files changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..af7450fa2020d29a4ce98eb958dabd0cd8c61860 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -12,6 +12,7 @@
 
 #include "pm7550ba-eliza.dtsi"
 #include "pm7550-eliza.dtsi"
+#include "pm8010-eliza.dtsi"
 #include "pm8550vs-d-eliza.dtsi"
 #include "pm8550vs-g-eliza.dtsi"
 #include "pmr735d-eliza.dtsi"
@@ -420,6 +421,121 @@ vreg_l7k: ldo7 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-4 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+
+		vdd-l1-l2-supply = <&vreg_s2b>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_s1b>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		qcom,pmic-id = "m";
+
+		vreg_l1m: ldo1 {
+			regulator-name = "vreg_l1m";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m: ldo2 {
+			regulator-name = "vreg_l2m";
+			regulator-min-microvolt = <1056000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m: ldo3 {
+			regulator-name = "vreg_l3m";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m: ldo4 {
+			regulator-name = "vreg_l4m";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m: ldo6 {
+			regulator-name = "vreg_l6m";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m: ldo7 {
+			regulator-name = "vreg_l7m";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+
+		vdd-l1-l2-supply = <&vreg_s2b>;
+		vdd-l3-l4-supply = <&vreg_s1b>;
+		vdd-l5-supply = <&vreg_s1b>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		qcom,pmic-id = "n";
+
+		vreg_l1n: ldo1 {
+			regulator-name = "vreg_l1n";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n: ldo2 {
+			regulator-name = "vreg_l2n";
+			regulator-min-microvolt = <1056000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n: ldo3 {
+			regulator-name = "vreg_l3n";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n: ldo4 {
+			regulator-name = "vreg_l4n";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n: ldo5 {
+			regulator-name = "vreg_l5n";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n: ldo6 {
+			regulator-name = "vreg_l6n";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7n: ldo7 {
+			regulator-name = "vreg_l7n";
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {
diff --git a/arch/arm64/boot/dts/qcom/pm8010-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm8010-eliza.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..7fe414970b27c483706c86491c4db124bdeed43e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8010-eliza.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8010-m-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_m_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8010-n-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_n_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm8010_m: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_m_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
+	pm8010_n: pmic@d {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xd SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_n_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+};

-- 
2.34.1

