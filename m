Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156297;
	b=0ayb1cqYxqnDxjBgU7qbD+rGy/MJy6TpET1taV5tsqDmF5hX8tBjwHm5ppHt1zaj4AIs
	 DcZ1B2FlDkiTHPgZtDNi6tQIzVaZJLchyDOHquHFeaBa4gGHUbGmkXHVBXvvdNYuKjVi7
	 poZdCCOuTm9m86r2jcwvZhRwsHn7dTjzklagi2JJkVRY1LZcohsUEam+p9RUGt/lEIOHF
	 czDz05RdFQWR8WPBDXqaXtzm0PShSJQGI28bH8WmLvCKywY5owMSsKVXGhnOekYFuoyGn
	 b2Q4YAn3+zDAvCQtStnJJ8U6WSwuI40yTK3gqAjOCNEOcX60lCi9nwfd7hRvOQhBHhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
	b=YWZwYq4aFeTD2BjmcCQpp27FayWAx+wBPBgEwYH3XNxvwJrjjnrP/OLPCCjKlSRYiCJD
	 hZzAoplNev+Al30NBF8ahVL46JOxukjM5SJoI/D93RQ1U9lL6kP0ID0WoteNjW+728O/V
	 9rFJxcLkDmEAv0lL8qH1R073XBIZYav2yExPRVexHmbbYhZgT5Ux3v+j7ZtmVSbCwdvmW
	 1UeJIbqbnb6SiLVuVbEDychMKU8LKwIKoA0Ak5FaU3K+9Lc6OH0S3iiTtvab8j2MBaTEK
	 bBPFWDLno+yVMCD04WZbPIKMgDJHu4jA0Bacju9xDmYQJav47ej+ZW/Sv48SnysQfIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGVc3mTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B3606A321
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGVc3mTx
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so349218eec.0
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 08:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156296; cv=none;
        d=google.com; s=arc-20260327;
        b=JZEeGhmzSbxCZ9cyMuCLiC1O4dB+tgXR0CebZZpIg0vAC9oVq+Z9W2HXANOY7ydPnV
         kemLY5OCRBTFihQhvjIJIXciNQXLtgyP+1LQZf7iMc2bwqBAnQaUsSRCo3Dp+91YUlKr
         Oyt1L5nS0LNioUxM+rveNnm1+ywRkmEn1uo3vp+o/g9FPusW3ueIFL5j8QuGYYdOTa0m
         MC0v9QvGcXLm+wWsGzi5AiGYiGwK0kjig7anDRPFw7NUfFMuBilKNzSxIpPSDl54bcxF
         sFHezHhnLjP+GZoW+p/hE4JApy2b5L+nlKWWUl+Z+oYSYJQVKWrH/ClHVlPvfVTnbB1h
         alKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        fh=XNIwmyXrn+eE0DdR7D6TRhjQ1D/ErwhkKGxdFdMhEqY=;
        b=WMQnwhzI2Gko5FSICN4l0JyAqNUg7bFJTyG0+zP6E5Hz9jNOh3UPHuAP/JnKzFnvhD
         yQLf1ievPDPWXLayA9WOvIGZ8W8UQed29i9KnKCEFV93JMuyXqPbFrs0BuC4UVGXENgv
         YEz9KLAfdSqE1xFnghA7235Umw2DP4ZdMAelJvGArIxwRx7DYaJoX8Anbf0k9nkd25Ur
         K00DhZRS+f45P9V9YxuYA76lJfepTrndBHiM+Yer5ZPIscAnaaEua58rAmjrfWOJKWmv
         pNfUcHk4dgpf/IkjjcuY2/dKJOPiZc5VQ6q7A/gXp0u0G2nqMWEJx6udcSABdJuO5W6B
         e84Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156296; x=1794761096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        b=dGVc3mTxzs5TaHTrjDBddOEhDnFHztDcNjd73h4P55tQ63wPMiESkNoB9Lde3OzaV7
         iUAOVUlFh1sfIJ+qrGFrYhwQghANfLjzIySMTWAeE9pSGBdnHcsCiibMDBufFLZEWOvp
         jW2F4JFkvCply8e246LWG0adkARKQPvY+8ppfwSC8YJBGqAO9p8FYkvaK1yQhnidXc/0
         O22ewF6CvQzzCCVoViTM6fbwkoeJzylYTlxrlNgSYXQ3/sMn6a02UZuV5SP+WIVLorxq
         dxVuA2f6lbJXMTpX1tfVmL/XjQ4Qx2IvHPYQXH/mP47X/5mKLrm4srzDVF/TOTUE42nm
         vrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156296; x=1794761096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        b=ufi3WFoyLcoutOXMh+ntWVgzZHuElf0BswTN/HxFEIHS4ptgfwSfTUPn4c6yKctXHo
         wl1E1TEtosajsd7EIKr+vwjIyKFdMeY7Q9FcAXKfh0OyctUFl2wfyvYV5fDn0Wc3uws/
         Xdy9+ScGJBHxjRx04EOS8o+IzQRdQMj3oCfS9OC7NUcKrkr9L85FU+NJS+jgKcbYOQLw
         kY0ycuVWqsyCIGH4FNRkA0TMon625YcPE2TFBguBh+ooBqvKqSvEM6vsF9OW605CQlUU
         3dJOstDvPP1TvdiH/1FpLWUzIevz8Sz1F8udCZfaO7hd4/+pvfwyrUVLjiiZB1Gb7rnc
         eDWg==
