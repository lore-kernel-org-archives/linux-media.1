Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032935;
	b=Glba56/e7QYrsuSzgsg0euTwKZIXHXy4fGK23Q+gZq84Fw0mEZYSLUUaLV34riSOehak
	 jotB/yHNa9ZMV8LBLks5mtY3W1dkg+zWqaCUlaUtdfLgF+O19cevXQnYxSexKGH3BH7O7
	 R8sWu2Cb9XIhq9TXdSpiOicHdaIzuSwU6Yfurzvh0q+Lx+b4E/mSOKLRYV3/n7EbWa4jN
	 aIbZN+mvFD8dgX0zMSUcBY4eJ2slFRvZHCKQo/iF5YQORm/Zx8NCcEiFusv+/Ofc5ND4A
	 kughunutKkgrn99EudKEbQob7KzD5y4l76z4QmPogs/1uH8jdt/IdwJrO71QH4+rA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
	b=oOgQHwFcoeI2uN209342JTQ3dVqgMoCVIcEWyDmxO7Vu8ukgtKaju40e823JZkkIY0HI
	 6IIGzKeh4JFCdfwXjJfdpzpSL4rPzSe1T99Xb1NUdet86tqHyHoENYqB3Irqs8g+enY7x
	 C7dl4hvZnk5RwuTGFD1gJyeT87PhrdfWQXLa/7BjT/pk8yZvk1hSI4nEGGbvM8fqK23c5
	 IdQpAQQ9JwLXYBl7qNFPcFjcJrE9ekDwu4GNY0TFfCQ+CF49MJ14cIyPX94933zM53HNg
	 SPT/pQo7+LJEcjn407+IdPG7nKtaoJh9sfgiRwp1LIpr6cjLgz2ekvI3bfWk1B/ERzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvxhfPHE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95202606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95202606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kvxhfPHE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3025262f8f.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032933; x=1793637733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=kvxhfPHE820gI1UUM7RXsrnNDxX4JrU74bUFOfmSep4/3gAeNvshA/8Bq03VHIFLED
         B2DnvrQ5EKlS4kyfFqCYZK+i9/+z3Qq7dxQiuOrBW9QxNjrZLaJhKr/bk3lnGctZaVPN
         giZlBVnKR53ravR3lGTnElS6al/3sOTSa1FX+Dqj5LGsLENIFYq2lu+Z8h447XRywzz/
         9RmD79V+yeHq+iId1UD1Aw8nBTCX/JwaE22BV2w8BSZo0zZl/OQ8LmdA+zl8f9THLcwS
         0fEL0p/HYeQjUUiY4wpLyMmaAt5eace+ZnHI1Ypp3WStbBPcIo5blod+7a8tOh85t51Z
         MxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032933; x=1793637733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=p5YXARuxWd+DuwYi5x3nFayWWAvpqHFfxxJHXhoZLCLW0yd1k3pjRPfqVtBhmkLzue
         4uRXQReGePVkQ27j8/1w0amioK4aM+m2gyCh6SjV/byWdeCjPuU3UgxaqlP+aqy7FNRe
         2rMoRE8xcOuGzTwdObhdk6jqhlOsgFHA3OC19YFl/JX2h0aYnMkX8wlzyBDrFEUW8EHC
         fHI0gFhcotIu89Bi2cll07YxmIsnNPzumv90/9TB720S7UqOzM0JfJbwre5ZhDAUf0H9
         lVKgRTy9Fp12Mt+scEjBwIKIKQo5GBiwKzHDLR+YoenDvkDc7BUD9OzEso7Y5jkj4Ysu
         6JWw==
X-Forwarded-Encrypted: i=1; AKwUvByZQlfWyodyjmWv8Kw/KQKKztRvlIP/CYe3dR4k1Qw01OsLve83zlIT5cxwgVD6cBZ7yZieEYUHCgjrHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxHmdJBJ81kKv6DNd3Oee/CaVMjqkwS/RSmH/Cf/Aw4AyyN7hR
	P1CpDmH+BOZJLsTqmICWCOZ/dVTf5xjwRFNgjhJ/v+1KZ7P5FAr2pAyzU3gd2kSnlnAbf0ca
X-Gm-Gg: AYBFou2oAbXqZKSjPX/p1+77DKaogw2xfR6Bx3W3tjyhtvkSKsPA22V1mmjEeWtPAuV
	j5LmQ0OAKvrfWeZBCuKqB1ukVAgmwVyydIqSYRqfpofEYv3r9HDybY9jjaKucRfhIARi2uknVN3
	TqYD+YpBEz5/oPcbq4H46XzucYdaHORwn9PsfTdYvf6VU5yOWY+p5IYlvnTf+5s7GOpYUj5nGb+
	1eeovCfU4EfdfpZYO79OMqE6bFNbbJyg28m2MRL35vmNM1PhNVy5rixHXiPnAmCUSzynJWe/OEw
	Nnu9j+aS5CY/iPN0XoBUDVLWA0LkTyl09nLRJUUbRAqpuEOFy7BiDt2r764mWizb5GekHpqLQ+0
	OICyWQb3NWp0kaqGmSvG0Myo+YroiNkDBgvZhxOUU+BbL64b19Y9+aoLGBM4ec9ZrfK9H0TYpJS
	C2tBA5aSWWHP1/33GfEbj9oXqKcOBTwz7UCehDlxP/kgWHvzHuBxnUgH2cfUM3CGOpoPFsm3yuw
	vOCOQSIKqbAy6e5mcXRhS8u+jyqmacbpeSZ6zNQpd4Wi3U9FXWc
X-Received: by 2002:a05:6000:24c8:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e3eb922a2mr13567728f8f.38.1793032932768;
        Mon, 26 Oct 2026 09:42:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm17879800f8f.57.2026.10.26.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:42:11 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:42:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in
 atomisp_freq_scaling
Message-ID: <at-C33IuUEms74EL@stanley.mountain>
References: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 04:10:58PM +0000, Abdullah Mohammd Sifat wrote:
> The local structure 'curr_rules' is declared on the stack but is
> not initialized. Initialize it to zero using empty brackets '{}'
> to prevent potential information leakage of stack garbage values.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it fixes a bug but there is no fixes tag.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index e66a7d1c7a0e..d4de2bd9a0a5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
>  		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
>  		return -EINVAL;
>  	}
> -

Deleting this blank line is unrelated and wrong.

>  	return 0;
>  }
>  
> @@ -180,7 +179,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  {
>  	const struct atomisp_dfs_config *dfs;
>  	unsigned int new_freq;
> -	struct atomisp_freq_scaling_rule curr_rules;
> +	struct atomisp_freq_scaling_rule curr_rules = {};

I reviewed this and the original code is fine.

.isp_freq is never initialized but also never used so that might be
the confusion?

regards,
dan carpenter

> +
>  	int i, ret;
>  	unsigned short fps = 0;
>  
> -- 
> 2.53.0
> 
