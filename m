Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794466813;
	b=GsoYwClClIVvYOrVvU/+AI1LnCT1qBcODm6B/ENmz58zscVHTDbHxr4QgBTqUgj3Vk7G
	 Uua2APdtVpUExiCPMOzK5RvCNRuiytrxYSAy/ZACILRk6my4gqWdAayQ0u/kvqL25EIyo
	 gP5+/dsuRvOt2BtaSsLphbWajnODfbEIrmZuZXDB7s8jO+O3zFeNnf4mC0YcAhHHOawSe
	 awQl168OTQRRZ9S+r0N6VNhM1PqnV5ayFXWKtLgGFZFx9ymZKPaYFTRz+t24H16KsfHo2
	 raFBaCZPm6qvvXEjPnssGhXjcHPD7Am/8HBsB561mQaiXCweJ1g9AQg77QNOTm3FWiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
	b=tMe2fubFOe5gjIe+HiLauGj1bzrw+XeIeW3pymfgfgFa8c9kSKBVfNaXv3JQ+UyPz59i
	 Kvxn6SjdQCcPxhn6wQ6DL8jKS9sTF8Wvph9Ll3CvkdlZI/H+W1x9bB6RGDGhkq1O/Sk2N
	 dSohGTwAnd0yGljcs37GWoWYeqlJY/8c5LJ0vjWd28n3RXmyYUyh6xHRaCpeEb8za/zQy
	 QYdZvEarOI5VVbJD5X64MeMiA2euckVLLSg3y/gwe3wojbQpLA4X+BrscMQu6aasIoJKU
	 37u6jb3VZaXQKm0DJoDlS3+iEGzXZQ400IYxyacs48LEtEFUhWD1iiZWdyug8xNrybg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbqhU+I6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D7606A330
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbqhU+I6
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso1825825d50.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 23:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466812; cv=none;
        d=google.com; s=arc-20260327;
        b=EysSpB75tSryGvXWYd5cpPgevUrhb8FP6eJbkmcrfxx5jZxVwsvpU/pT/oWjDNblBi
         M3ZJjkdPKGhU26oXMfwi0ze5CAbdkB6T30izBrn7BEja0hWWY6qQ4zirwwm4II9bj+z4
         7Y8i7lsHJg90RbAD4pzdSvyB+Kwuw2YB8cB8J+B1MzAy0WO5j0Y2MBUxm70oJILAYQyg
         z0c7oqSqss4nzxXxXxC9opBKv6OTXy/ZjFiyhgJ4nuhWzB7t5JapIgiDfUObAe6we+sb
         vp7mem2DCoF2tNOBZaU7ZG5TzaXPaLAhREsZVTaHQvcewBU6xaLNIe9XFHNwr+e3Z0VY
         h42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        fh=j2YxIMV/8jrACs4ZpQteCL40Yh7YaleK2/mzg2nmm7Q=;
        b=DIH/eKJBt8KWlQ/7F+OVrmyxcQ2/tBGI8uXINgzhWjt2ER6G74NyCpi/GopvDrf6It
         V5o392PQA+c2Ok15NJiMrLeBMf14tOcnT0LeHi3ctkdjsp35fmpRPqAu3iuRcCCzp6i4
         ZRMJ/nhnSrS5oQwS8fZaMr2T76E6J9Q4+0qggObCgTur1R0KGwOnqAp7KRb2wotBrku7
         OvQHwFJyUMYr5yqAmNgZXrp1AEUGA5UTbdolSTthOzgr/LMwqdO1+hb4Oro9yE70fBbX
         pM/oEADvnah14XWYZnkFdmzXZDqiBHBA4e99+dP9HYgin4dQ6zLwoA1duUoKVwPia2Am
         pdaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466812; x=1795071612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=sbqhU+I61actH1FXlkQKkXifXZndh7qlvAJgUROUb48LOjnnFZ68Bf64wHDby1xifu
         N7jHViteGzXmM1S5VGfeMd4tFIVjdpInLWcLOIzN1wLEWa6X8eguIWRQQAAkDOV6htHc
         WTziKAfQCxxoJgN34ca/DDAg5PPf1SwkqgRb8B9Krv8QCyAMiMInrkh9lQEuu7Pk8+CG
         DKhgC3W8h9YzgPJFrNePk3vbklWXh04CNB94EyEUQYyb6cC7FjZIHjyRlszqnpgOhulG
         3rDwsWD96esH5sKtXWaNWeNxra+ErkSPRp8yQwGnNeYeOJgYvG+qf3oZ2fYprn76sGk/
         xtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466812; x=1795071612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4eCs+pePZSsNTSLB3l0XzT1ZyhQXo8bkW+JvuOJYlE=;
        b=z4XnCkXdZcD7vvlek3PaPRlju4jKQcOB4xG8vQ4aYbulVEouWEZg7uMtjMCeHICfv9
         P3ykd14clWGJKSZD9aMo7wQu+DWJpB3MARubx7jZqqJE+9Hw4GnVoMKh7fGWUFBHAzKi
         2QIRWGgTvGPYqXYaYum6e8FxPx/8t9IlmBA6AXR9k11BWn8Mdhl1wCI45ZZt7kmmjdNr
         qOvk7I5sG2IeIcjl9IOCwYqokS4T0SiEcTsnaJp9vf+5FOekXymHqM/N2yE8sYHGI01X
         WlX55RXy5xdBhZzCE2SL7DFG23iFZ9UGhqlFqG9VAYrfyCWuSAfc5LqWyqc05jjBMflb
         Gs8g==
