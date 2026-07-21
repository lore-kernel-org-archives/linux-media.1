Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53705409E0A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670551; cv=none; b=foCE3pdCYJc1BGMBkN1X1LlbaUSd0n4cTFJZIPFegYCOXpPHj4LZaDXtz6BfuBQjwI4eBv52ZA/7OwQP7VRIkaGRt3AHZaN/kVpJ1JZmCirXnK7HMZipSLUOGvipv5OfNecOUdJEepQwzEkQ9U2Gl7dhG1dbnEPGbGzGVXsRei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670551; c=relaxed/simple;
	bh=TTzIq7jSHz4AYC3VS6WS9o/imjClM0fmeZAsDYpYJjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPrsS5FqSnxc356Jyp7WZ95CZdzbMoB5mqRNQr9/G6grqv5ZwplGeyOShBIsKNk1Ce4UFFqmKE1fnQ0c3c3C0zN6OT9aCakbDY9FXiFn/Psturc6y9X9NNfpUMWerCDHIeMgVo5oqWDjyi2aY8YZoF1KW/Mt2/48xmZaWJR6X08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8zX/jVc; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8zX/jVc"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c7720bc9cso7248621fa.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784670547; x=1785275347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jJPK6WsZUoetFgU5n/OkwtbmgnvsORPlU3I309PYPVI=;
        b=w8zX/jVcYOsrNLylISxexZgTzz4BgtYLaxx3RvOHCcxYn78k9z8hktLW6j9OEuP9+j
         pvKQf1xO1bZY7YipSQDsXY7OyMwVo5TZtXxPnDWpkCPNFETw3QLma8/ks1A05l2EPJmE
         4SqyQ2rohv1TItbKjLyRTADyFiwGpXVrhSeClBuZvviW38Vt/ZgrDUwFNtNfDx4882fP
         dgLwEft5u4sgWoBTQczdoRx6qSwPIjWhiM8DjB/UMCKsZB7g97mi3/+uLunsATgce7tC
         yZ64h4e4rN/009s6kPGcbR3+iW/7CaHFy6SPaRWWGeAQjos+9qJDmz7pxJLS7plusTbP
         vb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670547; x=1785275347;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJPK6WsZUoetFgU5n/OkwtbmgnvsORPlU3I309PYPVI=;
        b=U0HvtJ2C2EJq7T0LAax35XIZb3TaHC/n7l/aQ+5sTU2iXV8r1ZYD7KGsnomFs8AjKo
         mEIfVYuQxVeRAhLanH46ZnhZuBadnNkvGLfo9VX7oAIeYa/nQcwTd3TDSFzYVyF2xJgL
         3aPh5NlN+FwZ3KXA8gqxCE/m135m5Upw/9dRhflmmq0qQQvy9NSmRzToYAVDaavHHRwq
         0T8FehRyAEasQ0p1LHsB5W4anmc5xw0HyeKNwDCBgyxR40r27/iJH01oFasLwLkAPug0
         h58YqjtJCnzNS2Sk09mdjG1NJc+WbSb1DvSFmtpMKn6Nu2pkB+NL6uT9qSR5KaoUR+Zu
         Z13w==
X-Forwarded-Encrypted: i=1; AHgh+RrWdsSNz3G/rYBhsmjO2whehhleUrL5gkh++it07ymSYnte9iNjypKVl8dLSZTtrRbusbxzHkDmJtBN1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WAoVnOBC2iOB1kvWPVaed1I2XMXVnNlLNu28oAdA67yYBGW1
	vLk1OMu3sJCswnqnSTFfRM3pGZhYB7sckIDy8Q1YReuz0yiqcWDXChv8emSLP1l0aMU=
X-Gm-Gg: AR+sD12PVtk1hioBKWIegSQvG3Uxf+94xsLB+Z3mpSL3hj9XLgmGt8+hK+3gIK6q3ER
	cR66OHz6TuvzZ5PjJfyCOzgtFb/nw6nIDVPZ1HzH4w9QESm46glsUiyQYBt4oLeO5YT3I7roOxy
	Udp4N5TLRT4aTsCHHzcmpGPrS6JmTFnn3YA2MuJkCED5zgwk/NxM3a/BPq69/5ust/W+ZfaXd4Q
	nNTz5ay7W4lJxQfxOMPc5iOkSWwwqpZBvE+5CANUMR2fpM5FxXNhkUgpig2ktuiFJn5VuMDez9Y
	ny6Ek6JmOHIXe609re+4gajrJWIo4l+sL2EkZ+FReM6PaiOJy2+JPTlznIl1IIq5QGuKBxM0EcF
	oCQ2xRL1sIFzqFUFIohjCou90gjLEykUCt20kYysAM9nAmUSuUDMghCCJcz4O+8k0HieBVHlU0H
	/v+4L0Z6i++VbcQLQ/IRgouAWjHuxbQUaz3HBuiikgUlwV6tKkrWJCBQ8P
X-Received: by 2002:a2e:be28:0:b0:39c:6e71:8332 with SMTP id 38308e7fff4ca-39eeb6a2bf5mr5917561fa.1.1784670547167;
        Tue, 21 Jul 2026 14:49:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558d5sm1317761fa.30.2026.07.21.14.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 14:49:06 -0700 (PDT)
Message-ID: <b974f1be-b802-40a3-a54c-f7e3c8fbbece@linaro.org>
Date: Wed, 22 Jul 2026 00:49:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Frank Li <Frank.li@oss.nxp.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <al_BEUNJOrqVPQWw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank.

On 7/21/26 21:57, Frank Li wrote:
> On Mon, Jul 20, 2026 at 02:11:34AM +0100, Bryan O'Donoghue wrote:
>> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
>> supports both DPHY and CPHY operation. A special mode of DPHY operation -
>> called variously split-mode or combo-mode also allows for two sensors to be
>> connected to one PHY.
>>
>> The submitted binding here describes the DPHY modes of operation only. CPHY
>> is left to future work.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>>   1 file changed, 195 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..880fe602945cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,195 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm X1E80100 SoC CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +      - const: ahb
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
>> +      - description: MMCX voltage rail
>> +      - description: MXC or MXA voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. Always present. A single sensor is described by a
>> +          single endpoint with one to four data lanes. DPHY split mode,
>> +          where two independent sensors share the same PHY, is described
>> +          by two endpoints; endpoint@0 with exactly two data-lanes and
>> +          endpoint@1 with exactly one data-lane.
> 
> Sorry, jump in so late. I have questions about this design
> 
> why not model each lane as sperated phys.
> 
> csi1 {
> 	...
> 	phys = <&phy 0>, <&phy 1>; // use lane 0 and 1, connect sensor 1
> };
> 
> csi2 {
> 	...
> 	phys = <&phy 2>; // use lan 2, connect sensor 2.
> };
> 

Such design has a number of flaws and in general it looks overly
complicated. From the beginning it's unclear how to distinguish
a clock lane from a data lane, how to specify lane frequencies etc.

-- 
Best wishes,
Vladimir
