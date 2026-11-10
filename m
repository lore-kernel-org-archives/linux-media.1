Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335281;
	b=wsvF5Vm2UX9a4oKSAvV+K6t9i8JKGIhPt17VP8WufbnflqSFRWYiZIOwu8Ew6kVe14Pa
	 PUtEikiFoIY8gL8AazVEKPvqmCI0o/031iWsvIkfwBU6KG+skqgqiOpj4apIxg34o/Xin
	 YW8b2wecTTCVcejkJ4i7onl91Xv0J6AUr4zvuZijhDeBKHanwnUFjxyVbeI95t60Y8FVl
	 ff80xtjH02WbsfmsFhgVdfSWpZWFhlVZBSsBYCOi2mZ3jDqcM3zXHjr7VzsACstzdZIil
	 ZoYsR+lLc2L9xAjFN3l5Gtsq7QtKDxFbXgdlyn6N/thbT2fFcBWt96rHIq+F+P4VK+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
	b=g25ENeoONWaTXb5kRX/zSWZ3PxegUsB4jTXR820Q3bwePfmPPDxaVT/U/yqvmMDzptfj
	 EI4LaB2+VRxDrvQwyjfjQ/HZfa9PJOk/CKWSmN70yWfq+9SYxbP7Bq8V/9YMTf6MwwI0C
	 UxUyykjyoA2DC0tSZi7x87jSV8f9CdqKa8/kCjcfT/DsbEoLmIZHEfQgsvVKg58r0nU02
	 InCH3NqIU/y5oyMRg46yehMheZfYwOcOYU6uE7JZYIqn5Uq53GeRps75zDS4SvJZ13jqv
	 0oxr564BvB5y0xFwRvnjdy9PS+x7awkBg1SSukV6cdngbC51KuG893xr9WInYwqA3pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM8+v6VO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668ED606A323
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IM8+v6VO
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so923729f8f.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 10:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335279; cv=none;
        d=google.com; s=arc-20260327;
        b=sTxjVTfTcCiZKjVHFuo9eGl7RRTOulXlpn+9V4d5qZDcmesLaM3V9dtlQz0tWnjjAa
         46C6phkXVzEBmCdMRGX1BKUBLGxREdb2DygLnhPgnQKP9EgCiUy6KILK5CAt8O8RlUXN
         MTyhBQgdZYDRxmkw0OeB66z3tuAZJv+zWoAEOalDEWKMxnb8C0a/srP9JJecqBI6d9iY
         01avvW2tFatlsgnO6nshRHbZN0io8WD3/Y+FwTxijbxV56UyR4XzwZ4BYIN0cBtfSc8R
         IGjKaYivcX+IX396994E2aovsqd+n4VvZTysAS/aZY4eyjadp4NfzGoKqWrgqemgcnHJ
         9XUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        fh=21jQtjxQrtJIfEAE5PRlG6phWdtvY6+IpWKmH6nP7wY=;
        b=q96biaxZfM2Fv1UtZM4Re6K6pItZcbFSz2P3OMgzB9qyvurhOvvpOy/5fJnfzfkGhb
         AFkEqM3whkKj8aISANwCBzJ3vUp1gXpAzjviAYWGWvdWlhqAK4RdkVenOBh0xL5bo78D
         jAwPTcw2VLgsmwHD6eZqCHg9AH28FmAg1khWXvMCCV5unwuoLeLs0JKU2ijGy6OsPQAr
         JYwugjVmDLgHVMts+F7UtYSNd/ZsWbgSMdAewCmLjFm2zbCuh8CzZOqXXG2fLP2ghdWW
         j+KBYApSSCAtsTlqDR9xko/yoOWwl8NKjBmdU1OZSmIkWp+UtobLojV/18/WJ1/8xevR
         1P/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335279; x=1794940079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        b=IM8+v6VODEbzMLsKcWFuS9S9xmHEUoFxom2xO9uGGR2po2iJ8Dyah1rV6I5MVQIepp
         FfMJQKJo0h45UV+I253ihetGTCLcW/dxxRDVS6h8150p0rNWBiMMaQ2hUEtgkCmQjTD5
         6BcW5zyErZbXnw97oCdTfwLjdyLNUAv2hR1lGm09IFwq1BY8Trf2XHfoNcijdpPeliSd
         i2luqxZEOJcpks0DzraY1rEoQsAvm8hzfHI6o/TmyNwWgrl/L/i9yN9RqJPMTHhvrOMx
         CniLDvEv0mJYgHUBcmLNKldfp0u6a5wZpHp5+JT0t0OSQYx+Rr6giQ6NRElSDUlHR/BG
         w/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335279; x=1794940079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YLdB3g9tnxFjs9/6VH9nFXGUYkvbUmaGAC4N10mcqc=;
        b=RV1Y3VeU4pQEl3e0ePe4Jz6UHixC12mYjfPHzYdagqYVRpQz7GcHXa5bYfqgslfDwF
         QBvf94Q3o4Js2TiESwIP1O7Rq8j6QmE4ZI5Fp+6jJYHqJaR6D6D5dzo8/2twaaoVhKFY
         VxupROhuZOIThLYjK+29eB4TeDbF9ldtOaNLOAshhQv+RajG83hM6XByvFlanFy22lE2
         +Vtc40CCkDoQlNuwtB2H3++x4sF9ptYX5ahScEd6uB96cXHLf/c/3j1OW7EyT72OwJz7
         W8rTYj1cTjB+XkOxxYCZz5jgmm44g1Q9h9Lz3jMZ8MwIXrQKoxhdscyWQoDMl3k9TrLf
         WoIQ==