X-Forwarded-Encrypted: i=1; AL+hErFt8cD0z5CQHlNQnj6Q6MnbE1FQIEdORBxPifI6xJaBWcK41ncg/GhWuDcFpohwOYh2nyh2ixYoRELYlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ywa+4PnMglq7teVlTYhO/LIihlFo+tRriAQRE6wKzUiUwfjSF
	0Cwk58oGLOfj1S0zHUlMpBRCZg8LiIPZsQ0wN8vWEZYV97kENyCrK20Kj32R1E51GDR+lIWfua8
	T+MhP3CFtZbM2Ug9oXvXlt2ueyjYbkAE=
X-Gm-Gg: AYBFou2h1q16i9n4BaIOW3Cvs7Gar9kbmEBwpoTAy5bO18SQWLgC0xQ1MkrsBqrIWeP
	Ez5OvnyMV9OuSwGlShoiGO+Tp4NOUL6eTIMbFZLHxvbjqdNd1PCFlYuHWEzZTtsNQ/IwGCI3Z9B
	kdjpBDoFhpIxYvTw/yiNziNp5qrw3Xsz6qak5lMRayPxA4c626bg9dZvSVR9MPLhE4r5fAbNp1V
	J8gL80ZvupTls4dTiAC+1lfowwhVUjgQwBCErKnnDPV6+Yk7nQdzKniUWLbFPYRJ03SSjiUWZeF
	wsrnpJ+8qycA8A1fIXsfwYutEvmYel4DogD6aZkEtz2rgDNEw+96Pgg+XuoucEHhaSLC2SDXmI6
	YKXMqh+ahZnpbnUL56AsJ4uiFctpRyNWi7fGgVYirxZYhnBmeyrgjLfyYgnmtNQu72pybI/lamM
	Sl/IUO0NG2UgkbCTG3P6qABVz8Ze4=
X-Received: by 2002:a05:7301:da8b:b0:36e:a321:5353 with SMTP id
 5a478bee46e88-372543bbbf7mr4144537eec.2.1794156295714; Sun, 08 Nov 2026
 08:44:55 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-redrat3-input-uaf-v1-1-b882e43d9803@gmail.com> <avCBzjIenoErsXhh@extorris.mess.org>
In-Reply-To: <avCBzjIenoErsXhh@extorris.mess.org>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sun, 8 Nov 2026 13:44:44 -0300
X-Gm-Features: AclHuK9OUQ0JURmPmwyzwr6q9AbQnZBaFuj_eL060l-9qRbVh720idxJ-TbkSgw
Message-ID: <CAOCBhwFruAbWMWsDomwdO13xD9oQwtLsfmCEqtJfwEqedadGBA@mail.gmail.com>
Subject: Re: [PATCH] media: rc: redrat3: fix use-after-free of input device
 name/phys strings
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+aec1962419768c5caf88@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

You're right, I apologize for the incorrect analysis.

rc_unregister_device() calls input_unregister_device() before
redrat3_delete() frees the struct, so EVIOCGNAME cannot reach
the freed name/phys strings via the disconnect path.

Thank you for pointing to af452b9e01331b =E2=80=94 I should have checked
the probe error path more carefully.

Regards,
Joas


