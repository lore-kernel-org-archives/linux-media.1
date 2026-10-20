Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478600;
	b=gCEYaSYnQTF425NpRcpfOleyuTwpwGgbPqYRHDK5G7xLYlv05jIc2TJhVSxqGI6aq8Qy
	 BcmvfArTiSuDDadgXUv6Q7s8JHqUk6ZX0K6YKpMb4ezxiQG9kcX+DCWqr1JXYSFgnB5H/
	 tpdy9FXYOtdJ4YgbJPtM9xc+YcHFtsFAhkiJ4/A0iobcV0Hx0zoJ7rQEH26Zlxh7fRgQZ
	 yDFBsbsRVOq9MeuBZUpbUgONqOJ1yQhQ28EfRzxYor5mZ0RDN+7GMcwRgogw89Nt7d/cH
	 htqnOdK4IecNApZAWUUcvTgr2FSetqLLYDCBuHgsqXHarbapahlYH0Hq4HIlYtWGg8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
	b=mwvnX6kQQqhWHsxvZ6BSCJzZlJiu2o0z3vV/116b3LOVSwaQ1g+frzMDTpwiemNL8WLa
	 i72R/SjfOGzCHY/1XwLKsiPjDBcAaaIgQrZy0Sifbah6jF5RRL5dzLK2wdxdLdTbZgKz4
	 QJb5i++WKFvVS+IakujcdrFcdRyiHl5d311MCId77ePwRgDj8iXFfTQCRbrhhNl3Em9Fs
	 DWtov7qXm73iLFAxeXHdrjVoBczZyrvQ2GVudnoGEawLURTJphn9BGtHzkBSq8FuSEmES
	 a7GSeA0O18WnFpojUwnYzKBfqoatbros7TF497ELeLRA7ap1MeRJryqLSkNBc3pCpYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DL0XNOAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908C606A327
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2908C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DL0XNOAs
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3827035a12.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478599; cv=none;
        d=google.com; s=arc-20260327;
        b=DRm5MDbIo9I+YpXVqbJekn8z1Ld8lOxz6dylQrKaZNmFj21fGcewDcYOW2W2smjtPH
         Qr3DNOCtKrx/Ntd0GPfMTrBEC79wMS6Z5ZJ2oG29+Mi9StN0JJhTVyzjSY9XMTwzk5FM
         o8pDa/8k6uciuOsZAaM0S+yRplkOOA3wglScRRQJaKZr30vOtj/+tQqpK878I7A1cFpF
         GcQHQ5oBWUrHZbke0ovIHtzILaSE5odaA8O8pyA77R7mPh2tEmCwNwgrX4+fK1OvxEKZ
         ryKPiv2eiT2pATOWcNNkbKVpZCI4sny6UWJtyxDU4868jmwMR5X8SHZRMeDF5Sy/aI6p
         FpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        fh=sMRrmiGKnqkH+9nYMyVO+YyAn+5JI+LguWwaOjOHvzE=;
        b=b/eFkXSIEC4oRe9PNljhONrEdUlqMLEk7rw1PeCr9oS8EfO6stxumIyknLnhJa7l5B
         9rmYmmOrOOAw7qndoi3xiXL6QlJMMSRiLYj2M5U4PP7w2EXdKGjuL4zC9d1nx+Fnoaph
         HrTtF26wnK+JPuJML5eMZo8ZtWbHvoQUKkGzXGPE3nYiPOGP1X5lmzFsSoM451ikAS+x
         OCeYIBDZLayQt79qcXW1mEdkHygPco1zgs9Zo3luve4IVbMpFicKBIu2iudQHvRRJFk5
         k9uFTw0L38+XN6nkc+v4s9KnUAzpxKf65bQKsdvZu7OgsZhDbiz2q6jyCmlUWp0wCIy3
         k8iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478598; x=1793083398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        b=DL0XNOAsWGfOEzp83z0k6Pps6p636rBuGYVs4tvPxFQ+DvD0cEQJIXHZJqfa5cBX/C
         V1/01WAF5Vpd6NbpQvva7T5p91yQEMyZ1wJdDs9hNJrbDmdVv8a9TcTmv/UfQ+5KYuYg
         3unvL2AYZ2x6G+oMKXpHhK4TQUknywAvJ63wQtVFys087f3IRRyBC5Lhs513kcYUO83x
         FAfIo3MTDUBKdbHraVHzDEVK9YCVlHsYXdXJHz8MIUSHlLoi4UCjLIOAnARJNwhi45FC
         NTLg5GHAz8uudYX+PQ5FuUTy6TsqiFgYT2P5a9uRSQH7ShY2JePGXkI557aRsCeXrkzp
         N6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478598; x=1793083398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxVjMRsgCRAMcy5JOH8aX86oUFkOqGoXGoe01HrRyE8=;
        b=w2fLv02Dyi43pKpXA/W2GgcepdqQCtt1zlIb2HMuzQHPqUyM6oh/WJbmcK4DCEqlXa
         3p+33GF/PxIQrcGu9OhUYcH7/cWbfuj6jo3EoiAe64IAw7mfkW65PnyOPp9P/yHBn4uf
         PcDHI+G+Jz0zFWyqDYmvQliJ2dsMp20AFKWuqt7dpMJ7tZwThBig6EW3gSqBzWW7Kn1T
         ceKy59Vb9D+BPQytrzzTE+4BC1diizc39HUZ5xKEmVJv+kvrWbjHohe+zKpY5H4eISFO
         DZ0xxNblhzvbtdBcQCRsRyx1lue/WcE8S9tsVkrtDFg6RS1iVfkPUEkJPlDoakzNBs2L
         iVMg==
