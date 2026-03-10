Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B2E3A5E92
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111547; cv=none; b=lpyHQicwOHSPPl4V6Z33fYhXoPt5UN/FYtLfVTAwcoJeYkahA3zSndGgMVJ7N7F328JPGGx1d/6sl8W/3EZb8feMDvVR/1jZvaw5QOfKFsAgymhKBFSjV7++i4OwVJZRxrmtpOUlz3LyM1Ce9Y6m7GirBuyQw4xRsyKbw+Vigao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111547; c=relaxed/simple;
	bh=dkDiQ8T/dS7rcScVGiSUtmbWrvdcICmLsgYu0GSicG4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FSASgZqOnlo4ei9YoSfYpAjqNiryhi3zgTpeXU7H0PZOH3KVhR5lTq3nasXzVlbgbV5BV5BsJG0oaKI5GFYCFHIxuYehi1KGaqtT91itNK0xhG3mbLYwTDIC9VVhaV59tsS1aeT9mJbGknITUDZsZzA11A8O/YsSDvJEczEVgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJuKL/IU; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJuKL/IU"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so11177290a91.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773111545; x=1773716345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yS9VzDgzb4tGHuCe+hXBByU7p4QSJ0iEjmhSlRsitWM=;
        b=GJuKL/IUKvD2+RmSIE4v4kl+hmNp+95QKBMgn9EhZQzGnS5j2SgoXnqQKNV9uyi5jx
         fU3KPLyKJJO6jllDkbBzFPoN2ylIJL4+TEYHaRvAfEQNRR4X6Fgun86A0ATOm+wCE9S2
         0WSnvSVc9HUmQnJYM928Mx7oYN4rNDzj3aH81KtYPdlHay6PtQQ4SOB7RqA01YJ6wuLX
         MU0AyYZaKus1iSv8IT2L8HOkcUnYNKGVcrKxwZQXM+mIAKHDBF2Bfbnm4zXUj4HIwOIJ
         3P3eASvbkHIvk3+QFHrlCgPvAicx7oNyVKgRe9z6eCYYrOqsa1mSmcleAqiZ0yfIBm19
         m6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111545; x=1773716345;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS9VzDgzb4tGHuCe+hXBByU7p4QSJ0iEjmhSlRsitWM=;
        b=IHfExYoBxemBxG4eEesBsDhq46B5oqhLiKOsWy189DeMX+RGdOzsxGUPuYN30rs7iZ
         D4PjQBFpLTMuXl/fOS7Yky7Ny5Pas115LjkP/xBT9Uas7LuTngt8iqGJExp3qfowvhA3
         fG+S9swIy6fnz9bRvsW533Mi9L9eBYyuZXShK77OBKo4C7dQG3f2b++YLskzaHYsRnwt
         gz9mTPlFEuXbbKUlc1hO4PjtBMN33Uh4pFjFnWw8iiLbILQxiOyH79PJ7van2evmxNV4
         8x4tHnOk2yrIqj8lDxJCBxcerwpwUT5Nu9TWhh4QZlnLOAL6FTH8Trpaa1AxIUgn9rnm
         yzvw==
X-Forwarded-Encrypted: i=1; AJvYcCXRfTyyE7YK5w3kL9a/Acic7ScWfxEJIyLtt2QjTWnUEbelESAeqS4Xu3K01gwYzmNkWynMOZFwJlB5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIQNTeLgXKuYt8sgsZJ+CmHqcBJnsVXoETpcZikW46vVwxLct
	bRGuOe9+n+U9rkSwP2wljCXLJLaUgZKRQNkVA+wwbBjh8rZ/nQz8yPTE
X-Gm-Gg: ATEYQzzVm7KW8+Kb/gXzbZ4PCwBiY0GMdGWw9gceoIZ4aquYDL+r+WJ+O+EjiX5O/EV
	1Xw3Gc2ul+RNJI9cW4hzL3el61W10zMbuw/36/b8Pj1MX0DDBx8Q6TUlemZOdsNxU55PtrybF18
	GX8bw22xJcDtUTndg+RjzHN3c1IC7EpPk7eL5m1NTH+PKYaysKAoRdOxTw7Hzqqbc+Odzn8GZR1
	J2GGCniOsoizkSKV2C0H+07+sahJ8RLhnMFnwG/bIJQ17xTcwfDo3WhRytkN1lldc4bS8aUawFF
	tr+0luOUuKd7nUx3chSFP56ql4OFUCj56h/D//OZZzAFM8p9AvrnfVzR0xq3xaqT1q1R0mk5pvh
	6pa0RmMbpFIkyw923tDlqnBQm+BZHqIz5Df1gAEkGmywXats2JQ0NEzQRAmif7tNPtnhRIyoPti
	TfE/T7wHdylgl7CTSGV8nZdaOAryPeI7zZhw==
