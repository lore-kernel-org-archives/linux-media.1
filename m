Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09623DB326
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902373; cv=none; b=gpWKFWbaJfguqpA4Td+0Y/dzGll/4dTisdzBQujcA5TzV+7TcMZtgpL6ux3bvXdvvUTsOmQC2Ba0biUD/LeJSTwBHqXWIwN2f8nC8U5DLTMJg35b80CynJEN3HtVo2tYyMMPdjECbYjkRI5j8NWepdtZzv0vZg0UFCuR9tOWODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902373; c=relaxed/simple;
	bh=LGKI1KJ90VuLGqPMu0oT9i7BQ0JNdRRtcySPaXz6jbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJ4qMZgcuw4+fj1bHqKXb4mNqR2LTMI+Bklq/XKfwOpyrKxj7JBWgcDqqI7fMDFRq2jeiXVdGPs42cqt9tvSkrvWSD7/WPYxl1PWuduIRVXcSFODye463WJtJj2mOxreUJqObgdBNfNiUopdU+xHUFzfg3cNMS3qAtQb2jL8dbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qTMVZint; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qTMVZint"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2af9beee4so78836e87.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784902369; x=1785507169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tVTyLMTq0CDU083g87e7iSrtjPEaVsy/e4kL9OZfGks=;
        b=qTMVZintg0jYiHbyIHjKkLuOKo4iD/8a4By/HK+diFciqo6mKv8sldsews7uPIbOwk
         zBfgiIia9uT7d49eXCeXMr7gBkDmaClMMzeTJuxm7h9J13i0Zqpkc/2e5yXI+mKhY6NI
         Xf2xTPXmQABJjzzwrwPlfT6O5KQm0OorklmWd/LDCXunKqEZATvG5QGI7Thl0kXbDG6L
         +PZLZqRt56MvGk/qTbOr1rF6znRVTy3jrxwBYbiB67diuGgjA0eEdYc4AArXxIKFJDyL
         A0PPM78qV4J6m7C4KDVmCi3LSSkETISAkaPpf4ZgZSsrY/ycG/OfB3P7F6vkcinIcOxH
         gpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784902369; x=1785507169;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVTyLMTq0CDU083g87e7iSrtjPEaVsy/e4kL9OZfGks=;
        b=iYuHNuLHfr1CgkkTEBl5GGHaXp8hO1PpgnxviA3NrqtMzmwzo60K/pOhfLiDBa6AEh
         wwzjb0I24ZT9WMO/C7OLUnregYM0cFAWTYK5bEDK+Ai+ykUZSxJx1Y330rW/3Ut3mR0L
         P+x1DvKPY03vxT3wV0uSW3R7xkm+IlwoPO5ZnbBMloSlPhST5sTts/DMF6rIWF2jaCWC
         jGGDKcbVqHWDx/030axMAP/JnlGZ/tIr9pb+4mnb09kzgtsTSPUO43AoRq/PhfF3qBXq
         ZKzDa0TQY/1/RlxyaAZsuKfXLeKr+zs6cj5l63zgYKmSBdTd8KaYksHT59V/jqWWbqvF
         KAJA==
X-Gm-Message-State: AOJu0YyFearC6JiocR+LzIy8x5HpH+BUa7oFVc/OSymsuaHktXp7Y90E
	LftyU6HOBdOm3pUsoTzfZq7McrWfny50VXcmSD+RaSzS+/VuLYOA0YXdtDC2WFGe4a8=
X-Gm-Gg: AR+sD10jMDzQEUPj2g+ddTSd+pO8NeL2sQly/TkFEM6Y3Mu6Qcj8/gN85umlzkkAMv0
	yaa0zZx83aKRMRKA7/O/eelVvZjBDW/Up95RjYHE+xEVu6LjgXQiwM1iIV9aY+y0XMNX1LmjcVr
	luVgedvwAUubTKYj14e4JIpmiQVLy0mpL44ZsAMGSE6/L7vMQ8rcFdnI7q26iZcFD90hGHyLEvi
	XUEZuIKUmW4kHhLxrFAQgEW8x0/eaNyGdLP53+cAkN4A372lDLxh7D0DAAgaCOrTe/fJHeFMMTG
	fI+Pk6EsnhAMNWjFYb/Oi8xjzYt8Xl1vomr+WhcdGqq55VNbJ5MdKBEOQkhsz60caDZoifeEK0p
	pdplJubNvAjl1ZS7Los3y5xMUIM94XEZHLroi6iN51onQDY7u/AaHjt9BpxE9Pgfu6AN6nhJjDG
	Q+YIMUE6CoBDQGfTXBVI7PgLfklwraBVcykOfQpWPgO0EaPARH8ReZtVDu
X-Received: by 2002:a05:6512:6d4:b0:5b1:5dd0:7134 with SMTP id 2adb3069b0e04-5b2b2f8674cmr843257e87.8.1784902368973;
        Fri, 24 Jul 2026 07:12:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d3051bsm1608596e87.54.2026.07.24.07.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 07:12:48 -0700 (PDT)
Message-ID: <442145bb-9487-41be-8a9d-af5553e6fe8b@linaro.org>
Date: Fri, 24 Jul 2026 17:12:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-1-871d3b9a2e47@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260724-sk5jn5-v2-1-871d3b9a2e47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 12:50, Wenmeng Liu wrote:
> Add device tree bindings for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
> MIPI CSI-2 image sensor controlled over CCI.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../bindings/media/i2c/samsung,s5kjn5.yaml         | 113 +++++++++++++++++++++
>   MAINTAINERS                                        |   6 ++
>   2 files changed, 119 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9526d2bc5f5be236d7e3d0f1409df2ef991dd0e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5KJN5 Image Sensor
> +
> +description:
> +  Samsung S5KJN5 is a 50MP GBRG 10-bit RAW MIPI CSI-2 image sensor.
> +  The sensor is controlled over I2C. The full resolution pixel array is
> +  8192x6144, data output format is RAW10 transferred over 4-lane MIPI
> +  D-PHY interface.
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s5kjn5
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK/XVCLK input clock.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to RESET pad of the sensor.
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description:
> +      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2 volt
> +      I/O operation.
> +
> +  vddd-supply:
> +    description: Digital core voltage supply, 1.0 volts.
> +
> +  vdda-supply:
> +    description: Analogue voltage supply, 2.2 volts.
> +
> +  vddio1p2-supply:
> +    description:
> +      1.2 volt I/O voltage supply (VDDIO12). Required only for 1.2 volt I/O
> +      operation.
> +
> +  afvdd-supply:
> +    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera@10 {
> +              compatible = "samsung,s5kjn5";
> +              reg = <0x10>;
> +              clocks = <&camera_mclk 0>;
> +              assigned-clocks = <&camera_mclk 0>;
> +              assigned-clock-rates = <19200000>;
> +              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +              vddio-supply = <&vreg_1p8>;
> +              vddd-supply = <&vreg_1p0>;
> +              vdda-supply = <&vreg_2p2>;
> +              vddio1p2-supply = <&vreg_1p2>;
> +              afvdd-supply = <&vreg_2p8>;
> +
> +              port {
> +                  endpoint {
> +                      link-frequencies = /bits/ 64 <1248000000>;
> +                      data-lanes = <1 2 3 4>;
> +                      remote-endpoint = <&mipi_csi2_ep>;
> +                  };
> +              };
> +          };
> +      };

It looks almost identical to samsung,s5kjn1.yaml, this sensor has
an additional vddio1p2-supply though.

-- 
Best wishes,
Vladimir
