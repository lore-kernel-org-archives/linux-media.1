Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3F14AD0D;
	Thu,  4 Jun 2026 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583629; cv=none; b=fHTxSFZkZ9IumEbjmLUMKLrOgcD5qDlU0WswJhiHrgtAR+8HAE/0gK+ppReI619XLBdZmNS0eKKerTaB96NsaP2E94mUPmbZ+Oye6zw24O2XKmMbHrtHOad38fTjetv7tERKnW/3mSAFZKkonf+9Jb8nlzFRlkxiQT0+n2fPwTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583629; c=relaxed/simple;
	bh=9z4T1HvFkwfCv0SQWWfaCKhRB0QKAH0PPgQ4gqO1Mgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CxFouRucy/EdaYQA2ovUqFs1L8keQbHwuneTusWIjE3DXXRAj09AdAAnvBXSo2aFdrXEGxXj33uyeeQl1x3fFN/6PSmDCQjutik8KPgoILLlGIVizPnVz86+2IseYAc5T08OOpgO5xLOIlOdC2hvQEZre0umR+PtmDx7zO7gDVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENfCeNe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENfCeNe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9B51F00893;
	Thu,  4 Jun 2026 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583627;
	bh=604/UiUpPHRFg/jeEs6D7UzRyH9KefpF6MPIRngxV7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ENfCeNe9526nGjJlYtHujDbih8w0oMznWiyAEHZzzXCeih06rLFsT95moPZQY0ADn
	 WArvphux7VBAZHeH4ONz6UkZjqZfhE7timls2J1l51vGrSHKfcPAbG5oEMSnApf4FM
	 I8Zrs/8wTkwdHSBIUtg85+hD0Xj95QbHzLX02HInN0caYdSoIcrGQNRntTqnR6iiif
	 EpXNj9sV43wITEPLu7x/ZihLXbvz0yLN5zcq+lRO2VVIn0DIZAKutDGjMjNocEb4ew
	 fDPZNygWkzOU8ERq0bOWB4Hlpww/9eyZkFKdoVneFgdj3VB4CeixBoXDcTcdkrpRNa
	 elamnt0HuNcGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-19-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-19-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:33:46 +0000
Message-Id: <20260604143347.4F9B51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removal of MAX96712 support without enabling its replacement MAX=
96724 in the arm64 defconfig.
--

commit 782bc70657af4532d1172e803123908c74b0ec7c
Author: Cosmin Tanislav <demonsingur@gmail.com>

arm64: defconfig: disable deprecated MAX96712 driver

This commit disables the deprecated staging MAX96712 driver in the arm64
defconfig. The commit message states the functionality has been moved to the
MAX96724 driver.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d905a0777f939..5a4b75612c054 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1422,7 +1422,6 @@ CONFIG_GREYBUS=3Dm
>  CONFIG_GREYBUS_BEAGLEPLAY=3Dm
>  CONFIG_STAGING=3Dy
>  CONFIG_STAGING_MEDIA=3Dy
> -CONFIG_VIDEO_MAX96712=3Dm

[Severity: Medium]
Should the replacement driver CONFIG_VIDEO_MAX96724=3Dm be added to the def=
config
here?

Without it, the defconfig will no longer include support for this hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D19
