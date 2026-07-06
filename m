Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B0370AE2
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333187; cv=none; b=CYabobxp73cMbu4tUJFVdA3Qvi9jPdx8KoViOm/u/y+jUj7vEfbI/bNZb6xo41vuLSE+rly3cCSBzJEcu3gZmdEiGDn3jpS4k+MXtfzdwxJNelkHAQ5hiBEo8+jMyPGcN9mWsPz/P1ijXsi0TFcfZFWZZnv2RhVR8askAnMowPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333187; c=relaxed/simple;
	bh=KmfR6yIAJ2fYTP1OLR4lLsR44XEMajPeyLYwK0BAJsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1gqnEobjo+Ah53k9yA4KGmn4J7a2oVqdQq6GCGblcLhpNfLWnjaL8JJF842rEy4XtppqWSvzFUopJcQU+iLInBh1P6wwaibIph4VcURxn9dlWUi6TeTPNw9XCJ5bMDbooEkddlbbZieng7CqIor4x+MKMbSNJuMrErmCowDa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeb9lfrm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeb9lfrm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso3501071a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783333184; x=1783937984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74gU3islGwdmxnesUaUsU+krAV2TXhAdAquxY2zrLBI=;
        b=yeb9lfrmZAuSU5aFKe3IupMgjw07nos7Rv8UtZbGvLisy7Ro58Y+0jpSWOdYqIo0BF
         wUNhy8sYQ91rTmSJoRAW5E/d9WnF7rL9dmu8vKPzS96gQ6laXocBkh9gNqlzorMgRq9s
         rNHcjix65uBMdVovu3qADKyPDERvC3A7X5fQuPBI9zlSQPV/hjAMrMZQRrcb37X/roNK
         8naPzIFoGve69cRcp1uR9D9FXK/aRpZXjHMmBQIkxUIFsoCDtK2OxBNrYFBIfZd5D4Jh
         lHS5ozylSLhONajDHXrqHzlzAvMKB2K1khsWi+HYEnXLgqVHf0pxbuIZ5b+7KHfEFEjG
         YKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333184; x=1783937984;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74gU3islGwdmxnesUaUsU+krAV2TXhAdAquxY2zrLBI=;
        b=oR8ag5QXWrroQbgI9XAXNpQ3ViHnHA4ZA5ghcszw4NA4tS7JdUfu2zGJeotiIn8THj
         p/v2DajyQuww1WpY7/6s/XlFINRhMSquNY7lyPWRRQOVZjjN0igd6llr9LYOmZIiU+qe
         AF4W02D7gDZ1YYAzUA5ddPQucWASDEwRXBGjm90siPAwyoOc2zl5vdYlQ1ZwtrwR9Acq
         d8W5NvcsYqiWrUuJFJPJ2PI1sU52RWMLkLXHxU3vcgth2KTN7cKeLzQ1dzC9drdW3l2z
         2esN8VGH1AckBVeezrNtu3piSt3fBx12LmP377hA8JrKimAu6WIg9dDH0O7kVr6fAy4I
         c5jQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxhV5V6l/rN8fCwUV1Z0tbtTkfsdYY12mxvXb3LUBMpPm8BuyJ3JhUuFSmIA2gKgKGvEOj0gnMlk1Tzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/VSh+9TzRWjJSK58IzBQ0DH2PEw4ahcy9vaVeACLmjFaK+Pry
	s7j+odPZ3YBWDdOPQpeS3RFvKsMjKBNl6xG6iXfmgx8MWvOEPKfTdOCPtBuPC1Ad5aA=
X-Gm-Gg: AfdE7cmASBYAJcksD9v3L0pjFVnLBTx/Y7x0N3iyYg/hIUROzE973qQzGPLNcMQf9pc
	BfkuA8JHCqkT7zgnGricS/BmbwZw9RdiXXJgfHDFkLRlu58g0hRJhBmtZvljLe9HlLnvuShzpvo
	adrTLxe38bTVSm6tJNErXeAeC7fFy2jUFFRrQfAHP42/OObFSeKWVTsr2JfRVopAvfn4ZGGWcbX
	vdpzksLXzaixX8K2iFeWdAGafOgxW/nWmeIdGn0QXQvWYX2BUaDH6ndDz5o8KeecjhFTe1YOCT1
	pmXPWQxqq4RL4wTBgM+9WLGzoI+tk7v+s4QCl4LQsSuK3B0sewbGuaM/0u7IQ2Rp6xlv9w67Tqk
	l2oHU12ln+7kMeAySMPoOP5wWMd1WQA/qboUJi4ydnvgc9I4BJhBAt0TYdT8juwAHcElHrRiDxz
	MY9Q8l6TY1hb3N0pcR51iaVjP4UiFRvtnKuUpt
X-Received: by 2002:a05:6402:a204:10b0:69a:11a3:ae82 with SMTP id 4fb4d7f45d1cf-69a85c0b975mr170a12.25.1783333184042;
        Mon, 06 Jul 2026 03:19:44 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d78a08sm3829915a12.18.2026.07.06.03.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:19:43 -0700 (PDT)
Message-ID: <ff2a7084-f343-4121-8e44-a0777856af09@linaro.org>
Date: Mon, 6 Jul 2026 11:19:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>   1 file changed, 151 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..e4c16388ef07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +
> +  iommus:
> +    maxItems: 1

We've been asking people to name the IOMMU SID to ensure we are 
including the right SID.

My own view is we should have a header for these items with a meaningful 
name - separate argument I'm not asking for that here but please do add 
a comment naming the SID.

> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - iommus

If we have clocks and interconnects, there is no reason to omit 
power-domains.

Otherwise looking pretty good to me, thanks for sticking with it.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    jpeg-encoder@ac53000 {
> +        compatible = "qcom,sm8250-jenc";
> +        reg = <0xac53000 0x1000>;
> +
> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                 <&camcc CAM_CC_JPEG_CLK>;
> +        clock-names = "hf_axi",
> +                      "sf_axi",
> +                      "core_ahb",
> +                      "cpas_ahb",
> +                      "cnoc_axi",
> +                      "jpeg";
> +
> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                             "hf-mnoc",
> +                             "sf-mnoc";
> +
> +        iommus = <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 = <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;
> +                opp-peak-kBps = <76800 104166 104166>;
> +                opp-avg-kBps = <38400 33569 33569>;
> +                required-opps = <&rpmhpd_opp_min_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <200000000>;
> +                opp-peak-kBps = <76800 208333 208333>;
> +                opp-avg-kBps = <38400 67138 67138>;
> +                required-opps = <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <400000000>;
> +                opp-peak-kBps = <76800 416666 416666>;
> +                opp-avg-kBps = <38400 134277 134277>;
> +                required-opps = <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <480000000>;
> +                opp-peak-kBps = <76800 500000 500000>;
> +                opp-avg-kBps = <38400 161132 161132>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz = /bits/ 64 <400000000>,
> +                         /bits/ 64 <600000000>;
> +                opp-peak-kBps = <76800 625000 625000>;
> +                opp-avg-kBps = <38400 201416 201416>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };

