Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8741B8CB;
	Thu,  6 Aug 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005908; cv=none; b=ZuZBYbI9N6sL5uOgjP9dop129HTAHjHk8eZU8JylQ2vHXrUUd/hDjnyqdPo/w0qJff5jXtz1nMRQ435tWeLGVB1kzHn2kgF+sgWvQsgSbm0WsmY9HQi3pYw0WQXBTpukteztxXYYCr3/4RGGd5eNmLy4uaMRqjYbQJE6EZA0t/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005908; c=relaxed/simple;
	bh=48kFD23ryxgadIoWj41R5u4/Agy5Cde0AZhOezpDrmg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=u0HumAumOejOO5fEEA/IMzGmWuqwoGnVJQo8RT9qDFnb74gk/w7nLSGA+O5KDlmOQPrP0o5Xr4itV7IEyJQUqsEycg+J6VfMLqj7RMlN+bE7MRisUzToOc23v1cOYGmF9FLnsb1fQAzlLC4d0QKXwjgTRk80TJmziuezvNl692E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=StEtHN8E reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="StEtHN8E"
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:1abe:f6b5:fe9e:82df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41558493;
	Thu,  6 Aug 2026 10:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786005824;
	bh=48kFD23ryxgadIoWj41R5u4/Agy5Cde0AZhOezpDrmg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=StEtHN8E1NJbnrp/AEDiJfATZNIn7eii5QahD/KLVy7ja5Uf9yVYFbMDNu2PJ5PdJ
	 yaqGuBbznjjZNO60wdAWN3VclXmoTUTf6sFiU0EAAzXwNaoHUEHX2t9AYdFG0fhqIw
	 AgK+CXRWa2xjRWHGwF9B3n2mUeIYdCxtPjg6XDIU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bryan O'Donoghue <bod@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Xia Jiang <xia.jiang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Zhi Mao <zhi.mao@
 mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Date: Thu, 06 Aug 2026 10:44:52 +0200
Message-ID: <178600589209.843203.9177682416623399293@localhost>
User-Agent: alot/0.12.dev43+g2cacc0d03

Hi Krzysztof,

Quoting Krzysztof Kozlowski (2026-08-01 21:55:29)
> Correct a few white-space issues, like double space after '=3D' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

This is an easy one.

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>=20

Cheers,
Stefan

> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>  .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>  .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>  .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>  .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>  7 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2=
.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> index b0129beab0c3..2f11e5f45839 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> @@ -96,8 +96,8 @@ examples:
>                    <0x0 0xff01a000 0x0 0x100>;
>              reg-names =3D "aphy", "dphy", "host";
>              power-domains =3D <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
> -            clocks =3D  <&clkc_periphs CLKID_VAPB>,
> -                      <&clkc_periphs CLKID_CSI_PHY0>;
> +            clocks =3D <&clkc_periphs CLKID_VAPB>,
> +                     <&clkc_periphs CLKID_CSI_PHY0>;
>              clock-names =3D "vapb", "phy0";
>              assigned-clocks =3D <&clkc_periphs CLKID_VAPB>,
>                                <&clkc_periphs CLKID_CSI_PHY0>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a=
2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> index 0e7a7b5ac89f..99d728c47cfb 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> @@ -88,7 +88,7 @@ examples:
>          #size-cells =3D <0>;
> =20
>          sensor@37 {
> -            compatible =3D  "galaxycore,gc05a2";
> +            compatible =3D "galaxycore,gc05a2";
>              reg =3D <0x37>;
> =20
>              clocks =3D <&gc05a2_clk>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.=
yaml
> index 4505e66876a2..551e483f3e51 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -160,7 +160,7 @@ examples:
> =20
>      vcodec_enc_vp8: vcodec@19002000 {
>        compatible =3D "mediatek,mt8173-vcodec-enc-vp8";
> -      reg =3D  <0x19002000 0x1000>; /* VENC_LT_SYS */
> +      reg =3D <0x19002000 0x1000>; /* VENC_LT_SYS */
>        interrupts =3D <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
>        iommus =3D <&iommu M4U_PORT_VENC_RCPU_SET2>,
>               <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..76878050cfd9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -72,8 +72,8 @@ examples:
>        compatible =3D "mediatek,mt2701-jpgdec";
>        reg =3D <0x15004000 0x1000>;
>        interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =3D  <&imgsys CLK_IMG_JPGDEC_SMI>,
> -                <&imgsys CLK_IMG_JPGDEC>;
> +      clocks =3D <&imgsys CLK_IMG_JPGDEC_SMI>,
> +               <&imgsys CLK_IMG_JPGDEC>;
>        clock-names =3D "jpgdec-smi",
>                      "jpgdec";
>        power-domains =3D <&scpsys MT2701_POWER_DOMAIN_ISP>;
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 5b15f8977f67..3bc1ccb25893 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -67,7 +67,7 @@ examples:
>                     "mediatek,mtk-jpgenc";
>        reg =3D <0x1500a000 0x1000>;
>        interrupts =3D <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> -      clocks =3D  <&imgsys CLK_IMG_VENC>;
> +      clocks =3D <&imgsys CLK_IMG_VENC>;
>        clock-names =3D "jpgenc";
>        power-domains =3D <&scpsys MT2701_POWER_DOMAIN_ISP>;
>        iommus =3D <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> index 56c16458e3bb..389b545c9631 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> @@ -119,26 +119,26 @@ examples:
>                   <&mmcc VIDEO_MAXI_CLK>;
>          clock-names =3D "core", "iface", "bus", "mbus";
>          power-domains =3D <&mmcc VENUS_GDSC>;
> -        iommus =3D  <&venus_smmu 0x00>,
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
> +        iommus =3D <&venus_smmu 0x00>,
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
>          memory-region =3D <&venus_mem>;
> =20
>          video-decoder {
> diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.y=
aml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> index 1fc62a1d8eda..5c0f2f7b1d95 100644
> --- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> +++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
> @@ -53,7 +53,7 @@ examples:
>          #address-cells =3D <2>;
>          #size-cells =3D <2>;
> =20
> -        isp@880000  {
> +        isp@880000 {
>               compatible =3D "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
>               reg =3D <0x10 0x00880000 0x0 0x4000>;
>               interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> --=20
> 2.53.0
>=20
>
