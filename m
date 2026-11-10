Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314236;
	b=375/VGseGVdpd8f6bpu/guw8KXSzIOQCLDWZKh42QET9oysCGnugbVQYmWog2zjSqcND
	 zkNtXtto4o2O6FewMqg4StaT/4Gvmoh+jNQcAL70/JYZGALBPgxjppLt5JiOwMSbtDy44
	 OfhYDjMwWrWtKR+d5JehkPwfUZ85G4N9+AS+24Snw6o3vIQerDgZTXdYE/rTN4WCjcx4V
	 eksn7GfJTWppAOB1RK0FtMPFZ6/7fI+mh25QrrvO9+VgQcVrduo/7xi0qlraNJjn59LAD
	 gtuJTwmcQEivYCetJlT+tEnGQBFleKkcxdmSTvLwIv5FFyilUnkIe5ZLCBzktZGiewQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
	b=nEt1YrsXqPfS5LAlpUsBkE+j//CoY0NNvglulD+Dsh6QRY5MmjhLDkCC9yAWUnbzVn86
	 qjWFx1k0v2lzqKP7QF+niVvmho4cQaqKC1j5wRF6rkNt4rsdcvMSLfjWchfGcuz7gm+g/
	 fT5/sbtK3thoZWyX2XzZB3L5M1XZYEWMYA+8xNYusaMIAtXAD1g10oh1RlPAGObUH+K+1
	 VLYRA+jYF1G4uxAsBmxvGaO5ngt2/CZCB6QFv00zhYTdA/i6cpLEgIYan7MHsynmItcUb
	 SaEAbAlS0eT+LgqbSxGzJ97D62wEq4b0ytbQYFZg1DAa7r56Z6dvrEjmXtxG6HygHig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95966606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 12:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95966606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c49c32650adso100286966b.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 04:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314234; cv=none;
        d=google.com; s=arc-20260327;
        b=NctFh6regAZwqGhSo7WktZy8UiiRVtK9BWs1KvvkHZk//scZxgi1MI+Xl1tIO6QKzb
         qTRcZqcoNxMrfmYGzFmbfhWLf0ZZWH6SPJd6kdOZWZ3y6O/3L6Be9FaJCLlzidZt3CD6
         cFu36B485pEgsORnmqTPmz20+VceSrQLWjTKW/kaoOvejM6ye2XKq6e5j6G3H2Qp1V4r
         hFnQXVI7YXor1Murl6TFWbu5L090x1rVGpQtYoD82KsLpG9aBDUGI4aFP3DMjzfv9eYE
         po4wZiCLePBVVguBO0nPhZop/huzULR93BJpqnSMeP/u6ZE3OdSvw/m4amfuaFAwKE4U
         oJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        fh=L0mcTKM7qiiAPVgThxySYaV5nqK6RMcViTiwVJ/UOs8=;
        b=R8GCPNktx3oWfk7OMSm+0KMHjxEWe5cVHjQ0e26nIfzMbI8zV8DSQqRm3S2rZjT61G
         BUbU0grBeXET0eWemibR8s6mK859XyoWt0CSbFe9NhlkrIQHXvzDN8EAKxL9huQdGpMN
         rAqp5pURyXnun9YrU3H+ybU3gxQlpyNkzJ6OukTgnQslyjAsVQtZhFYMRyLChfI21Cma
         X+uZaOG1dm+v3/671ZjLGEZO2evHfUICHvhT4LHr5Il3hgpt7I4mcvw1w7phFPuJmyuG
         cLEnEcbaq8aXLPkDgwViE9Rx95+LEXMnCK48W0/vIsS/5yy75JS9V6dq1cr+zETeN5JJ
         N51A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314234; x=1794919034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=QaxtLhMLzna2DqFnl8rF0kzUuQU4IXhwXr/jgqsxFsK029Wl0NXvyNa3kBQTnhNlew
         meP8pvjnlMfYi4qcE8fCHtuwCV33S83R56oo8Dz5kufwGjs/nfQkCkYD+W5vAjxXYWLH
         drlGFjUqr3CrE/ddqO3eZNxUKm9z+6r15U+DwhqkKgoJUucg5+hesGYXy3t373HHvxHI
         KWKqWfbo481m0UFJzbAeQqX806D/S/Sl9lLyqUMeXCsHONVEvI9ABrEU4p3Co0Jz7YbY
         ry/8kz88NHnyvl5G159qP4/d2DX0izhVLbcZckPIuTyC411wBprFPKPDpSTE99Tg7QaD
         w+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314234; x=1794919034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=NEz/am4dX2pkOmWZzFcwBsmJ5Owu0Qb0t34tynZZeTLqRKArV91SS+bF5KrQ1XuS0p
         a4yDIFE58xK2Du8S/4yTlMSxA7mHH0cPIDx1xTU3BNgYUrHuvLiJJJktFT1ZqwrtC9/M
         vDhWEB5osFL5z/4AlMs2Aalubm7cqrmVj8Jligdc0fgtp4E/qxXr2SIQ4Teivf6jKI++
         CMRO8pIlPvRo7uBM/8X106cKKvzdO74GXQtcZVwofnrMZ+j4XlMEAMCL7kQeFAUhkppx
         bB+bJIrXpTGEIt3QS3OrcQy3Iv/mfrhPXFJOugFtgYh3veX2iOpLgYRq45VeC5DgqMP2
         0TNQ==
