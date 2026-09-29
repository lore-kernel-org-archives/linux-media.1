Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C93AD516
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668702; cv=none; b=pKC3sM79GDJY5GUDrQtB4IJOoXnQV0/VAvUvaCJJII8OrAcP5NKmu96Lf73JHUZafEW7trBNml0+BH5uhzcsU2u+v/NZ+iqxepW4ewF9vOAX0pm6CjJQ80mhj58CHmMo5W6CEq6aBQGBMI89IPwewLbHJaHBLR9z4H8dRAskIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668702; c=relaxed/simple;
	bh=+0bPSMf+ODS0XFWMMmyxJc5nkg3+4W/hM2vGEAGZ5Ks=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ldVEpIME8cZ6mpv+hsWCHKRx3wAumVtbab2NWTEeqgtkAwqGWcwBkxHiinO6XI0/jqtMU3R0L9Sgc6J86VAIJDmz9n7+8/qw9nr+So26/9+Dpaio3GaVmSnadw1qoh365jlBv1Yo1YoSd+s7xedNGBIeaxChi0rUhJIgkO6CoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZm74dKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZm74dKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A5F1F000FF;
	Tue, 29 Sep 2026 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790668701;
	bh=KlmzbTr4OVGU4i+lAGwXBFkSN8/6RG23fJp8vylYZSA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=CZm74dKREcQdOJmxEIkoMkHNggaVNC4awW/tZleEmwcDpmKqRt2AZJrd35yPOhZtW
	 3LQMmI7tVBK6mvinQWjHiiMQhbyt/5uMMDQPoXYsVwYUhhkiRF5VfGwNfn47zuF0FP
	 eMZnoZiPQNYuNZkyes2ajKIB2KnPR78n6UY9DRgXtojcvlqcxJS8m9idyLAibwp8As
	 +kAXTDJnX2BJfRZ1p7xefLcYpk42NCKUc2afOFmfvfr0WnrM4YfA8YlaVTvfvxY8Z5
	 JG//8BPdtwIOTiEbYQqus8JSquxnbOAADk3s4eGUns9wmc/4A2wEtoaM0+KB246yhU
	 hi512C1t9ecug==
Message-ID: <fa69ef0f-089d-453f-b088-dfa573bf1fcf@kernel.org>
Date: Tue, 29 Sep 2026 10:58:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match
 ov02c chips only
Content-Language: ru-RU
From: Vladimir Zapolskiy <vz@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260621145808.2660219-1-vz@kernel.org>
In-Reply-To: <20260621145808.2660219-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 6/21/26 17:58, Vladimir Zapolskiy wrote:
> Originally a chip id check in the driver's probe function is done for
> any OmniVision "ov02" sensors, but is too wide, since there are at least
> "ov02a", "ov02b", "ov02c", "ov02e", "ov02g", "ov02k" and likely even
> more families of sensors with similar names, thus the check for id shall
> be more specific and match "ov02c" exclusively and expectedly.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   drivers/media/i2c/ov02c10.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cf93d36032e1..b36da75d7dfa 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -18,8 +18,8 @@
>   #define OV02C10_MCLK			19200000
>   #define OV02C10_RGB_DEPTH		10
>   
> -#define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
> -#define OV02C10_CHIP_ID			0x5602
> +#define OV02C10_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OV02C10_CHIP_ID			0x560243
>   
>   #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
>   

can you please start review of this trivial and long-standing change?

Thank you in advance.

-- 
Best wishes,
Vladimir
