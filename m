Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921D4052DE
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757442; cv=pass; b=snDUIuWOd3hNiMDB7W2lUEjFE1fReri0lPGzGRiD0RI61iey7XXni8LSs/90NIzVTU4hEe3Wrl6Nuq6MbCZUKjWWQnE5wqGPJzTlj2gY+VebRZqNisaEivE4/wD5XuPvq8rjh1MhZQHotDpVcNFqTPxCSwL+TW1dctjL7LqlRBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757442; c=relaxed/simple;
	bh=bR8m88aGaXrfrsJOpMkJ/BBxQtrF3+thka+XnxLV90A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsHwvF30PT6m1PX0Mwj8uaW0X73lUJGX+lz6CTRmUv9xjkfMv0LBipMjZ/HN3r6xyuqNxX8S7PToX2z9zcyeKoOFmhjYv3DlF23oUgroXhV0MVWI0sCehtgX2WQ1OdZSbKHh0yPXaONg6sv+MRRGbTJSYzzPoByFePEHqxx1uxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3jXfUfC; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3jXfUfC"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6756d2aff02so1255648d50.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 01:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790757440; cv=none;
        d=google.com; s=arc-20260327;
        b=Ck7IPk7ZKG+rVzUMBfWUFYHlpSkwcnsNSkpzfhnMypr/wRvJyAjNLkzCUCG/kPH7ME
         AeLbglmsvwyVTYB98gTS05UqQdONKZJvIH4wgXu7thD54maoyemueufytwyadE920r5K
         R884kenHt81KAPPZgaNskDhRldCxTxtKKCpNd4K6Ew+RszaeJgvs2sRNXlVjT7aY3VOa
         3u3eWxTIMA1PVdHcjMGq1KrH9G74N6QB5NCvk3bQqgS65XkmkV97f2JQrr3UWfK8Fns1
         Q9LZEYju5abSvpMCJNPhKTx0fKgFcf1pEwkSRzsv4iv+/MbOU8OUGVDhfU4bNyj9iB7b
         KK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        fh=zB3nQv4jUFSaaK8tv9nkpUrh9WrYCGepJEJ3fz/vcPo=;
        b=kFMyaGRfKTgRql/jK86TW+h3uxze1xbsyi5BolJ0bCd5sKISJ0dS7BJwHtcbJWACBE
         lfabc6K6pe3QwNR5uLqFNXKF6eVEZuafOXuuhqPNAiUrCAFwpu8CiofUYOj9Uhku1Dzy
         ZwTOaG1TPJxGPdxDnX3zXc+nE/n3UZlMMwW37ob0SD5bhKkHlh7/+0alKsPMWDwgOS08
         MV+oHCNd8OtVfYuBEwLeh6Dr1Ewfu//VP9/McjKnd2g4lKsYLUz7kzVGmLP9D+7nviBg
         +Yxr9ge9hiiJpGBpm+Demzt60P1xf0RKCneRN0aP/EX02RNftu/NawGY8oeli/o72PoH
         JBSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757440; x=1791362240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        b=q3jXfUfCskLmgnN1nFKDmV9khZIazXLOiGbrss2zOKA8yUQEO6sA0JJ+feqj/6W91M
         GWKSzCYAwTjS/xvP41P/8LHXs/uth90A/Qca2opQpTg19IWSlLOX07LVU+ul7dxQCTu3
         ouqk8xh7QpN+Yqq3UUR/k7+ZjQHGa2W3D+G7+aDCijqqpX+zuf0E+WGbjNVpKzGohjWb
         WMbw26OvaJjjhVzHDgXxwwjYe73fwQSI07FDyIEWG5NxkEYCXywxl/O/irO3WCund4VB
         K1K9BfJ9bSy9wPE9FnBBdFyyc58/CTw8Ys5BNwPoAPlj0wbvs39dhyoIRwSmt/YEI/UG
         jDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757440; x=1791362240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZbsdIhFdw4lA6lXthA22D9X4FQUwOvCtO8TfQT1itQ=;
        b=1aPzJnBRFTgiRgUcvpKRu+tsROUGt27pDKtBte60Gv1i3UExROoVPG/fvglf7zXidk
         D9kuPirtu71G9cCDAqyqBpgub8w6BjBmQHNIWrfR782n8iNRPSljQgKMB28mnSHFRflM
         /bsOgPapJaQfyBe2QVMe5vvAv3os9jX3VAGESY4DKRuSGg5sWrV+0L8KeyqhXIqrnhW9
         Wuuix4EUUSmIhbxLJ2la66h9AiQ+tKCanyY9VfMuWiu7kd1/ZzDC5W4Z071IthR5ONRJ
         tHLCOQcSCNLKyOJP56k7IIN6IuI/SZM48QRQ9B/dq7u1NQRHmr9ijggOG2e2b0u4uWWp
         5gMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlR+iu5iUzwAKi4hFyR7cc5vDJ83TlJhOC8Dv3WBuVcYtCzoN2K7s8DEoIRm7l/t9Pl7A1kn3oC3widg==@vger.kernel.org
