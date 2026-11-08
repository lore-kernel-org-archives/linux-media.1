Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171756;
	b=oYYuWPa0BOD5+z5iHRoFHIV/lgWzqORMDOM1i3uqtYZGhVmaX/0ItTZXPR9N+EurhTef
	 WSiOxRtLWK/DfVHoN4jJHD9iuqJEkYwSY8KD1PoaR6a+nyJhfoVaDjS5bpRAX6j4dhc7v
	 shael9bWooZGin3/mbEwysvWWwTceJ6vg1pvWjWxyz92URh6ScIj7u6f78qKbpDjEKqQy
	 v6XspNLY1dxTPiGkPx4DTi/d1ARXMtJlvTPXWoAfk0m3Uh92z6du1iN6aDeIWAKxoRafc
	 Y9AwTMc/XInVgMG9L5YHUAtVP+UngOngxnJFpn9p6LaRYcaBWSkCsg8qH5U7TO36RhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
	b=wfa6Pgx0wgzLh/N4SeQlsD0qPwah/aO8nNArdk+nHD5Zr3TUTx/0X6eMp3QWD3mUuMGH
	 xLZI8wyFEtluGAKR83M3aYin+eeobFlLEMjVJyViJrKMJRYKnr0A1rGww2CHardoTP7jP
	 muHzhVZocht3frwz9s7IgEn10ePfa/JDx42SJ182w338PreLyyvXLcrie/pdVH8qBltHP
	 T/c/iGD4nT+hfVbxyml68uZRvNOk8Pc/bWoF8hofmGJ6EcW1UqITpSIjcvlRWPa5mBVgy
	 ytAJjzM4m0myL2jx1icUJEiyhDhHtOdHQtyNyTUudoIvhRPh+Ozm6NXnO7phnWi8Tuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ef66MZbs;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64E606A320
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B64E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ef66MZbs
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2591575e9.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171754; x=1794776554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
        b=ef66MZbs7/9pQUnApmXYY+6HgFy7hXZ3fMbRal1xwVliJp8N2CZPYRn8DmmPTTXF0H
         IwQxUrmtz79jzNHH/Vwpw0dUvTlg5+LyAea6RTZP5rNYZw1H7lJL0LHeab9PN8P5csNO
         Jd8q7ULRZPEoWUtrjDx4YBfh/SzLACJQYUZltewehSpFhOQjUW67VicHRSa0MkT4fr93
         CgzC1XtxB6f7TYQZ6flxH1+U0KFvd3B9GKp/BsDdeznc9td9/HF5CtfocRaJiPCEbh86
         Xzz1SaJ7SbqW6nlXbLaMlzua9+bUwtpAdyX9TYAIUtByIh8yYF1MdYYM8eW7IAlTy/wQ
         /YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171754; x=1794776554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMm3PWlZKSVzTBduDywaKmxs6tEZa4+wbXkdqUMN/Rw=;
        b=Md9fnRzvgcSLva/fGoCcmkKXnwaGOOuaRXMtmFlpqyW7JNDvaKpIxATQwlhFLgNBg3
         cCJ+VAIczVmOT3S8wggvHLeLBxoeYmz0iVhFm8s/uKIMnnGgtQdpkpgvu29uMfl1ydX0
         26RXKoLvRbOGbic8Tf6aXpvsdV2jqXD6J/m0epyixlvDudxfBhUoT/Na/T0h1KqHsoZE
         AHWSiTKIxXjOLH5wxKjYPAYjzcou0c6FRIRBEyLeQ21t4cpUoFDSlDBpKbksqru74rMy
         EO1qyfEx4d82P87EncmH+XV5vsws/+rNouTcSWu8jHiK6wRzTlI84SJhq9ujUJuk2B9a
         u8XA==
X-Forwarded-Encrypted: i=1; AL+hErHobLAAkzr9OiNkR5fIdj2ATbwDhIunQy3SrAH1xSbt7XFBL+jYHISvQLvD/OxkTApcGjsQ230n2nf97A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QaiHVe6fls+BmeQ6jRPk+R0omsbCtLxldLLQPuMtomEovhKk7
	ET75gOLHDqQHoZcFK7jbaRTDwjnPcwWbcciKB68IUlfJZoA+75HqIh51
