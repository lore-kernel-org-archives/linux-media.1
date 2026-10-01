Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D4C3F54AE
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832553; cv=pass; b=jRyYDonyaGnLC44bo5DXeS582zj7SITmjyC4XcJYEwp7/QdXmvjUfBh1++542yoA7G2WWIpN56fj9YXX5Gy83yLFIVdNcK33JaBH0sitp61emNXQLoclfh56a/hcuGyaxY72DDXMrsENsThynRWq6D9qnS92deOO7LLBs+QIj3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832553; c=relaxed/simple;
	bh=iyH4XmChuCIrSHjq17pUFOv3IOKIb+u7oFkVPS6lsQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=OomDUpbzv7zYiN4k6reXK9e8ZunQmbCujqxIRlqVO7Y+MlxdkQw/jQ3YtBmyTBrMr5rHzaV5/mnWOJJC39IycbFhrO7n1F3bKRhzg3tmBP54BFBIUIyABxFQzBkQMroMFedhQtCDnS2zttrzmolfM0qBLGnxhheOGmZh+cChHJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osDYJEBd; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osDYJEBd"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so7816220a12.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 22:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790832550; cv=none;
        d=google.com; s=arc-20260327;
        b=a0iZnLmrno9w8dr/6Q2jOHEZq5g+lzXqiD4MqCRmgsl7OuwlI77mrv6Jy0AsvgZcQV
         7oqZFmsHEh6P0EtdgtHajOOHqeK0VH8r633p4bBJTm2pFnB4Yn3C01NTwLEgfzIg7IYm
         vU8R3x/xwWMmBa3Hrco6DXsmtOojC7n27l/pPB8VBnhH3VubDQnUjMf7d/c5B0pPEr8+
         vCOI//bMOpooEjU+07chpG27JxFHtZE9y9fiLWgqD4btSpNamdaIkqVvBIPp7T6yxDSu
         f+MASHbW0XVpcThLgn6y2MjCzpbXNrnfNh2FB8QnWcp5q7ofcn3Mv0/u18J5+LsF3i9M
         fYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        fh=LggCD2BDzXzC2ev0/4sua5JzVaiu6r1a+ey2irCsUB4=;
        b=edy5IlCS/OxT5wAEbiUupJuI/OwbgN+gyp0xL4icVCo2UJyi1fzmLsOGtcwMkgSVDB
         s0AivkqJJObmo1QJ4TCkeBSQERSA0SSd3iMmtGJ2crFpk/W5rXMNrLW6WI/6XjOqi281
         7ppAcR/Roevch0V2KtmM5nTPUOqFTjOwBGx2MVxpksUhu2izq3lnAFymMYUeXdQz2+iN
         c+6vdV8d7buymyQd1ewpl8gKyIF/xMICKa0+SuhmVM6yM9aJP6pSiTazuvk5fwUglrKH
         vN0oI1ech2gUYYPslfR1m/USplJ7SYurqCLP8ASYnZLj3z6jStawE1Z/27NpcFWo6QK9
         qu5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832550; x=1791437350; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=osDYJEBdSquqTH4ZFXpMUHX2XBr3nOEgG1h8rZyrujLdLCVNRxl9RPOdGTRH9DmyPz
         l3ITIkRVULsPCqWaADStaEPoZoUY442sUyEh3MUoEBZ/dlPpdiXKf+PbY3N6dFOwtzsi
         jPtKhfP1YbdErbdskHmZkFDbE5BYOfsL8/ZZT8Vw0X8SXZ7qJkuq6/b9s7L3r7qWdmPT
         90aS+lptcxezM5U/C4ni4Cl8hoxNfY/UXpJodKYKzlLhXyyKKth82yeJH4K25tZKUlqD
         TtssVuIXRsIAP4l5SrN4Gah2XAuVCE75YbjpqamLDpXjtDj27m2fjwmHm5teYeGFEf26
         MOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832550; x=1791437350;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=RRLI7mCcZR79WyR5ClzCrrOdkvsvCwP0/HNpHQkbckvRtaEBhN1b5IZ2GW5xy8oCUR
         xjigE7KkXzrhYccyQTmjUwY25QMRPG4qrnHpFL5Ds7mHXUQiM79XLp6PjypHLUZ7dpxo
         N/lx9xeAGJK6TZj13sMwAP/rXXJawQbNWYmWS7vy7uCQ9wOOb5JvcsmLNpC6j/duwp48
         jaK9GrdP2x6JbQ8dXtNkykhnl+Hbz55pfNRUDPGbUK1jvXEvWgUUOZxIiXCuQXwCgf8J
         s7yFeeJreMLPRWC7i7KvN53QQgMoAVeQlf4opDFyIC5KUYasmSS0z93xU6pENs4Xb7tq
         LjgA==
