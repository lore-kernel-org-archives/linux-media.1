Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3124DD17;
	Fri, 17 Jul 2026 05:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266288; cv=none; b=jISguttNo9se8xo3qUKNmFeAnEMswhjLSND2XmsdsBi1NPrwN+2CDpoyEJ0aN26QQdbd5OQbiv80tBhwtufgVHfO49owpxzcYJcDnJtwVcX7wE2/YiDQHAOoYFsS1ffEk0+ENIlbslZlsaXybxDcrGCeg4IcwOmLEhYfHMncxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266288; c=relaxed/simple;
	bh=3T5pgjHoZUS6SyAuRVMuwRC/7zs1hZ1BZyd7zTrZ2M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4N+4EsZ2Ydsu5CXXN9vjAzXvGJ3/0BvJT0Bm+8thQeLCdCBJK0/Sumz+2cDuWy8k+5xqeZPUPG7e18ZDqFspOgRmZGg2nmdsUdesZ63i1qmtxAdHZ5Q7uIQdaQ5L2sMTbaz/2Tm2HGsQ9xCrdT0wwNGwWCz+QWDurdwW1KlpI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ7AzxKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ7AzxKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21001F000E9;
	Fri, 17 Jul 2026 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784266287;
	bh=oql6awHgm7RCuMBhQo1fhAYs7jKBo0GfSnCyNZuwnis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nZ7AzxKSrIMAt4RciSjpDwGyKD84mmUOJqX7nnYe+V+NHBFB9aqK63SpT32CPHv0v
	 GYZ3rZByqoNNdJuMnWvCMGdbYN5ypQLI/jWaZUbI2JMTc/6ZbO+ILukELprxIZ/tLK
	 3WBsBQnmCIxmafslb1E5fahmj9dTeja90smSoYB09F5vDUITVFosBg61iF+e55eGuQ
	 HiiHfae/jfC+ZnQjPZdBrFQot8GRe7jlfESKEK55MVjk2+JW9ppdfEN714pHBi6DIi
	 iV6xxZxUw50LDdHEgXnL6MlpOXQ5MMCqlSI1ruKVzVvyP8iiX6RFLR64PWeaUpwlQ+
	 /6Hl4NSEAZA2g==
Message-ID: <9a8a5393-8c91-4283-8d0d-aa861aafe2ee@kernel.org>
Date: Fri, 17 Jul 2026 08:31:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] media: microchip-isc: fix ISC_PFG_CFG0_BPS macro
 name typo
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260629-balki-isc-prefix-fixes-v1-v2-0-3b120cc3742f@microchip.com>
 <20260629-balki-isc-prefix-fixes-v1-v2-7-3b120cc3742f@microchip.com>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <20260629-balki-isc-prefix-fixes-v1-v2-7-3b120cc3742f@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 14:09, Balakrishnan Sambath wrote:
> The BPS field macros for ISC_PFE_CFG0 were spelled ISC_PFG_CFG0_BPS_*
> (NINE, TEN, ELEVEN, TWELVE). The register is PFE, not PFG. Rename them
> to ISC_PFE_CFG0_BPS_* to match the register and the EIGHT and MASK
> macros. No functional change.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/microchip-isc-regs.h  |  8 ++++----
>  .../media/platform/microchip/microchip-sama5d2-isc.c   | 18 +++++++++---------
>  .../media/platform/microchip/microchip-sama7g5-isc.c   | 18 +++++++++---------
>  3 files changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Eugen Hristev <ehristev@kernel.org>
