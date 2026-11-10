Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318889;
	b=ZHK/L8+7nOvcc92i/XyDG/LTyvvzqCmvo2gghB0T2Yy+amDDBN0pQH+jdRPXVIuSDLak
	 2CK+w/QPs1jWCzGWGM+Dpp6Xn6ikZNMTj3qVk0SAXMuniY+zQHs1KW1qBhKrOIYDY4JTk
	 wIZwaUMOzzunEY/vp/UMg/urNJd363ZdxkLnTEKZC0aNz997MM2u8y/FfUjQl5E19CozP
	 epO/Shq2sgtMaviUCeiH9tDAYZgmCJ4zShOQ1JnA9uol8Vgzq6XoFAHEgROuezbAvhvxo
	 e7olTr+khXKEksDsmw3uRvIAERFyiSl0OD+pE5g0eHudUxK6IKYGfQzxdAPu63dSZpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
	b=oVpKuctvVhCzOq47wY+RX9DEQwMagXH2+tqPt/RUYLGU+olSx3nicE8ec2rXqRefMJee
	 OfNSxHGzal1UFwz7J9/awB2nJkSQoC0vmX5WWHZSnqN2PytSjgw68ZNcEz4Bq+OOEKm1p
	 lyE4ynpsbTG4NwUQYx6QgjKT+ZzMY7LdK5vGKcYDpJpQa+QTJBCndXMb5kVeIUjCfKmRS
	 A2rsq0fimbAiQJFfWqmgQQ+yw9RxWzLHKwO9KZgFjApuwIM6jk5ZmHB0W5pFKhsKnoFmV
	 oTbOYrWTh6I3kvaydNI5hRSBCF8iwGWxzglCrZhGTblT3LM5d6Zg+70lrhMSUFarsPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET24+BCt;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57D606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 13:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F57D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ET24+BCt
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16908905e9.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318887; x=1794923687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
        b=ET24+BCttaFJhFjFN6Eks2eX8C7MGzZ1SLB8gH6G9gFUT8E5qOKkXXMlpScMkMSxwP
         Du7v/5gUag1yzuXJxIFaV3YF0d4wo1IWLcZbzKLDnlNn88334khYUalL7W8s8hmLYldR
         PiyaJyEKNFOkTELbJ4iF7ktMe9D9cL69s6PRaNXKL/bNZOLQD/AU9RHXCaX5vnfLYFs6
         wae4vlZoYtiIXmHxCDuImSOykO1mEIMdA4Y5xk4b0LqG4JG0DwiCmuV9GSlHgGAIrOOj
         fDeAxOs/li94i9Os4YCgtYzWf49OlUt1xLE5+7c9mNFksNfT34pPe/o+113YlMRCO7tU
         Kh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318887; x=1794923687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYPhgJGQCwOuBRuJsUZG5jqL37WaDmQ33hS03hfIFgk=;
        b=vDlLHPbtN3gUT9lvuL6BOYA6wnoF13YIzTBamuvsdcNbI5bC0jqsMYwrKmXs4nrb+S
         Q5MCHDjWzfC8BtY2Kn6HW+UOVdH4vkQZMQFCNOGv3QTotWsk/8Q74Szo4ydptrk6pnT+
         +pIws7X9ojx+PYMnNjYiikiH+fyUW8wFNAfXLogKwAty/udG5jyVXbPuzi/31g/3woVH
         IlVnqIGqXf9c8GcJ3wbVjT9eIQEK3+gtSEsJtZzEa3TbpRi6gmiw0q9ixX03+MBclEdH
         plskff/pWNBaeU/Ow1jgLf5gpooOM5+sUs2zyhRTxYrcdy2Q9dVpV6moTPtMCIpYl+Ik
         Ee0w==
X-Forwarded-Encrypted: i=1; AL+hErEo0D7uqdZYR4r0heIZ6J7gSDlJcwGD89fOMA6wF/z02dvBGBHEH5xG5e0eG0849T70vUCoN/KdVIbcRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9R4z0VnH3Ej8KfdPnGaCYktB5LwHYNv0keIvIXky0oGVsb0G8j
	Oy+3HNyzil+N5odrf9tYLLmFmNLEr6r624y7QEoF61EIExgqkSkLyvzQ
