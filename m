Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2E43F08F
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013754; cv=pass; b=CctESSbLeeaA0J2owcJ0filITgf+kCJGluNBLcer+bfp3d/VnS+JBt3oggTXLYjZ5O4XjsM/D0eudl/3mCP2GfEE+F9jk8HLYIwFSJW7wy2bMnKDn0FeYmST/Rw+uRqbO7BMLkR4P0T9OGOhPwIw2jb/Dh5Di+tcbObZXFaVRz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013754; c=relaxed/simple;
	bh=ilqc60JsWKpK4XmzhXcu6LgOa4t6EyTgNdSTMrIR/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyjhQf11vzcOH3AVa564zIkVJF1yPuDNTrRVo3AFI3PaZEbRdmlEVp0VhIFjZzV0hOZ+NSCGtUZcHs2lukMKIeCRvhirK8Fbaa3JcLVIsGbjI0Azqp5miEGLHfdcXrs0l+96Je3HzjVU2IVji8LP1HHXysdJpFY8OtBWt6isiOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2TYjbyM; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2TYjbyM"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e55b62640so106660285a.0
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786013752; cv=none;
        d=google.com; s=arc-20260327;
        b=XYi4JuF6g6Y4WgfN3+mo6lruHmzWTwfcqVwpbd48Jaom/RTc9GXtDDNJR8hlEx41Me
         R6XxNu8lYp63a39XRTZS0ZPPXva5JQXf/uMrso1D2Z+Uti5lboFcSvDynXlFUCMbe/CM
         9yT50UPnEJaaf+y9W7AyBKWpRsmRqeaQtbWNePuo8Ro9JM5+etW9bvda82UzDamcZh/I
         IGh73L2ZYochd5wXGqiEQB7uTWvcn5m1QSY/96v3/UMGEyR5zNQ82EksaKTnCoIf60tg
         gMbKiOC2KCExCnfG1HCtmHKDm/S/8x0H7ae4hWb7h4KV0TeoGRy07zcBk7g4+ovc5Wpq
         n1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        fh=DJU0cBwBowqMCnQF0H4iv2z1M8u4ImACZVCbmnRmBag=;
        b=jqVH7LPKjsLGENkrHBSNpTLXMkLPXBdf27+8YptWYOFW2SaiKPPiVctu8wpGFfaHJR
         M7hoaOH1LTdyglBEChuZ+dCFCqxlHNRs2U34clf2iVnH00yKn09EvA25KhcDeSltiJG3
         Lz04FxQhb3YNwZXFXY+OCRhpo/AmSo/Uz4z23X08iwRC866Ovyzvj+d9O8izr3zJEHyN
         fyQtXkW4SI+cRU/YkdmbqBPGyD3uFbla7ANThpTSXhzTjd9QJS2m3ht6Yj4fY+BQTwwd
         YJm8Lmz+FiHnbeE1PjWH0LV9YeXy1deSlqvYMrdZZS9o4syqUboCYVe2ndMgPZh1o0KR
         mAJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786013752; x=1786618552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        b=K2TYjbyMAFz0Dfk9OpUAT06jnnQ61zYoLhnODRbHf9MqJ7wzLL3licj/Giv0h7QCyU
         n8NheBCmlIwxzmFhrcG7ml01QNiFe1ESRwzncCsLHllXTV7KfzqAEmEyzbFEAuEFTnsb
         JloYeBoXLY79VRkO7vySKBAdMwoZiZw6QAs5CuYeUYSEyvppodOBvozFfxb70Sdbfl8a
         8Hax/SeU30RVLmACng1SwJVSVgXn/6nlh9qMgV0TJeBkHWODIG5VuhpVSGlGh1nTusC+
         POSRTfjk/3nDQ8z5l91IHTsHUfjhZw65w5L/GO4OD/0jTh0nir/9rGkkGUibVvsQsHmV
         53Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013752; x=1786618552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T65fESTPGPlV/T1qvjOWpdsn1fVfSsd2tiR5sGi2eJ0=;
        b=PUJpjV7A3h+5w01Ps2qTFbMrFZ5ahv4dnYFcGuXo5QTqM2gzUFGKZoTMNOcQ2o+onH
         NRzDwVd9RhKot6tuODAMWVTbZC/TmF6ij/YrzVUz1tOLJ6KFvfcVqZ7RzN8Dnm0vnCeM
         NA/xpONxcfUn7jD+H2+H+Tiw1OgRQpWGIYlGF3p+Jvyapb5RATCJ/1JGQfjUY8lg3wkv
         1MuTMWZ20rTgyyX+eo+WaGhXAFe+2XEKGBQfTUhPx6/lQQUBlXU3BwEdUXkapC4Elp8K
         ckEAh8TmGg60TUQXVuACqvFnRPYy8Xy2EGjJnyzuUOq0GtEDT1Z7V4aZYqIqtI82PsxZ
         SA9A==
