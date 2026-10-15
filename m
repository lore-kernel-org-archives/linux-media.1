Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D89A4C14E2
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066639; cv=none; b=JDYl5CJJsXm6FSqakj3M4YG4JG0nnquIxYP0ZQjXfGwtFnVdi3QyDM32iwMhsXITelwTDfclLOq6Fq33R00r9BAAmH8oLJ1V5qMi5wE/aF1gfoXiUwTW0LyDTn0qrvZMEP3oguJnbUPaLHd4TY0I8iTGkk9WtRrrCgs22L2Q3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066639; c=relaxed/simple;
	bh=+cu3tY8AFUM+eV4SLAgVAUZxH2ozE0k4wg3g2rhklmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJ0TZOaaLXi2vHlziNfhXThdeF5/9u+/mIzqGkd37M2v8eX8uz6laIwnfMux3wtTXBqtUQEAWNTdCkSfmdpiyWrNt2W7kQHgMh4XVHCsO2opy9DBgpobABxUxXlVu7+v0gG94SD9B3pbW2wK1JZ+YLmEKRBXSL1+OaAKzUZCLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ampdpgar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzi9wQcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ampdpgar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzi9wQcx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuuW1596369
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kwvB1zKyxNXdUuzLtE3Xrjsi
	oZNHT7RX4lExGCslwX0=; b=AmpdpgarodzIVAKJa8VQxjU3IzQux0vpqCcAhD7c
	ZFlIcas0KLQn13sqWS0jJh40xKUrAc8+I3v0bHOpN0XSKUfV5uS+AVw2cjQYO3Pi
	/j9iz4brp7TwDEzjLTTfHoedSoLBLvf93/yZCeBhCDXNPGA8JNM9hSLtw5759kEH
	2hOYzU2+cscF3mrrIw7GqLyf2wDE7jFE7lAG1fMNgbkoABZ7voXmD8TS7kIzOleC
	fEihV5xE3MJimuMr+LQNUuaUH696j4epbU+JbrtpDfoZ5m6lhITY+2HRuyyuhOQl
	wPB7BS2p0K8KCN7ykoebhsPhW+jlLvSmm1IX/OimxfRIZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8cv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:17:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso23864696d6.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066636; x=1792671436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kwvB1zKyxNXdUuzLtE3XrjsioZNHT7RX4lExGCslwX0=;
        b=jzi9wQcxSpI5ZmshBoB5Y3nvSv99ZA50gigzn75frxvXMG61xxQRTMqjysa7gORbum
         xN1ylLpG1SyeYxntJ/5zDkRcKA80KRITVCTM1TRkm2Avwl+UNCvDf91LZM+EiycA4KKF
         xHHhGSo3EQoTOoN88R41EQh8OYysFwFxtMNqUkfjhWOtb+USW34Xz4kkIGj1BWdXxI7h
         8wjrHIxGZlbq3eW+ccHuh3SKn9lU2+i0NPXx6I7cqqrNBN1xNrDTy2LY8AeegWKmwOLu
         mDnvFgGQqmWFhQvYnIa/2GWJLnmrZ5Hh05s8h0pqInw+mU6PUgez7CmanB60dH7Cs1Dw
         vqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066636; x=1792671436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwvB1zKyxNXdUuzLtE3XrjsioZNHT7RX4lExGCslwX0=;
        b=RzVeS7ci7FfeqFgkexdwo/KTXq8kGBIK582eH52Pla01EyykCTdJwu2yXbDHL/pokQ
         GzsSsC8Q/srVzxcDiBe1+0OVum8bfLI+zU80xLd1SPP9zBVcBEyKRmfXJPtojPRDluMN
         qZ0yxU0l44KgXrhcmwnRkucKctHQ1SRwNrm7cfYq2561dVFRr4iRxiO0xk8Xskm+n2ZN
         4vkQn3YixQI/THasJ8a2y40dh65i0F0UTsYr6LFDLCOWq15K+spw7/H5HNnCHFFxPW6z
         PLdkDxyc0YnGcwcLuF1JnyzYixBGRqy32ypeXIk6INbLStKttheF9YpumVYNEktr7ZRj
         kXnw==
X-Forwarded-Encrypted: i=1; AKwUvBw6wmp0g/1g1C4sROUNGNOXnhOZ5852rZpVYGaHTx88G1FATx7JZXn+GlwREYbAxARqZ7ArnBJKuGMz3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHdcbeBdK0KbLe0lsLZLZ3O0guNAO395fnEJkI2YnXKXU4Ye6x
	ljoAcTqG6s2tYCvocCpfPXv7lG88qCv8Zs64ec8KcwnpnN4fuTMzNxcwdiQG/LR3NHpi8bRtML/
	Yw+rUxEADgjPE0NCYAZOqawk7yfgWGYYBOo7Cyt3n6JYYej7NyKliije0pBSiBFPlQQ==
X-Gm-Gg: AYBFou2RyZnUcDfZ16o02McAdaQCLGFMGhx6v0YnwKFi6gCCESy4QW1LBAyo5X8gFsg
	VxHRGWecAFYxlUnN/dA3V0pI7vVf5xn60gW4YgW1kmkPb8n+BwNFOSdpqFmOM4O69T6TW9Tx9DD
	ennPBGIRIS2QWqRcsmj7k7fMvPHLzv9+ccncInVZ7llyXCr+kczaWRY0fcHlPyoLwslIwkzPGf7
	6xDC+xgck6F1AbJK8UtqNkN7a6b1MfrFjRZv9vvPQtm2myn7Q5cIudMRfVjqvgRixL3VlsIlTzy
	2iAEzyJiIrKQFOKkADHX+x+AojtEHsojpkwnIlk5aSW7XxvYLj4OlR+OuyNget/k+js+zmS2H8R
	9eMomogb2dX1fZbx65e+8OcyfNiPZZ+M1pkoIY/D/aMwl4dzk9B2Ed4eKvPMXdiKgEv9pF0+/Kr
	L/n2Qnur+Y1EEw
