Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7528852E;
	Fri, 17 Jul 2026 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266359; cv=none; b=h4gMHlhzSFAWeMjFcJsV/u0Hz49TgIL1INTRDU/4RzKWvmR5Sitru98c6aaMgl87e0BeI+Q9qhZowpse4NMZnl9+3XAGzD1hvAi9MLqbxc87oZyaYE+NZRI+BFOwlZF+37ZYO/pSHaAM6RYqb5F9tJHD2fvvm+Dh9xAS2m79wXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266359; c=relaxed/simple;
	bh=aSfd5JO7Pnd8LuiDedQMxKhqfNngdMC7BeNLS0CZ8X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCPfioaacQASSTWgHHeEmQ9S11MHJ+uF3sof0+IkrzTm8rQnGS6T1lXq7DHjJ1LBprok25vjHnHv/wgpoeaFuQOZusHn6B/JZ96fbueaKXWGucD+oOAH5SH/y19SHOAf2xA4Jc0iTFWUO5eO/yZ/MmuFN0+wwAHlhYCLGfn8cjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exHZHibe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exHZHibe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB0C1F000E9;
	Fri, 17 Jul 2026 05:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784266358;
	bh=PGtMbBQeT30snJQcPbG2KWmVgXhNFtVI93qkk4qPrtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=exHZHibefk0WP3T+4ZeYwKUTT0nE2HHb0lCKG8CJ/NWs2ZG4mW1VZ89K3qX9vuafo
	 /M/W6z0DhIE+61zss95Vbu/HUrsKY8rh45JeIE0EfGIIgu4qNNUJfTVbvqSnQzhT/b
	 AiT1FxLGF9VDLFUczmOBF6/eHXCDuR4sdPv8AaJJDj8fTYu/puY6iHXlL9KYLucLEL
	 k4vEV/MsM4dH241I68FweWGaCpIwzrY/8p2hhFHxFgPpItWuZMHNXnAUcxWPfq+w3A
	 W/eOs0mb/xAhNWxgjQ78MIiDyLCnMA8Ue+cdud66X+Pa4pmm/IH93CVT8GPazEUx7n
	 kYiJa3In3EucQ==
Message-ID: <2f4fdfc1-c5b9-41ee-a588-48d4d44e0105@kernel.org>
Date: Fri, 17 Jul 2026 08:32:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] media: microchip-isc: store the unshifted
 PFE_CFG0 BPS value
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
 <20260629-balki-isc-prefix-fixes-v1-v2-6-3b120cc3742f@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260629-balki-isc-prefix-fixes-v1-v2-6-3b120cc3742f@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 14:09, Balakrishnan Sambath wrote:
> pfe_cfg0_bps held a pre-shifted BPS value (ISC_PFE_CFG0_BPS_EIGHT was
> 0x4 << 28) ORed straight into the register. The other format selectors
> like cfa_baycfg store the bare field value and position it at the write,
> so this one was inconsistent.
> 
> Store the bare BPS value and apply it with FIELD_PREP() at the PFE_CFG0
> write, and fix the pfe_cfg0_bps comment to match. No functional change.
> 
> Suggested-by: Eugen Hristev <ehristev@kernel.org>
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/microchip-isc-base.c |  4 +++-
>  drivers/media/platform/microchip/microchip-isc-regs.h | 10 +++++-----
>  drivers/media/platform/microchip/microchip-isc.h      |  4 +++-
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

