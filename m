Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4E470440;
	Wed, 19 Aug 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140113; cv=none; b=WVj7bcvyXCJCvndtS6W+o84gbIN5stIKu+cDIGGDvAUJhOdoQKbRdcgLbHbK8c/E0u/tkOqJ7e0KoNBmN+15Rj9FqMyXy2FrUR2V6motQrIWai+J7EPSRG3MkO251/CwNe3HlM8DJMwXtHVhvi6ckLF8jYfqSCwKJx0Inx1mqdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140113; c=relaxed/simple;
	bh=u3TJwMKuPKm/NlM80QqacMo42WGNRDP0mnSft9LBiwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5jKAkXl7lN34WKBH/1Ll6Ubo6HaD5t7IOtLmY9ygGIp8q07UxDnhmH3CJukfLUYg/n8KUQRgpQiMUeDIIUILPNJ2wY+3/mmPegTeUiaPsRpIC8oYgQ+I662poyWnGQkMQJ9xrRtvAzTsYw2OQuQmYGiteK4hSe2eTjrv6BQSEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwi7Pxkj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwi7Pxkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538EF1F000E9;
	Wed, 19 Aug 2026 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787140110;
	bh=9v8j0p57uTfbE42UKSmDEtNQ0f75hyiXW3GgpJKLraA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zwi7PxkjKuM8kUPCt0g9AW0dLi2wRfHlkn4FOgAlD1PTiCjv6k8AJI86lI6eJ7yk0
	 ABlvzs45a565hlv2qhVssexMvRuwCEyRS8VB3nOCtVPxUnIdG7Jlt2h8wZF5kIdfNh
	 T5eA33YcjT6YHo8QCNQRs5AFCqTBWaJpw5zWaxBC/7FfqS00BPDO4i6PKXMCcV8G6J
	 fcLF2P/ttwZ8AHBz33PmscOUeoje6/juVA4iSX3Nr0/2P3sDLUiE69v9yUdNlFMVLZ
	 krYeabTohTQT+iuWHBQYPdhx/a1Vhe0vQChm/2lnOE7z0UzZzkP7B/NPyDCdnfhUm+
	 j2IkFZscbtMhA==
Message-ID: <31a68e05-0200-4ef9-b31c-1f0e4ec1def0@kernel.org>
Date: Wed, 19 Aug 2026 14:48:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: ov5640: Fix potential integer overflow in
 sysclk calculation
To: Daniil Iskhakov <dish@amicon.ru>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard
 <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Agalakov Daniil <ade@amicon.ru>,
 Roman Razov <rrv@amicon.ru>
References: <20260817161115.2530827-1-dish@amicon.ru>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260817161115.2530827-1-dish@amicon.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 19:11, Daniil Iskhakov wrote:
> The calculation of sysclk uses 32-bit arithmetic because
> sensor->xclk_freq is a 32-bit integer. The intermediate multiplication
> result can overflow 32 bits sysclk variable.
> 
> For example, with pll_prediv fixed at 3 (OV5640_PLL_PREDIV), xclk_freq
> set to its maximum of 54MHz (OV5640_XCLK_MAX) and a pll_mult value above
> 238 (the maximum value for pll_mult is 252, defined as
> OV5640_PLL_MULT_MAX), the result exceeds the 32-bit limit.
> 
> This overflow causes the 1GHz safety check to fail, as the truncated
> value fits within the 1GHz limit. Consequently, the function returns an
> incorrect frequency, leading to misconfiguration of the sensor.
> 
> The expression sysclk / 1000000 > 1000 now also cannot be compiled on
> nios2.
> 
> Cast the result of the naturally 32-bit xclk_freq / pll_prediv division
> to u64 instead. This keeps the pre-divider operation 32-bit while the
> potentially overflowing multiplication is performed with 64-bit
> precision. Once the 1GHz safety check has passed, sysclk is guaranteed
> to fit in an unsigned long even on 32-bit systems. Cast it back before
> dividing by sysdiv to avoid another variable 64-bit division. Avoid
> 64-bit division in test.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
> Co-developed-by: Agalakov Daniil <ade@amicon.ru>
> Signed-off-by: Agalakov Daniil <ade@amicon.ru>
> Signed-off-by: Daniil Iskhakov <dish@amicon.ru>
> ---
> v2: The patch is adapted for nios2 thanks to automated tests and a tip from
> David Laight <david.laight.linux@gmail.com>. The first version cast
> sensor->xclk_freq to u64, making the division by pll_prediv a 64-bit operation.
> Keeping sysclk as u64 also made the final division by sysdiv a 64-bit operation.
> The kernel test robot reported that nios2 GCC emitted unresolved references to
> __udivdi3 and __divdi3. These libgcc helpers are not provided by the kernel,
> causing modpost to fail.
> 
>   drivers/media/i2c/ov5640.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 92d2d6cd4ba4..dbe767afefd5 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1377,13 +1377,13 @@ static unsigned long ov5640_compute_sys_clk(struct ov5640_dev *sensor,
>   					    u8 pll_prediv, u8 pll_mult,
>   					    u8 sysdiv)
>   {
> -	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
> +	u64 sysclk = (u64)(sensor->xclk_freq / pll_prediv) * pll_mult;
>   
>   	/* PLL1 output cannot exceed 1GHz. */
> -	if (sysclk / 1000000 > 1000)
> +	if (sysclk > 1000000000)
>   		return 0;
>   
> -	return sysclk / sysdiv;
> +	return (unsigned long)sysclk / sysdiv;
>   }
>   
>   static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir
