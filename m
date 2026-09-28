Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992263D9674
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597921; cv=pass; b=RmFMoDo0lRNeVOtlYJp4Hf0kMBal8M9C4TNnD6o+PUPFhJDG2J2zcW33ydzO7WrkhRUe6l98Y4tsd1zYsHton8/F1esPPjttam2x1n3JYItlSGqSJHOg4wLqxeZE7zy5/qfEPelscxq7+d9D0nO37sS6V7NsHS0kYWy6dd8bE8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597921; c=relaxed/simple;
	bh=TijKxK+nK3xx//VQ9rSkkM6WufIlRHmW8yc3Q92XXuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eirEz/edKxCVxM9hlsQIWICsEVIKXia1b1WOVVN96xVm9nMPGAf9fn7a9DiV3UT21idLJv0+FNZT/ebl9qENKkmkIRsERqYPILVGoBZhKlF3JhxGMOxxUKi2MYwCTNWD9TRYT+0QmwfXyR69J4UticHx1GmP7XrMHtEXZ6t0cBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMe7q+kr; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMe7q+kr"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7a9afe43so2357522d50.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597918; cv=none;
        d=google.com; s=arc-20260327;
        b=RvLssdA2s3RqZ5/WxpXDw9ebgm7MNvNtd7rm7LqK1C3oN0s5Rc3aoILO4Mfoc1pOMb
         gXW7OG+lTZ4m7z+KYYoRSGaq9ga3LSinUQIrBTK09mEQg5azaX5/5bisnE2JJNqBqYnZ
         ek/kullZziCQG2fL72bUFUKYN9yYs9golQ6mNlugtvltMzJS68xxgaH+ZBZNG1dxeztG
         Uc1nuF4setS7mxb8Q1zag1/gKg/S1SRlkplWdUEyr56z6rXd188XbngqRsnLdNdZ9+Rr
         ProOtgeZaKd8alS4RX4ygviw7wvkwWZGcY1LtLKaZyxpNgvDD3Y87f0hlZ1II7h8NS0h
         /2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        fh=Hu+LIEf85Hyqfghj1nmoaFeY6Gu2qrKTflfhPPvbs3w=;
        b=e6NdJAV80hbtBi5culH7kga8cJ2/JY+7Ia3jDUmcxkUr8pn/prgwNT/fCyoL/ooOB+
         6/yMTGY9vZcRLAlodkZu1Z6UGf1IWNVoFx5FROsR47irpGt8u0yNg854ROhvVSB5nxTd
         YWje3hy1UyzMmnwBQVZjTcq0bcDWTq9EqxKewZYlgPckpvrgkWDXlKtLOspOKe7D8hBy
         pPkJKoSdd2oPAb67RmqzHy53LTzv394vWKlzsUf8kbSRPEyEreBRTIqE/ZYsL1fviQ06
         3Kp1N/QMLSukKI0vzjviPjBPXRPVvDHFWk3jut8Oryi43nnW66zEjui2W2tWqIkMb3jm
         mX4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597918; x=1791202718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        b=aMe7q+krHZT5jfGanu6pqnmHEhYF/VajLq9iHFSn69rjtntsEn+eoUrqSz7fTsN9Df
         B4I/wwoDgitHtf9jiDtrA8y8B3lIeINYP0eCtEbavwD8CtkdVDiBWciJll8vI+kqxxss
         sD3WQtAn4QtdMvHkkXtRimuVpbIFR44/ntg89+HeNp4Is5ZDs/sE/kTagn/pm8EQYY7C
         EWhWa5c22WGX8NpPkDXToMzC7sieIMuKtEqrcRC3ZMRnfQxuCdTYetXN9HIhLdB0dSDr
         nyeNOxUowbkXZDV/hPQlyGNAbFTO2KhWGdmTpzJwd3wi0tnm9R2BrOIU9taBz9htQq7X
         8WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597918; x=1791202718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL7XzunHpqYpnOMoylkNx9LH6Y253aowfuldXMm2MNA=;
        b=d/Zou/gZhdQ7s6TTOlcdcsaBHsamvonGpGYsu/0V2AvwrcbeRzW1/cGKtcnAPX8qTG
         QWwot8jkiqB64OPqyDwhwiAaRNgoVuycppIKBue3cgQvbZKmut6NlAWEHi5ZQ1MLFLRj
         CLdtDZi1ZBS8iqVEQjDLTdQTaBzy2I/IhBd56k2HOWSNSARZAk3GSVvQRI9W+50LZLBC
         2KIuZ3ynhcj7zcn4YmmpnXct57db2foCybzFvfN4wk/IfaMqoFbA1Qt7Xs6L8kczg/oz
         tPYE2lCJqNh//xcf1WDAkgRkiM5+DJYib7o/+xsypAOCiMooVsJ/SoA0XuueG1XxtGns
         xicw==
