Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021076.outbound.protection.outlook.com [40.107.57.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C05471CF6;
	Thu,  6 Aug 2026 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017798; cv=fail; b=IB/uW6wN0B8BlAVTC14UXH4hV2oS79ZXb2MFB5W41VNTgG43wePhf4aUAkKKuSt4kTANZiE7DC0bgTF6XUrXSF3dTh3wODCTQPmrQps4vY1CT03XcTuQY3wE/ixnoco+EQGynJXQGi06yrJuj5rpp2I/audAMGnr0a1C5uDaptA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017798; c=relaxed/simple;
	bh=NvrIF1VWHPD2cGrbjpu+JxPFy4LAKk7q9k3fnWA+q0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=frlBpYUQEIzwpbY5VkMZPxC81Q//3jQWnN2GhxXEDfqJVzTBRdTukibntmgUFWHtVYD6SakPudPqhfAndxUCAw/LoRWzUSRcgx4cWDq7c5SOBW7yZCpJer0kqBn1LM4cYhTgyv3acZEjKcRRrj1oARwDXXhTBFo0BAlyWTXBCtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=T8tJFDxx reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="T8tJFDxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYnQu+NRK3CAsd/hRkkNTCG6yHQ2iCHool4YBZt7JL5f4kIxhVG7PX15yPhssxZJbk/4QOoLpEVnM7Ruwgt+lsPkAyPAf1W0VF7lgZKPVrYRFQhLVVnpByXQtsMduIXikHl10xktDoYFUlwvM4jL7gEDmXPnhfP+lXDGdfa4/3/OPgHk//ewA0oglrBA7Jjhnzs3gTI32pylstzkGib5sJF64l1BaL7HKpRCuhuyHccT1h9jaP1xanNBG9VPUM47S4WXWWtijYqua98OIcN12lLSYG/uVy7I5n4bqff/Xb9WPDG/VG3DV3hE6/cyKxNHq+gqOZK3b6rUmpEtv580wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqDWnbS/3DHYupEEGbCVd/KzgBdOQ1ppDe2O4EmqC30=;
 b=G914R8xR7nCtA379oqvP1hlUKZYa7r7yIYx9F1n+7xyIqQrnhiiYadNo1ag4mz3PeBF+oMNNPbRvHx5zW3bQUnQ4tNOA6OYKTXXj7K3iSggkFeGtv7H05hJ5AXwGzTGJaoOScws8BBYsyfm768PA5Qqb4I/xHlgdbIiUzfAMRMptg8ImzPu3JJrYlMK3+SINXxWp3WGmg5WW1I6CW16uU9CchR5/eHXKiHi2cAw8aoxi4u4nt8ARrqx2xHu12wV/inwMvikh4JdqwD4z82E7xQ3MZ1auopN25REpbU1FSd8jxDrNqrRMlRx9PQaT/ZrkDoX2dJMHbvirRvE+wcyUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqDWnbS/3DHYupEEGbCVd/KzgBdOQ1ppDe2O4EmqC30=;
 b=T8tJFDxxJqwgr0vAj+imO0oAX0VQ6NkM2l40IijH2k4Iw9o+no90CK8uUGmNfJcFzGv3PLUNBuBiODwCcktsDRj8dPPObh9UBclTYvYDFcjYgpta/SMpiBcJwGbx7p+2EYxg6FftJTqoxtgFZFyX5edtjj8KF/eUGAlFqy9ornnADHwKJXagQYgOymWbhUXFUlsaT8rWzs5zw7THACSk/KRR5sfp+dKg15vrvjav/cuYuUkJbeAVsJMlCa3hzWKCN9Y2rwy2/ZG7DULM8ruhdFDsQGv1odSpCrXz6oeKr8ZNKVmOGu31Y04+tKMvX0e09SAx30OKLAdEqHsoqvz60w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNWP287MB6109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:03:14 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 12:03:14 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
Date: Thu,  6 Aug 2026 17:32:09 +0530
Message-Id: <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PNWP287MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b10b22-3770-4622-3ba4-08def3b2b168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	75pVZUFiECmWDxqa5b1iLAdZc6/AHtPJI8cjMn10iDnt3Sr8+fQxIG4rKDqogdcQDYy3zKeqc2lwHYj5UrCACq/ZgEwi0gZls2hBiVLAgR50Onx22Vn6Y55czQMbrOyMtEhWsZEjkiCpIy0JWGeiG5xIWchJiTyYSTfQSuknxqMcaNuqI+vq0c0NxUe0LhCNqDHHn6+dr1jhVUGqv9u+S9qDqFHPq4Inf6i0SZrlyTuHzUNK43N0dOQGdsmHLQZGYDkESrVP130z+44f+eeMHbShHx6kuJRyoSJUUQ/FjKo4aOOQXO8WsnE0YjYWvN3utC4zFanWiB6i1fT9PfnItLCp/miujuge00fYaUIhsdLr8r6K2KF0fksVgMlV53ewj//OCCFaQOaudlhdCT2ELz1Y0WnKzUqqTEbjrjUxlDxeBThfqm/3YfBOFQlOMpe+5tMnu/eDX8HGH80k/u01Poi867xmycKOVHpMbAxV2tL8lQgHvP+cBQkOqlN05/g4vZEMZLK1BtWqLSLuhf2AuoPwQKBaMifRMYRhD4WijgAWTUcXzJ9l1xUaHrYHco72c73pQzYWxeUVxFn5xVx+yTuIJ96F4tY/H64x5SL6D5kJSj50VFwPJo50NOtKiRu0D1F366joguGEdaIbEyQSV08AQTlSfgRKclS4EMAITdaoFAeoPdqnwv3rm/mWqaBASxKmtW+qg4FLDPvPF6OPsLw4ltcmidxFBWLsjH4ShPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RI2O8AxvXR6Q7sE+0uGfpcHwJW2heEOszuZ/h1P5pc029hpbyet8MKFtmd3c?=
 =?us-ascii?Q?OYoMhzvBT74cLTsfOFAqtz2cVR5SVXx+dIhKQ1Esank+wAB9pG3NIIVbrMsy?=
 =?us-ascii?Q?aJK28bgJD/kTPU/HRE4mkgx8OTAv61FmnBt2wxAfyMrpe9kK9bLhS8taD5Sv?=
 =?us-ascii?Q?AKvU0m0G4kmXdAN2Mt1bL6eSNS80JshPwHWiV4ewF2uH8cu2c7njrQqF/oVt?=
 =?us-ascii?Q?yHC66aVW+AHZb8O4t4cnXNuvA8Hzqc/JoMh7ZaHJoPf/PtgvIGhC/cqY2EdF?=
 =?us-ascii?Q?So9YJopCbOmDmMjp1KyD6bobOhtA8qySIMhB1O5LAXkwjU8iGmBTD6HmJIyq?=
 =?us-ascii?Q?7BVgAmAmEEmQRK79g3kGDFiK/q0RkccvVqxHSWYC8NdX/DO3QbfqV6Mw4vnm?=
 =?us-ascii?Q?plILeCDcWAtULetKZix1xbcscZspZa2m1rJ7DiIBw3Ps4IdvUHYgO50cHVPK?=
 =?us-ascii?Q?cfHJDYIiy6RRWNB4ADUibtoNwxk11FtlMI5LbNn7Aj448vWnoUoiKw5vFj3u?=
 =?us-ascii?Q?W8bkNzrdXLKL3Ea1JSxTaMqbpRTYAPYYfFGUHo38NoXDGIKtN2+q7HgzmrGI?=
 =?us-ascii?Q?18+OJ5Luhrejxeisa4LvCJoRpS4o4Rbn3xslIHji4rCFnYb163PbVvz2Og0a?=
 =?us-ascii?Q?SasJHOi8NbuAXj/HxEB215ukPHVzJPPhWP1qFL4hRkN+94Fd7ECJGnZW9DBJ?=
 =?us-ascii?Q?jndiHmxhiu2ktR31O5HF6J8yw5q9C+grcflew2/qEguwXAqvLai2PpV2u9tW?=
 =?us-ascii?Q?SkITEj4dYIVVMe0pmr/e4y5qgHSUjwnkdlemp4A1/VLJbIu2nUFq+3dNBuZM?=
 =?us-ascii?Q?3yCbUCmLfEvHXDoEuxDc2lWMFFpb0s0qfsmhRGXBGdVfs2JcByxI8hQzFYn3?=
 =?us-ascii?Q?mwYEy5VAk/IfDRw1kFo7KmzTt/QjgXtcE8gvE/RFNPxfD/QFS5JlNJ6oLEuP?=
 =?us-ascii?Q?zR0TNBncwRYX9xY2bLUkwLFQwrGRO/YeF17yOMcu+4/FEAN14j77OHEFE59w?=
 =?us-ascii?Q?RbOSmPL0ps+No8N+7tkp63IAsgRYydaA+dPT/OvtZqNJLO3kPToTNsfC7/6k?=
 =?us-ascii?Q?+5yKewB81sD0veEFtXKPEEn6SRgsURnKVs6dQWZdkiLJE/agzUqBXq3HtAZ/?=
 =?us-ascii?Q?7DJlWCMM4jffLwWArRrt/e+ZAyYnUR4evLRBw3vBnFvLnw6STVzQp3TO+oJg?=
 =?us-ascii?Q?J0fQ5UNtTtGTYSVgldrkF3St++4mzBdP7+suuR+z4vZQGXDq68sh4D9rvUpQ?=
 =?us-ascii?Q?3Sd9JNUopaA6HVbTi4jElLSTH4s/HV0LOuori2IwUvTu0d3/diL3RZ5eY+Qx?=
 =?us-ascii?Q?BmX5D/wsX7QhCCxY7FwuadstyHXAvQ+X+7+vGHfH5qVajHVR4L6wKGEMKP83?=
 =?us-ascii?Q?NE4zvrIY6TjkarFRxrVcbA0fpgyE0j9kI9Ogz5LOuVZCIQpzEykxel5eOmnY?=
 =?us-ascii?Q?gKiZRrI4W44/q2IOpHrxJpNPKxrWWANcuv5RhdeWvccAasHgSNu2oqeMia3O?=
 =?us-ascii?Q?StrWjPCcWe2r+IAj6yI5KdlIwmxkD0EhhpYTXl5pkhDycMqqlQ+cQOP6goUC?=
 =?us-ascii?Q?KlBFC6B/ZQGjyIywKBq2M9xNY+k7MFWuFnJf5s9ca4d2m1ToUDVXgUoKKR8p?=
 =?us-ascii?Q?UB6J071RQLo2Ryno8oMSP6D7szkKhX/067gndvGMvNZeXb4ifAt7KTRqcXoX?=
 =?us-ascii?Q?/ETfLn1FVYQ0NJji7MoLr0mnc7BNXhEw0cq8TmCbagSzhvD/OIMCKEkIdD0P?=
 =?us-ascii?Q?UmWjCHWHtUotrfV5ea/LJ452HwEKkU5pblfC02cjVbJFC8YmdTxX?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b10b22-3770-4622-3ba4-08def3b2b168
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:03:14.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1nFnn6whW7DrhzxSYt0uoi8ZZJwrTEef0Vdg8BiYDeNs01apUVwfdQm7l/oXWbiRGpU14JiTLah8sFZyVQv5FBV+q2uPbZDshZ7S9HVKRJkSZTd7d+VAFoUgbS9CjHL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6109

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add device tree support for the Sony IMX576 front camera
sensor and connect it to CAMSS via CSIPHY3.

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  7 +++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9ecd17e0b6a0..5db18f6c1be6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2926,6 +2926,13 @@ cci2_sleep: cci2-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio30";
+				function = "cam_mclk1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc2_off_state: sdc2-off-state {
 				clk-pins {
 					pins = "sdc2_clk";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 711a120753ad..452fc649ddb3 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -17,6 +17,8 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -547,6 +549,29 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdd-csiphy0-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy0-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy1-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy1-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy2-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy2-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_imx576_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -581,7 +606,34 @@ &cci1 {
 };
 
 &cci1_i2c0 {
-	/* Front cam (Sony IMX576) @ 0x10 */
+	camera@10 {
+		compatible = "sony,imx576";
+		reg = <0x10>;
+
+		vana-supply = <&vreg_l3p>;
+		vif-supply = <&vreg_l6p>;
+		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+		clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default>;
+		pinctrl-names = "default";
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		rotation = <90>;
+
+		port {
+			camera_imx576_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				link-frequencies = /bits/ 64 <1017000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@50 {
 		compatible = "giantec,gt24p64a", "atmel,24c64";
-- 
2.34.1

