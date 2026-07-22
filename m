Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F533ADA7;
	Wed, 22 Jul 2026 01:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683068; cv=fail; b=dLc1+08UUEOgvmAOYW7s1uzrxEq/jbAxTSSI/25Bzs+VXh3Bzt98358eYAcrVxamp4zJzuv0n8S1IwpI1cYkdgyzfWqJy2M9DNIlHQal5eW9Ym9zn6wk/J39wAvXqqk6Jfs3IrG5ChoeHhNgrkl60qnbI98LA069wTrrh06l2KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683068; c=relaxed/simple;
	bh=yK5t6qIDJ6wO+sEO4zk0619W4PBOwqvSV/6oHOIdGrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RmsevFe0mpL3qpxcoNpKWNjmm61G1mp8X76nE74FY01ABxZRup4771MnGhV1N5rQ5pHzb3NxTITz5OeWdNiaPtkIpMkYv4jBkbWvn3HWytSYL+jvI7vsSBZUhVldkrHo2Y8ikITU4B/sWplsB9LKbO6aOHeOdKMAVBTqcdxWAps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TRVuHurK; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TRVuHurK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li2Lnm3fuQBa+w3Tsz6DtLDYA/NQyTRIiMqPA8gjJsLmGO+dYfj08Jl/F/jBBrzPHVDAtDR95UvOtQ9veSZPwHe5a4yeQsFN77eijLlHVNixZCV0C5txM1SmIOY4frD1zA6q/kMzCaYxfLYkkPKgK0NgxnXPY80tHlLvqMSL+uo2nIwnke0ZN/viSACUPN8/3bssFIOGqfJFUO4xPp6voKdm6WAlMNmJ/xRgXipQpW/mQ74sppWlWsRe6eQ9pYCX4QGPJhHgCRI9naNoV3QcYmoGRf1AXB6j4h5i/QHEy7PHz1hAnN3sJV5K8u2tueCNVZYPCiBA7oDG2t/dy5wMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zNzyaYynbZm0lcfQ0KsJGAvLqhVGlYlouAx2krtwUs=;
 b=PSyH2QTy3izIGJKDB5v9ZOiyEfikjP6vcO6TyD5L01Sv9PD4hDBBNEtsaAg7HVbzYHUhBW8/738Calj9eLGlOe7DfpmwC/ikhaCMqvl/++yGspmJkl7wEVCCIJG71+lvN3q31PkKQT0l0AZWgluVZEPFRopIUrF2b2cJybXXRhdD6dNPuShFOpf/CJojYEq4NXdMZbfqutWyzSskhr+m+T0G3+RIYD/pwonAbVFb5NOOVjQL5p/i6gjlDGbLMUnDj+ZBhGtlmFO3C6fIfL7QHGbn1iSTBTA3IeYHBSW03vz8x4VcPlrkkR/mQHey4V7GzyGABgR9Vw64L5tOg6Dbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zNzyaYynbZm0lcfQ0KsJGAvLqhVGlYlouAx2krtwUs=;
 b=TRVuHurK+HVWREE7aeXhUCKp8/BPXuF/qJVL88l66CJNYqcnj+3IseXPBHOUNOp6Eul6VJ9ggxOx/vf7Dm9RvTHsjTs7QPmR8dzHa5UkIti7ub+Qt2UMwuJTC4idD5H0K6Rt0jBsdmWMgHt+4fr1d28ph+WyNlZuTOrXjNeIP+UWOx40rjhBzGptnG5HshiUYIDRwK4GJdO3l9gFRrAFt5ABNFt1WOxL2h2QBwL1PzbegqJDwbvQU81y26qbi9UCiARa/2dXAH6tjlh6ngWylOGMAwnOSAyFoit5o4QkF2ucpiBc5dZ8/0h/n+MYy9c1pQTSh4CLD6E6JMrAG5cauQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 01:17:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 01:17:43 +0000
Date: Tue, 21 Jul 2026 20:17:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Message-ID: <amAaKalbD749uZuK@SMW015318>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
 <b974f1be-b802-40a3-a54c-f7e3c8fbbece@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b974f1be-b802-40a3-a54c-f7e3c8fbbece@linaro.org>
