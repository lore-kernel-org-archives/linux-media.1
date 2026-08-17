Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0EB3B27F4
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993887; cv=pass; b=cEQOgOIn8JO4pP2G6907RVqDvbW6a2939ReziR72N8sgvTHEdt2GjI7Y3WLhy4yeiH3VOKh/xTVuQuuB3L7g+wiRGRDTZUtMPnPfLHMnycnQT7p6PGaL0Ir5MrwQYKsaRnRpAZGbO+GU+qllMDqLNVosZzf14Ffl72mV+eD/CSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993887; c=relaxed/simple;
	bh=uTnougUIG5rsOStz0iODpKJHP4inO0xB8c6yl6xAlyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXhW0kl05gbbWgBmDrJ31YSpeDcD3WpNVwXoEYTpICmA/6jUkpQh+v1HnCIYrcVLrzrKRqD6U2IKcj9In2HPnh+rdYhUKgs6TE2+Tp2P1hL2SbTMxPkSc55ZXhDdnT62/Y04LSR2EmWE22jqR28uuH8HSgH2x87oZXzoET5Hd0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHxne63W; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHxne63W"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aec6360133so3125431e87.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 12:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786993883; cv=none;
        d=google.com; s=arc-20260327;
        b=GtH2VLbqQ+Oqcm3PqdhSSQQfI/mTaG3UAfSFN2H8R82YdNnQxPicvfTHULrBp/hhLB
         pBr307JqK9Lc/Wsw40F9Dv+ih0CjXVW93Ys1UpVMrL5+J/5caa86yiKnhXPw18l2SUb8
         ZK1DjhbmXxupPnz6CspS37XVrPwghPecbjuiY/ItQ6pIiY+SNzBrMWYaFQRMxbZaKMgU
         kdiJYRPA0njGQhjlN4Bdvh4mQsi//mAsMQMytWSzg+v63gUC08HTYfJwOZ8COFBxhcyW
         PuHd/IVpiAt+SwyWeyWVz5Lli6Ad0ivoiSotq/lbJy+zrLDAvv34oI8GHj25HZ5hymM5
         Exlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        fh=wjaNn8+qtigu7cHOgQ2ZmrcAhdDHZtf12K9YbyXCRo8=;
        b=NS7tjNnVSx8HvJK7hQSSgbMtN0OqsQhowXTCPHWSliH6296d/3F9UsByXsv4iYj0os
         otchoCz83Iy22c32DjbOX50qkhjI20Vrf0/bVeHOLupd12ZrrNWbThkiS5fC+7JQc4wC
         KrAnfNWPdheIZguyLcMeaWitc6W6fCze/sCXJyBHGIeLppn064G8HCgYMtHpWZfUWeT8
         ndRnAIp2qrtNcWFAKQQPeBycUe/NbeEaa6y0V/TK2mKjv2fsyjR0jxA7+b+SyaST1ArB
         +1efj6sqBpv9vNUvPp0xFmG7hjbi6b6OI3p8Db2BpkFDyLvdCMD8Rl9e2oBFLyJ/Xh7Y
         qzJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786993883; x=1787598683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=jHxne63W0n5Vz5scXxk67+eE/3f3mxoUPN/Kndvck5aKDlgma6uUbWOuMkyH7zdzUL
         GvNL6E7kVhx2gi1RnwbPevdGEvNwrxLwJz+XzBf/swzlCGy0yvpsKUgGiMj0FpM2qPPl
         C0grekBaUPzI0ESDFIm9ZGk4Yo3j3sy/7DHrtL0kr0kgdp4QU1+nmQ+rOkyYmDA+hxXB
         rQHGKbn02EggaRDrTsXr9RRI1rL7lhKvXVf4F2yscXU8HkTVrw2tiTVY4nBdUOycz08Q
         NOzaN+w3flboeNbTvBZfltZi53jdTFWSFI4T41I/TlXAcjAjJlUl+vNiosBdntoBIXow
         Wp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993883; x=1787598683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=WAnWxLMjNApnBh9EVUog2RHorF3EhfO5hs4gr4rptZaZnymdFwEqKBYWAKoBtQofFd
         1jBPn9N3xzDc2NEg1ZY/u6va9aoNdvaHOy7GLtvfuEixefELEmG1BankBNf6WboMlEw5
         9DFa0H4iofpdYCyKFYPwWs1tBD1Y+HpcYagJicXS2n+6SjgvLfFYIJdiEzxIB3hWeGmn
         Ife7SNVAV3NF+/l68aSYeLudtW+Uwa6ZXiQV+lNeWGrwLDgUaCUkerJ2SeTZO6VwoAdp
         PsMxKPuRB4fgYwYrUGXritNDo7RBO8lUWKro21GT/f5RWEFPtA1SzefL3kSiKGSIeL9+
         5z4g==