X-Forwarded-Encrypted: i=1; AL+hErFiOzsOS/h4Cj+yDt5KOcMncBREx90VBC6R1J7yRDdOnlZZmOgxGRKbaB8mFh23ywu6P9cGKYxpa1hGVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z86rnCT1FdTCtqqNAr5soCB7710MtsG8jz9ASGFZzRUQiJd8OBL
	Hh3A1BCcE3tAEuL57JAZDasfOyBGlwVC6yyrIoYIkJKCtxGCHICtDO63nLC15jBAoHK2GdKbUVq
	S6GG1F3X/5SS1sbDmaJdZ3tooBX/7cTg=
X-Gm-Gg: AYBFou0AZO9EPT8TOl9G+o3FUf1TDrve9aK4BQ2nu8kcdit7wByGu7rlqsByMU/xtbZ
	isSlRkEmt1gKVDTB/YtomfEsE01KuIV9z3d+CBqgcYGi9ic0r+AnLEpxuzBPl9Q0Xi8FPJGUmId
	WhKhgDsSvhKpRjMPG2ZLFHpx+bNlYsFB1T/YOQdEKE+i+/VMVAa6tUDoJ9xfGKnUYqwz8KKz+bL
	/+ZUJBrQqxhe8VCuGlV6E54M8IkXnyNHP7029w0jc4SNtlx2cDff9v3XVhrOUl5ZgxZ8UTlYyDC
	ECmGZAXmUkeukmja9awkZE/2S5D47i4ctnoDOeIidZyFRfD5sfNtykksi+rHE82PCjjDCddJ288
	TDpKpQSjkc291cBlRDdusoerYH6D5XhLFqn9CFrSiJX7aXtLIl3P6iyPf6V0SNoaaJIALJid7FL
	Jrf4JHF/2lUV8hF0Er
X-Received: by 2002:a05:6000:1a86:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-4982ba3297amr6630503f8f.3.1794335278568; Tue, 10 Nov 2026
 10:27:58 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
 <20261108200800.2b3b15cf@pumpkin> <ed2a6a4e-f480-4b39-9684-0dbd2d55e261@kernel.org>
In-Reply-To: <ed2a6a4e-f480-4b39-9684-0dbd2d55e261@kernel.org>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Tue, 10 Nov 2026 10:27:46 -0800
X-Gm-Features: AclHuK-s0hGDrA9NemleLuGLRjjsAkkNcY2oEM2MlQ1hpilpfd-nAy6wrrOh58c
Message-ID: <CAPDEY+UxXCg3M3oLxxqjgEOdaVVaHJSwQCyt+=v2zLP8ESWVgA@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, nicolas.dufresne@collabora.com, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:13=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 08/11/2026 21:08, David Laight wrote:
> > On Thu,  5 Nov 2026 00:45:18 -0800
> > Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> >
> >> In preparation for removing the deprecated strlcat() API[1], replace
> >> the strscpy() and strlcat() calls with seq_buf operations when
> >> constructing Hantro video device names.
> >>
> >> This preserves the resulting strings, including truncation
> >> when the compatible string and suffix exceed the destination
> >> buffer's capacity.
> >
> > This is just stupid...
> >
> > David
> >
> >>
> >> Link: https://github.com/KSPP/linux/issues/370 [1]
> >> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>
> Just use scnprintf.

Thanks for the reviews, I will simplify it to use scnprintf and send a v2.
>
> Regards,
>
>         Hans
>

Best,
Mariia
> >> ---
> >>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers=
/media/platform/verisilicon/hantro_drv.c
> >> index 26e5d5547466..2bfcd45cc55e 100644
> >> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> >> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm.h>
> >>  #include <linux/pm_runtime.h>
> >> +#include <linux/seq_buf.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/videodev2.h>
> >>  #include <linux/workqueue.h>
> >> @@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu,=
 unsigned int funcid)
> >>      const struct of_device_id *match;
> >>      struct hantro_func *func;
> >>      struct video_device *vfd;
> >> +    struct seq_buf s;
> >>      int ret;
> >>
> >>      match =3D of_match_node(of_hantro_match, vpu->dev->of_node);
> >> @@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu=
, unsigned int funcid)
> >>      vfd->vfl_dir =3D VFL_DIR_M2M;
> >>      vfd->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLA=
NE;
> >>      vfd->ioctl_ops =3D &hantro_ioctl_ops;
> >> -    strscpy(vfd->name, match->compatible, sizeof(vfd->name));
> >> -    strlcat(vfd->name, funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> >> -            "-enc" : "-dec", sizeof(vfd->name));
> >> +
> >> +    seq_buf_init(&s, vfd->name, sizeof(vfd->name));
> >> +    seq_buf_puts(&s, match->compatible);
> >> +    seq_buf_puts(&s, funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> >> +                    "-enc" : "-dec");
> >> +    seq_buf_terminate(&s);
> >>
> >>      if (funcid =3D=3D MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
> >>              vpu->encoder =3D func;
> >
> >
>