X-Forwarded-Encrypted: i=1; AKwUvBxsQ3U3de7meAyZpmyouudZD6fJaJyOcnGTaEg7sYc7NVl8YjPqtA8QFX+n7cTvw7plGKCRhS/P7reoFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYITE7uvnsGKVIVVeR3N0BLwe0A/FQ9IDI4XzUOpthK+Zwz68S+k
	7dndn5nq6O/+GNCVNnJnfvDSKJsed1G/y0CA2uOGg6aEt19/2DDCyenFRv3t332ycxryblTQeYT
	1PHLaOchUDiAH313fRtiqPrFR5eXbPBw=
X-Gm-Gg: AYBFou2W2urzWzPYCGgBtAk86975NsvE/dcXo0qA3E1mzUXMCrfSsgombHABCiCg1Ew
	vMLSQqbSOSQyeWupAwFv5Pzt/mcW7rHm3ZeOhB/ySkxLly9QK8eybr5VFwcmYtq8dhlxVfEImAL
	XtDx/QF0AwUAiU5qzngJp3YW1fW5+mKbOqMdvwYh0zuEzH1MNVhuwXdrxNw0QISp9zygCja2/pL
	qpisFa3MM+IYUZN8X+PMUtE7VyzeIWtd7VY7M1rd0m7q5PeHy3VMf0pf2WX7r7MPH1VUeSaZMUY
	Yki/taDbBlLWylEvHSXI33uBeEYuHB7v3nGnQ8OdPb/wB4wRRGC9uc2YttePrMIOnbUJ8FGCyRG
	wDtILR8tzFhyfxBg/9doIHxg/gZ/uG/2Ltz1V2nHGt3w=
X-Received: by 2002:a05:690e:12cd:b0:675:13fb:ef4f with SMTP id
 956f58d0204a3-67513fbfdccmr1784360d50.93.1790597917899; Mon, 28 Sep 2026
 05:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121230.35359-1-kartikey406@gmail.com>
In-Reply-To: <20260928121230.35359-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:48:26 +0530
X-Gm-Features: AclHuK8HSa-2KM0ooi_5xiqzSTVbPS3E0wHbBsge4xM3DW_Ub-G1EbMualq28Oo
Message-ID: <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>
Subject: Re: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
To: sean@mess.org, mchehab@kernel.org
Cc: jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> ictx->dev is a raw pointer to the usb_interface's embedded device,
> cached in imon_init_intf0() without taking a reference. On
> disconnect, usb_disconnect() can drop the last reference on the
> interface and free it while a userspace fd for /dev/lcd0 is still
> open. When that fd is later closed, display_close() dereferences
> the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
>
> Fix by pinning the device with get_device() when ictx->dev is
> assigned, and releasing it with put_device() when ictx is freed.
>
> Also drop the dev_dbg() in free_imon_context(), which only printed
> a debug message and is no longer needed.
>
> Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708fc
> Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail=
.com/T/ [v1]
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2:
> - Remove the dev_dbg() in free_imon_context(), as suggested by
>   Sean Young.
> ---
>  drivers/media/rc/imon.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 049a73b5f882..562a70186db4 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context *ic=
tx)
>         usb_free_urb(ictx->rx_urb_intf1);
>         kfree_rcu(ictx, rcu);
>
> -       dev_dbg(dev, "%s: iMON context freed\n", __func__);
> +       put_device(dev);
>  }
>
>  /*
> @@ -2253,7 +2253,7 @@ static struct imon_context *imon_init_intf0(struct =
usb_interface *intf,
>
>         mutex_lock(&ictx->lock);
>
> -       ictx->dev =3D dev;
> +       ictx->dev =3D get_device(dev);
>         ictx->usbdev_intf0 =3D interface_to_usbdev(intf);
>         ictx->rx_urb_intf0 =3D rx_urb;
>         ictx->tx_urb =3D tx_urb;
> @@ -2314,6 +2314,7 @@ static struct imon_context *imon_init_intf0(struct =
usb_interface *intf,
>  find_endpoint_failed:
>         mutex_unlock(&ictx->lock);
>         usb_free_urb(tx_urb);
> +       put_device(ictx->dev);
>  tx_urb_alloc_failed:
>         usb_free_urb(rx_urb);
>  rx_urb_alloc_failed:
> --
> 2.34.1
>

Please disregard this patch.

Thanks

Deepanshu
