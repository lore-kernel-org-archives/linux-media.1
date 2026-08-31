Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A71C5D72
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176743; cv=none; b=DAgsDeBqoB5YSEHAGVSeK0M0/gVca3DUQDBoJAmMl28+Czl15vBnkpDB7ZzwbNuA3nromgv5qBAIEeT9waLLTqgUG0dOMf76Vz0LP5YgXcSis72nO7D3OwQEgXLPejhoq0wVILEIG5FJRPbrhst1HK97eqbCjiIJ4pcjI2J4asY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176743; c=relaxed/simple;
	bh=BEeQAQ40I0LV0aGncVgyaQlkRdikCzo4unT8jnz0Nbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9hklooPZtRvMgJeJuCyXsGQpItIuLzKmppsNw63GaaigZSbK33RgWvXWA8uZUmYzL8icpyfpWk9LwwZu1Ti0BQajUiSQuHIVVy/CXjB/rRu4q9Ke1Uza4KtOYLJhuZRZDWN04QZn/VB9nNa00EbxFv9i0eNzbs7UJGMiDBfN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K9Vl2qw2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K9Vl2qw2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so3784762a12.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788176741; x=1788781541; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIGBSwlzLQ3JNiD8igYqt5VspQFX9U8fXgxj4FZ+S/0=;
        b=K9Vl2qw2aTOSN3FVyf9BuTBo+zuZImLZJAb83gzT4uS35gzC/9a/VG9ZaKJgHhmHho
         T1A1SbolXQN6g8aoP77yaQa7stTkGPlrBuRpMv134h8AfBfgzjigjY4dZe/A/WPWkI++
         MGKmF8Dxi+SfPV3ej4wEaQBlTqle5+lhZw3+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176741; x=1788781541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GIGBSwlzLQ3JNiD8igYqt5VspQFX9U8fXgxj4FZ+S/0=;
        b=NwkejuKyXLoUOfwuLv59CccmkdJrRuK2bdWyFiQjKqYjaTnNA3x3hWeJZDTyy4P16E
         /xL3xo/x8hJQNwvbPwbFe5ht25wNwwq00Ax6Rm1b3Ep02l8MqiwrmEk4My5ih56LCaLj
         qjR2e/GpZMMlBWEDDMN9ZmPvJbAp/wMsioEI9M5hGSyJX0Zx7vmj3uuIdF9jt87RPUGj
         AZLgpOv5YU10NC0Zh6PwAjZw7QxKc7y26Xa1itkVFZrIcE8fP4j2d0ZPD/qPxIWkZeAZ
         mJWhIeie/GE4jJSF39ah7qfxai+IpEIQEGAtURwQnCVIS8KkXVRJaYP3vPcLlI3R2LCX
         DFCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4aE3UEzsKYMaEx73PO1ICFW494hgI+PHhjNGUQzLMPL7XPaI0/tvx1jN/XPie0D+HFCzB28r9PgIkRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mQTc+DxU3HVAoit5PLT99GFWRHgtrtjTNeQ3W5HM7nFcigjXbF
	A9BFN/GumZc9VL6ytpDv990HoQB/DAIUbx/OQzO7NDtz037z9QznBnOib3yBeEJLBn0OlvmPsbw
	babN2D1F9
X-Gm-Gg: AR+sD11Wq6iDURN7SqreiiQUtSOfcBqn4fHTBFXzlb1g4Dhu8DM1GoFjFxIWIxya1N3
	SqNuIv/aOkQLj3Lq+o4qxoTXEEx0inJ8TptuA3ks0M826A+0U5yqwkQOwnpWhPHDT4JvarLJTAf
	XDQJ9tK2sylUQ1jyjpRvsZUC3CvtnD0PgO3gOIE+kdpZHPYRK+uiy31118FmrH1VyhX495/nuxX
	HUg4eQs7iDVsQdsVw7MyKfc0DG8IP04+nd1HZHeYBEPgdIVBujNj9dEMociL8kGUjAAPBQf4S5N
	5DuO5O1mtAUvY9+aSxs1A5WseHRPYIpGARjKc8NjRJusIUrLK2zgrWBkEYLRJYsQ/lym96J8xmS
	NwApcB2vIvld7LlPJq/gaj0zYErJLEzQM8esmG1ibc6ycAVIYDatDFu05qwvfLtZuyDuHb7aFbe
	qQKkeJMbYaxnPi42Z8Id21pSB10qpRQ/wv3O8PtJISL6kfGJ6xC7fdhfB7FQKv5LgKKa4YVFLk6
	rFartMo1Y8PxC69zB6xc2H7BA==