X-Forwarded-Encrypted: i=1; AHgh+RpZwmLj8E54ToRmR1sY5IMm8bxxi4SfnSRQrKXDEF/6ftoYWBU2DqM0Zvtx6RGFpxq6AS1jxbJyqtjnfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lWDBKZwpjhXMzBUPq5pxG+JYSvu8fBFuleiRuLaRdnLg+dp9
	gMid3Wt9G97TbnM/dyvEjt9NQuIHYBuIOW9hmJP1/yrqMMIibONXqKD0aN0HOlq97Frl7yWH9EO
	BugHKWZb3bwAmtfe5tKSSNnVoc4peY2I=
X-Gm-Gg: AR+sD11dCxC95FKRHMbU5YQIUMl9xMClxZ+Fw+fVQp+kf82A2DrbOL0pxknlecYyGlS
	ziXrMF0z9/psEbRD1RCvN4a+6mv84MaozIdoXIAKeKK0swf2g3SMiimUFgHj28rSZjZPBWK+S/J
	hZ+ChkO8IuXn9s++ivULL+B4/g1E23Cqrsn658jgcsJrZ4dQs/EUsrB7PbAtTSPy6p5mdyyll6+
	Pyd3+WhvLKvFxPNBPwoDgVcpeIDCTyMPFwu5z2kM7N1C735cBn0R0XF0jt6E0TiyVIFLjSHBvND
	g5acvH9vFUAWAssYwASv0jxQMCKXzD1Jbxp67a+tPfnzhvHmStlc/Bg=
X-Received: by 2002:a05:620a:2a06:b0:92e:1725:15dd with SMTP id
 af79cd13be357-936490ca6f3mr1200907785a.26.1786013751819; Thu, 06 Aug 2026
 03:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805183317.85489-1-work.ashmitkumar@gmail.com> <2026080628-album-pandemic-ddff@gregkh>
In-Reply-To: <2026080628-album-pandemic-ddff@gregkh>
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
Date: Thu, 6 Aug 2026 16:25:40 +0530
X-Gm-Features: AUfX_mwaZGZilJaaOZT7dCAVbB_mCM-eMaCtPQnsgArvLwG7OsBAy7SCf_uBde0
Message-ID: <CAPDQrT839L+qUraZuv3KDKbjZnNLzqkoRO5r7n_gv=W3xr_4cA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace custom rtw_cbuf with kfifo
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mchehab@kernel.org, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Regarding the pointer type, no type information was actually lost. The
original struct rtw_cbuf was implemented with an untyped void *bufs[]
array, and I used void * in DECLARE_KFIFO_PTR to preserve that exact
behavior 1:1.

The technical reason the original code used void * is that the
consumer (c2h_wk_callback) expects the queue to multiplex three
different untyped pointer states -

A valid u8 * payload buffer.
A special sentinel pointer (void *)evtpriv used to trigger c2h_evt_clear.
A NULL pointer.

I traced every push into c2h_queue across the codebase. Today, there
is exactly one reachable push site (hal/sdio_ops.c:766), which
exclusively pushes NULL to signal that the interrupt handler failed to
allocate memory. However, because the consumer logic still explicitly
branches on all three pointer states, preserving void * was the safest
way to swap the ring buffer without rewriting the underlying event
state machine.

And to answer your second question, no LLM was used to create this
change. I analyzed the driver's event queue and wrote the migration
manually.

If you prefer, I can submit a v5 that changes the kfifo type to u8 *
and explicitly casts the sentinel, or I can submit a follow-up patch
that rips out the unreachable consumer branches entirely.

Thanks,
Ashmit Kumar


On Thu, Aug 6, 2026 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 05, 2026 at 06:33:16PM +0000, Ashmit Kumar wrote:
> > The rtl8723bs driver implemented its own custom circular buffer
> > (rtw_cbuf) for c2h event handling. The kernel already provides a standa=
rd,
> > lockless circular buffer implementation in <linux/kfifo.h>.
> >
> > This patch replaces the custom rtw_cbuf struct and its associated
> > functions with the standard kfifo API (kfifo_alloc, kfifo_put,
> > kfifo_get, kfifo_is_empty, kfifo_free), simplifying the driver code
> > and relying on the robust kernel infrastructure. Furthermore, the alloc=
ation
> > size is simplified to C2H_QUEUE_MAX_LEN, dropping the vestigial + 1 tha=
t
> > the original naive ring buffer required to disambiguate full from empty=
.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> > ---
> > Changes in v4:
> >  - Abandoned ternary operator style fixes in favor of completely
> >    replacing the custom rtw_cbuf ring buffer with the standard Linux
> >    kfifo API, as suggested by Greg Kroah-Hartman.
>
> Great, how was this tested?
>
> > @@ -58,7 +59,7 @@
> >       struct  evt_priv {
> >               struct work_struct c2h_wk;
> >               bool c2h_wk_alive;
> > -             struct rtw_cbuf *c2h_queue;
> > +             DECLARE_KFIFO_PTR(c2h_queue, void *);
>
> Why did you loose the type of the pointer?  Was a LLM used to create
> this change?
>
> thanks,
>
> greg k-h