X-Gm-Gg: AYBFou3Yms1c4O/qEz9vPRgRIEzHGZRW0pFtl+RdNVeETUuyGIzkHd03WpnNAKiO3ko
	F8UghrMAkMAnXTUhRHjW8xnkEnfj9QyXlK/IxC4CnwwuFLoBPNFCAaR0J3c52KkndKyUVHkh9QV
	IcfAhzj5iGgtY0uWh5SlbVylFXfTzIBTo/UT4dbnaHc9CT71/dCQoAP5n+EG2joIiyXTYbUxn2v
	TrhGYLnWTwufziRI8+RuNp5DInCy4A9cO/REE0hHnXmY9d3iQbEEygdtzX68gEJ6bWXateBCYor
	GcYCcuL4V+0jryqmROxvP1BpMVh43LoBpDNSjg/gzz/KtZ2FObQzrZQ4/O3ahZo3ydNQbHDwdB0
	MRFQgeYk/lBgEChyvMsKp2+KjswEAvK09icYhkhkA+Q945pPF1alloJ/BpAiy2GyXT55rsV2mRS
	hqR75OqAqiEsYWyqQx0QdA4lbsmNZppYnZ53iEYJSm6wroWA8zl/b4Ai5387Pt9waru+N7lmRSm
	DAaYiama7g1Q+LVN98FNYTE7BsUFceKqEFalbWmYWq7ESTWsJGRFmWwIgqzf98e0uLBaOcw6XaU
	0F/oHI5N2V3I9tZHpPRf2MtEcRlYTCRmC2l6eeBZ3ZsicUzbMjN7uqdL9F4ycFp8Ag==
X-Received: by 2002:a05:600c:46c6:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ba023508a8mr51664645e9.30.1794318886866;
        Tue, 10 Nov 2026 05:54:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm104946385e9.5.2026.11.10.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:54:46 -0800 (PST)
Date: Tue, 10 Nov 2026 13:54:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, hverkuil@kernel.org,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261110135444.7d8070ec@pumpkin>
In-Reply-To: <cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
	<cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
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

On Tue, 10 Nov 2026 11:08:30 +0100
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> On 06/11/2026 08:46, Mariia Nikitash wrote:
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls used to construct
> > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> > 
> > seq_buf tracks the current write position and remaining capacity
> > across appends, avoiding repeated scans of the destination buffer.
> > This preserves the resulting strings, including truncation behavior.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>  
> 
> Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> This is silly. Just use scnprintf().

Or wait for someone to add a call that just does what is needed.
In this case the first stscpy() returns the length (and it is often
known).
So you could have:
	len = strscpy(buf, tea->card[, buflen]);
	len = strscpy_at(buf, len, " TEA5777"[, buflen]);
or:
	len = strscat(buf, buflen, tea->card, " TEA5777", ....);
or some variant that will do a strnlen(buf, buflen) to get the offset.

But it really is best to leave the strlcat() calls in there for now.

David

> 
> Regards,
> 
> 	Hans
> 
> > ---
> >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
> > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > --- a/drivers/media/radio/radio-tea5777.c
> > +++ b/drivers/media/radio/radio-tea5777.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/slab.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-dev.h>
> > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
> >  					struct v4l2_capability *v)
> >  {
> >  	struct radio_tea5777 *tea = video_drvdata(file);
> > +	struct seq_buf s;
> >  
> >  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -	strscpy(v->card, tea->card, sizeof(v->card));
> > -	strlcat(v->card, " TEA5777", sizeof(v->card));
> > +
> > +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +	seq_buf_puts(&s, (const char *)tea->card);
> > +	seq_buf_puts(&s, " TEA5777");
> > +	seq_buf_terminate(&s);
> > +
> >  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >  	return 0;
> >  }
> > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
> > index c37315226c42..e49228eb7c46 100644
> > --- a/drivers/media/radio/tea575x.c
> > +++ b/drivers/media/radio/tea575x.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/slab.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/sched.h>
> >  #include <asm/io.h>
> >  #include <media/v4l2-device.h>
> > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
> >  					struct v4l2_capability *v)
> >  {
> >  	struct snd_tea575x *tea = video_drvdata(file);
> > +	struct seq_buf s;
> >  
> >  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -	strscpy(v->card, tea->card, sizeof(v->card));
> > -	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
> > +
> > +	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +	seq_buf_puts(&s, (const char *)tea->card);
> > +	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > +	seq_buf_terminate(&s);
> > +
> >  	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >  	return 0;
> >  }  
> 
> 