X-Forwarded-Encrypted: i=1; AL+hErHZ911egKIN6CB0tsmr4V67FGxCATTGMZot83pYJEMZytWRMlEyyis2x/Cut+bKLxB0/Yy4ZqYDKFdpXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5u3rb+OBCwVdOcoW5xkWuu65z0ja/JI3qN67Ro2v3y3eV0Vlz
	+j9DwGnKOVtqBVhw0CVZNmn7arChDTotWgIyfIF18mkofzh7rHh7btozJjXFfQCG2v6O9eYSyy0
	CpJxfyLs8p0Gztgt2Mxn0AeSQh3g28Zg=
X-Gm-Gg: AYBFou0jyRDVAoTaqKGoE08LdLpGqugH7SRWzAcD34c6N5pixy9djETCRdWSPSE94c1
	NNpdnrBh4ab+mSKj7ySyEgaNa48vR0DC3GnAKEeeV3WWduGIlNiThdI/j1rFekS3JO8C7sWMy+b
	AWzqoeTRq5X4KZPXjvbJbkWZOFsmdP6g185PT3Va6JtvGW13oGvCQerZC7OT3AeQ4sWYuFDvfDP
	yw/reLUHPyXqu2r0FD8gab0Mse71XSQrrUByaBW0mujdUgnyvuAjlNAq+thYEu681JozmjJEDVx
	ImBNfDhoyJhsJ2jRzwrsKwLDdZ5V3vME2XsFYZ5WzfYuW9+hCV6weKDcqFAlkOefw5ysUJZ3NEX
	fstWzHtkZY2GhHcuRjisiTTJbSRcj0v/4fgjulXs6ONbNWAEvGYYeNxf9xhuwMPx3OHQJmfN7WN
	/+MoTeXB2yGZFXAE2HiyGq5TesRn0u44bV2J0RMmhmpkC0PBMJZcsLcdUMtMI3/Y5q9tEiZMzpQ
	AM/xvFi1vGtVjGUj3BeFp7IowAFDgk/jx4qvhvtkVxzqxBhzbrUIlzIWSzUHg==
X-Received: by 2002:a05:690c:e016:10b0:8b3:2d9f:e5e4 with SMTP id
 00721157ae682-8b3a808cf11mr23524727b3.23.1794466812390; Wed, 11 Nov 2026
 23:00:12 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112011025.101375-1-hmjm081106@gmail.com>
In-Reply-To: <20261112011025.101375-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Nov 2026 08:59:35 +0200
X-Gm-Features: AclHuK-mtvH5nJYZEQDl4p7LrxPm2ImC-KMW5NnR0JKKS7aflF6_FvAqZyCHuxg
Message-ID: <CAHp75VcFZB7Rz0cs2iHqzRoCaGKWS8Q2Mt2MkgTc-xbKSg+S-Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unneeded return
 statements in irq.c
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:10=E2=80=AFAM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions, along
> with the blank lines before them. They have no effect and checkpatch.pl
> warns about them:
>
>   WARNING: void function return statements are not generally useful

Only in a single file in the whole driver?


--=20
With Best Regards,
Andy Shevchenko
