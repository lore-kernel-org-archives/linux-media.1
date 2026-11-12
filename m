Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510426;
	b=h7FIlJ+kY+QweVKEvU2GJfxWtzuC8jEmvzUMBXmfVhQj1C/IJVB17BuLiB45BxeiQZaF
	 jKy4jcTdtGvGgWtVSxauO/Mn0DOXhAv/GDoLa1NuZELXdJ7IOygdAz65RDYqu7Af1oKxC
	 EcgsaQ/bgEo+8KC58HNagwRt4NH5lZSpwLAoh38fqAS6Ee7Z6UZd0mgkoAh+CenMfokaN
	 +4llr/+yiCcYxwz3FVKJtOmDmmTdSUolwC8jLan3C/ZgmeSfqSK0iMpW9ZCceXfF7puRA
	 2pCkv7D9pVFrdFkR/vwfSus8daB97HVyp8ATxGmIKvWPJLoQGP9vOGHYXnfHxg4XMlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1O1U6qPhJPf5Ji+Q9AqdK3EWLHHYlrm+QU8LLYnbjMI=;
	b=xKnK+YTvYzL/AAp1O2cuK95tlQN9TXKediPpEpC9yrvbdrY2S7C80bwu6dkOs7RFsVUu
	 NpLiDmStbiEkvHEE/acC9sfwGolsDHHOjU+jEFAkOU0yuZeqsveSmbUOmqVTXINsunqbc
	 gMq1dv9ltKCqt+q82S6ggMEkXBXynFfqSdbam8IXBowHLClrA2nCbIUIeX2ybofr3Tq3h
	 31dWepKrLgNf+m6gAiEjR+zOAam7AsyAmDsgaxISJjXCMvNPY4+mqYXiSB7BhqCYbyA79
	 RdSCSpINKJV2rHn2ST7jWpbwEU7hiwToJB95D5ZqIpa7sW7cTkycUgW0O/T/qATIMFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL3XOhdQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B11606A327
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 19:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B11606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL3XOhdQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1309525e9.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510425; x=1795115225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1O1U6qPhJPf5Ji+Q9AqdK3EWLHHYlrm+QU8LLYnbjMI=;
        b=AL3XOhdQcgM07eN1urgtxjJd/5hgP7smoF5mflSEa/geSkQ40Po6j8smLYalL6BC5t
         kxR9I9ztuXBzZkxfp+tuDnQL7O17TlYtf29l1KyhZqQpNzZTW/o+azm8xXnmmJVFQ2zS
         +3znKKC/yrSsrB0MO1873LHHCja07smNI+qfZ3c2k7/Kkr75M2gCjiv+Fhbc6nDm9Da3
         wzfMfZLD3om1yx27F+8HwaUIuuReudmIcqEIvhE5aYlQjoIVvDptYhqy5dB9sDc+UVcC
         xqwJV55olC3Weu1/uZ6oG+2E1ygTRU8dK0L4iXWQ2rIVKLV4u3O3XxMNeeCR1kEzoFik
         XbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510425; x=1795115225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1O1U6qPhJPf5Ji+Q9AqdK3EWLHHYlrm+QU8LLYnbjMI=;
        b=o61f76wqQnVLOT060O8zEcVz5ItFkho/XiG3PFwBJ8NkvLdr2aj1hfrR6b/2np12xy
         K7lgpwusbr/PNmu0LA9oIT/z8PvmlKbLrzMgv8/luHKP7zvl4ODjTNQbzu79CyyHhvON
         dLHfvhgrSFK4MJoPXwmejOWNQ1OQlQh8cc8xiu8Kbc4WxozKK/IThVGZ9OG8q/eYrJyu
         2nddxSZ6R9nOmuEMWQl1zVeLYN8d0SnAiYDTp2UECrf3POepTGpmg4w+Mx7ZIoUahV9P
         ACMdsEmD1FcGZCw3hWqrvDsJRKYPvMYJPOIDBmn2OagiDZO26qJ+UmgdoOCQGAdSH0Nu
         s5cg==
X-Forwarded-Encrypted: i=1; AL+hErHs49lv0IyhimURC65wob3IZqfmmczNLq380tYZg+UMay9zxwdvKX64tjf9zebQSR3Gf6icteTzOoslPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9AdlUhbPomR3/xgjzT2gZhN6n8GkKB06k2YP+6QPSeYAthnxOW
	MDfipfHXacGW52Y3vXcagcHRx6eO0lFuGYFuocevWf3wup6cRNi61+9T
X-Gm-Gg: AYBFou14mYgkuDIh9DztT1qKLDO6WB2Msc+tCN6nKLg/IvwbT1wW7LZ5EJ1VWf9VYcc
	0qJqQuaoYQT4gXAhPdijp4vtXd/unDCV9JYWBV9fSSl4GZm2owo9z2ACb8sHGDCpFlbQDG2CgLz
	Q6/6yvlJYV8sU51VY0XLZsLtDgcLbJqV+1tOIyCrR7TrCouljsoeHKLYlELmhut5RCzB+3bdkFw
	2fdyz+okPWk9qHbaqAk9mNdWHP+Kp57b1YHFOpAcnmLmB7I1LQ6H4hWMT6eaM3n1ju9/Z0DWxtD
	7pt8MwVW5XQgh6k1FaoCNIUM+KDmk8ArJv53KPxyxBgiKbGjVjrV6fbw260zw+1XbhPLVbqlJBD
	cq0jUr8swhm+1O0boBAEtsd/JV53/5oFuRPtoLXd6IpylzINekdOGBMPgEPktwW8eJOd1GRmqTu
	ES7X9VjPoPHf//w+3i812hyhH9ksm/iwgzrcEgbWN/tiHtE8RaEvDPe6PQxvY0YebPtINXJLcvV
	P0/0MBclGddbAE7Uh2qKnmWGPWsq+Haywi3X4tbxkykYvdZdlojjKnhXFBhlFf8szi+wP+0LKFG
	d6SETRw5g0bafym2OykBgI5T9IshPuBiW32mBxEQ0ap4/EiC0R8H9VWyvs9z+Jf1wQ==
