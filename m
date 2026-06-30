Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88D2C21FD
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826203; cv=none; b=V1XEy2vUSNk1ttHI8zsbrM3JVEvLxTdGOWtUXhVlu4RpmLI81AwDx9zjHj9UKKtYnwhgKMVtzbrV0y1GQYBkbl97YEqAWfwpFdqzvo6ut4S5LVp7we3V1GhdWP/nG6ASquigvuLJdeZdufKC5Yl7vwYGo2MeSD/sbjlk1qHZlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826203; c=relaxed/simple;
	bh=vP5xmxbAtsReBgizcKAYtCOV1Q+2TzkNAQm0ELHFxVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxdvfhQ+28cYjTkC0DXz5RbQStVnTRzkrxC9JQllfZsL8W+0TEc8kB4S+/GXOik7CTtKoQ5wNiriBfx84IGzQeh2QiaSbHcN8djB6EDv3dyiLbPasTIXQUphVB9xF6huW5p5upXWUdiyYr+DDwYC/pdNECce5saMoG6yONKXRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsPImFqb; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsPImFqb"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so391269e0c.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826202; x=1783431002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rMj7L3fCtkNCkQ3FJAGXRTneX9MRuVE2CQ0qk3jLeQ=;
        b=hsPImFqbUh2Ld50T+Cx6XbpJxGxi5lhTKvf7xhOM5zZGPTVjiw1Ur8K7Vl0hbMhodF
         6vK9wT+EaQuiAgZbDWPmbfO8GA3jh52D5Fr3BHj89Z1Nje1wTICuMkYxQ51I6+dSQaYt
         92PEp7ROajHc6ZOpsTWhDDUfTYOS4Se83OnoOIzmVajzNB1U/NH6XrHs9F5EADNrDpd3
         tNAHZxzO54+OeK6XbYdSmTD0cYMOcGXDrL37KdVXhUMK9uayFJmuHXgiLRB1kTSF5csa
         6K2kPeBvglY479k04+pSi158vzLzpKUlDMBSn0deeGI1UOnpZBTPHNFs5JSP7/zZREWC
         jROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826202; x=1783431002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rMj7L3fCtkNCkQ3FJAGXRTneX9MRuVE2CQ0qk3jLeQ=;
        b=TbCmORN5KKL/KvPVGtsjciUaZ3axDx/0tevZeSZOIf98T5YS4qGEg7FngjhfmXIch0
         OROW9gM2C6dYLaWm1Ykran0LCLEG5x/mgoe3FhSXF/Pr9HpHDN+4qXIMpUhrzxeZ0M5o
         LLCEuBpfcHT7/iFLJn5Y6wwR9fIMbiVUuhruOJLNP6mrajLatDkCriP2w5w+IiUxH1K+
         TmPaFx7PRxLH4aGzQ5kNMrmBNOL6dUFnCFUdF6U28xW6png3VrFXst9OJoyJ8JDq1/4F
         46OsP7E5UuqH/uZ/4LN5h4cDPammnrBHOdZN1Gl7PDfKSMn7SNWhStl87Z+LsS6RHlD+
         qAaA==
X-Forwarded-Encrypted: i=1; AHgh+RqvWXOBHr0OT1KWCULhlzCvq9QP9SBrMjy57iMKO6lOQCSWsOaMxDBohE1ZubGtq+nWFNonskBRGBaydg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBY6WINpS09P1/ldWJOKvO6ovnRF1Q92jiApZirYst/kiSnki
	svT1yI1YuGmK5fcvUFuU00LwrZM2S1w6Vy2y2osZFkvS5lA3ClGC+u+L
X-Gm-Gg: AfdE7clywaJ56YAolHWWPriyDKNNNRo0gh7vfl1xiZOgcXuKYFzI3a7wpS5Z8Mp6c3M
	laX0k8gAW3mEyUvkV0HoZMp8C23Mk7SZE8ZSF1t8AoLHT6oYzEQRW6x93vG++W9rTXlSxcudCEq
	UzxH1uwheXNQfgWsx7mxHWKHN86nreX+SKvXNaK3crMgtzkW+EEdb9y6kO4kQoKQNeK8XwjrV21
	m9AcNRbtDhhpVn1soTiEcSm2N+/D5P88YWKgGwIMSRy9tbjWMS+wAZMqconEpoWZZqhOWm1iMSS
	GzjpBMrS7X2ZHyJW16TbRUHAW4jdCCI4HcL9LXn61oYJ4kvyi2Cg7g10zXosGCiEpGwkLOZwYL6
	iKqgd0NwitmLzgZQveBIo5PFmkJKsHT8ezeNubXS+zP/3e2CG90yAVTV+d3cELQT3o7CI7EE5P5
	l5CFwj
X-Received: by 2002:a05:6122:288c:b0:5a0:90e0:a4c5 with SMTP id 71dfb90a1353d-5bdc95175c3mr469899e0c.8.1782826201821;
        Tue, 30 Jun 2026 06:30:01 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc189bfc0sm1353432e0c.7.2026.06.30.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:30:01 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:29:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdanmarcus@tutanota.com>
Subject: Re: [PATCH] media: atomisp: fix block comment formatting style
Message-ID: <akPE0_FWWMAe8BfS@stanley.mountain>
References: <20260630131226.23374-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630131226.23374-1-bohdandmarcus@gmail.com>

On Tue, Jun 30, 2026 at 04:12:26PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by checkpatch.pl
> in atomisp_cmd.c to conform to the Linux kernel coding style.
> 
> Signed-off-by: Bohdan D. Marcus <bohdanmarcus@tutanota.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9fd26..20abc2c0de80 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
>  		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
>  		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
>  			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
> -			/* If the grid info in the argument differs from the current
> -			grid info, we tell the caller to reset the grid size and
> -			try again. */
> +						/*
> +						 * If the grid info in the argument differs
> +						 * from the current grid info, we tell the
> +						 * caller to reset the grid size and try
> +						 * again.
> +						 */

Why did you indent it so far to the right?  Something went wrong?

regards,
dan carpenter

>  			return -EAGAIN;
>  		}
>  
> -- 
> 2.55.0
> 
