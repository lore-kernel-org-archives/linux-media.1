Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C7344D85
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843244; cv=none; b=sWoUVU2zoJ6GSys1RK4bJOpHOGlJjgjK8TqboOPAFQpgr/+Ruw7I/bhp+BKuQGvuZCWmXvOVAvrNbtrjnlURww0o4qiG34aGr587X9Y+7TBKg3JTp9xGdFwg9F6uuh4BhSOR6+6t8Zk9SUGwwDCyjGkrjgXBd3J8o5pIxbcl2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843244; c=relaxed/simple;
	bh=oqaSnnXYZjSIYsGOsnZ5ExcS1FQ6XlZbscZyq8fVyfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDjYJoLvK8Aw2HRWc7Ukwv6+eerOovHcbgcp1YyAeEu5yrr5rdSF1EJ/679qfyGGW/0+ZOcMHBBuG1bduDPtHhzymMyYh8mcxf4cDkmClkY03ma07e09JB6b4yNYH+xXOvH90VjT+RYAnlfyJEelmzYM/iGA6NQ8RYqIGyj+7mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vo8dwj/J; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vo8dwj/J"
Date: Tue, 30 Jun 2026 20:13:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782843231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5AZdLeo3uI0i+gBOxkvCjAN56VCiTSwOQL2+ob71TQ=;
	b=Vo8dwj/JOu5hhPzOjkfgTellBxOoSmDT59R5ScsLPX1SHaWQLyqh2ZwC2Ujh2V2nxoTZv5
	yw3zOJ8Z/B8yRJzRQAv2Bdj1r7Uk6OpPKyLoTCvTB8g2QJ8xSEGf4FEW2jaCNFBaDDLHfO
	fw+uoi96CONzIr9mGUyW5/m/jHUi+pY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: i2c: isl7998x: inline
 i2c_check_functionality check
Message-ID: <akQHVh9EaQbY6SU9@linux.dev>
References: <20260602223441.1087427-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602223441.1087427-3-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT

Gentle ping?

On Wed, Jun 03, 2026 at 12:34:43AM +0200, Thorsten Blum wrote:
> Inline the i2c_check_functionality() check, since the function returns a
> boolean status rather than an error code.
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/media/i2c/isl7998x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index a77538d2343c..8244d4296a02 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
>  	int nr_inputs;
>  	int ret;
>  
> -	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
> -	if (!ret) {
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
>  		dev_warn(&adapter->dev,
>  			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
>  		return -EIO;
