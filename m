Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D69A40F74F
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494374; cv=none; b=fvZosnm37aZ2jrv3upkQjYA+4yihapVxBEmGlNX5zF5DwSXO7WaeBJXcyrf9ESlbRK/iM4r6wmjhO0NIEfY6QQy8ex6RqbGJ6nQ3cNQ3RP8SYLI8f6qQzs9e5Z7B9vRT2sA0Fm2DnfalzSCFL4O+wfRo8SLcQmdFlffPfPziXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494374; c=relaxed/simple;
	bh=IQPjoIZpdPaOkaeh40vjgCNeEquMxCEBZNrL/xEOMfE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dHr06f1EAToYXTjBDGR6KX3VtP6yZwwV4GGqfixH0OoE09ezJCBrZLRxUM0qukZIYf5wwg0Hp16XdfsjDAqUUKsqkBYhdhIyL+Jk/TAgmqZKnLxeWth1HnXI5haWRuN10+3vv/RWQr1Cr09YJS9YhT7xF7UZ3jtz0iN0I79Aiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHfpWEOx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHfpWEOx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AA11F00A3A;
	Fri, 31 Jul 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785494366;
	bh=bFeN5rchvANk3KY750yKKmJ0TYIEYUf/AgNApo1M/H0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=nHfpWEOxwka3SL/qHcwlrEWo8AAU6+dUEvM1pf7A4W32HnNHkjnsxw07jrYBuevZ6
	 eHF+d9OUY5XP5z2wFxQzrdAtb8SqHmjfidVTtTtbbmkHa7Gu5rZLcLCqDguWrNoP/U
	 EI4t+NBWQchCqlWUeAOb1OJaOSRCjMiURgLC8Nh70d14Gp64LY0DqBaOB+R7eIucgc
	 /DSo3gdmnxg1TDqrMG2jRb3JbNGCbyUKbyVPinTrJjNWYzAqnUIt/BoEUGHfstsyRd
	 +tcrFRHV9bOPYl9IuRDGR1WDzTAHJOxlN7E7MHjbWBJ5KWLUv6UuKWo5MKH1j+9diV
	 vj5BrUnkT7JbQ==
Message-ID: <6aec4090-74df-4ae1-814f-20b01e358d93@kernel.org>
Date: Fri, 31 Jul 2026 12:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: em28xx causes NULL pointer warning in videobuf2-core.c
To: Lars Ljung <lars@matholka.se>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <8ede91cc-b505-458a-94ef-fb02270f9701@matholka.se>
Content-Language: en-US, nl
In-Reply-To: <8ede91cc-b505-458a-94ef-fb02270f9701@matholka.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2026 19:08, Lars Ljung wrote:
> Hi,
> 
> While trying to get an old Pinnacle PCTV USB 2 to work I got a warning 
> message in the log. See the attached file. This is on Ubuntu, kernel 
> version 7.0.0-28.
> 
> The problem seems to be the second call to vb2_queue_init() in 
> em28xx_vb2_setup(). This call should only be made if VBI is supported, 
> right?

Correct. My em28xx device supports VBI, so I never caught that corner case.

I tested it with the disable_vbi=1 module option and reproduced and fixed this
bug.

> 
> I modified em28xx_vb2_setup() to use em28xx_vbi_supported() to check if 
> VBI is supported. That did silence the warning message.
> 
> My hardware still does not work, so that must be caused by something else.

With this fix my em28xx worked fine capturing video. So it appears this was
the only place where the em28xx_vbi_supported() call was missing.

Regards,

	Hans

> 
> Kind regards,
> Lars Ljung

