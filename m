Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20F5592E6
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873168; cv=none; b=nleGLFpGZrHVLUPeDFq+i85tCA/A1olJcWeSMd7l48EFdO5NTbTJ0LJdPHx25cAfvmEQXLIIvj3Exnsn49R/ZASLuUeoc1QFDi5zx4bdhTkAGlxkrotIDLY5GQeqO4UgG/UjFUJ7XDBWGqaadr0EmnFb141SqyJowO2crPUO2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873168; c=relaxed/simple;
	bh=2c2iy4NFbbN0aP5yp/80xl50af0U5oq65usO9PwE5mE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TB/RIUrZizI24RYULQHpXqRjxh0xN7iwdWuutN7LaZjIrV1BmwqnCTfpHVX3hVoW97+f3N5Yd96G5iAxY3YRGH0LD3seWJHK48BJjqKW64lENxk1yP1hkhUr+o+hrY5Bhv4ceNJ/5Rywx99oyhKkdhGczrucJrumCuE0F0LFJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73381F00A3A;
	Tue,  8 Sep 2026 13:12:36 +0000 (UTC)
Message-ID: <660d8d2d-935f-40a9-8290-0623f624e107@kernel.org>
Date: Tue, 8 Sep 2026 16:12:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Narrow chip id check down to match
 ov02c chips only
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

is there anything else to be done to get this proposed change accepted?

-- 
Best wishes,
Vladimir
