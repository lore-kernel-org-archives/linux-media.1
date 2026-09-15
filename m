Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8AD3D3D02
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486728; cv=none; b=sNjHx3RZ/TG+fi3SZadaeBuCWEIfO7ZmpZafsCpLVsr9MfAstJx3i0Mub38LBIUOKE5n8n0LpwrzQsqh29Te6kNpp/1zn6TnMHRLvZko4qMltOmcfkV4ZMMwX5HaPzt/342L15Y1thMx0Uji5eZke5vBKutjHhQzmJMvTDLDfu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486728; c=relaxed/simple;
	bh=+uXmbD88BiEUIkLs0C20M88JsOLHQcJbIINYHao3O00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRtNimgFW+yuEVPZJYQlVNI87pEDBYLsUYdrD9KvunHsE+Y/5pG5M+mMYc99Kvg9NY9QYEodyKUjnoKKhEGqZzrl75W5Dzlm3TmVNwWBddgioRxEjKE2/T02UIg73T+Q/QSYaZUUq0xm947mWki+aG8d1UpL4kt94U2kKedFJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kksWIDgc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kksWIDgc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso39061185e9.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486725; x=1790091525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NDrDdvnRkf8oxzdqkBmS7w/O32Fpy9g/+yKR1PGh7M=;
        b=kksWIDgcdYv58/5E2u6zYyZYCazSqDgxYCRQFq/KCheo/ukdkEButZUwKsZqziJvdo
         SRhWmQa9m0rBRf8HW3WbcXI6Ups5IOsFcfzEtDi1qLQ+es2RjLRJUj1vjlwspqhCLiwu
         amF8J3oblO4z8DKWE7ckgE9tzzlo+BfytOTjFVmObkMdxP2zGaXFSWqsfSl0/+lnBlUm
         TDpjqQhkDz1i0bUN87z/qfbw1v4SCLrEg9sJWJbymO1n8dd6kyZKP9UmQEBWCAHuLLUD
         f7YZyCP0n+mAFdb7d1aDrNxQEJzVGRBQqD945Uxru75OD8Wsn7AMUjecLrcEznppdQe4
         KZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486725; x=1790091525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NDrDdvnRkf8oxzdqkBmS7w/O32Fpy9g/+yKR1PGh7M=;
        b=luraRi39lLFO4LaRa8t5JUIM686nSTwCCJZNjtTTcco/J0qyRejb4yRTVv0YbSbpv7
         IGiAld4j8cfO2EO0h8cI0LdeC4RZDQjEDglsyh2fUnZAJigQYaUipitVhhepjxSYHkvT
         4OHC5pWNfUG3rszQl5NWHvv4VqZBFBQS6rvZQhPeOHosAiEjN6SiH0sAHqveZAQYd1ta
         fisg6d7B3OnLKOjRRmubq6y75Qh5ONztTtTyz6+Vm53IGlpreKGiDtXFONbUzacpV381
         4o3zxXqQJNDM8YT4sRyohqONXO631G30GIrvzUK0MnKcUkffdsSLj9gEAALOGkKwyzjk
         Fd2Q==
X-Forwarded-Encrypted: i=1; AKwUvBycqeF4GUAQNNx6lhzfElbl77QWhuaCy5TgS0ylY9Sq5H6XxF64UvKISQkyTR31c5s0zqoLe6IlxEFQ5A==@vger.kernel.org
X-Gm-Message-State: AFuF++n9MMSjJkDif4mYJinrPMq/VP4a4mSt5okOplO/6uZyQuCuzsq8
	ulfeMhv3lT0thErv3v9anTmLhti/PycL40szsGKHqRbRATfN6J/PrWRt
X-Gm-Gg: AYBFou3KiiKblT09r3k3yAYZw3amZM5v6Fs+vC/m7zSfPE/4QO7xedZz8DuZCWGXoW1
	XgPgcVQkQSdz3bRLhNF75l1ofgD6TdWMAV6DkdBOt3D3p+PWldJZet1L7iTGoYqsAsrT6s1sm/d
	lT/EDNdwXxRiaO2MGqlg3EvnpJPiocpoA3ZDo8Ue6ElVyIgS3iBWYotvz3STf0DYzkmR72mS4p9
	mTQtIs/0PDaDbTJubXJuUDWbA2HFKwzVd0D0cyjXEqo6i3TRyVtYeV+KW/c/1OR7rcm0F2m5Pfp
	YOS9m+aZmT1Idfw4OGdB2CQHZyrU4L1Tij+c5eY1XiJl61Nm4Qg0s2BWh5mFF+lgSan/il82UAZ
	KwHcCIFPNUMSxIJkhIhCctRVejWLEADn+6eZAzzpJwPwcBYF8doVW/jn1LBnLZynCyOUFebSzJg
	naQGUnpq7X43NfRmsGBhYGsisCGts97gfkyS++93rLPrO3xX9MqCCUakGHTiylsNLHxAnzHJ8fO
	LhyoQ==
X-Received: by 2002:a05:600c:198f:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e7a66b2c5mr160200285e9.10.1789486724578;
        Tue, 15 Sep 2026 08:38:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83ac3c52sm4128355e9.13.2026.09.15.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:38:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:38:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: atomisp: ov2722: Return after failed pad
 initialization
Message-ID: <aqlmgA3HNfxbvjXF@stanley.mountain>
References: <20260915140828.25537-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915140828.25537-1-punnaysharma805@gmail.com>

On Tue, Sep 15, 2026 at 07:38:28PM +0530, Punnay Sharma wrote:
> If media_entity_pads_init() fails, ov2722_probe() calls
> ov2722_remove(), which frees the device structure. The probe then
> continues into atomisp_register_i2c_module() with a pointer to the
> freed subdevice, causing a use-after-free.
> 
> Return the original error immediately after cleanup to prevent
> registration from accessing the freed device.
> 
> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>

This needs a Fixes tag.

> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 2c41c496daa6..0748247ca42c 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -979,8 +979,10 @@ static int ov2722_probe(struct i2c_client *client)
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> +	if (ret) {
>  		ov2722_remove(client);
> +		return ret;
> +	}
>  
>  	return atomisp_register_i2c_module(&dev->sd, ovpdev);

The bug you are describing is real and your patch fixes it, but
this isn't a complete fix.  For example, there is no cleanup if
atomisp_register_i2c_module() fails.

regards,
dan carpenter
