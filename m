Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529959;
	b=5Eyz026XIePVoIT7GFWFHnN9Auca5eIDE3ZpcSUTIviRuvtYF23CyBIEf1FXzuUmYMVc
	 BlbsQnZ+wRtGrr0Ftqt1PxVtJUsUNQsTN51mwYt+B+rjV1DuARo6JQXj1HjpswbEqTCeV
	 hw/yDs8Eo2HBcFGxQzFQCS5PI38odgr9QeIQPTQRgRTa7Tn6UYQA2RBaxUg4as+hRXaXY
	 TqWV1c7sFkMiX+qlqMTHnFPmE2iGlTqMDgwtPyCX2RUH2y7mO4VkkbJwCs6am2xMcZtIX
	 s82CMGtlIud6fe0qmNTS4W6MOn+4FBDPm4DJ202A98j1VdhAzO6k8b/U3QffgpjVvPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
	b=0ZFbM7nr+J8FjGbW2fh5Ytzq7wc6DP5vI0nFvTjRlUG11oij79l4iCkm0RFPuwTMeH/D
	 q2K50TJt35zR70Mm+HBqBp6bBkzInZxkEp8fEcwNvzVVdmfZa/WsgtUxaJXUNXAUTwiSH
	 PmF0lw/vf6ZVoBXrWns6YTYhvoGs40klYOqUaA0NnOYs0vQTFV1TSE3MHf8w8M2v1FFbU
	 IiXgyN9+MailPiermMLXzoTgfYR5YHi69XYeZNpkdxId8VdHmJiRj4scqMN4hXcIVXHAq
	 cDA2s56BNDlS+XhKQCNaA87mpDBKRkMTRpI1XEtlp8PijZ9teaNjBH5vgDNOX9wRKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWqblDYl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErqIz2mM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274F606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F274F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWqblDYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErqIz2mM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtplq2745076
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=; b=lWqblDYljlhYfnv3
	omWHIPH2Wl1zbWIomVLAWQRdiGf0v0grw9XZquYiqVRrjmYi9EvWlL+GO8J+ap6y
	NprW5AY+7yVRTVMC+5mhJXzTFeEPSgX9UEgz4aHE/Fbw5mzv8h8uJDo8QK8jJn6j
	yJTCeGpoIA4WYyp2OY39oJjrZY/V4qpOHSJMG4ivXO92XLW8ycFQy1MOhewNi6VM
	7tbn1PP8AvKT5gZVAwyH99DwCKePz7vFDsBB5+PB5Aq2egDBbegI/hew83JGxS3W
	30nH2T6XeQEBYrpWQzQfk74OM3ZieJXuaYE9GwmfIcLPQeXRrrePOsROLuSvWK0A
	qPksJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n4fpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:59:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so6368805eec.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529956; x=1793134756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
        b=ErqIz2mMNVe7147LZ7MwidLgqPYBwE0odRDghueEuxIPflPpdWfkJSt33p1om0IIfP
         rV9Xq6YfYsxzD9OFGSZW9ky1ZCK0TGZdcbjDzHjiq/c6gTWdIQFtGJBxiK5neN/NFpju
         KyP4MefQsVirvCez6Poy7jAec8YXZY9M0rELYwfr+GLLbiPeCd2Ybm5rGHzg38RaTxly
         9RWZbKvdiz5HakQPnrSgDGgDkGfEcwRAYVmhkNDWHUVYmdgFtj3S0s2j5dHydJUgHQQq
         miaOzkMKOjgQoUu3gdHmcxEl2A/U48arQPdzNJw0AHxMTkkCtXv3Wycn1RuvpV9G7u+Y
         7jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529956; x=1793134756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1sqo/ZVn+VFxfXfLlBZ/RuAV0Yoz3eQ+nWIZ+yIl6c=;
        b=S4Wa3hcrQojNdabbs8zJOoPXq07LbYoEuzkWp/GUI9YXGYv84AV3c6xEQLTtFGhk61
         xi5N+Xc8YXzuW0+uLsdqHinZV37wmMUB/X/N+jZtW7vJbpEAuEBdYiu6KqrsSMfp4pwj
         /Y+yAdh67ga0IhiJsh+z5zFeFJ4VelTwgGdirEMrWn70sQ5A7MamwcOSmmaVczQDOFk/
         BP3/bP+Q40ztVrdLFF2PSTsn/9nYvzmFrdQ3T4sBslcFayygE9+v/oMeFoUaDIHGZqbQ
         onpr78QkTo7+64M/c51RWs+khShhi8IYrSYo09OD5TCkOGxseE8CpmghmGakIPJtTinZ
         s/yg==
