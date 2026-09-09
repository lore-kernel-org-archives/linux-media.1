Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D515803A8
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963503; cv=pass; b=HerQaSeN5CDBrxLg2uh6qcQRI0+6bl5geKa3d0VfC1+tDwkNrAeAsd9Yr5JRiS7I/40o8kM4e/zKUDcUU2pJbiZpx4OzZpHymxHPNT9h85GfSArzCNwKCXli/Fh+OvnjWBfDPsaABf/zsTfjr6MZ0RmtkcenluHo6Drrt9rzHd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963503; c=relaxed/simple;
	bh=72wFbPpMuGx15LH/m5cgHl7Zu8cKL7S6eHLd26lZQ2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVJtXfv7THJd2JFSi9hSjGSrGfNkh2/zTSv/XPQ7EKYvMDUheQtuCfwlm84Antkn9cjHab+BcpQz8GLEe2nLg+afo/T4cw9gIIW628dIjQDoCcwyfyc3QQ0JHPg2aa7dndz60aV3zWgqN7380TqAcH+nj+/ENP0Bndxv9S88OPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/J+12eK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aucAGEPs; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/J+12eK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aucAGEPs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BomQG2698832
	for <linux-media@vger.kernel.org>; Wed, 9 Sep 2026 14:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=; b=Y/J+12eKrVozqs4C
	HnJljqDlqmXV6Yxb3DzRrQXaBUUidRg8ZtB+2Ud8DkIaU1723WZAeSRojyDes+5S
	7lO4JcZI1Qb1faE86cSlbiQ/J6HSbD28LKekL3Opnr9mNI+fxAQV+EmHOi7cd9Mq
	YYLuEu0r3FCX8u8qwnyzKrjSiPLjKq6w0DTMvXKPiI0n+EkOZpYfHbucgDH43wg9
	GQGNMW4kezL8mfYWq26JR5VkurJriD9wMxe+sj90akccX5esHGizG62V/at55IXx
	BihoaMpINlvaWPjaaQ0+MSNfX7ZjEjbEyuKK0dwB1uArFbdgt9dShGgx7bByuNrB
	axahVQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0mrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 14:18:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b59d85dcso10115584a34.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788963498; cv=none;
        d=google.com; s=arc-20260327;
        b=rXcgTtnbF8PJsbUTs/iSugwSfkyeUGiwOAGUJMSSUkS/P6ZhRZUjLcShVZwf6XTKLz
         rTss021nfoagsbNu7/oyXgfp7DUYstj/MXfarBIv2vU/Z1v77oaLPcZshgN/YMFpCyBb
         NoF93+WrJXXDxX4u6raqRqx2kxBLZOlZsPUGtWgsTf8vYPZHUisUsLugEka2chaRJseh
         yPBTsWlQlakic0TrD3VickMsAycozCTQOw7e6kMdACA36kaSyQDf5EzOmVG6ARrnGU20
         unr8ASe6EwBKYM/49mTtdyYNa6q6Zweaza+paDJKOnXHPgdc7TSK51vYsrKC24n4+YP2
         /Aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        fh=r+n+Zd4lfkxRPtr46zN4IvOlFaEe8UCPJ6Jfr3CpV+4=;
        b=MEFQYVbEAnoh5S3LAFqFEkeeYOK5FCq5aNwd9isrY5ZfAHq3BihK1zvgeGf/KTW1E3
         4xZGAMFSRJpoV9jch6iAfQIzuqoZOlk4ak5e9tiuiGrep17mx8ZaMI/RME+OPDbSvEyv
         Syq3c3/xc0Bk95lN1oc/Fxf783ZB1+2DeeKpvsHXB3nLOeDXtThJFDhPrMtcNvYNRPIs
         Kn3WLHDKk0+xX5HWGYj99AEBWa/ToEtxrjpTCseg+QcdUj7zzuvepNbf/yRyFlxGVVnY
         fWv696NkB7MjuZBvJq+pNtGK0jOj6QCR3RTM94o6HMVW+LR+zJdKtZSrPK4u+1ZPFIes
         cy9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963498; x=1789568298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        b=aucAGEPsnOtXAwzchxKu8I9ffBz8kvo2mRc5EMa7yurhxXAGZjrtAathG+qNOn4TzV
         sFB/n7gflvHe4ZpRqcGyW2fwKOgiexGWs9AOmnPQ38EWFMsFtdtIlqT6WSD1F6tvuaW6
         /iTkr1P1p8w6HjgxHHm8PZJ7U0CFXTJcek5QhiwEkAkoe5La/20lI+x1pufCAaO1Jyek
         vqVpwfcuqSn+jonqAm4JpJ/TCmlG3Lc1nZQsSUeDEaU/AwuqnaUG9yxdGBbuQDQTbA58
         ahW2r1zluSURFsB9DtYl7yHKiY8b9iexew6BXFcNeQLjJHXPRe2USu++2rP8wC9yCbIu
         cYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963498; x=1789568298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ijz3qU9AqWAuODrFeJR7HLdMoz7Cv3StevXcIGLyJWM=;
        b=mMCNv3Q7ETIX+hLKuFtRkhGzteNByCwrQdqYa3rhlsOXPQNqjrkEyp7tpEkiOU4kKo
         nkxf7bFI1sP4X+BV7a6kgQ0kcM5TEqdr+gs7TP0p7NY6xKF54CgUeqvgdAqhsP6TijuZ
         w5FTDHo1GziRYBYKLPw4F3Ra/c/DVM9rWjHesjIkcf6jWKivQBpRqKle158DsH8g6pmf
         odIGpdOcxLQYQCivRcEEP8fX8O3bceZ/qqy/+e6o55Y11Fgih4QdfEEhxPJYfD+wHK6k
         YDBA85MeM6RLC2gdl00aVatlRu8cWvVI+NqTdmZ7iThuoregUjgyDNCT4VotMa6WS4Ro
         FigA==
