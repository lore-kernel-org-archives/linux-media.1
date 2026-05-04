Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB332E6B8;
	Mon,  4 May 2026 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928214; cv=none; b=moHmzqFIY12UXXgSM5mMz+viDkrKuXziVJ/ulLFOLDSSP9o/rGML1DpTkjd3T4PzxDm67X/VJmlW3d2stKvbfYvga9SRbZW5aMINdwsA454bU8RSCHKFF2R8HCVKysvIh566NkIPoyxfg7uk/kBocfrQgTtOOKmo040TmgzdvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928214; c=relaxed/simple;
	bh=OvsCWWPP+AJqsZrjj68PfEv+0e7Rwk83hjd9I2X1TZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUQF1teXVhsY08jPIoJ1ow9PDDuRTC2EIuVPscLLUZFpyIBX9h82BCczMBK9US1EmWSQMx8zn08vd1dHzKSbIz252urfji1a7wvG5Am1SVrPxmOKzqVKoSHROKiYI99hLV6AEl7hOXovPDw+/jQ//D22+AU38/EcCO4EbvWJgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ufY78wWh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ufY78wWh"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 823BC9C;
	Mon,  4 May 2026 22:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777928206;
	bh=OvsCWWPP+AJqsZrjj68PfEv+0e7Rwk83hjd9I2X1TZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufY78wWh2b9JOGqS+s7sDYdCtsOJtxzqD67uitaDNCGbWefxWa+K2b1IZUrkIUvi9
	 RmQba+GRYdMBexUtM0Bj4YXPjTvJWKX+hJgSbofLa5fGfVZqbn/i+hzTQzFwOegbj7
	 9o0nQGZ6Mr32L03XVEe006VMjDAwKUUk7xCZTrho=
Date: Mon, 4 May 2026 23:56:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <20260504205647.GA1489398@killaraus.ideasonboard.com>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
 <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>

Hi Michael,

Thank you for the patch.

On Tue, Apr 28, 2026 at 09:27:23AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in the
> RK3568. Introduce a list of compatible variants and add the RK3588 variant
> to it.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> index 4ac4a3b6f406..fbcf28e9e1da 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> @@ -16,9 +16,14 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx93-mipi-csi2
> -      - rockchip,rk3568-mipi-csi2
> +    oneOf:
> +      - enum:
> +          - fsl,imx93-mipi-csi2
> +          - rockchip,rk3568-mipi-csi2
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi2
> +          - const: rockchip,rk3568-mipi-csi2
>  
>    reg:
>      maxItems: 1
> 

-- 
Regards,

Laurent Pinchart