X-Forwarded-Encrypted: i=1; AKwUvBx/Em904gq369uuE3V6Cek9RlgTdNsf5eOFUaDNhbXXfYziB0dIBMGoq4WHv2NOsmGB5CoTh9u5AfvAKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJezQ2qjYJc2SQJKiI/t79kUkYfSPXEWjZ8WXpeI5qbtlWD10aA
	2nopy5bjj2RPRmxa0ciMZqWnINGfAI8U0fvglUfCzXHzpJh9tGaShKu5AHe79FVtPWip8Mvjbtk
	EQI89CKC7LNVEDa5jbWuewJcnsTABtVhrt/mG6xh8L/HKWKle6vnXHmy0DHBFnnckkw==
X-Gm-Gg: AYBFou13xKq9nzqaYqdXJHFrY4fKlxzrRdBqR97rk6FMhydkMNmsU86g8xPluTmbHYs
	7kI/9qZK0p1POHB27zH9JHWm9e/fikkuZs/tc8qc1yOHHGJKkcfPhnWTgACsw3UxP4lGcEgox9f
	fQM7PmWzFrQVMESTAM4OFCz7LqZg8GvUCtm+Awqx0hyssXcszmXBqq5TOdjwkTGkJOcAX0poxls
	uSWNOQdWcMqwDhUlF3kAfj+O8hVeCREyA2swGioULCiFpKUDCYCZ51QOzgsO00C96d1gzR5mCpK
	wmHu8y/yD4EdnhsXD71VIgo0cCP1J2Obe+pEyxtGoLBos/qI6fmmqGDLZ1YcAdQARMG5zTeTOrG
	DvTuwFxvcWy90VR8tKDQQ2fwS8MxWOVGkGAYU7jesMkhxnyWzaiXGFrJD
X-Received: by 2002:a05:7301:160c:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3674c63d927mr549908eec.11.1792529955656;
        Tue, 20 Oct 2026 13:59:15 -0700 (PDT)
X-Received: by 2002:a05:7301:160c:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3674c63d927mr549854eec.11.1792529955015;
        Tue, 20 Oct 2026 13:59:15 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm1247328eec.5.2026.10.20.13.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:59:14 -0700 (PDT)
Message-ID: <51147489-a26b-480c-9d33-a09eb858fbb7@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:13 -0700
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <20261019-ninja-velociraptor-of-gallantry-2efa3c@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-ninja-velociraptor-of-gallantry-2efa3c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vGMtQERS6vaEpMZHZ4o5jONifMdP5aYa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX7z54o+eV3ppB
 rMNyRa/GbJ5XyrmPo9RXRhHHJDLnFGSt0TbzDT6BXddEAQqGhF3zWQ0zFV1kNaa/fQu9Gzs2CCt
 VE7Yr+WIx+e3fd46BdliZ+u/sJ7wCOQ=
