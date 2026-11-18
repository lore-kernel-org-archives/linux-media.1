Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996451;
	b=QbWzb9CmE8oWRSPNxd+iqPCsj+BNYp0WrhHBmv7bQ5nUDjHLfyvM9J8ZU/Ymg8W/08CP
	 yGKUEWBUrodZy7oCxJqaRfJ3pEXLeYCKmrMMWLuX0Oz9NAr/U98iM6UNtfnH1PuyOSRe8
	 xJL9GHDlxY4AbOXiIXfRpbayrBlQXIUFGTS/appMLVoxV0M4++4vB8oKD6zW+0aKsDiTF
	 oucD/yjihzmNFHMKKqSbsfRQnYGxqJqVt7K0rVR+8RkDvEbObckl0NbgA3MjDhQjpdLaa
	 mGJjIjxrh03pItr3xz60S3eKxFPypFR/NmBID7xVhRpibIAlts8B9EnMXNoB6BheL1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
	b=DGwmtRM/iYkNDv6elJt2SKvFpDF0BoUAnE4CoSkTCgH3oph1rG4fycL46yVOtqT8EMib
	 V0X8LxFWQIPva14fJm6+wdIyGQUYwfwTxX5XCTcap3qHSUPVbD4xDmLzG6LXELbA8s13R
	 CKi5HTDgctIlPAnWtazRN4+I/ZSLUm2kshFhciBhch8ee7KuUheah5qxShA9lsPyvx9kb
	 ma89O5KfM4Zqne/qfIRHCytPSzhzE11ArPQUuBaFbc6lD7mY0kcOiccAGnzHvFQARYv+0
	 EpAm+VP90mz9Qq3IIjNtgcwzR8tZIh8MYR0ID3Qk7byqHm+9lCLj2Urn9lWoCiAbi6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2OqD5yw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A7606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 10:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 066A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2OqD5yw
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4e2ec4b42so4598487b3.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 02:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794996450; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/094t6wsX42OiGtmK28GWyLVhAalSJMJakcSXLW7XLw7JsVLU8Lk6c+0EaDqbuJ0A
         cTBu95xY25ILB0HE+O0vAmoRuG+5qiQt3vHTmdM/z3h9hh0wMLxrFj/ewWSrKOgOP1vi
         gnaHQ94/1UoyeEaThHV8Yii3cU29gRdDfUfvNQKjI4U+Qt4ZLAvVuKnojGqZL+Ys1Y80
         aq7Kcjt454Vj71g+aTlPOwSfar5ct1q4IdoNsW738seZn5LoE1t7DC4OCoakd95wD6L/
         ViQTotPYo1ube/DQk1WqFuxWwPBsmbaCUwmgVrApefwRynX6imgGPYD9wDKzFtdthHLj
         1fEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        fh=e/lZUf3q3F+AKI3bdn42maG8rm+uDRGNmAE7hlJ4BU0=;
        b=gI4yyfyRF3qJGpJj/dAHh+hOiWAG4/SE5ozcmM5jPwbZo5mtwRT0EGknRAFVGHV5kd
         VnYlkIEB0WgBVJKkml3i/VL8qhvtxkjCkgfmkDVSPmpwW7AEvnpVo/nXBCgFvqExFdj6
         dXLPR8Rx8cNaS/oLbBiF9a9MvgM7Jh3gPy8cIDaRFEv7rPS/EI8z90NpRlENxF4GBEaj
         NzDGy/8FREBcVExAbUFcqb5IVGBl9t+9BbPx4bPAbXmg1qZHO4wBGUpzT/kEAWrHAN6E
         4iFRjAazol+Z3UWVvWyhiNsXr63SP4/7tq1djcpxaTdY7mkVqyka873cnwu6pyFtikcK
         eiBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996450; x=1795601250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=J2OqD5ywyH6LSEJ9BuWQdnXBANlORCux9CWVCvlPvyXwDNECvacfIqeqlxdhU/zUU9
         +H9DaQM/3143PxHTTAeEK5al1FsRM5tLGy5D7sFGq8AwKBBEFq+VHS9DWU2RTFSz2g+i
         fRnqFcRQDp3fhP6XgcjM5fRg+H6He/4Efb7pGNhF+ThcF1lpl23vydjUIOha0qgKTk0p
         FZ8DOwP75UIDS+6HbXrJtR/h6FeGLPWe43w+x7vcffvzedVvz41971mmbUL0LhzDc6Ax
         U8nunais28KNSlarbONkt9hj0+CL0ZoFu8k9nZg0iejgjtP3mS01jqBeFFu/d8aT677B
         /5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996450; x=1795601250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=ZGVcH7WuneLW3r4zys9hlzdPx9WsWFhRWwTIPmamFsS+dojDMDoVhJV02iVcATfl+c
         uePlLe/KeTWMGAwxN8hditsbScy+WnI7PO9RxJKgUy0UfK4bsdw1MNtpNHRkMJYFBm9q
         P0vlEjW/f37/HJjpHNqUfQNgbMbvNGpAnNwAzztcS/NmzUy/Uu4nJyEmmUhl+kas44Ho
         mBeCqMu4eyrLDmNBLzPLEBxAhnLsuvjgu2B5ydeZzc5Fx70cw3ZgPRNgM8FRJByJ7WLu
         pn8ZvA114zQni/8VEr+dOWge5fF7IUCprd30wHHenNT/AtqycKr8gxmWym5vfu8e5n0i
         RGvg==