X-Received: by 2002:a05:620a:3708:b0:93e:c12c:fbcc with SMTP id af79cd13be357-93ec12d072cmr2801926385a.72.1792066635932;
        Thu, 15 Oct 2026 05:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3708:b0:93e:c12c:fbcc with SMTP id af79cd13be357-93ec12d072cmr2801917085a.72.1792066635216;
        Thu, 15 Oct 2026 05:17:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdc040d3sm5939231fa.3.2026.10.15.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:17:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:17:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
Message-ID: <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX1xBW8VL3oEre
 7N+4YEKA1jkoLFkLBoOJ0ZXoKMBS7BPnWvNiOMKZoWDw4MAluomuAlMS5Q/NkQzUDgbs0bsLg69
 fhukCG2PSZkc9nbAdHunPJ90Sx5LDaTjlnNhYcvdXGug2FN81P6kk5JTg//RHGP7CsLLpwb86nC
 m/JhuMGIwiLfYCZ2UVPgGK5lhq98UeRHS8NVj8hQEVHi3tcJB6cMn3UczZ4Fahqtc2/V6TcPk9j
 KvKJVGvKmW9MQEUuu/O/fb8XHdp538tMm7AFpmcnmvI2cPxyXmi9NeBaUgVQBXNo60Z0byDQ4Os
 wpv9F8O8H6djaKyRBcwk72MjHUC2EpCgimaAvPgmGunRKBdLrY5wJlNHJr5m9fRT9O5Bd+mtEt2
 zpmhV3RdkDAPZpmm/Bu3yqneO0CckA0VIBlDKi2Xt/YfRkBXqN+DeXLAtGicD++n0RW8M2enbXM
 Hg2kPH/6+0lBops3mgg==
X-Proofpoint-ORIG-GUID: fZ81bvhb_0dsX_T5FmEhXrqM4qQd2euq
X-Proofpoint-GUID: fZ81bvhb_0dsX_T5FmEhXrqM4qQd2euq
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0c44d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=-nBYf6lyRfyxIgOjefsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX3Ik0Z0XH/ApR
 OhGaLMRFkutBUviyaEjOXX6+leciPk9/5CHhhi+R/YDhOHQFxIiHv6lPsycNwJFpE1Dy6xYOu3Q
 1mGSYkhc/BKYIRwOtLxPsC7+AzHeU68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048

On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
> DCP platforms place the display pipeline under firmware control, so Linux
> cannot discover display resources through direct register access. The DRM
> driver therefore needs device-tree descriptions of the firmware transport,
> display topology, IOMMU contexts, and panel connections.
> 
> Add bindings for the Qualcomm DCP VirtIO display function, including the
> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
> IPCC power-notify mailbox and interrupts, firmware display topology, and
> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM
> ---
>  .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>  .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>  .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>  3 files changed, 307 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> new file mode 100644
> index 000000000000..f7178c66c09e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DCP DSI host
> +
> +maintainers:
> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> +
> +description: |
> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
> +  platform. The DSI host and its connection to a panel are described
> +  using the standard DSI controller and OF graph properties.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +    description: Index of this DSI host among its siblings.
> +
> +  status: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      port@0: Input from the DCP virtio device's DPU INTF output port.
> +      port@1: Output to the attached panel.
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false

Why do we need OF graph here? Would it be enough to link one of the
ports of the root node with the panel's input?

> +
> +required:
> +  - reg
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dcp-subsystem {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dsi@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dcp_dsi0_in: endpoint {
> +                        remote-endpoint = <&dcp_intf1_out>;
> +                    };
> +                };
> +
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> new file mode 100644
> index 000000000000..018694310dfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DCP VirtIO host
> +
> +maintainers:
> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO transport and
> +  the host-side IPCC channel used to wake the DCP firmware.
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: qcom,dcp-virtio
> +
> +  reg:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  iommu-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  interrupts-extended:
> +    minItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: virtio
> +      - const: dcp_power_notify_irq
> +
> +  dma-coherent: true
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  mbox-names:
> +    const: dcp-power-tx
> +
> +  dcp-subsystem:
> +    $ref: qcom,dcp.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-names
> +  - iommus
> +  - dcp-subsystem
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    virtio@9be8000 {
> +        compatible = "qcom,dcp-virtio", "virtio,mmio";

Is it really compatible with virtio,mmio? Can it be handled completely
by virtio,mmio?

> +        reg = <0x09be8000 0x1000>;
> +        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "virtio", "dcp_power_notify_irq";

Why do you need names? Can they be dropped in favour of using indices?

> +        iommus = <&apps_smmu 0x15a3 0x0>;
> +        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
> +        dma-coherent;
> +        mboxes = <&ipcc 13 5>;
> +        mbox-names = "dcp-power-tx";
> +
> +        dcp-subsystem {
> +            compatible = "virtio,device34";
> +            iommus = <&apps_smmu 0x400 0x2>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dcp_intf1_out: endpoint {
> +                        remote-endpoint = <&dcp_dsi0_in>;

Can this point directly to the panel_in? What's the point of describing
internal paths in the DT?

> +                    };
> +                };
> +            };
> +
> +            dsi@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        dcp_dsi0_in: endpoint {
> +                            remote-endpoint = <&dcp_intf1_out>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };

-- 
With best wishes
Dmitry
