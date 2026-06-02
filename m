Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AD83C4B92
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440270; cv=none; b=fk+mbS3ChEsutXCxBT+Sn8fAR5J/TK8ciOwBvQ+oK8Ixxv56krqZOLKrKYOmsvebBuCuEFi5w/eL7oW1hckaBy5zBZMZ2a97LXLZfrOU0wBfm3rf1OhCQ7YHo1FEqebrHGrmAcmLxh4tFi/m3Bfo3hYrftNAzn/lI3HG1yhhO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440270; c=relaxed/simple;
	bh=udwIlmkrAo1hRgXy6kwRmjF0oS7m0VEJS3n4K33jWP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGLz9awEhP1xspUBrgau993Mwhs38s1RCtVg1YSF+2+UKXF0BK/KrF+qqL/6hBAK55jUfWQWIgxm9DNr8knDA5rXM3a2wh7KPuQVoaSlCW1chZ4qzMDKjixTGIpQjWoZK9B6TLVhM0/NWImDgqZe6u5FcK4/EabuqVJoi2WYbKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tEvbjnvw; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tEvbjnvw"
Date: Wed, 3 Jun 2026 00:44:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780440267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0L4kZCFL6r3fPJtAkqsclFqnfoARljWtQTrNXqgcjI=;
	b=tEvbjnvwYzs5Kuk0IutQDjkGMejXhiu2VZxYVQAkQVsYj0i73ZVCRPDVsKegTfSoI5Qqbr
	pEyNg8zdv1S6+n0SfubXaZn0IfzXgl/F4urf45X8GcyPTCFqGr8tbpi+rSAhuwlZv+WFGI
	YvVcfHtvX5tTKpvrACLm12+IXhWPXA0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] dma-buf: heaps: use max3 in dma_heap_ioctl
Message-ID: <ah9cwXA2CO5VB6Kf@linux.dev>
References: <20260517172352.3615-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517172352.3615-2-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT

Gentle ping?

On Sun, May 17, 2026 at 07:23:53PM +0200, Thorsten Blum wrote:
> Replace two nested max() calls with a single max3() in dma_heap_ioctl().
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Include minmax.h as suggested by T.J. Mercier
> - v1: https://lore.kernel.org/lkml/20260427172519.417333-3-thorsten.blum@linux.dev/
> ---
>  drivers/dma-buf/dma-heap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index ac5f8685a649..d49188893608 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/list.h>
> +#include <linux/minmax.h>
>  #include <linux/nospec.h>
>  #include <linux/syscalls.h>
>  #include <linux/uaccess.h>
> @@ -153,7 +154,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>  		in_size = 0;
>  	if ((ucmd & kcmd & IOC_OUT) == 0)
>  		out_size = 0;
> -	ksize = max(max(in_size, out_size), drv_size);
> +	ksize = max3(in_size, out_size, drv_size);
>  
>  	/* If necessary, allocate buffer for ioctl argument */
>  	if (ksize > sizeof(stack_kdata)) {
