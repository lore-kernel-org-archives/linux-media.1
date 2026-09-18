Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5903327C18
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721199; cv=none; b=gqd+Fuce4r6sQ9oPjSX5e2XzLujyFlbotubh6bDWZiBnL11/ZpseJZNpfXVTvBHTrkKIss9Pn52oo4WkUat4FQiZrOFBUoG4FdIpe0q5S++2dcZuyZmwFENj7xFZvfvHoUb/zpx8UGYs9ocbMbN/JZa6ip6iEJRyjS5Ms53Ekng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721199; c=relaxed/simple;
	bh=fqfVPrC3Ys5TAXAVcNQblHJwDCHg1PxsJFjcRAMj+as=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ufm+6Avo0vbRgUFXL4eIwEHmcMiJ9wYI+e+G839LD8iGTNdNbHsHP+1h8/Y3iS1wEYLfMJVxloQnio5FouAqwsSfkokaDaK+RXNChKFskS3N6eRwtp5kfh8eX0dU/V45ETlwArQN6BPtFwkxeyGGaX6cTHuQUROHaW0GQfdNwNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opkQv8AL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opkQv8AL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566A81F000FF;
	Fri, 18 Sep 2026 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721196;
	bh=F3X7CtmN9ejh6EO6pFawSchgxx9yumgFZ1FcCdRd59I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=opkQv8ALw88+g/1WdKyWLE4sck07UeITSnKfWk/18o2vvaQfJ0daGgs5Dz5HF14n4
	 ChVe3ydsxXs8DVuF8YVsMmXhorBup7Ecm02QlRHpD7TCiZKoPIMC2EwsLboKUuYpTx
	 bg3CinqHdf9R0Sd7HNkR0JUPDPuk3hzQ2+XZRLBOv71nGFQWTWoXpYAjxxlhXqJiSd
	 wBwIrykXUOFgsuVVBbO9n/zB2h6zkwwBx/zicPfm+WFGtKCsFVpTn8L1t3rB2zZWZC
	 IA9aO0f9r+14iLvYOvSZKpIxgfjxlq3/pw8tdIITBGDP0Ftdz4pIBQDHlmpKyitdEz
	 X38IjNb9qxZEA==
Message-ID: <6b572f73-8a87-40af-8bcd-a360b25e29ee@kernel.org>
Date: Fri, 18 Sep 2026 10:46:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_1/1=5D_media=3A_Don=27t_hide_I=C2=B2C_or_S?=
 =?UTF-8?Q?PI_drivers_by_default?=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manuel Knitza <manuel.knitza@googlemail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Junjie Cao <junjie.cao@intel.com>
References: <20260918081755.65082-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260918081755.65082-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/09/2026 10:17, Sakari Ailus wrote:
> MEDIA_HIDE_ANCILLARY_SUBDRV Kconfig option was intended for working with
> sub-device and other helper driver autoselection in cases where the
> required drivers are known, e.g. for PCI cards where all the related
> components are mounted. This option, however, applied to e.g. all camera
> sensor and lens VCM drivers that are generally present in systems without
> being mounted on such a card. This leads to easily omitting required
> drivers.
> 
> Drop the MEDIA_HIDE_ANCILLARY_SUBDRV for I²C and SPI devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/i2c/Kconfig | 11 +----------
>  drivers/media/spi/Kconfig |  4 ----
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4d9946479160..9b28e91b8a67 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1010,14 +1010,12 @@ endmenu
>  # V4L2 I2C drivers that aren't related with Camera support
>  #
>  
> -comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> -	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
> +comment "audio, video and radio I2C drivers"
>  #
>  # Encoder / Decoder module configuration
>  #
>  
>  menu "Audio decoders, processors and mixers"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_CS3308
>  	tristate "Cirrus Logic CS3308 audio ADC"
> @@ -1180,7 +1178,6 @@ config VIDEO_WM8775
>  endmenu
>  
>  menu "RDS decoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6588
>  	tristate "SAA6588 Radio Chip RDS decoder support"
> @@ -1197,7 +1194,6 @@ config VIDEO_SAA6588
>  endmenu
>  
>  menu "Video decoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7180
>  	tristate "Analog Devices ADV7180 decoder"
> @@ -1557,7 +1553,6 @@ source "drivers/media/i2c/cx25840/Kconfig"
>  endmenu
>  
>  menu "Video encoders"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7170
>  	tristate "Analog Devices ADV7170 video encoder"
> @@ -1656,7 +1651,6 @@ config VIDEO_THS8200
>  endmenu
>  
>  menu "Video improvement chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_UPD64031A
>  	tristate "NEC Electronics uPD64031A Ghost Reduction"
> @@ -1685,7 +1679,6 @@ config VIDEO_UPD64083
>  endmenu
>  
>  menu "Audio/Video compression chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6752HS
>  	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
> @@ -1701,7 +1694,6 @@ config VIDEO_SAA6752HS
>  endmenu
>  
>  menu "SDR tuner chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config SDR_MAX2175
>  	tristate "Maxim 2175 RF to Bits tuner"
> @@ -1718,7 +1710,6 @@ config SDR_MAX2175
>  endmenu
>  
>  menu "Miscellaneous helper chips"
> -	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  source "drivers/media/i2c/cvs/Kconfig"
>  
> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> index 4656afae5bb4..da3e225d420d 100644
> --- a/drivers/media/spi/Kconfig
> +++ b/drivers/media/spi/Kconfig
> @@ -1,15 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  if VIDEO_DEV && SPI
>  
> -comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> -	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
> -
>  menu "Media SPI Adapters"
>  
>  config CXD2880_SPI_DRV
>  	tristate "Sony CXD2880 SPI support"
>  	depends on DVB_CORE && SPI
> -	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Choose if you would like to have SPI interface support for Sony CXD2880.
>  
> 
> base-commit: aedd77ea8168f00687c1248cdf115071e869cf93