X-Received: by 2002:a17:90b:1d43:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-359be30827fmr12323882a91.17.1773111545240;
        Mon, 09 Mar 2026 19:59:05 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:53d0:5b96::e3a:5d35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f08c4289sm1115534a91.17.2026.03.09.19.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:59:04 -0700 (PDT)
Date: Tue, 10 Mar 2026 08:29:00 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Frank Li <Frank.li@nxp.com>
CC: mirela.rabulea@nxp.com, mchehab@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] media: imx-jpeg: convert kzalloc() to devm_kzalloc()
User-Agent: Thunderbird for Android
In-Reply-To: <aa7tLI_S2VYrrKdL@lizhi-Precision-Tower-5810>
References: <20260307210404.1428894-1-sanjayembedded@gmail.com> <aa7tLI_S2VYrrKdL@lizhi-Precision-Tower-5810>
Message-ID: <4C4017F0-1288-4B08-B2D6-C038C884AAAA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9 March 2026 9:24:20=E2=80=AFpm IST, Frank Li <Frank=2Eli@nxp=2Ecom> wr=
ote:
>On Sun, Mar 08, 2026 at 02:34:04AM +0530, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>
>> The driver allcoates memory using kzalloc() and frees it in the relase
>> path=2E since the allocated memory is tied to the lifetime of the devic=
e,
>> devm_kzalloc() can be used instead=2E
>
>static const struct v4l2_file_operations mxc_jpeg_fops =3D {
>        =2Eowner          =3D THIS_MODULE,
>        =2Eopen           =3D mxc_jpeg_open,
>        =2Erelease        =3D mxc_jpeg_release,
>        =2Epoll           =3D v4l2_m2m_fop_poll,
>        =2Eunlocked_ioctl =3D video_ioctl2,
>        =2Emmap           =3D v4l2_m2m_fop_mmap,
>};
>
>Look like it is not true=2E =2Eopen() should be called only when device o=
pen,
>not at probe()?

You are correct=2E

Since the context structure is allocated in =2Eopen() and released in
=2Erelease(), its lifetime is tied to the file handle rather than the
device=2E

Using devm_kzalloc() would defer freeing the memory until device
removal, which could cause memory accumulation across multiple
open()/close() cycles=2E

I'll drop this change=2E

>
>Frank
>
>>
>> Using device-managed allocation simplifies the error handling paths and
>> remove the need for manual cleanup=2E
>>
>> No functional change intended=2E
>>
>> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>> ---
>>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec b/drivers=
/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> index b558700d1d96=2E=2Ebd4b5f08a85c 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg=2Ec
>> @@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
>>  	struct mxc_jpeg_ctx *ctx;
>>  	int ret =3D 0;
>>
>> -	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>  	if (!ctx)
>>  		return -ENOMEM;
>>
>> -	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
>> -		ret =3D -ERESTARTSYS;
>> -		goto free;
>> -	}
>> +	if (mutex_lock_interruptible(&mxc_jpeg->lock))
>> +		return -ERESTARTSYS;
>>
>>  	v4l2_fh_init(&ctx->fh, mxc_vfd);
>>  	v4l2_fh_add(&ctx->fh, file);
>> @@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
>>  	v4l2_fh_del(&ctx->fh, file);
>>  	v4l2_fh_exit(&ctx->fh);
>>  	mutex_unlock(&mxc_jpeg->lock);
>> -free:
>> -	kfree(ctx);
>>  	return ret;
>>  }
>>
>> @@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
>>  	v4l2_m2m_ctx_release(ctx->fh=2Em2m_ctx);
>>  	v4l2_fh_del(&ctx->fh, file);
>>  	v4l2_fh_exit(&ctx->fh);
>> -	kfree(ctx);
>>  	mutex_unlock(&mxc_jpeg->lock);
>>
>>  	return 0;
>> --
>> 2=2E34=2E1
>>
