Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E113009E2;
	Wed, 24 Jun 2026 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301865; cv=none; b=TxJtsFLMQuUZHYMrhYHomke2P4iez+rOT4eTSmJNODQ+NMU9fe9dTRM4fTCt9CWOb67dwJ3dK6VmP0Dt1KUbqybcaSI0XXhfnbUBk89V2Rfrw1dXUN+Fpldz3mAFVibZ1qk9hO0Mb2OOoZhRe/FPDQqZbe/IiSa77pZRXUZL4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301865; c=relaxed/simple;
	bh=5dzyQLxWEzLeVXPIbmDbho+uwuzcOyKZe8Bzdgi69Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/UNOFNMJ5TA/aeYddwiRZPZWvMNsfEScVziyhe1/iJvFT17IRooDikpZmhc+/B5OGsWLAbNT/nMHal6tbi10w+F6TtcIoY+86AXmSUXwcdal+Kao+WTZ5HhOFeIJO2v8cr0CAl9EYVtnibFDYZ1HaXoJGdNXXgLJA7B26lI1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GzI6Ho+2; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GzI6Ho+2"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BC1831F842;
	Wed, 24 Jun 2026 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782301855;
	bh=HbvPqVl23P2DsY6H61wNv+/45EFbasMQlkmFk62Tx6A=; h=From:To:Subject;
	b=GzI6Ho+2HqSaGIvywvx8Nn2XInWYLXh0fV7tRcTtVPYdJPC6TROoTVTp0Nx8gbag1
	 KqLaP8FOjxEonaEKWUkHnNK80qvlkEOm32Qe/tz67mMtkXb+G/vHFswU7HRpegajnL
	 dOmAnHw9xWuQKxDctvb7+eN8iGzfZd9hIoBwd1EN6rB+b1nc+bWb1IIqiUYseQokSL
	 kEHNGxiByuB1+K/u1+bXv2NdkR0dN5WSOp8byaIN9AmnQ2UZplD3Nm21VJm19Upbkp
	 A6Un/48P3iK0WPut+dhcuaa0UqOSmh49+KMyZUVk4Ep7TZ6PfiBYZbC0TLoo1qFXFA
	 piBUUHCOPKgQg==
Date: Wed, 24 Jun 2026 13:50:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec node
Message-ID: <20260624115050.GA38214@francesco-nb>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-10-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624072043.238-10-nas.chung@chipsnmedia.com>

On Wed, Jun 24, 2026 at 04:20:43PM +0900, Nas Chung wrote:
> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 11 ++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 36 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 041fd838fabb..7edd1c69966a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -76,6 +76,11 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  			reusable;
>  		};
> +
> +		vpu_boot: memory@a0000000 {
> +			reg = <0 0xa0000000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>  
>  	flexcan1_phy: can-phy0 {
> @@ -1142,3 +1147,9 @@ &tpm6 {
>  	pinctrl-0 = <&pinctrl_tpm6>;
>  	status = "okay";
>  };
> +
> +&vpu {
> +	memory-region = <&vpu_boot>;
> +	sram = <&sram1>;

Can the `sram` node moved to imx95.dtsi or not?

Francesco