X-Forwarded-Encrypted: i=1; AKwUvBxwlse7dJStxLA2EnRfrhWma/6enOx6RM/3mRjn+I4WHIhz859swbQ+Sdd5B2NNipBhVunpWIsLq33B3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYILbUqHyJQxtuIo2KAQ/k+GGKtfvdbsJgTSWuA8QZiXGxF/ym9Z
	CXZKh3e1UDKtU+9rhZJGQ1mJFYwho33U9b7tZJLvqT5r9xMQZJYgM8+jVzCgZnMvCTMacY0FA2B
	+A1gybABmw0BUkNAf1hGBJwPF2QbRnbQ=
X-Gm-Gg: AYBFou2ssI7Wbe15BRdohxh00znu+Wg1+kzLWfIWNdwM8HfLbtwwVIIsIQdIbipJKwm
	7vIAQ8F2Zcc1M1Br9lBl7z5DLmnUs29BdVi8IfPfkPilKqx86YVgTXHYdOi38O9Oa+fizdGpgZD
	qMNFmdRL5bURMwOC7WO/lA2FXgauOkGd1oGb7/1L5JaSMLB3CJH0uWunrgISBbyaeY64ecrcX0o
	uu1z9k0y3/4NKJjzKO/5kIL265i85Lo/LcfFFAdGFteHREZa1la802k6mTUFJZgBRwGjKwF2kGy
	iGQD8kmL9AmNrH1Ve0gTWEuWdGVP0FYYuQLrXUSvdkC8myLtt/0yaCVqxTiorWVZLjbGKoG80ur
	OB8niLJTI2oWrkhpgq9qBC89aX+0ETvxYwJwvc1KXCIeMIpvuZIfOaxXvsm3DAk44PWwGuUNkCp
	HE3qHC0IdUsJD/BGmYcswDG6fpUtu2vC/yIRQ6a20K
X-Received: by 2002:a17:907:9614:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c419ed3674emr896695466b.30.1792478598514; Mon, 19 Oct 2026
 23:43:18 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-3-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:42:42 +0300
X-Gm-Features: AclHuK_h7thPbK43T1nxg6VzE934IoCX4uM7f6mvAqFm3KhDuLo-7j__7w9G65c
Message-ID: <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
> Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
> reports the chip id of the OV5675 and takes its register settings, but
> its color filter array is a complex 4x4 RGB-IR one.
>
> The silicon is likely the same as the one of the OVTI5675, so it still
> has some features (binned mode, hardware defective pixel concealment)
> that assume the classic 2x2 GRBG Bayer array and thus produce meaningless
> output with the RGB-IR array. Disable them for OVTI5678.

Should be marked as RFC...

> NOTE: This patch cannot be upstreamed as there is no way to properly
> describe the color filter array layout of the OVTI5678. The color format
> is a placeholder at this point.

...and this paragraph should go to the comment block, ...

>
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
> ---

...somewhere here.

>  drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 131 insertions(+), 18 deletions(-)

...

> +#include <linux/mod_devicetable.h>

Not in a new code. Now it's provided by i2c.h. We probably need to add
an ACPI ID header to it.

...

>  {
>         struct ov5675 *ov5675 =3D to_ov5675(sd);
> +       const struct ov5675_mode *modes;
> +       unsigned int num_modes;
> +
> +       modes =3D ov5675_get_modes(ov5675, &num_modes);
>
>         mutex_lock(&ov5675->mutex);
> -       ov5675_update_pad_format(&supported_modes[0],
> +       ov5675_update_pad_format(ov5675, &modes[0],

&modes[0] --> modes
in this case

>                                  v4l2_subdev_state_get_format(fh->state, =
0));

...

> +       ov5675->variant =3D device_get_match_data(ov5675->dev);
> +       if (!ov5675->variant)
> +               ov5675->variant =3D &ov5675_variant_bayer;

With driver_data it makes no sense to support driver_override.
Better to return -ENODATA instead of pinning some defaults.

...

>  static const struct of_device_id ov5675_of_match[] =3D {
> -       { .compatible =3D "ovti,ov5675", },
> +       { .compatible =3D "ovti,ov5675", .data =3D &ov5675_variant_bayer =
},
>         { /* sentinel */ },

At some point the trailing comma should be dropped.

>  };

--=20
With Best Regards,
Andy Shevchenko