X-Forwarded-Encrypted: i=1; AKwUvBzwOPWdByXHXTjmL0YuqQwhd59TTscLTAEjhbFvdykKoP7eCE48nx8GhClQ/sxd7taq+6Gk4S5IRnKfLg==@vger.kernel.org
X-Gm-Message-State: AFuF++naEtVeanlUu62gs6pkeOUHgQF+S4RUBsTD7eEGpr7PlTXQqTdy
	thIFnAXF7AvimwxUrtmr/w0Q9W/frHPLrW+QPSWW97x+hVTW+BAP08c1+r1hAiQQDqQojOxPj2x
	jQg+mEko/4evABd4Y5/LpT3DCadCssIZ2kDpoy83sq+lWizd9ULwG0Lqd2k2+tHOHFPWclMR9PX
	OhMK6DfITRMyJcMFXFzHb16u/VaEZcbNkO51Rle3os
X-Gm-Gg: AYBFou0jSAnWIbIV4ZJhQebz4kB6RLFN3xyjSeTFpK0VKVQ3RVMz5IW880VH6Az5K6x
	5bHN9LWoYHjbI9v26z8upCkxEioAoS+5KH6ET2yN1DCOKkkFzowbP0TNRS/XupdBgXUmRV+SxoY
	sn/wpanFEO09TrBfhe3l41mo2ik9tVB3cXNBwAPNkBt6cdlXu4NyxoTkqVzoul67ndVp6Ynl6fD
	tmGFNde+9SSHSfwHb7cwJTu9PrMU40QQEupO9KaNTSRoeuahiGCIdSJe1qW4GSXUI319d3/Npw=
X-Received: by 2002:a05:6820:f028:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6bee715a830mr787281eaf.40.1788963498129;
        Wed, 09 Sep 2026 07:18:18 -0700 (PDT)
X-Received: by 2002:a05:6820:f028:b0:6b7:46fa:1693 with SMTP id
 006d021491bc7-6bee715a830mr787232eaf.40.1788963497568; Wed, 09 Sep 2026
 07:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org> <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