X-Gm-Message-State: AFuF++kSe+0jhjDI5yZ8SNzkFTi7iTx1AEsFNi1+Vv2vejoTvcAjJReD
	jdJg1EGV3uCHkRppFb6vL6GpicHYzZUlgwhLIR/Iegea5aZowh79l4aDqhpXNtqiTCAQbS+Z8mJ
	e23KmKIsaK+sYqVJFANKzFgBJW2Fpt/aX+w==
X-Gm-Gg: AYBFou1DY87oJMKAPEeLww70Cla3X0VVe4QhMPeM1KJyxqPv6AoZ4wQSBMnFdnznW9j
	ZxwqmwkIW/Q7iXNsAOAqywIaOYQ4YZXxhS1ypF82H79mcUhIV9NKMyC7K68unvV3GeGpd8jlX2g
	r3eXzNjr28c1jeglMJYD++45oEoyU49ijl8GtY3ZFSd2ebzWgCsn7rhS6wFVy1mYLKt8xXNcLx8
	w24gVTq7CDwAVTSgPXYOsK+7v3mXw8RNBqsGbeWSrlcnVt1beCFJcDbKoNsAJuqGJe5+kZKRbvm
	LTrmOwO7RJhuArMlp7wbdWsm1rLYJq6h8vwwEbaPovcuhwe1XMlPdl08umkKJyxNzbMXdG3DC9/
	5/GmMPCnAivK5AzTekhtHcgA12dchTBA1p0mN7wg7xqAh
X-Received: by 2002:a05:690e:144f:b0:676:858d:35e3 with SMTP id
 956f58d0204a3-676858d42a7mr151082d50.44.1790757440382; Wed, 30 Sep 2026
 01:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928121230.35359-1-kartikey406@gmail.com> <CADhLXY434wAdf9s-_3xh4WZj5A26yaP7LPj1JqvNaPaVJWQqyw@mail.gmail.com>
 <arpcrKbhue-aRud9@extorris.mess.org>
In-Reply-To: <arpcrKbhue-aRud9@extorris.mess.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 30 Sep 2026 14:07:08 +0530
X-Gm-Features: AclHuK_hL4sEK6mtF_ZzNd7F71VC1zJspJZfhjhXLVWvSJpVrusATxRquQk8KbY
Message-ID: <CADhLXY5Qtz=_6oHsHyZUVv4-rrbh+AmXaR-E5to6tOyep_A31g@mail.gmail.com>
Subject: Re: [PATCH v2] media: imon: fix use-after-free in display_close via dev_dbg
To: Sean Young <sean@mess.org>
Cc: mchehab@kernel.org, jarod@redhat.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:55=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> On Mon, Sep 28, 2026 at 05:48:26PM +0530, Deepanshu Kartikey wrote:
> > On Mon, Sep 28, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey
> > <kartikey406@gmail.com> wrote:
> > >
> > > ictx->dev is a raw pointer to the usb_interface's embedded device,
> > > cached in imon_init_intf0() without taking a reference. On
> > > disconnect, usb_disconnect() can drop the last reference on the
> > > interface and free it while a userspace fd for /dev/lcd0 is still
> > > open. When that fd is later closed, display_close() dereferences
> > > the now-freed ictx->dev via dev_dbg(), causing a use-after-free.
> > >
> > > Fix by pinning the device with get_device() when ictx->dev is
> > > assigned, and releasing it with put_device() when ictx is freed.
> > >
> > > Also drop the dev_dbg() in free_imon_context(), which only printed
> > > a debug message and is no longer needed.
> > >
> > > Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> > > Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D9bfac891bdd42eb708f=
c
> > > Link: http://lore.kernel.org/all/20260918054851.26083-1-kartikey406@g=
mail.com/T/ [v1]
> > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > ---
> > > v2:
> > > - Remove the dev_dbg() in free_imon_context(), as suggested by
> > >   Sean Young.
> > > ---
> > >  drivers/media/rc/imon.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> > > index 049a73b5f882..562a70186db4 100644
> > > --- a/drivers/media/rc/imon.c
> > > +++ b/drivers/media/rc/imon.c
> > > @@ -501,7 +501,7 @@ static void free_imon_context(struct imon_context=
 *ictx)
> > >         usb_free_urb(ictx->rx_urb_intf1);
> > >         kfree_rcu(ictx, rcu);
> > >
> > > -       dev_dbg(dev, "%s: iMON context freed\n", __func__);
> > > +       put_device(dev);
>
> Why do you need put_device()?
>


yes it is of no use. So, I have removed it and send patch v3.

Thanks

Deepanshu