X-ClientProxiedBy: SA1P222CA0147.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 081bbd64-6afc-413f-220f-08dee78f07c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|366016|23010399003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	OKFx5Y6ODiN25FtvI95354cqOYEuaQQ139o5aKi0YKZ7ZVBr9zvAfyq5hUH9h4RwsdQV39hGh+Jj7vz8Ptoyu8vg1+dFP1TL2Hr+AjWxWtumC/2F/T58s8OsAKPUaIRheMCqZLecWceXJUjQZTEwVO3EKQ8rMeRrY/DQYB4kidI4Fd2bUEpQg8pyKhOh47hJv7mwgJ67z4X6fyndeV/STHp2Ju6nLhkMQ8cVxBtVYzh2/lv6zBLCLAwJV207Hq4SDWcnzGcKj65H74cEYZXbbM+DiG8mFUyeDEr+1aM6+n+Yost1+0f/rwk5ZDoP07xNqhBhxG8/xowAKX7sWw2L6izYe/uBWU/i5sOK48QHxvONWkDdaQFfCKNo2AS5SPb2q0UnMfLBx9ctgmS7mTmEwhThB24myX7DkSfJr7VyE1Sg6edXTlyO6WUF9ihJbHoFgsOyW+qKnh5QibYivixkie6p2pojcqCo3nMiP8DZMNESkQ0nwJlKORkYD5dY3kcbg0mbU0kPxqWy7cvLJ1JFG0JJ2XhhfSbgFDCRS4gOiZooT09Li3xqGLR7brhZNquubZYXor970OkASjSusUPFcSZvp1KkaGtarhY19YCilWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u5WTe9jSugQnlIviazPWHQAD1Lrvg07HlW6VePMuzErPR3L3c0K8LzGa2ixS?=
 =?us-ascii?Q?SaGgKsqzFWNaowrblCTd/LV+Uqimt7ZeyE2CzfDtEtbPYUPilrlkWZpLUv8S?=
 =?us-ascii?Q?0rY6LQtwzn47lp6cU9XVFzLJWbib3zNIgLPunv6SFVMh7/Ycb8D/F9wlyfIf?=
 =?us-ascii?Q?LcStS7zwfHSHhZHaRLR/2xw0onEJEFNl86wek3lyiqQDUS0Ra57l/IjefYha?=
 =?us-ascii?Q?Nd4u3wcQ+VOwIALzS9NbAFRR+mkUDJxhUjQZznysQQBpw9QREdWzH307F9l/?=
 =?us-ascii?Q?Rkt+gsBSI32vLELKsiG2x8qfhW8oKPSHjgLod3BkABMAJEs/EG1gjlAjA67W?=
 =?us-ascii?Q?gEDUFO9e5OqM6AFNnlmWYFH6QjlkCafRZmkkWmzz9O9XuSmIz7uZMs+norEr?=
 =?us-ascii?Q?AZS9nKg/yQ3y0K9QHEFpvHeFie/YChjspxrj4W3GaX4t6bqQekj18xGmUmjN?=
 =?us-ascii?Q?dT6T/DPSoeMxGv1VsWLO84ooPaFTXtlERwkJPGmCOujc49OSv9888qtHsn4Y?=
 =?us-ascii?Q?CypHZ5papDlaUn5B4YYclvrlVnTDOc1iXnKFUImpLsfRIddENfghhN/kopTS?=
 =?us-ascii?Q?i8hJeHrJno15pLzGR4vIoAA2yh4oksH+KcZdZl8P0TaaUlCThPNNykY8fPwg?=
 =?us-ascii?Q?EdJcSfND4+GOZ4VuQihP67zkKyEB7P8LEpyy3fPWpEfs/NhGFkTYwHeulRWq?=
 =?us-ascii?Q?3mdnBaEoyrtuIuXxwUCqiVM16n+WkOzZPr9ksqbl0nFzdgvXIkmO+mlzvmr0?=
 =?us-ascii?Q?mTPh7Lh/StJeK25UgUKB5ta6tYKT0Ecqd47/U2rH7TpvjAxgC4pldq7/ezAF?=
 =?us-ascii?Q?bihcbCE0bX2TjRVIcWJbIrwI58pV7b63CaMNP2NMJ3WJfgeg0HT37j2nATYG?=
 =?us-ascii?Q?boAk1RERpBfdfm81pJpCAsZ9klQTeezje2Ai5XGmje2DRcyyapsVY6Kvs6ov?=
 =?us-ascii?Q?FHFiHFxN60OdxFdLE2LaeTmUU3lRLTfcxBLyqTHMiyseJ5th35HrSi3B/TfH?=
 =?us-ascii?Q?8Ie3VB8tpyBiCXDt7Hgv5w6y8014mMbasTwNRnNRJXOFJx+2YE6AJveDpr0m?=
 =?us-ascii?Q?iIjNZt22pFRCW4NsNgSg2gdmpqu8SpDzcDHETwtaQhKbbgjA46ErcJ8XOp4P?=
 =?us-ascii?Q?OpALHG8ypE6uJoQfvyiBa5Y3Q1gS3WD1jtRs+4RlZu1r7okoXaIs29huisy8?=
 =?us-ascii?Q?A4/DMLHKY23DIu9rBIs/i2VMjYX/OftytrvnZqFo/UILkfCB0d09uFXCsN9u?=
 =?us-ascii?Q?Ck94hVb/TdR5KnYmUc3z5tnyOpn2icwGVYh2wQQGj3E+N67TYn0EMN7YX7Wj?=
 =?us-ascii?Q?hVrXtxfM27I5xoapdp/dk8T22253y0HCJBY08GCSC+0HGhdfQVoaiiYOZzsN?=
 =?us-ascii?Q?tCsPp9WrctjHSgx/7F+01OREX4tZPScNwh1KT9jepRLIbi8UP8kI4KHD1vk9?=
 =?us-ascii?Q?3JKVmTYUia8AAF3hp03PYoq6zadl+cNJpIPmOfVVRyxTD0s/Z9le2jdTwokJ?=
 =?us-ascii?Q?LiQmyOlkSkHVA3VuFNJoz9Cl26TFQn9SrKYnBDxo92bDd86hfZekb0madN91?=
 =?us-ascii?Q?OJ8BKz6Utrrjakga8gt23tBbqzmsqZx653/Y15Ov7zsSp1QcMhMTtNJUxaFJ?=
 =?us-ascii?Q?lD7hDb4T21eRS5jM8Mau+trhaRNKN1ZhC3EHvEs+41fuMKIXuDkHWt0drp3d?=
 =?us-ascii?Q?tTccJ87ujcYkZl73AOUQqENdpHHwYUpj+ii4CAEBhY3wR3y7Q/Yk2+z6fHBe?=
 =?us-ascii?Q?sp/3VJ2jAzqmN1eIwkaEC8M/1BLbntnn4vu5wegfrbke/A9EmcPk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081bbd64-6afc-413f-220f-08dee78f07c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 01:17:43.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8dB3EKP0y9fgThYWJzNUPF28PUYKhPn/faZu6KxvPPqwZbyXwXsRcYKvUvGCSvVCO7jjm6JeprIgAwWEiclDf8eDJnXgeqh23OPr4aUzuu1P6fCuQt0Qf/ZaFhwhX95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

