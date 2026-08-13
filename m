Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C5442F718
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605423; cv=none; b=AP8t8uhBBSckx9ewVxa2dPXeXEK7/9UnSNJU7JCXUIWH5LmNU7nWRB5k+Q4WDVnxdp8Y0iQKZDx2MjdqGN+vQpMuyNs6n8gVcyEUQMzJU+e1iOJns+NjFYD2M8OpEOFLNqoOFd/b2j7TXaneuprCcz3UD1xdnAk4kgwY6qhXUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605423; c=relaxed/simple;
	bh=Q+7P68BobSpIPHS4RvT5H4ifxMw0+x43h+6RrwoFA1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkbj+CGt0TYF7sg0u6YmeYKtxMM28bWgqeXTGvmex1hYwChwrO/mEZYsdVlVE7BK5nEP/JjFHbNKJHNOR0pTEUd7ICGfQbRkTfk4mjC3bPVOGnPSk1Ph9gBoCzB7xyCq+rfUmtFWpacFW4SaqFg3t+0sy5upwbOr7134O9oiru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oj51L7wI; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oj51L7wI"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f256eaedf8so4241856d6.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786605421; x=1787210221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZNs+AMFgatTwzN9rphFKvuE/0PEQZq3clco5zUvQjg=;
        b=oj51L7wIIWgC6E9D3Xu8yM18OJNM2h3cC5xWrj+5nOhprLAv+tNtcBEcm7ExEAQsok
         LTIbcEtNfjLeRvWjoXDNfp2AXnP0d5nZuJsrVUpPztorwWZfnbsVfzJOOFhc0PDyv/CI
         VVLOfM8zY9x1pMVpAI3bilGxdAyyAFEL8KLOyIMvssw7F1p6NIvNgtT80z8igSVaEBJX
         sk0SLNxqLCfpS6ZsHZmrCgbl7dfxvltcQNgyY4s51jaPObHd0bbkL3s8uzvoAP3ZW1jT
         hCbaeBjltxPd1ALtbVRn6BbIb3RCW+vwTw0tOQLXg6w5r1pLMgYMPrstruKJKMS5YNjX
         kZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786605421; x=1787210221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZNs+AMFgatTwzN9rphFKvuE/0PEQZq3clco5zUvQjg=;
        b=Qrgf1E4jqtNs19bo9+7EjEBf0AIQpjg5vOuKMMwm2U1iggeDZwIz1h4b9gV1/Xa54O
         YAibGpZ9PESO0AdDPTiwTuvXWkYy0QVgy9y9/B2PkRcrbFiufa+6wkErTnASQ08JZ0tZ
         I6D/PsK/DVS7hBxW8aae75EGxYkyJeQrbGYVYM16RBCjTCqmibQQU/5z4zqy9M3JHJcI
         MYklnj+SWgE/RGc7ECzpAsLTHZTkm3P7WOG6Bb65qQUkFdF0aq+0npPDQztqkIzyOOjN
         dsXn8Orh0Hzau8R2ye4HvQobf3F1S72QU8hZIKvIIzAlYWFvYHKjvkHmXnQXi7qYR5kz
         yIIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7d6P1R1AdQFwge8jc7/CbNoelRWET0FhRRBAeMcuJqC8muxdx+BYdG7gEnDKqDSZtyL0kuL3AhFWSLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdrgkVMyXfEdJxUs+0vFLzkGa7wTi3iD9siQoqw75WvegsgcY
	n5acci2oeQcGa2nfDtzBJ4oYToW+C7TN+WEatyQzfxMue/LyE812ybDe
X-Gm-Gg: AR+sD10FQKj2cRHIYM8wz5pIAFazHQ5ytUoVqNdAbQ6tvF6L+gcFwvmq1Yr2wHQFMfu
	d522ZA9+u+boHsxJgnxRS0XmQaB7hk14L/12jeVqicoAxwnCcjsF814bS1mjfLp/SpCUR687D5P
	1SGI6Cd2/i6iYYFASPF2Dni961+k7PbykgPz8covSknnW5DfASNTUQqrTM5CqGfz26h3mQInNyu
	lP7nK2IKezBMRQEBQ7dDJcwUzCvTBldACHkNaYtXNjA/o4PU3ZzG98/OaM4cwn3JqI/mDWoxGdr
	WDC16hOy+ET1OoR6rxb9zj92raXClgSE/F6oYn4CQ0Rb+Xv0UvGsLNWLyiUG4pA73R21rSfQxVC
	TcEg4GaBscp+m/6HkJIeAK7MlrOJDZfLnInzxNAisZAyv/SahaXw3NeUflbQ/EMO3oxzO+8Lnhn
	34l8Zbuf0b4BHMCRFhxPpZ2wP2k8rmDAcpU2y+BB4zgvA7bGpylImJ7/OA7Cql52U=
X-Received: by 2002:a05:6214:2603:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90a80c5bb43mr29730496d6.30.1786605421629;
        Thu, 13 Aug 2026 00:17:01 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a81a9e973sm9023086d6.39.2026.08.13.00.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:17:00 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:16:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <an1vaFk4UrhQPkSu@stanley.mountain>
References: <20260813020354.152120-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813020354.152120-1-rishab.madhugiri@gmail.com>

On Thu, Aug 13, 2026 at 02:03:54AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability.
> 
> Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 0ee52637e..83519dd8a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2160,7 +2160,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
>  	bayer_ds_out_res->width = effective_res->width;
>  	bayer_ds_out_res->height = effective_res->height;
>  
> -	for (i = 0; i < sizeof(bds_factors) / sizeof(struct bayer_ds_factor);
> +	for (i = 0; i < ARRAY_SIZE(bds_factors);
>  	     i++) {

The i++ fits on that line now, so move it up as well.

regards,
dan carpenter

>  		if (effective_res->width >= out_width *
>  		    bds_factors[i].numerator / bds_factors[i].denominator &&
> -- 
> 2.43.0
> 