X-Proofpoint-ORIG-GUID: vGMtQERS6vaEpMZHZ4o5jONifMdP5aYa
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7d624 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sn4hIavaYfXsKkgl5soA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX7g0YRvDdDcPQ
 ph1hghu0mY5txmh9IMZ+oZ/Ri8xEljAN0gAVet2FvMNs4gE4Sr6gEJgVWY7CTDBC0iyxFpqTFNt
 3FWimHP+mHJRGHfQ2XDgQEzWmIhVASx1Ztma5mxba1zCO99IjicJ8Wj7uaZDA867X2MAx/d2nLt
 2ZLiiyPQnKW+Enxvy9W+pu4vSH8thrHfncmMUKNlCblIW2Jr3Ga7An51F7w3V0Y8jTmrMGMlvoP
 nT4quqilJjNy/Wu534til1oTywk5ljxDUPAXwWekeGSkhMi2VKD3eJk/621K7K4R0dfAZexobeg
 3ZzTM8vJ0yYoMCfEywMJcKkdDmh3Kz00otJ31GrUUS2XX6pji121QIDMk/GnDJxgwu32Gnn42LS
 4UMUqrQ5N9BlKHg5piFPqyBdP3b+n1XEUC6VY3nIIW7vMlAdcz5cW3fNgeWIajDUEoZM5zvUu4l
 XrW+Hgmz1ftqgwcmeiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200083

Hi Krzysztof,

Thank you for the comments. I have replied to Bryan's comment about a
single generic yaml file. Based on his comments, I will drop the next
version of this patchset with these comments addressed.

Best Regards,
Anusha

On 10/19/2026 12:16 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:57PM -0700, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> A nit, subject: drop second/last, redundant "schema". The
> "dt-bindings" prefix is already stating that these are schemas.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
>>
>> Follows the qcom,x1e80100-csi2-phy schema's shape: a ports/port@0
>> sensor-input endpoint carrying data-lanes/bus-type (D-PHY only for
>> now, C-PHY bus-type value is accepted by the schema but wired up by a
>> companion series), a port@1 CSID output, and a mandatory
>> operating-points-v2 table plus power-domains/power-domain-names.
>>
>> Unlike x1e80100, SA8775P's CSIPHY has a single power-domain: the
>> Titan Top GDSC, matching the legacy in-tree CAMSS driver's
>> sa8775p_resources.pd_name = "top" (drivers/media/platform/qcom/camss/
>> camss.c) and the existing lemans.dtsi camss node's power-domains =
>> <&camcc CAM_CC_TITAN_TOP_GDSC>. It is not OPP-scaled, only kept
>> enabled, the same way x1e80100's own "top" domain is.
>>
>> The PHY takes three clocks (core, timer and the shared CSID CSIPHY RX
>> clock) and the vdda-phy/vdda-pll supplies. The core/timer naming
>> matches x1e80100's clock-names convention for the same pair of
>> clocks.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 172 ++++++++++++++++++
>>  1 file changed, 172 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> new file mode 100644
>> index 000000000000..b66ec2f14189
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -0,0 +1,172 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8775P CSI2 PHY
>> +
>> +maintainers:
>> +  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> +  CSI Decoder on the SA8775P SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8775p-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +      - const: csiphy_rx
> 
> You just named it basde on clock name. Instead, name it based on the
> input name. csiphy is also completely redundant.
> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +
>> +  vdda-phy-supply:
>> +    description: Phandle to PHY supply.
>> +
>> +  vdda-pll-supply:
>> +    description: Phandle to PLL supply.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. A single sensor is described by a single endpoint
>> +          with one to four data lanes, numbered 1-4. The clock lane is
>> +          position 0.
>> +
>> +        unevaluatedProperties: false
>> +
>> +        patternProperties:
>> +          "^endpoint(@0)?$":
> 
> so not a pattern really and just endpoint.
> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +                default: 4
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +                items:
>> +                  minimum: 1
>> +                  maximum: 4
>> +                description:
>> +                  Data lane positions following this endpoint's clock
>> +                  lane. Positions are a per-port logical numbering, not
>> +                  package pad or ball positions.
>> +
>> +            required:
>> +              - data-lanes
>> +              - remote-endpoint
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output to the CAMSS CSID controller.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    csiphy0: csiphy@ac9c000 {
> 
> Drop unused label
> 
> git grep csiphy@
> 
> Don't come with own style.
> 
> Best regards,
> Krzysztof

