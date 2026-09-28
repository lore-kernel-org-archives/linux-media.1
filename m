Received: from mail-yx2-f21.google.com (mail-yx2-f21.google.com [74.125.224.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01A392C3A
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.149
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597888; cv=pass; b=tPFlRjc8wMS2/LcybsCBkwirj/2o+oLY4TdtZAgoZdldUgLMiIM4Rl+zX3yWbDKd+pQrpnFl0p706QhgtujWsP0JvT2c3r6/nWDrpX+lI9yf+zyzXhg7QiQf/I/KZ1CWKG100cQfdt57QA7ViIYjIijDk8Fr/SF0ePPzSo3v7yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597888; c=relaxed/simple;
	bh=rYxzzzNY1AdcrXh0ozl1mR8qkdvj5gJ0d5Mjvk9s7Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMHY3w1czJLia1Qd7u9oS8cBh1QfFqkpBxAV9bDvWR5XbBrFyhmAQ7/2PZ3YlNvFSlOrZ512ZsafbUcKeidQpe1SNeaCXR/r88LSgrZlARV6blV6JLpUaRpCjQYXUXQkv4kPONLfqMeAWzDwj7g3WtjZktTIEADKJu4UljsLczQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWFaSmDt; arc=pass smtp.client-ip=74.125.224.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWFaSmDt"
Received: by mail-yx2-f21.google.com with SMTP id 956f58d0204a3-6730c3bdb35so1773378d50.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597886; cv=none;
        d=google.com; s=arc-20260327;
        b=lsUt0Ph89w0FnE/8bctoyNYJc3RoxxrL9q6M/KIIqpSfbadS1eJ80kfIBKvNeY+4XU
         cBFJImKkaTNRexKHP5ahUp+WUjY/xjLCx9+HgmLYmGbGyx0lG3PM5fe8N6tMIQMt4VZh
         7XMA8NpXSDhsDl1odlgMuwqMi0dvZaPxjuFmSixEeVl/BrF0vh+j1M6fV8sol/9WOq8x
         oq7G0PJiM/kw9jQ2XY4JYVnVFl41Cj1oGxG7Me91+uXG9Hs7RLwJoQgjhO3foYkiLDcu
         UiJF5eJXy554sKZpe4XBF6TmjdMSK59Cd54KXVfL+leBoSBaNIPPxqD1zF/EJHS4dRL8
         KgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        fh=PJ85cYuepXFfcUj+CN49m+4R0dWI0IYwf5DhgzilPGw=;
        b=JX8zLtsFVi16ivxkxTDux2zmZB7a2vJTLep/3LSE2Vo6yT1x6X88dVxzYDY/Mq2MYM
         iSmIO6VuuO7q7FB19EZ2X6/jOcdRO37Oyk8UXiPD5Ge1fDYb6axDOnxHLPYVCHo1BVk3
         WdUbIREoVePQcgZBQK2iTNJyICnDRH0Wq8hDhGwKkn1WLusep48qI+9YBo2xh7MAiPtt
         kRDLiesonhrpXSDCYMDlEJYmieZe4ejZMX+WCkdS8hKcCHw+BkuB5liTrLRP/uWx9nTq
         yaBJChwcB8JV+Z+pRz/opw0SvDs6tYqYNIXuAHxENYRTOnHk4kkzu0b1A3jI9BgCHU+7
         whgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597886; x=1791202686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        b=eWFaSmDtXggX2AKjWrH+ThjoFOTE0Nfr35+yO7vDDasQwgE6Y4Vqn7MvPnkGJ30ngb
         BJMn3PHcdSBX8qCd+0qAcaRmzAgatWyIeDGKh0dQOZpNDGnl21I9kwAl8N9EmBBQEqLj
         bx9AXlNtFEiCG1cDUbKtBYLwUzIohXOfG6SxO9dMNOGTtgcfimWFp7Nn+umyefdwhkdO
         8DYwZmYY9nkyt+T/srEcQsI7bu2YXrJ8wLLTJppvuY0mS7+aI1kzNJL9QyIm1xlsdwRv
         vXePt2oK+lCyRAYQx+ccX7y01TgRWwPM2b4SjZ3Sjt+tJckUsKStsHus3fxQCjmlknlH
         Wm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597886; x=1791202686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eARHhkh9oYsXbPpbvCkfwu69vuTuYl2b/LL/+ePPlw=;
        b=2B/kSXbGXmLNBVhnOaOXxe1n1MleaOF0R658Of9HovOPStGg/ykK5E3oUu20m4MwHr
         c/g9djEPbx+1MlFe3c7+lm5Ti766EhCvbBZkDpBpj3ps5pNE5bNWRWumax7qECsfcTpH
         79IX3IYO9jpXWOtcrNhdAzVOeebxTc8kyOBAejGwFvrZFdEVO3IzZkdr/GbBEA/96mlx
         6cHMV+TSRWM/Wr+momrOTNjrweydxrPc5I4STClVTPU0vyz4tfj4w4ntLOUK4S9kbDGk
         s8xmP0voCUlAelVysThjhrjEFeM07HCIew4VrcfDiOAeGQwBKYqHSCefs/qZ04YWaoQo
         dohQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeU2oqO02iDVkKguCEd6DJHU9dW+uvJuOyfZPhuvBF1vjzHoMqdm64twwwDHlcsjMATG1yglkIb8i/UA==@vger.kernel.org
X-Gm-Message-State: AFuF++mgwv6s7xkv9jXhAfeqqCaaLf7BczRq3xtTgndRiCg6EtxNFlMn
	ac59wy/6H6uF0jnEv6zrlh45stp1VraWMWUiFpNY9TZ01jzhB/n1axfhPksek73PU9+NZjQ4x71
	ueMNfMRkXOPU7bjp+P1k8DJH8XbEmTRI=
X-Gm-Gg: AYBFou3TfjIW/1lXmlwW0D7okBceVSkvE8Gnu5SYyULoXXR385e+6HUDjaIhzpgoTC1
	/avLeN+SLUU/gM3iwuaf+7W65ZvZzPrt/lZnWevlX7yFJc3Fmg+cb7KtalfnCtiO4LXxc89isl7
	LJMKsyW8JrBTPxshujthwVohiYfsyNsuQ4iSf2NsfBrDuMyAkNpgts0/wRIusNaxnxNE+zQ3TkN
	APqLokw1hCwZhlI+r8eLygUaD4PGfS355cKy0ZzD23XZoIaE/zdk6bwPNPeNPyjlRkIRUUzZfDp
	zYTNWdNy6EYV7Kos4SLzktTyEhkhlQQnRPtKRrQnN3WFiRqBwKYD3hXhgGqnzQzz3hY0MiQgNE5
	gVaYVCGtfOmCm9EIzXKRb8fYk+bl7Q1FEn395FKiW89Q=
X-Received: by 2002:a05:690e:1c1a:b0:675:449d:3d72 with SMTP id
 956f58d0204a3-675449d48eamr1275888d50.32.1790597886319; Mon, 28 Sep 2026
 05:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918054851.26083-1-kartikey406@gmail.com> <arey7Lyzlb2lq09P@extorris.mess.org>
In-Reply-To: <arey7Lyzlb2lq09P@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 28 Sep 2026 17:47:54 +0530
X-Gm-Features: AclHuK8LDR3Ng5m5rYWshr-m-9JpiY_F01Ux4P8GgnE55sFSsBNXD1fPs72yo1g
Message-ID: <CADhLXY4j4hFhhf0Kd8xPKha0mnb-H9bNYjMrXjGBoSeH5Jt70g@mail.gmail.com>
Subject: Re: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:26=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> On Fri, Sep 18, 2026 at 11:18:51AM +0530, Deepanshu Kartikey wrote:
> > ictx->dev is a raw pointer to the usb_interface's embedded device,
> > cached in imon_init_intf0() without taking a reference. On
> > disconnect, usb_disconnect() can drop the last reference on the
> > interface and free it while a userspace fd for /dev/lcd0 is still
> > open. When that fd is later closed, display_close() dereferences
> > the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> >
> > Fix by pinning the device with get_device() when ictx->dev is
> > assigned, and releasing it with put_device() when ictx is freed.
> >
> > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708fc
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  drivers/media/rc/imon.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > index 049a73b5f882..9341dbe03b57 100644
> > --- a/drivers/media/rc/imon.c
> > +++ b/drivers/media/rc/imon.c
> > @@ -502,6 +502,7 @@ static void free_imon_context(struct imon_context *=
ictx)
> >       kfree_rcu(ictx, rcu);
> >
> >       dev_dbg(dev, "%s: iMON context freed\n", __func__);
>
> The dev is only referenced in dev_dbg() here.
>
> The debug statement is pretty pointless anyway so why don't we remove
> that instead.
>
>
> Sean

I misunderstood your last message.

The reported crash is in display_close(), and
ictx->dev is also passed to dev_dbg() in display_open() and lcd_write(),
which can run after disconnect. Removing only the dev_dbg() in
free_imon_context() would not fix the bug.


Do you want me to replace dev_dbg from all over the place ?

Thanks
