Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1B3BBFCC
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048318; cv=none; b=ptdXm3a4jgCvDG0+wiGnb+acd8Ib08FzFUXLFDnKtps1DLddS5RPmLDTt1W/pxYGrw7yrHQDpREVTn1J9N6XUlM/5+vWdCcXHcCs7guot/gZdEbj28X1fh91T1DCXaAIgfTbwlB4IyZHfiIf9FpZSbU9Sbt2U5+9WwkezrHwECg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048318; c=relaxed/simple;
	bh=dUjKG53ZlFCLSApN1wFxjTm4nhGX8LGRJK8VU5dSEqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAEWOKqGr1vqst5maZ3BcuLyhwvtziYBRn2pRc/rjOcXIwCDRow1TkRxYekbcr++DhH4dIgluyctqEcRdnxoXlm5yFyjBhsd5smch/HSxfVflBR7GZX3Tc81vdXcApCyvbou2KLHz43B1FlirLBTWiLye1i85Y8Yqw2zYlYKc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZEgD7pHP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZEgD7pHP"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso6428279a12.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787048315; x=1787653115; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USZtO/EZE0nd7rm/IM6Cvup5cPT/v7JWv+iAOXGJowU=;
        b=ZEgD7pHPrpe8rdpw391A1hWVkbYC16Qq1ZrCDOMBzsIYBZ3sn4l9o6E5/59bVbQh1Q
         3UIfYUz4tQcNU5IWPC51+zzFdLFj3/1frL6J3bwkvV7BTiYFVzMuGICc5SCNoVBXCfO2
         op4EjRYKodciikqr80CdqoSURT4puYshI/CEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048315; x=1787653115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=USZtO/EZE0nd7rm/IM6Cvup5cPT/v7JWv+iAOXGJowU=;
        b=jvCe/clLL/ThZCK2h/lWYIJ0pSt5Bxb9NqGTh+qRZdMw1E9ZUtAf7VxK1VUCSO+UG6
         bSWtmi/o7MAQCg/r9JOcjPgOpIgXls8SIAbkqHRHMbYGRgs0kTV/0qZG5O4LyYK5TWpZ
         TaWM2mERD2K7M/RyB7g79v3LDqeMzV1cS1kQghHN/p+0ZWb7vaB1oBQbQxNpveJGZmyx
         szWFM57ULT8Idqsp3n6ajw6LEzHVti8Qvb8LvG6bTmGA8knkaxw669C67r2VdrMwdeg9
         Rk+FTolFVd50nh2DmSFgTR3B/Xov51C/ryOAy+LIke8kyxa40USfhuorvGQINGzPCzm5
         PICA==
X-Forwarded-Encrypted: i=1; AHgh+RoLBuqNakNq0dYXTVWfWsGAxTXDEJsbxDbvqtFwG/A28dMHtEGJf2HNS9lHOHH7NIVwePdXzYDbISDwfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyh+dVsUG3camTf244qPs93ZQehvyxpFhmcpiO5l27ikwicMRb
	V4gMU8Y6mqaZkABbsbXX6AAt0F3cf5bRApa+iWA7lyfrH4hmlvDeeIjmxU3TQhfYwjT7FMdBeQo
	XeIBQ0RJM
X-Gm-Gg: AR+sD12sGhW+AJeY8rr8MYzt5abu2mSRX867OCAuoSTGI3knCdS9wArGsJ0anIOY606
	pt/QFoDn6tx624L2x3v9vNLY5RWwBtBjPxzk3aqWm9amJYO1k3Sk9gc7mExMGi/iNh+1XHLmBfQ
	RgL8wJmArorkUaHxmrT0UNaBFjvG+40zKgTriNO6gnLHi9sDa8aHfdFl0Udxi7h6VIuotJN1Qh7
	QleiCUafVwGypC8cZwIKbZelIre2trHRsJy/jYea4uajdgaKlHiizsbx7CcuOseFzzK/jiKZEF/
	eoswUXMo2QylQ0QsI7TgxwcXJMxOXO0G7vXzxl8uj5kI2yGbmVfZ8zuBcmW7oX/ZTbjwxpF6Yn9
	y2sjakSxfuI5dPBhwIZVMo+wCkmg0ncAlu7N3rsIIR5cT56nyQM1E7nUAJ/wpoqSeAsxXAj+UT0
	lX/q8H7uZn7+IvbgKf/alKO1qF1AzqwY3WSwMJeDX2yx8N+xpNDcpGqWQKf5ckMmSBJwmiPuBvb
	OCeIAJ6L1zSU0etY6HHg91/0z0=
X-Received: by 2002:a17:906:9c8a:b0:c16:8404:4631 with SMTP id a640c23a62f3a-c2188ae7e63mr435201466b.26.1787048315144;
        Tue, 18 Aug 2026 03:18:35 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm109803366b.41.2026.08.18.03.18.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:18:34 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso9683245a12.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqGfuUAHXgb+hq0eyiRS9YOxf02bbkJm+V7A4qvrsT9VsyVgnnZmzrr8AyA5U0Rw30kscvTkyJ1n/DaUw==@vger.kernel.org
X-Received: by 2002:a17:907:d08e:b0:c1c:2c32:1163 with SMTP id
 a640c23a62f3a-c2188ac8fddmr388097066b.25.1787048313110; Tue, 18 Aug 2026
 03:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCue8yyiGubzbAybRqSUTTFuB=-Y2TZy6yvOx32SpAASWg@mail.gmail.com>
 <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818094010.353021-1-natalie.klaus@runtimeverification.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Aug 2026 12:18:19 +0200
X-Gmail-Original-Message-ID: <CANiDSCsW8K3wdwMPS+Wq4f1Va_g2TpAGpoHzGSxHUUt91Jkrhw@mail.gmail.com>
X-Gm-Features: AcwNN1VTBT1es0-Wv3wLLMGNOoRQPfKzg5g8chBosMxHegxxzhKvlrVnC6BIGcU
Message-ID: <CANiDSCsW8K3wdwMPS+Wq4f1Va_g2TpAGpoHzGSxHUUt91Jkrhw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Skip frame descriptors with a zero
 computed size
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: noambs2999@gmail.com, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha

On Tue, 18 Aug 2026 at 11:40, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> On Tue, Aug 18, 2026, Ricardo Ribalda wrote:
> > I think we need to have some consistency. We cannot have  one
> > condition returning -EINVAL and the other skipping it.
>
> Agreed, and your shape is cleaner than mine.
>
> > If Noam is okay with this, perhaps Natasha could prepare a patchset
> > with the 3 patches? (keeping Noams author on his patch)
>
> Happy to. Noam, are you okay with me carrying your patch in a series?
>
> One question on placement before I write it. Your comment puts the checks after
> the frame interval parsing, which is outside the !UVC_FMT_FLAG_COMPRESSED
> branch. Frame based formats legitimately carry a zero
> dwMaxVideoFrameBufferSize, set unconditionally at uvc_driver.c:265 because the
> frame based frame descriptor has no such field, so a zero check there would skip
> every frame of a conformant frame based device. Did you mean the checks stay
> inside the branch with only the return value changing to -EINVAL, or outside
> with an explicit frame based exemption?

I meant keep the checks on the position of your patch and Noam patch.
Sorry for the misunderstanding.

>
> I will test the refactor before sending.
>
> The Media CI failure on my patch is the missing dependency on Noam's v2. The
> series fixes that.
>
> Natasha



-- 
Ricardo Ribalda