X-Forwarded-Encrypted: i=1; AL+hErFa7snzaugOtHr0NDZ7u+td45PvkrmdG2FrsQzf+FqAGRgXAevdDN/RMaObTAsbTePoqIki3uRZLpj0jQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cEZ47nEIeNkdm+puYLuf7wOaXAud4kZScTKPJNAsdkO1nsyCF
	gLFBGOsEzvkoy2GylKG5jeA2iaFT36uSuBGnnA22VaI7si9R5GqJjU3Nxw4svkFQ4poJ1c3oRCf
	An7zD5IiYlnlILuRJDty9POmIWb9q/50=
X-Gm-Gg: AYBFou1JjvhRJl6gH+8JJdYzEEiiIuWtS5wHDM5vzEuZzPE4sbP5P0uUi8tvIE83DLs
	X/DbZJn5F9WpZhLVkrWJLkAAHKQDsMzdE8YpiuaSZzUQJLz0jXDAfVdHCTkW3nUuMiOx5+gidwN
	1MBbTh8H2lgz8M14qpzjgzUsbJqu8O6RSW5fumRh+MDuqZ4Z8dxXTQwm/R5H3glgi3d8+ST+dgc
	UxAIrHc+mHHSpmPFxRIxj6kMyRUcOtdvKtmHpVh7Ki1GOCw0QfedIPkUTLe3iViobdHYX7ybcdG
	cMfx1cpu8Lvk8Yw0yZyTgpg6yZMkuNCoZo1YGBZeV5HMYx+1Ui2ANatf8TxroyUnxCU/ZHjdUsP
	lZBAtsBOYnT0x460DwIOLSLvLz+qIbJmU2eyvZbtY4o44XQfwtS0mWy5smOGaqOvA5L5Ht/RRWv
	mAzQHgriFcGJ7twLRkmnY=
X-Received: by 2002:a17:907:843:b0:c46:645f:cedc with SMTP id
 a640c23a62f3a-c50496efa2fmr206469866b.46.1794314233766; Tue, 10 Nov 2026
 04:37:13 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Tue, 10 Nov 2026 13:37:02 +0100
X-Gm-Features: AclHuK-L9Xy9_jIPCQDlfmK_CNn6002vmZtvxWl3lyu2iMFsjY1T0_prMJR207g
Message-ID: <CA+xk8n_CwetRPVJtQRQLehqXFJstwb-hYPDyP2ZGyPiYOXFacA@mail.gmail.com>
Subject: Re: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
To: mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org, 
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Just following up on this patch to see if anyone has had a chance to
review it or if any changes are needed.
Thanks,
Drif Abdelmalek Mohamed Said

On Sat, Oct 31, 2026 at 10:09=E2=80=AFPM Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
> video device is registered. If a later initialization step fails -past
> v4l2_device_register-,  the error path unregisters the device nodes and
> drops the initial v4l2_device reference, but previously left dev->v4l2
> pointing at the freed object.
>
> syzbot reported:
>
> BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
>                 drivers/media/v4l2-core/v4l2-device.c:78
>
> em28xx_v4l2_fini() is called later from USB disconnect. It reads
> dev->v4l2 before taking dev->lock, and on the failed-init path it owns
> no reference. The last close of the video node can therefore drop the
> final v4l2_device reference and free the object between that read and
> its use in v4l2_device_disconnect(), causing a use-after-free.
>
> Fixing this by clearing dev->v4l2 under dev->lock in the init error path
> before dropping the initial reference, and read it under dev->lock in fin=
i.
> This makes fini see NULL after a failed init, while the successful path
> continues to hold the initial reference until fini is done.
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1e71765881a6fc43185f
> Cc: stable@vger.kernel.org
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
> v2: added unlock in early return in em28xx_v4l2_fini
> v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohame=
dsaid@gmail.com/T/
>  drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..924a3f7977c9 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
>   */
>  static int em28xx_v4l2_fini(struct em28xx *dev)
>  {
> -       struct em28xx_v4l2 *v4l2 =3D dev->v4l2;
> +       struct em28xx_v4l2 *v4l2;
>
>         if (dev->is_audio_only) {
>                 /* Shouldn't initialize IR for this interface */
> @@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>                 return 0;
>         }
>
> -       if (!v4l2)
> -               return 0;
> -
>         dev_info(&dev->intf->dev, "Closing video extension\n");
>
>         mutex_lock(&dev->lock);
>
> +       /* matches em28xx_v4l2_init error paths */
> +       v4l2 =3D dev->v4l2;
> +       if (!v4l2){
> +               mutex_unlock(&dev->lock);
> +               return 0;
> +       }
> +
>         v4l2_device_disconnect(&v4l2->v4l2_dev);
>
>         em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
> @@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>                 vb2_video_unregister_device(&v4l2->vdev);
>         }
>
> +       /* matches check in em28xx_v4l2_fini (under the same lock) */
> +       dev->v4l2 =3D NULL;
> +
>         mutex_unlock(&dev->lock);
>
>         /*
> --
> 2.43.0
>