X-Forwarded-Encrypted: i=1; AHgh+Rov2KR1tbxBrGUDR4vZuLbbk/rFpzIWrQ6t1A/rCXmgcB5wOhNDO3GMkX5wnsAYXWqDxSAtmC+fVDlKQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RLgA9FRkj38riRvDmommDZFpy0L2vo+4BPKqX2d8p4IUul7S
	hwocjtBi74ANstqgw8nKfs9b+1y45LJxwD1VkRHRkaJN0/+Xzn+Uw0n5tzltvfan35ym8uJ2lUj
	fUN4U/S9ccQcYH2RrCp+rIWi0tcFOQOI=
X-Gm-Gg: AR+sD12qIzkBoWXOKhznuVCTL+imcTxrtQ6Wo/aPbp4P3Rjz/xZhsCoyNRoSTxFY7o3
	LPNRAwp2uz9zktkBFcBsmKarUtN2BmRdhJc8ljDwPa4nnuXXWxBqMS0VhsWh8lHyBf3PQkXU+bA
	NDdZxDmJTSTyw69k5sZkDMfu1RFQw2tcVddMcVf5eem9U9ozn3bUdEAjmTccGCAjrOtJ2ghnwx/
	xvtdDvcQH7UmJN8Csl06gDpZttfUl8X/45rRn+nZK/4E+5sE7DUHjStaf+M5ATFn/lMRf/Htedm
	Ry9zxMAzwURONgF0b2qVNqTgMlldvV0TTFNnl0rTLrq2AMP1iCfLWYpWjzKGEE3FOEKfzoBgIg6
	6GqAuW8InLTdSGSatAoINJ520XmU4VA==
X-Received: by 2002:a05:6512:2382:b0:5b1:4e5e:559c with SMTP id
 2adb3069b0e04-5b47069e8a9mr442389e87.30.1786993882910; Mon, 17 Aug 2026
 12:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com> <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 17 Aug 2026 14:11:11 -0500
X-Gm-Features: AcwNN1VtAz3TzQxDcDRv29ZIlK7LcvZGlrKziZlK_QH60cI6-b_6Gt0v_fcOAnw
Message-ID: <CALHNRZ8F85rJZ4+v+B_jsETeG9cUJWeWSe9vw77AVHcRMasw=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Enable DMA Support on Tegra194 QSPI
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:47=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Without dma enabled pio mode is used and flash storage such as the one
> on the p3668 module times out and cannot complete any transfers. In some
> cases, these timeouts cause hangs and cbb faults.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9fe..e2ddbc6715d5e8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,8 @@ spi@3270000 {
>                                  <&bpmp TEGRA194_CLK_QSPI0_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +                       dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
> @@ -1013,6 +1015,8 @@ spi@3300000 {
>                                  <&bpmp TEGRA194_CLK_QSPI1_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI1>;
> +                       dmas =3D <&gpcdma 6>, <&gpcdma 6>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
>
> --
> 2.53.0
>
>

Thierry,

The driver change was picked up some time ago and is part of 7.2. Can
this be picked up for 7.3?

Aaron