X-Forwarded-Encrypted: i=1; AL+hErGXv9ZNKoRNuqa/jglJrMUZwpEU2woJz06/yAhiXbVAm2JHU9WdVa7DdVHkzsYj2qjpiW252zOb8DZEJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JZuFPWj4onahBXf5Qov42DqDeSlqhycul9WOb+0uX5BjnzDc+
	5e/S9CCa/uwIYOFgnm+HuiQ6dLD9OXGeCS/c8MvXFzKfLYmG5vahbVOkQpTZBVApiktf/qid6wt
	G63qxUVKOT2cnqe/GwrwmuKA/YpvJRys=
X-Gm-Gg: AZFdTZde/DE1ToOb7IsTfcUAaJgPcNhMhiCw19TCTCY6nKC4weAUstpQebtlrjW5lwJ
	fwn3bIDzix/enCpvXwzBN5WvUAY2gVigYBf9kMuLiryvdrR5OOZpdrTfXCZS8RCfxkzSzVyVxDx
	Uo75d/1pLKlv/aZ4CrKxZgbL6mGCt56jw7mSIzOtMpuX2kXfbsIT57M+FiVlqdSLxSvaL5Wg2hD
	C9bZyW8PW9KIf8BkW8epNg9RsuPQv5hd/hDTciTjFwSetUWPlnQuG11Qc2Gj3uvkaPSAjInKXLJ
	L3/RHYH/0KP6aHl3+79M6XV9oQE84mQsMDZbvGJjajuo9ILVIJrbxG/kU9CYD3VTF5YXVlermLC
	gea5Rqfg3EgOv1bNUDiJemZ8zV6RgjWcmLWNHox0ebJNAOJsMqS0D81MoEKXYdmFoFbyfsiBiUM
	FdrYV/udk6uOK1XJPphPCvoqmpIjyPatvY4l8a9V9IPk/2xpDnVJj3bvUpAgMFP0izQD8QquCva
	aoMuzL7BqL8xiqZKkL1OWGjrkTNoneXjZp6pWWnggAzgSI7IUjTw3ju6OeQ+w==
X-Received: by 2002:a05:690c:a402:20b0:8b5:6e9:2183 with SMTP id
 00721157ae682-8b506e9277emr1851467b3.7.1794996450036; Wed, 18 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095314.42769-1-patelshivani2283@gmail.com>
In-Reply-To: <20261118095314.42769-1-patelshivani2283@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Nov 2026 12:06:53 +0200
X-Gm-Features: Aa3M54qZ8hkps0LsViVJo_s7XZ7AAjtX2_rzeA2MmsfOWg5FnTjwadGRxEgW-j8
Message-ID: <CAHp75VcPRtBpFmrd0sRD3HHPd3dMgwATzUxTyfkBPkuSh_xABg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:53=E2=80=AFAM Shivani Patel
<patelshivani2283@gmail.com> wrote:
>
> atomisp_subdev.h contains duplicate declarations of
> atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
> comments. Both declare the exact same function with broken formatting
> (lines ending with open parenthesis, leading spaces, and awkward line
> breaks).
>
> Furthermore, the definition in atomisp_subdev.c uses the same broken
> formatting with leading spaces and a line ending with an open
> parenthesis.
>
> Remove the duplicate declaration in atomisp_subdev.h, place the return
> type on its own line, and shorten the parameter name to 'fmt' so that the
> prototype and definition adhere to the 80-character line limit and
> Linux coding style.

...

> +const struct atomisp_in_fmt_conv *
> +atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt=
)

Can't we take one more step and drop the duplicate 'atomisp' in the
name? The quick suggestion (you can try find a better one) for the
name is atomisp_find_in_fmt_conv_by_enum() and also rename
atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code().

Also drop stale declaration for atomisp_find_in_fmt_conv_compressed().

Altogether, make a series of the three patches:
- drop duplicate / unused declarations of atomisp_find_in_fmt_conv*() names=
pace
- rename atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code()
- this patch that renames atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
and fixes formatting

Don't forget to add a cover letter.

--=20
With Best Regards,
Andy Shevchenko
