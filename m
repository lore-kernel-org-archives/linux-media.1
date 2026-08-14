Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F3F19E839;
	Fri, 14 Aug 2026 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786668029; cv=none; b=ROA6v7rO8+Qsm4w7ZalbL3QM/+H03Af9d56mRtm5XhmbmTtxFjEtHf81h5SAbsb5dN/IwQBk4fnSt0wr3YOoAH3yA+4tKu4kOHYBvQaYHppbrJxNR9JCSMGx2xt0ZtGUv6gtnSVifdRGSmuT+XXzKkh5dycL3m62OC4iQu/XFhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786668029; c=relaxed/simple;
	bh=fmSdAZAv2xLooji62JdC/6vm+nmv7ZU4v/KExSdkiH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f45nTS8+V/sXBvh388HSgjEDoWSvkzIWAmfwzOwt7k4pijjihV6wBrRxgsblWp/qyG9Wl+hpNl7CMEPCQbVK/j7q50B+RVFU6rhT3Kymon4vWZOHTrg0hRUHtRbStUXThhueUKd5QYawIMnJFFUgxlq7WjcZ4r/40PCBBB/2zCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from pirotess (unknown [79.117.174.178])
	by iodev.co.uk (Postfix) with ESMTPSA id D6CC5584A33;
	Fri, 14 Aug 2026 02:33:19 +0200 (CEST)
Date: Fri, 14 Aug 2026 02:33:18 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-media@vger.kernel.org, maintainers@bluecherrydvr.com,
	mchehab@kernel.org, bcollins@bluecherry.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: solo6x10: Initialize I2C read data
Message-ID: <an5iTu-BUjOV--UF@pirotess>
References: <20260813153120.3952770-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813153120.3952770-1-ruoyuw560@gmail.com>

On 13/Aug/2026 23:31, Ruoyu Wang wrote:
> solo_i2c_readbyte() ignores the number of messages completed by
> i2c_transfer(). If the transfer stops before the read message completes,
> the adapter returns a short count without storing anything in data. The
> helper then returns an uninitialized stack byte, so chip detection and
> user-visible control and status reads can consume unpredictable values.
> 
> The helper returns a byte and has no error channel. Preserve that API and
> initialize data to zero as a deterministic fallback. Successful reads
> still overwrite it, while failed or partial transfers no longer expose
> indeterminate stack contents.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: faa4fd2a0951 ("Staging: solo6x10: New driver (staging) for Softlogic 6x10")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/media/pci/solo6x10/solo6x10-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-i2c.c b/drivers/media/pci/solo6x10/solo6x10-i2c.c
> index 7db785e9c99791..1b37dccd137a05 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-i2c.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-i2c.c
> @@ -25,7 +25,7 @@
>  u8 solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off)
>  {
>  	struct i2c_msg msgs[2];
> -	u8 data;
> +	u8 data = 0;
>  
>  	msgs[0].flags = 0;
>  	msgs[0].addr = addr;
> -- 
> 2.51.0
> 

Nacked-by: Ismael Luceno <ismael@iodev.co.uk>

There's no guarantee that the buffer would remain zero on an error
condition.

But even then returning a zero on error here is a bad idea, the
interface needs some change.
