Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0695359A89;
	Mon, 29 Jun 2026 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718612; cv=none; b=TeXIp0ge3HIDrnSZoiovBBMcecL9BWZn1IomuTmeEq23bvMaBU3XhZmoDbyBUm2gEqJk5QMLG1oQhKOSMeOAudoJZg45+gZ3tutHx8mer0rbMEbydbVuhGpIWn7hTmSQYjkQvvgQW2PgSICtMtNBNzeMJQmRI+d/oIgdI6oq/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718612; c=relaxed/simple;
	bh=kXIZ98PZFKGNtdxdgbiMFZ0v+lZ1hI6B3tR43EhmaIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5JkeCOD/JxF3Y9ebWenlPr3AH1eL1VBC9Q2Hr03gfi7spDbQhuTxv9Dm6c+uUcMuQ0lzNLdNrsUGhJztplOQ15hcwTZWYS2X6NtVB2+whTLZI/4oh9Uh067DjDHjGKVN+o0Oky40DSvj5wiu2iRsVpXfFvllRAMu7dBfdKxkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sbJAD0x5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sbJAD0x5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73A17169E;
	Mon, 29 Jun 2026 00:36:44 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6571F3F836;
	Mon, 29 Jun 2026 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782718608; bh=kXIZ98PZFKGNtdxdgbiMFZ0v+lZ1hI6B3tR43EhmaIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sbJAD0x5Vauw53PdqJfM7OP8DlDBiNpcghMcVsczxsSnQxLdGRbkE2mBt/WWqlLiA
	 I1slE/aHuBDmaaNTwrumeFSkcePbBS0oBbmSwyfkUS/rPl6JTkPehY1TuxLE9zabzl
	 0u6o+EJ5oGPxOsVqcAPn9B/8zO/JRHND+23h9SRQ=
Message-ID: <509fe290-a18c-4896-a6b3-21d60585b335@arm.com>
Date: Mon, 29 Jun 2026 08:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: arm: mali-c55: Add support for CCM
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
 <1a4fe819-8351-465f-b77a-71433eb5eb68@arm.com> <aj6QBQhRlX6L5KGm@zed>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <aj6QBQhRlX6L5KGm@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 26/06/2026 15:45, Jacopo Mondi wrote:
>>>  }
>>>
>>> +static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
>>> +				union mali_c55_params_block block)
>>> +{
>>> +	const struct mali_c55_params_ccm *params = block.ccm;
>>> +
>>> +	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
>>> +		mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
>>> +		return;
>>> +	}
>>> +
>>> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_R,
>>> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][0]);
>> Should values be validated or masked before programming? Since this is
> Don't mali_c55_ctx_update_bits() does making already ?

mali_c55_ctx_update_bits() masks the value before programming, yes.

What I was trying to suggest is that silently truncating uAPI-provided values is
not ideal. I would add an explicit validation in the params validation path and
reject coefficients with bits outside MALI_C55_CCM_COEF_MASK, so userspace gets
a warning instead of having values silently altered.

-- 
Regards,
Vincenzo

