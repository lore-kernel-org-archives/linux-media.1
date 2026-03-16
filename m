Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819F3A545F
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675253; cv=none; b=llEnDzC9n2R94hdRCye2P/vlkkzRS+nF8IGDPBf2iU8kq3iMok+zjSe+0wXutefrzbZEQBzrQM/3+gPzQHLJuBV6UFFthM6kgYVqx4PZMJhcyy4dsHWGlQA6ARKv1N/pTJvmehmFIm/9AhnzxQigj2UEuYe5tRc2VvDaTNHDK8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675253; c=relaxed/simple;
	bh=vnAQT9RE+vH5WujAQtXJhjlhKyLBsaJKnKkhLJ+BiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrlQCf8r6ltf3ho9i4dCN57CrbUzleN98MoWqCebXj5s073loyWrJoKJuROmuItjWIBDHI1F9p4nicuyhKcenft1+naVWDpitl388xutoInvE+nV5GiFrphm7jEPJGQoiaaHPjqEdbuRKvLGqISApwaP8s83JtbK5UUPlijSYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAklMzKz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAklMzKz"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1687f112bso1904765e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773675247; x=1774280047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fc/Jm5bqQFiVZvJG+lB6MLj64d5j4WudtHzzE+s4ZA=;
        b=WAklMzKzwG5It+8+iQvW475ZmWDRXTSsWclAInlYxMIyLG0Bd0wWqD25UpVJtJ6+D+
         IPsQSEx/KVayhuLqhsOIS/EqMeVfizxWlWDWX0oZO+gFa9sAg4DZDeCQ2LwgeoMku9Bj
         1BLD5V3zfo0u46IMVljqL/0OGSgcCtcKHQZyJteABvMfulm2c1V+rG7QC7S/v19/8pOR
         vowY52CiqrVbCj4aqby6xvPZgTwFQeW0MJV2TWJBVZOeO80xL3LE5sEREsGxf8sH5mjG
         gt2VImBvZXj5bJUA2sqlhz6F15UcQ/s0yiz6Z625aAq7ZN/c4URTWJaZ+4X3K0Y3dG6t
         Np5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675247; x=1774280047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fc/Jm5bqQFiVZvJG+lB6MLj64d5j4WudtHzzE+s4ZA=;
        b=jQUNET8QRp31TejmTbN9dG4J9acZrOktlHhoY7V/OW8dFkvASdvoQO8tUDRR601WCc
         te6CQx0oeqK0YiTBM072HDdyrPDxMHa7ChMxaV1VRTkA6YnqCmBkNT2Q3+NBAJD+lfgn
         xugdiwzq23RXa+BS8dyhYyHQcjWXCr24XN4BZZPo1LPFkrfs4l82C4iknvnt1H/sB+I4
         xwIIvqtX4YjwaH4FbOCvXeqX47ASW3Y1p73FgnRQ5FHM+1L/yTZuaKDRrUokbZT934A0
         F3VrSkxlRAQyJ7swHtcJjSmpDdE5URb8HRDbFW4XklX/NOJGn+jz01j3HU/xcBOIMb8x
         k8iA==
X-Forwarded-Encrypted: i=1; AJvYcCVMo6jpq6pG32MP6yMFuPsTO/JDHNFoiJ0/jE2Y52UjiHXKez9jkqQJcB75+6ajzuo4dUdN2MIRHzAQAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2/YOF9de4aNC7mL6PGoBxj+QeyoUfbAajojn5twMRvap9Buo
	L1SBrx2JxJLcp2sUcGPSTog8oWkk6jXrANlSQx7iifaghfBzzhJ8W1yiWcyqSIJF7CXa4ltcJUy
	ffrgv
X-Gm-Gg: ATEYQzx40vD4rOAQchEiJbSXAHCWQNlRddBcLuuF7Qi0bfhXmiyUKjye1EEWuOvvz8p
	83OgjKjTrXwcfrjYgO4olf020XrCgwVpADsf6qSxDizNoUPwt3psNGhJWYZzY9rhWo2AAPqiO3I
	8syF1ZcLexGlp60gNNMi7vpnHgUjEFQlW0o3IYoxC1Q47S6qogvMOaf6Pn5VbnbTcLzPTx1p+kJ
	px7uLP24NSenJKDlN/TmmBR4cOq4Q9re8lGzElKXhO34N/57Lu3u+ZiLemMZrffd5h26uynwvqb
	F1U9ATe9N5G3vy51N8qE12KO63pJCtC6UUhtAlVK09tXpzrDHD/OAm/YzLP2z6utB82NKqsR9f/
	J5O3cD2GY3ww6sBpcRHjN/jZjLcI/I/w9DGSxQ0GcNjWymBN9Wm5GcNFlC6tJeve+Vf2McYanbU
	LKIOyAv3nxZ2bnDhf9GyphhK6kg1NJ
X-Received: by 2002:ac2:4428:0:b0:5a1:19fc:4755 with SMTP id 2adb3069b0e04-5a162b44e02mr3452856e87.44.1773675247207;
        Mon, 16 Mar 2026 08:34:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm3547139e87.18.2026.03.16.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:34:06 -0700 (PDT)
Date: Mon, 16 Mar 2026 18:34:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Message-ID: <abgi67iUDltHbfNM@stanley.mountain>
References: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316152340.238100-1-ss22.kern.dev@gmail.com>

On Mon, Mar 16, 2026 at 08:53:39PM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..f4709b2c4f41 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -958,8 +958,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
>  						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
>  						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> +						demux->playing = (ret) ? true : false

This isn't an improvement.  Sorry.

regards,
dan carpenter