On Wed, Jul 22, 2026 at 12:49:05AM +0300, Vladimir Zapolskiy wrote:
> Hi Frank.
>
> On 7/21/26 21:57, Frank Li wrote:
> > On Mon, Jul 20, 2026 at 02:11:34AM +0100, Bryan O'Donoghue wrote:
> > > Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> > > supports both DPHY and CPHY operation. A special mode of DPHY operation -
> > > called variously split-mode or combo-mode also allows for two sensors to be
> > > connected to one PHY.
> > >
> > > The submitted binding here describes the DPHY modes of operation only. CPHY
> > > is left to future work.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > ---
> > >   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
> > >   1 file changed, 195 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > > new file mode 100644
> > > index 0000000000000..880fe602945cb
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > > @@ -0,0 +1,195 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm X1E80100 SoC CSI2 PHY
> > > +
> > > +maintainers:
> > > +  - Bryan O'Donoghue <bod@kernel.org>
> > > +
> > > +description:
> > > +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> > > +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> > > +  modes.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,x1e80100-csi2-phy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#phy-cells":
> > > +    const: 1
> > > +    description:
> > > +      The single cell specifies the PHY operating mode.
> > > +
> > > +  clocks:
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: timer
> > > +      - const: ahb
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  operating-points-v2: true
> > > +
> > > +  opp-table:
> > > +    type: object
> > > +
> > > +  power-domains:
> > > +    items:
> > > +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> > > +      - description: MMCX voltage rail
> > > +      - description: MXC or MXA voltage rail
> > > +
> > > +  power-domain-names:
> > > +    items:
> > > +      - const: top
> > > +      - const: mmcx
> > > +      - const: mx
> > > +
> > > +  vdda-0p9-supply:
> > > +    description: Phandle to a 0.9V regulator supply to a PHY.
> > > +
> > > +  vdda-1p2-supply:
> > > +    description: Phandle to 1.2V regulator supply to a PHY.
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        description:
> > > +          Sensor input. Always present. A single sensor is described by a
> > > +          single endpoint with one to four data lanes. DPHY split mode,
> > > +          where two independent sensors share the same PHY, is described
> > > +          by two endpoints; endpoint@0 with exactly two data-lanes and
> > > +          endpoint@1 with exactly one data-lane.
> >
> > Sorry, jump in so late. I have questions about this design
> >
> > why not model each lane as sperated phys.
> >
> > csi1 {
> > 	...
> > 	phys = <&phy 0>, <&phy 1>; // use lane 0 and 1, connect sensor 1
> > };
> >
> > csi2 {
> > 	...
> > 	phys = <&phy 2>; // use lan 2, connect sensor 2.
> > };
> >
>
> Such design has a number of flaws and in general it looks overly
> complicated. From the beginning it's unclear how to distinguish
> a clock lane from a data lane, how to specify lane frequencies etc.

Thanks, but phy-cell support more than one argument. like

	<&phy 0 mode_cphy link_freq>

I ask these because simiar other phys may connect to display panel, some
phys combine csi and dsi together.

Frank

>
> --
> Best wishes,
> Vladimir