X-Received: by 2002:a05:600c:4e56:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4bb55aad2demr2986685e9.28.1794510424573;
        Thu, 12 Nov 2026 11:07:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2cd05sm718945f8f.31.2026.11.12.11.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:07:04 -0800 (PST)
Date: Thu, 12 Nov 2026 19:07:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Mariia Nikitash
 <nikitash.mariiaw@gmail.com>, hverkuil@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261112190702.480740d2@pumpkin>
In-Reply-To: <202611120947.AC428BE4B@keescook>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
	<20261108210232.13800dd3@pumpkin>
	<avDmyLYpWOQ2WB-i@debian>
	<202611120947.AC428BE4B@keescook>
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

On Thu, 12 Nov 2026 09:54:15 -0800
Kees Cook <kees@kernel.org> wrote:

> On Sun, Nov 08, 2026 at 10:25:35PM +0100, Alejandro Colomar wrote:
> > Hi David,
> >   
> > > Date: 2026-11-08 21:02:32+0000
> > > From: David Laight <david.laight.linux@gmail.com>
> > >  
> > [...]  
> > > 
> > > seq_buf is just OTT.
> > > Using to replace a single strcat() is just silly.
> > > There is no point doing these patches until there is a sensible alternative.  
> > 
> > Agree.
> > 
> > [...]  
> > > >  	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > > > -	strscpy(v->card, tea->card, sizeof(v->card));
> > > > -	strlcat(v->card, " TEA5777", sizeof(v->card));  
> > > 
> > > What is wrong with (and almost OTT):
> > > #define TEA5777 " TEA5777"
> > > 	BUILD_BUG_ON(sizeof(TEA5777) <= sizeof(v->card))
> > > 
> > > 	len = strscpy(v->card, tea->card, sizeof(v->card) - sizeof(TEA5777) + 1);  
> > 
> > I can answer this one: bugs (particularly, off by one) are quite prone
> > in such code.
> > 
> > From the Authors of strlcat(3), you can look at OpenBSD's manual page:
> > 
> > 	Since it is known how many characters were copied the first
> > 	time, things can be sped up a bit by using a copy instead of an
> > 	append:
> > 
> > 		char *dir, *file, pname[PATH_MAX];
> > 		size_t n;
> > 
> > 		...
> > 
> > 		n = strlcpy(pname, dir, sizeof(pname));
> > 		if (n >= sizeof(pname))
> > 			goto toolong;
> > 		if (strlcpy(pname + n, file, sizeof(pname) - n) >= sizeof(pname) - n)
> > 			goto toolong;
> > 
> > 	However, one may question the validity of such optimizations, as
> > 	they defeat the whole purpose of strlcpy() and strlcat().  As a
> > 	matter of fact, the first version of this manual page got it
> > 	wrong.
> >   
> > > 	if (len < 0)
> > > 		goto fail;
> > > 	memcpy(v->card + len, TEA5777, sizeof(TEA5777);
> > > 
> > > What might be useful is a helper that would let you write:
> > > 	len = strscpy(v->card, tea->card);
> > > 	len = strscpy_at(v->card, len, " TEA5777" [, implied_length]);
> > > 	if (len < 0)
> > > 		goto fail;  
> > 
> > Indeed, as said in other threads, I have such an API:
> > 
> > 	p = v->card;
> > 	e = ARRAY_END(v->card);
> > 	p = stpecpy(p, e, tea->card);
> > 	p = stpecpy(p, e, " TEA5777");
> > 	if (p == NULL)
> > 		goto fail;

That one is playing with pointers.
They do make it harder to do any kind of compile-time (or compler helped)
sanity checks.

> > Linus didn't like my function name.  We could indeed call it strscpy_at().  
> 
> I really just don't want to have bare pointers or lengths being used for
> any of these manipulations. strlcat needs to go away because it's part
> of the whole C string API that is confused about array vs pointer and
> has no sense of handling bounds. Yes, FORTIFY does its best, but between
> lack of sane bounds and doing a strlen for every action, it has to go.

But both snprintf() and seq_buf are far more expensive than doing the
strlen().
There is the separate issue that strlcpy() manages to needlessly inline a
strnlen() in a lot of the call sites - instead of deferring it to the
helper function.

David

> 
> And I'd like _fewer_ APIs (I realize that didn't happen at all for
> seq_buf, but that our current best direction). And I especially don't
> want a "len" getting passed around. It needs bounds to be *in* the data
> type. And that means either true arrays, or internal bounds tracking
> (like seq_buf), and it shouldn't have "extra work" associated with it
> (e.g. stpecpy above still has to find the current end of the C string).
> C strings were a mistake, but here we are.
> 
> So, for "easy" constructions, sprintf-family, and for complex
> constructions, seq_buf. And probably the large bit of thought at each
> place where it is possible, is "how should truncation be communicated?"
> 
> -Kees
> 

