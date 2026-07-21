Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE239BFFE;
	Tue, 21 Jul 2026 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660256; cv=fail; b=tFiJ+B/ougV4LEKNtCvUF0x4mh3jQ20oSZwCoamPENDBa+Dqa4cVGgqSTqOoK+x35gfY32cQDC9E1/dwCvIN0IDptd8sNNi8kO6HnaZ1h6GAxu+KEQORAdVl7l6oIDZuHk/BPEs+fJNtlRtHWqMQnRB3YzFAnFZDZoXBeNF0+yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660256; c=relaxed/simple;
	bh=gAFMF9mWfhKMOzj3E/KgL20ZJW+3/xNRpheD2G1iWSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LO3ATsKMYa6cmBxnDkJN89j5nWOn5sWr8suNUui/mNHEFGAdFqO/QvJRvLyEnCIqzHgmUj+cayWscqkUrQaqqW0zdtVhuKqzRxQcqPHFYPNGrpzjv9R6Yyc0JM3SWxjOOKzqhe3Ra3GTQDVrVwfpTdT0BTNuN6xVyy9XBpFmw2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jBnVCBzH; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jBnVCBzH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNvfq7tAofWSBuHS6M4C4wsr028BH/XtbYW5c2FwpjkoCHlU+Z7/wRR9npVxOHz3dWQkKGZfdfPpCWG0xHnwrCudfV8Ux/fKaiKX2PZUu4UM0mAOfOoqkQAzh3/dfCNwSpUW+oQzmd7puktoW5wusRe8OsFG/8CFcc+3wIKPWpRUsUcMvRALg+5W9xgqY9LbN0W9VSR48Xu/S6yQhzHlhVe8q621GhW/j7GcnhBOlJKKb4fy4waqk3/nkdadttQeKKHR5Tj7fSAFItk9VXf2J5DfO/n7pNg5pisqw1KFDqlWAnETAk6qwQhrjZYXKHxFwD50LH/fPTSpxf19XLNLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJmoAWCX2N/E5uy8YxRHoXDdgn2T5XUxb545InlNRRs=;
 b=M8k1hbnBO1/WyxH+QQWbZ98Aj6VhTE1XI77rFN9vGs45jM6JtGpQyNguTeDC4HvDg/MyQ9SbiZdRnH/GaYvUuhRm8jRRliG8HTBDdbd8IDhhkW5w50qnpERl7p+q2r9iy/FArhfurTFev09w0q7tgaQbYcPGAUA0y7NoSIptG5Nh8mLA46ay424hFGLaZAgRQobGCWuClMKaP6ZxyhMckL9XBqMbSfAD6CNb2YqFyvasZVN7s/fotUji1/sFG3EMj1AtmrQ4Nl6hIjifCyTkuYpsf5ew3oIYsu0QdyQ+hTiObIWdHxpNPz8KXcqaxu8ubcSqlxEwAjrMS5mDiv6ayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJmoAWCX2N/E5uy8YxRHoXDdgn2T5XUxb545InlNRRs=;
 b=jBnVCBzH65vFJ4jo1RIuo6OxiFipSg1S2R9IQqakHrn7bvEOOoO33uHZ+aqxX9i15TcgYn/eu00LM4g4B8uuNtwpM1ILDjK7v8/tBpsXJ5c/2h8XaBe0+IrWEz9JIU/vc3Kcg+oGq0ope3GChHHAexIgnY3cAXUT5TWVZ3QojA+FBLyPhDRID0LCSliv5WsdemP+VgGgI8sRm8nrqt+YG7uIJpWwW/qG8z5TN+Wi6I3Hnu9fx4hEDoV3lpVN72TIQvcOTadblPC+3ktf+0K7ArNTmcOqx8d4hrdLPC3J7w3XSbONm4R7VTCQO2HcSD+XiUH8i5ugH5ChfL7nmRcbtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI0PR04MB12234.eurprd04.prod.outlook.com (2603:10a6:800:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:57:29 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 18:57:29 +0000
Date: Tue, 21 Jul 2026 14:57:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Message-ID: <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
X-ClientProxiedBy: PH7P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::7) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI0PR04MB12234:EE_
X-MS-Office365-Filtering-Correlation-Id: 33aaa266-b193-4359-c5bb-08dee759e975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YeCCyfbOUrJBbuCZ4Tm0vohiPiw79leCZzQVLGskL9rUT5K4Byfae8IbMxehcXyy7BFFXsnL3TwWi/LXc12DYJDoG6xg/U19N4ll8ypvPsPtVjfq40JIk4h/CKD+BcML0b0f0Q8pb/4+ChKGBvkhzrnswyVj9cTII9NBphyM2JNNtDBoWyaAYD2qv3KI+XW+OoDwexjZIqI1sBGoIU7Cohri3XrcZiqLSjz0q5d3NLuAqDrl3IjDaxF7/KYUMVL6AUMuzJ2NpMLeB5wZg1TAXj9bkvYwCeiEMmpb9jUpDFf6ccx2YeXplt6psFLVNNWuH78eOP97EzWTHJ9QAhvmYZ+SNMH3MR9HCAn65KTsET3hlz7EbS7E367EoNjHsBZrAJt8hOtbvxfElPKffwTzjNHTj7yETz8k7qXGxgPX4mNp78m5MqgLggYkA43fIkmj6L1gVEmyKo/+i+vuCO6JyctCQ4o1ObROvXCinzs7A1V2xbgfu/mL1cQ3flrHOeQ7zx0wzASCvHuFZechZE1KJmP9a9Ih/rQQn6BCWXDP1fMHLVVkVH9snRYFpbnSc/kHKYVEeiMdRnajF2MqIwTdaCvIEE1ZBoO/kmW8vbiax2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5Xd+jmLSVyAU4ezgUzbfHgwraIUFJYbGC1iTKv2QUse+13HyPFutseLeh1R?=
 =?us-ascii?Q?YfWfs8qSBptXwo4n8xWa06IRYftHkEIL8LMJYkOF9q4W48UKAGaxutDnZ7bd?=
 =?us-ascii?Q?Nh7pHONYfznrJQb1+pME2M+4u4QJk17S/7kiZjFAAWO8NDwQuNivUw8w1aPl?=
 =?us-ascii?Q?6m1/x+/ZSl0UurxapK9g4qbg97719kTCyE6YQJpbZF9q6wDgVGK1OSSnDMa+?=
 =?us-ascii?Q?Hu/fuPNxMH3GdJ5cmlF6cqjNhHbD9n0T9eV2hqD7l4FPVQglNto8p7/Jiu45?=
 =?us-ascii?Q?ezEgNZVqiCqzhpSRMfA9jjJNQi2nHVfcTh5wGdUFavipoDbn/ZvOmeoP8E72?=
 =?us-ascii?Q?o1rT2KWsSof5oKvCpcZ/G+O7omAezxB19FO8nokug7areZDaOlzQdtLN653I?=
 =?us-ascii?Q?TSPBcI5fMFwfLXMdfp1mRYORBgcjGWDB8OCapunLW4RoIvsqvls9Mdv3MTmL?=
 =?us-ascii?Q?PqfqNLzgbQUCe330Ce5BsSk+5C1AwwcHOa8YGXTHDpzX0/6VpkOQfFk7T0uG?=
 =?us-ascii?Q?7yrGLXOGw4g2jFh0/tC/YcwUsW6a9pVB3UtVKlSN7NytGC+ASiIiqeGbFqVG?=
 =?us-ascii?Q?mTGvUrMFw69zPcSHj3KTm3WBA8DD3yyW1uRexegnk/LQ5UG8vr+ZV3IHsoQI?=
 =?us-ascii?Q?lUFcdh4sn/zL8FnuA218mocVX53f5eG1pOUkHW5XUoysFja4tcqWjpGPER0q?=
 =?us-ascii?Q?ULYwfyptHQEXLLl/FoL4adgqat/VvXYtNvcOffi8oucxENJNQMvSRoCYzb6e?=
 =?us-ascii?Q?ncpl84EAmrkqa2RIqj/CE+lIgybFmh8W51ecHR6ITvcGQBHSZT4x1kMvm5zj?=
 =?us-ascii?Q?01gmGJXoUJU3mmhO0WpmT4FEw8q+NCUNJ7sZryk9YQUR3Oqh53UuXNiNLhos?=
 =?us-ascii?Q?y2N47jtWoUiuGE7tpXmYJZw64e/Mx1yaDGDIVGsucu4HN6JHCMZrO1EQYqYp?=
 =?us-ascii?Q?3WkT2ZKESpJnZeZa4/4VZM6dXOy3KMTtBgw6Wg3Lf/nochx1889Jv9tBJPFA?=
 =?us-ascii?Q?ej0FKhdGHuw6VTIk/0FhVTTsl4cYdbyCe0QEurEOYr1bf6YX3nI24N4ssOhU?=
 =?us-ascii?Q?BlX02qc9wuSMdI+04gvDagoq/TG+OZz1EbI9M57O8H+UTivQ2/V+mib5mcT4?=
 =?us-ascii?Q?fgrKeMayzHUxnrmfNZaNeMHcCcElckCOBs2yWiRHVRjrTrLxMi+08+wMLMxq?=
 =?us-ascii?Q?5vyNd6kc4qGD+UyVhw5A1QuF6//55rR6Rbv0xuVEv5IBqebnUFRiY5o5ngkT?=
 =?us-ascii?Q?c8ZAwdp1apOz64VbYSElfWHak6j+665eBCYxK0icYzGYskpDtaV/HHr8QBfT?=
 =?us-ascii?Q?c38XWRjqqowMB4ggr4Z3TJGKZCrGfUwTSw8kjZhnCSIRVXjj0HdmORtDpQ/Y?=
 =?us-ascii?Q?QcHzGuzylVLXWrRg66c80e3ghKQKfUkfgIvMqSOu3/au1O96gdzjBOJDkwOn?=
 =?us-ascii?Q?KK0TPAj7LO/1TEIF0KgeBjZGAHMOId9X935QNEImEENCgwU4GE006pR1AqLV?=
 =?us-ascii?Q?r8o68vqptnKdDzZN1JbfmdNES99KSGLxY9cLU/RmYDYRg+dCbG9crkUWhTvQ?=
 =?us-ascii?Q?7V2jXMtVtm1nIqYYN09kXEeaIBN2QF4rw2/J/R+q5PvoB8WGloUVgktAJeIO?=
 =?us-ascii?Q?ioUvQ2yls32wLtzH/w9DgH/FZtFRalSf42TXVkLaE8PoQyqDbB//edn0haNM?=
 =?us-ascii?Q?zWKMA8dUMeL8l2jfCN+JXQ+QPaje9SrBUyhr2ax9VGYjGz5way3yVvVXXjAI?=
 =?us-ascii?Q?XfJn/DzoOvAJGO1IAkam9izKqAEj6mWUWyV8mIHbP+yzh9q64d4R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aaa266-b193-4359-c5bb-08dee759e975
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:57:28.9594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWJu//2WvqgxRyHGZVEsYKzzFb5f09ZCCSAIEY01vZgWw51DD9i+GJageS+gpP5bpk0gjrCza6kf0Kgd72DmjhWXypoehx/SBlJKDiB+z1dzYHz+2z4aBmSpyPjV/mvy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12234

On Mon, Jul 20, 2026 at 02:11:34AM +0100, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
>
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>  1 file changed, 195 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..880fe602945cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 SoC CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two data-lanes and
> +          endpoint@1 with exactly one data-lane.

Sorry, jump in so late. I have questions about this design

why not model each lane as sperated phys.

csi1 {
	...
	phys = <&phy 0>, <&phy 1>; // use lane 0 and 1, connect sensor 1
};

csi2 {
	...
	phys = <&phy 2>; // use lan 2, connect sensor 2.
};

Frank

> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 1
> +              required:
> +                - endpoint@0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names = "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p9>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in: endpoint {
> +                    data-lanes = <0 1 2 3>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint = <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
>
> --
> 2.54.0
>