X-Gm-Gg: AYBFou38FNQDzV4vUUvGh4AoHBlkBdAnXCBGXi3HEXiUQBD3GL08M2dR/QGVvjsJs5f
	CVLRbVDH5QrkQx7vVExXSUxgfyz+Ague78Rcw5o8HG/kjtqB4TREh+rjxIT2uqcD0inTbXIUw0G
	vZst8OT+iKytTgr7fTSFp+/aZUY36WHoTSrsPkcQKBjsFlOBGmBPX+Ib+36kERnkkX/ftJfQ9sW
	VO/WXL+Ui+5v7w4etB/KYOi+/ZQp61BLbQdP2Iq52qNWeAgpMfLKutLz4iMizNPA0At9abbT0k2
	4NroO6x+Ww+MNzbM+p1uKkJ1jMA7SKHY2czYD0MP9iynL7KlNOGb6OKhZCxLhXuo79mRP0oVudI
	/7YgC9F7eIZICTKqcSRo+dDwmslyu8t2xtzFmICg2yze3oAnBlbpjm2MPIkGEAaMKQpVgSSFspX
	S85dSACvYMTuEAEFapvowf7v6O0+JIHhHzdlB/3Kyz2G2O9fUk2rGdKzRpahvp3z+SDQCFmn8wL
	VcFeJC/+2cqHF/JpBxR3AcVTh0JxZPs8XmjICk5f32Z7phoX8hT3+Rh+1IPXNjEdLEXghI2fOuI
	zQOtypQ5nQ/UAsHTEK7yf1HCvkPK7B3qPlQfeTqotjiifFV7kJntRcg27cdOfvCS
X-Received: by 2002:a05:600c:46d2:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4b963c6ca8fmr41994175e9.9.1794171753830;
        Sun, 08 Nov 2026 13:02:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm99840785e9.13.2026.11.08.13.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:02:33 -0800 (PST)
Date: Sun, 8 Nov 2026 21:02:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261108210232.13800dd3@pumpkin>
In-Reply-To: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 23:46:39 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> In preparation for removing the deprecated strlcat() API[1],
> replace the strscpy() and strlcat() calls used to construct
> V4L2 card names in the TEA5777 and TEA575x radio drivers.
> 
> seq_buf tracks the current write position and remaining capacity
> across appends, avoiding repeated scans of the destination buffer.
> This preserves the resulting strings, including truncation behavior.

seq_buf is just OTT.
Using to replace a single strcat() is just silly.
There is no point doing these patches until there is a sensible alternative.

> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
>  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
>  drivers/media/radio/tea575x.c       | 10 ++++++++--
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
> index fb9de7bbcd19..2b1c7f6ddd60 100644
> --- a/drivers/media/radio/radio-tea5777.c
> +++ b/drivers/media/radio/radio-tea5777.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
> +#include <linux/seq_buf.h>
>  #include <linux/slab.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-dev.h>
> @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  					struct v4l2_capability *v)
>  {
>  	struct radio_tea5777 *tea = video_drvdata(file);
> +	struct seq_buf s;
>  
>  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> -	strscpy(v->card, tea->card, sizeof(v->card));
> -	strlcat(v->card, " TEA5777", sizeof(v->card));

What is wrong with (and almost OTT):
#define TEA5777 " TEA5777"
	BUILD_BUG_ON(sizeof(TEA5777) <= sizeof(v->card))

	len = strscpy(v->card, tea->card, sizeof(v->card) - sizeof(TEA5777) + 1);
	if (len < 0)
		goto fail;
	memcpy(v->card + len, TEA5777, sizeof(TEA5777);

What might be useful is a helper that would let you write:
	len = strscpy(v->card, tea->card);
	len = strscpy_at(v->card, len, " TEA5777" [, implied_length]);
	if (len < 0)
		goto fail;

David

> +
> +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> +	seq_buf_puts(&s, (const char *)tea->card);
> +	seq_buf_puts(&s, " TEA5777");
> +	seq_buf_terminate(&s);
> +
>  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
>  	return 0;
>  }
> diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
> index c37315226c42..e49228eb7c46 100644
> --- a/drivers/media/radio/tea575x.c
> +++ b/drivers/media/radio/tea575x.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> +#include <linux/seq_buf.h>
>  #include <linux/sched.h>
>  #include <asm/io.h>
>  #include <media/v4l2-device.h>
> @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  					struct v4l2_capability *v)
>  {
>  	struct snd_tea575x *tea = video_drvdata(file);
> +	struct seq_buf s;
>  
>  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> -	strscpy(v->card, tea->card, sizeof(v->card));
> -	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
> +
> +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> +	seq_buf_puts(&s, (const char *)tea->card);
> +	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> +	seq_buf_terminate(&s);
> +
>  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
>  	return 0;
>  }