In-Reply-To: <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:18:06 +0200
X-Gm-Features: AcwNN1XeMPnSrK1BZl7UqBZ6XmAK9pb6YYlBOZlSZsTEkGUJatiu98s12aEsERY
Message-ID: <CAFEp6-1De_S+BwpDkH=Hkwc2YWe8m-cPBxkKCL86f=1fJ57xHg@mail.gmail.com>
Subject: Re: [PATCH v17 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX0Y7I2o52zsT0
 a1+YnoNNT022yZoFTaUzvoDZG+jg7rrgRjnHo8cGSlyCaSDO6hmVCuTnwDYKGRIPwXhXrZEQaJm
 CVat5NB4K32cChIpCPO62MEXo3/1pghlYuemoNqbD0Fc0LMNQTAmQwx6EidfE7fnxtt0FBBl72L
 k0OLsyT4JwO2aG4za7i7XG+V711Dk8Ev92pmmejsz1jUoBEOzf1Umfq5XfR49MDLyxZU4LRUlh0
 MAttskbWG3Oo179WXiRc9XBLaDFmHQROEYXzjCaefn0evkAN9cn2CSTWh6n1KEArWDeRD3n+5oj
 aBgfSNegAqXb/uzpNbfuq2MHWJlSUfA3tbU15o/B3TOjuuud6O3VPTMcOJ3ucGsL5DZ/FwJKvwi
 4+cRkqYgb7Rq7hJZLqyEUa2BSO1/t9n1UnGJYydjBkbVzkG3qchDbLzCODR63RNQtmM4kDwdv0K
 yizR4nJNRzLfo5A4h9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX0faWG46+LRhz
 dj+DAwWQPednZ/75ozEOHXi7Dfapd/TJ+3h8jfW/4sCBW7ebracOAhiJeWBQqqzvb8mJfxcMV/c
 MUSwrJ3OgS1m8xJmjXnxWsmEZDgxAwo=
X-Proofpoint-GUID: kKzrVWlKsrF0-1tgRcOZXcx8v8PbjXbb
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa16aab cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=a1JshUc-Vb5zx_Q6SrkA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kKzrVWlKsrF0-1tgRcOZXcx8v8PbjXbb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Hi Byran,

On Thu, Sep 3, 2026 at 10:54=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to =
be
> connected to one PHY.
>
> The schema supports both the D-PHY and C-PHY bus types.
>
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Checked, and some of the sashiko comments seem well-founded.

Regards,
Loic

> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 221 +++++++++++++++=
++++++
>  1 file changed, 221 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..993271c42fa06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,221 @@
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
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sen=
sors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PH=
Y
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
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
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distribute=
d Switch Controller.
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
> +          Sensor input. Always present. A single sensor is described by =
a
> +          single endpoint with the D-PHY clock lane at position 0 and on=
e to
> +          four data lanes.
> +
> +          DPHY split mode, where two independent sensors share the same =
PHY,
> +          is described by two endpoints, each with its own clock lane po=
sition;
> +          endpoint@0 with clock-lanes =3D <0> and one or two data-lanes =
and
> +          endpoint@1 with clock-lanes =3D <3> and one data lane.
> +
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[01])?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +                default: 4
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +                description:
> +                  Data lane positions following this endpoint's clock
> +                  lane. Positions are a per-port logical numbering, not
> +                  package pad or ball positions.
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
> +                    clock-lanes:
> +                      const: 0
> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3
> +                    data-lanes:
> +                      items:
> +                        - const: 4
> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
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
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible =3D "qcom,x1e80100-csi2-phy";
> +        reg =3D <0x0ace4000 0x2000>;
> +
> +        clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names =3D "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +        power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names =3D "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply =3D <&vreg_l2c_0p9>;
> +        vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                csiphy0_in: endpoint {
> +                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    clock-lanes =3D <0>;
> +                    data-lanes =3D <1 2 3 4>;
> +                    remote-endpoint =3D <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint =3D <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz =3D /bits/ 64 <300000000>;
> +                required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
>
> --
> 2.55.0
>
>
