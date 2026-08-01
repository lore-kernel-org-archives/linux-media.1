Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C21EFFA1;
	Sat,  1 Aug 2026 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617327; cv=none; b=eYPsXNzGjVK5exJHp6qZQ5cpshHSV0kF2LLIY+yrqdGEZ/phq4nIvnvRSVtLLTfKMnDGjqd+9XgIhLqIoTuaiQBYzEAF7xS+muw+AiUjjf2ms86F6cjpNFwiAXPgP1LI6MVV6fnA2xl3rvULxe8BFjEX37mjL4HM3ses0e9qP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617327; c=relaxed/simple;
	bh=fcdjobIJxNyTkbXrbysTn8RgKuzr+8AiP0Xa4LQHlwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bDUp7Jhzj3352KSkddgp3con0gjv5A5CsrQeFkFPurYDD/A85XvbzL+y0UrAGg612szb2ApdFtwP9Gozy6dxZzOhxPhOK92TRm97XnRFJWqVVLwbOzdZgZzamcOTOpF7BGFA1DuM7qLI1411IfOQY2UAI+KvrNK38BGXznSbCxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3m8Vfnq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3m8Vfnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6851F00AC4;
	Sat,  1 Aug 2026 20:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785617325;
	bh=kF4Ouf6923m8/khhEZloeYt/teoWBSnhTBWNx5bo0wg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Y3m8Vfnqu91tGKFF6ZoJctBKshyoZl1yO0HWrYPSqpcxpGidqXnhWvR3JwNV7jloy
	 JnWSb86HkDoERnQg26cNwG5YKD0ejWxbEcJqBVumWJprI20CGZYQwoilDXU9jdEIH7
	 ahXCaY7JM2sd1JjMYi14H17QGd/Qd1BUTuw20fPekGApA3JBQH5JreqOhOEQ/lbRf4
	 cMuKXrlR60pZKS83wXrPvdcKc6daQNeGf4py1LlWrB5GwaWogkzBY60I3XihHqh0v2
	 DxOfnCbgHmJMYXN3i21L/RjZfYXIj7msJRBl+TTtFLrK5+xPJHmi9DhWqBaSuR5uVS
	 hsrMzusZCW0Kg==
Message-ID: <cb59bcdd-a158-4fb4-ab1c-0a98f8860357@kernel.org>
Date: Sat, 1 Aug 2026 21:48:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xia Jiang <xia.jiang@mediatek.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <xIYnc9B56o8xe8HvsOwmdoaAjF_TthVpVNEnPsR7e_zn2SvMHejEb9bzZ6XHny3bojqzBWOX2ic2MV9laa5osQ==@protonmail.internalid>
 <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2026 20:55, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> index b0129beab0c3..2f11e5f45839 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> @@ -96,8 +96,8 @@ examples:
>                     <0x0 0xff01a000 0x0 0x100>;
>               reg-names = "aphy", "dphy", "host";
>               power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
> -            clocks =  <&clkc_periphs CLKID_VAPB>,
> -                      <&clkc_periphs CLKID_CSI_PHY0>;
> +            clocks = <&clkc_periphs CLKID_VAPB>,
> +                     <&clkc_periphs CLKID_CSI_PHY0>;
>               clock-names = "vapb", "phy0";
>               assigned-clocks = <&clkc_periphs CLKID_VAPB>,
>                                 <&clkc_periphs CLKID_CSI_PHY0>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> index 0e7a7b5ac89f..99d728c47cfb 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> @@ -88,7 +88,7 @@ examples:
>           #size-cells = <0>;
> 
>           sensor@37 {
> -            compatible =  "galaxycore,gc05a2";
> +            compatible = "galaxycore,gc05a2";
>               reg = <0x37>;
> 
>               clocks = <&gc05a2_clk>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 4505e66876a2..551e483f3e51 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -160,7 +160,7 @@ examples:
> 
>       vcodec_enc_vp8: vcodec@19002000 {
>         compatible = "mediatek,mt8173-vcodec-enc-vp8";
> -      reg =  <0x19002000 0x1000>; /* VENC_LT_SYS */
> +      reg = <0x19002000 0x1000>; /* VENC_LT_SYS */
>         interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>         iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
>                <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..76878050cfd9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -72,8 +72,8 @@ examples:
>         compatible = "mediatek,mt2701-jpgdec";
>         reg = <0x15004000 0x1000>;
>         interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> -                <&imgsys CLK_IMG_JPGDEC>;
> +      clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
> +               <&imgsys CLK_IMG_JPGDEC>;
>         clock-names = "jpgdec-smi",
>                       "jpgdec";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 5b15f8977f67..3bc1ccb25893 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -67,7 +67,7 @@ examples:
>                      "mediatek,mtk-jpgenc";
>         reg = <0x1500a000 0x1000>;
>         interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =  <&imgsys CLK_IMG_VENC>;
> +      clocks = <&imgsys CLK_IMG_VENC>;
>         clock-names = "jpgenc";
>         power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
>         iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> index 56c16458e3bb..389b545c9631 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> @@ -119,26 +119,26 @@ examples:
>                    <&mmcc VIDEO_MAXI_CLK>;
>           clock-names = "core", "iface", "bus", "mbus";
>           power-domains = <&mmcc VENUS_GDSC>;
> -        iommus =  <&venus_smmu 0x00>,
> -                  <&venus_smmu 0x01>,
> -                  <&venus_smmu 0x0a>,
> -                  <&venus_smmu 0x07>,
> -                  <&venus_smmu 0x0e>,
> -                  <&venus_smmu 0x0f>,
> -                  <&venus_smmu 0x08>,
> -                  <&venus_smmu 0x09>,
> -                  <&venus_smmu 0x0b>,
> -                  <&venus_smmu 0x0c>,
> -                  <&venus_smmu 0x0d>,
> -                  <&venus_smmu 0x10>,
> -                  <&venus_smmu 0x11>,
> -                  <&venus_smmu 0x21>,
> -                  <&venus_smmu 0x28>,
> -                  <&venus_smmu 0x29>,
> -                  <&venus_smmu 0x2b>,
> -                  <&venus_smmu 0x2c>,
> -                  <&venus_smmu 0x2d>,
> -                  <&venus_smmu 0x31>;
> +        iommus = <&venus_smmu 0x00>,
> +                 <&venus_smmu 0x01>,
> +                 <&venus_smmu 0x0a>,
> +                 <&venus_smmu 0x07>,
> +                 <&venus_smmu 0x0e>,
> +                 <&venus_smmu 0x0f>,
> +                 <&venus_smmu 0x08>,
> +                 <&venus_smmu 0x09>,
> +                 <&venus_smmu 0x0b>,
> +                 <&venus_smmu 0x0c>,
> +                 <&venus_smmu 0x0d>,
> +                 <&venus_smmu 0x10>,
> +                 <&venus_smmu 0x11>,
> +                 <&venus_smmu 0x21>,
> +                 <&venus_smmu 0x28>,
> +                 <&venus_smmu 0x29>,
> +                 <&venus_smmu 0x2b>,
> +                 <&venus_smmu 0x2c>,
> +                 <&venus_smmu 0x2d>,
> +                 <&venus_smmu 0x31>;
>           memory-region = <&venus_mem>;
> 
>           video-decoder {
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> index 1fc62a1d8eda..5c0f2f7b1d95 100644
> --- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> @@ -53,7 +53,7 @@ examples:
>           #address-cells = <2>;
>           #size-cells = <2>;
> 
> -        isp@880000  {
> +        isp@880000 {
>                compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
>                reg = <0x10 0x00880000 0x0 0x4000>;
>                interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> --
> 2.53.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