X-Gm-Message-State: AFq9FYIBspdj+jnm8RMCFFRQMh8Ry4IWmT0kphHuxVuK5znrTKrH0its
	mU1TvKDnJ8Tw4A0/Jae9/h6WzoD7TaddOLmiQqfsGWIeRF3futZd7ickNW8IAagsftVfR2+ubhT
	Wb17CSr3vgplpu112urKIKzNNvofTPqgjMQ==
X-Gm-Gg: AYBFou0agcwynolmRLxSCvyC4LtmkZEiNr/UnNx99e2pv7b+PExmnpviBT+OyWmdN2m
	VrT5i7vhthnD5xihmSb8tdClYYO0fJLdrB7eLVh90hKu5B4r12Bc5+rF/VKsi0J3zWGzNS4h4QS
	GcnCjWRpw+cWOxdz2oZE2ODlIAi+vltTC9Onqv81Apd0Sz57p1+BKCN9woGSvJ9jc9nqH0R5nfD
	dUtpRUTRzIT+6ip4FFtSw4kSwmVRn7hEwVi6N2ISVYJWU50l90IjoOWyyZuxHFzAzMYsFjBLPPJ
	orlpsj5FkHsQAcgADx7t3ClmzPKcvQsQoQf0motbpVuA00pdv0yxnjikMQclqf/YiA==
X-Received: by 2002:a05:6402:1906:b0:6ac:73f8:2e5a with SMTP id
 4fb4d7f45d1cf-6ae199853d6mr2960704a12.41.1790832549463; Wed, 30 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260923211816.89954-2-lsa.uz@pm.me>
 <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
In-Reply-To: <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
From: Andre Gilerson <andre.gilerson@gmail.com>
Date: Thu, 1 Oct 2026 07:28:57 +0200
X-Gm-Features: AclHuK-VbD2xvscLLOhBugu82UCpNYQ2zHUF3TP2o0zojNR6k3K4mn-rv3V3V-A
Message-ID: <CAKNG7X9NkbXSnWGR4-79akJ7WiVeGa7D0mC=p1Pz2gTFO4npZw@mail.gmail.com>
Subject: Fwd: [PATCH v7 1/3] dt-bindings: media: Add Sony IMX681
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everybody,

sorry for the late reponse, I was away on holiday. I was originally
working on the IMX681 driver as part of my efforts for running linux
of the surface 11 pro intel. Thanks for Sergey to bringing this to
mainline. As Krzysztof asked on v3: I am fine with being listed as a
maintainer here, but i would include Sergey as a Maintainer as well,
since he contributed as much work by now.

Acked-by: Andre Gilerson <andre.gilerson@gmail.com>

Thanks,
Andre

PS. sorry for the doubling the email, the first one was rejected due
to HTML formatting

On Wed, 23 Sept 2026 at 23:18, Sergey Lebedev <lsa.uz@pm.me> wrote:
>
> The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
> several Microsoft Surface devices. It operates from analog 2.8 V, digital
> 1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
> 10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.
>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> new file mode 100644
> index 00000000000..6d2e4ddcee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX681 CMOS Image Sensor
> +
> +maintainers:
> +  - Andre Gilerson <andre.gilerson@gmail.com>
> +
> +description:
> +  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
> +  array, used as the user-facing camera on several Microsoft Surface devices.
> +  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V supplies,
> +  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
> +  MIPI CSI-2 D-PHY interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx681
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (19.2 MHz)
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (2.8 V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.05 V)
> +
> +  dovdd-supply:
> +    description: Interface power supply (1.8 V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO, active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
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
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@10 {
> +            compatible = "sony,imx681";
> +            reg = <0x10>;
> +            clocks = <&clock_cam>;
> +            avdd-supply = <&vcc2v8_cam>;
> +            dvdd-supply = <&vcc1v05_cam>;
> +            dovdd-supply = <&vcc1v8_cam>;
> +            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +            orientation = <0>;
> +            rotation = <0>;
> +
> +            port {
> +                imx681_ep: endpoint {
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <969600000>;
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> --
> 2.54.0 (Apple Git-157)
>
>