Em dom., 8 de nov. de 2026 =C3=A0s 11:06, Sean Young <sean@mess.org> escrev=
eu:
>
> On Wed, Nov 04, 2026 at 09:03:01PM +0000, Joas Antonio dos Santos via B4 =
Relay wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > redrat3_init_rc_dev() sets rc->device_name and rc->input_phys to point
> > at the name[] and phys[] arrays embedded in struct redrat3_dev.
> > rc_prepare_rx_device() then copies these pointers into input_dev->name
> > and input_dev->phys without duplicating the strings.
> >
> > When redrat3_dev_disconnect() runs, it calls redrat3_delete() which
> > kfrees the redrat3_dev struct, freeing the embedded name and phys
> > arrays.  If an evdev client still holds the input device open, a
> > subsequent EVIOCGNAME or EVIOCGPHYS ioctl calls str_to_user() which
> > reads the freed string via strlen(), triggering a KASAN
> > slab-use-after-free on the freed kmalloc-2k object.
>
> This is nonsense. rc_unregister_device() calls input_unregister_device()
> so EVIOCGNAME will not work any more.
>
> My guess this syzbot issue is resolved by commit
> af452b9e01331b5338a1e5141624f17607239207 and this is the error path in pr=
obe,
> not disconnect..
>
>
> Sean
>
> >
> > Fix by allocating the name and phys strings with devm_kasprintf() and
> > devm_kzalloc() respectively, tied to the USB interface device lifetime.
> > This ensures the strings outlive the input device, since the USB
> > interface device (and its devres) is not released until all references
> > to it are dropped.
> >
> > Found by LLM-assisted code review of syzbot-reported crash patterns.
> >
> > Reported-by: syzbot+aec1962419768c5caf88@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Daec1962419768c5caf88
> > Fixes: 2154be651bfd ("[media] redrat3: new driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > ---
> > redrat3_init_rc_dev() stores pointers to the name[] and phys[] arrays
> > embedded in struct redrat3_dev into rc->device_name and rc->input_phys.
> > These are copied into input_dev->name/phys without duplication.
> >
> > When the device disconnects, kfree(rr3) frees the strings while evdev
> > may still hold the input device open.  A subsequent EVIOCGNAME ioctl
> > dereferences the freed string via str_to_user() -> strlen(), triggering
> > a KASAN slab-use-after-free.
> >
> > syzbot link: https://syzkaller.appspot.com/bug?extid=3Daec1962419768c5c=
af88
> > ---
> >  drivers/media/rc/redrat3.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> > index 3e82b5e66..d9e37ede2 100644
> > --- a/drivers/media/rc/redrat3.c
> > +++ b/drivers/media/rc/redrat3.c
> > @@ -229,8 +229,8 @@ struct redrat3_dev {
> >
> >       u32 carrier;
> >
> > -     char name[64];
> > -     char phys[64];
> > +     char *name;
> > +     char *phys;
> >  };
> >
> >  static void redrat3_dump_fw_error(struct redrat3_dev *rr3, int code)
> > @@ -943,11 +943,16 @@ static struct rc_dev *redrat3_init_rc_dev(struct =
redrat3_dev *rr3)
> >       if (!rc)
> >               return NULL;
> >
> > -     snprintf(rr3->name, sizeof(rr3->name),
> > -              "RedRat3%s Infrared Remote Transceiver",
> > -              prod =3D=3D USB_RR3IIUSB_PRODUCT_ID ? "-II" : "");
> > +     rr3->name =3D devm_kasprintf(rr3->dev, GFP_KERNEL,
> > +                                "RedRat3%s Infrared Remote Transceiver=
",
> > +                                prod =3D=3D USB_RR3IIUSB_PRODUCT_ID ? =
"-II" : "");
> > +     if (!rr3->name)
> > +             goto out;
> >
> > -     usb_make_path(rr3->udev, rr3->phys, sizeof(rr3->phys));
> > +     rr3->phys =3D devm_kzalloc(rr3->dev, 64, GFP_KERNEL);
> > +     if (!rr3->phys)
> > +             goto out;
> > +     usb_make_path(rr3->udev, rr3->phys, 64);
> >
> >       rc->device_name =3D rr3->name;
> >       rc->input_phys =3D rr3->phys;
> >
> > ---
> > base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> > change-id: 20261104-redrat3-input-uaf-b6d3789e63c9
> >
> > Best regards,
> > --
> > Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> >



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