X-Received: by 2002:a05:6a20:144d:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d7ad7825f0mr614112637.4.1788176741282;
        Mon, 31 Aug 2026 04:45:41 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f698bsm4016662a12.6.2026.08.31.04.45.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:45:41 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2558249a91.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 04:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZRcAK5/y35qQFmgN3gFJqABZdAaWvUK7v+4xNZnqYsjSBj4ZfPCCWu1sluL54V2A7D2pelOTKuLF+9A==@vger.kernel.org
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id
 98e67ed59e1d1-39907e0f87bmr182688a91.14.1788176739296; Mon, 31 Aug 2026
 04:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822112256.12346-1-jeffinphilip14@gmail.com> <20260827035155.10725-1-jeffinphilip14@gmail.com>
In-Reply-To: <20260827035155.10725-1-jeffinphilip14@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 13:45:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCvPSF85ztR7XOvOmhRN_i52etjS36+jXmUAE1ci04mXgQ@mail.gmail.com>
X-Gm-Features: AcwNN1WLAz6VN8qw8vpP77AnvuGLGadWRBZtJh28ci9mCBTda2OW0XvkaTo8pN0
Message-ID: <CANiDSCvPSF85ztR7XOvOmhRN_i52etjS36+jXmUAE1ci04mXgQ@mail.gmail.com>
Subject: Re: [PATCH] media: dvbdev: fix uaf in dvb_remove_device()
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: hverkuil+cisco@kernel.org, kees@kernel.org, linma@zju.edu.cn, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, stable@vger.kernel.org, 
	syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 05:52, Jeffin Philip <jeffinphilip14@gmail.com> wrote:
>
> On Sat, 22 Aug 2026 16:52:56 +0530, Jeffin Philip wrote:
> >In dvb_remove_device(), dvb_media_device_free(), device_destroy()
> >and list_del() all dereference dvbdev regardless of its refcount.
> >Thus, if refcount for dvbdev is 1, it can be freed and we
> >operate on freed memory causing a UAF. Fix this by moving
> >dvb_device_put() at the end of dvb_remove_device() so dvbdev
> >members can be safely freed and assigned NULL when dvbdev is alive.
> >

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> >Reported-by: syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
> >Closes: https://syzkaller.appspot.com/bug?extid=37578f730d38898f4b74
> >Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> >---
> > drivers/media/dvb-core/dvbdev.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> >index d753d329502a..9aa4b8fd7379 100644
> >--- a/drivers/media/dvb-core/dvbdev.c
> >+++ b/drivers/media/dvb-core/dvbdev.c
> >@@ -598,7 +598,6 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> >
> >       down_write(&minor_rwsem);
> >       dvb_minors[dvbdev->minor] = NULL;
> >-      dvb_device_put(dvbdev);
> >       up_write(&minor_rwsem);
> >
> >       dvb_media_device_free(dvbdev);
> >@@ -606,6 +605,8 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> >       device_destroy(dvb_class, MKDEV(DVB_MAJOR, dvbdev->minor));
> >
> >       list_del(&dvbdev->list_head);
> >+
> >+      dvb_device_put(dvbdev);
> > }
> > EXPORT_SYMBOL(dvb_remove_device);
> >
> >--
>
> Friendly ping, let me know if you want me to fix anything.
>
> Thanks,
> Jeffin.



-- 
Ricardo Ribalda
