Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E2389111
	for <linux-media@vger.kernel.org>; Sat,  8 Aug 2026 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786208406; cv=pass; b=W5Da/CxgsrXor842ztif8wePW5TKV07GLbn6zZw4ohAeVB+h7ly0+hWZc822Wx4Ze4UdpClPC0XJrCekFZkbfeLmGYJCIRfEZGknud5hhN+YglQOsWhoJ1xcwDc4PJWpswlqHKRC7dCpFWtHDOucqKhexzCzCqrA0GVsFlrIfFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786208406; c=relaxed/simple;
	bh=LirzUpUVQ5HMcBNdyEuocXN8AZHSSuk2FUUMcGWSMJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTEtnSZfWfoDnegFLPS+u8Ve9scsQStdzB3kDysGppbvc8hucUk2lPGOOiXnPvhkeZskuJW5KZ/gV2SSEwfKjQC4XVNiX0q6BTFnTefAxD0TDgL/fUikZ+GQLcaM5G5KzpP+DI2tz4ptvl1lPqq+5KyQ//wwCAA0yPMux1IGjto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHHeEbPv; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHHeEbPv"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c5382806fso6035931cf.2
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 10:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786208404; cv=none;
        d=google.com; s=arc-20260327;
        b=oXgalleAOacd7qeLY3o0RPUNKUyUL9E+GMpOeGPa51WiclkDARM/uysGTJ99KE2GPp
         51ToHyGD1T3+LolXSHQDu0dGYOKCtpzEvjFVozWDOr+VMmV3ir2oMAIV1XsDf8guzeje
         SJWHjvf27SWVbzvVVTZ9J58QhtLuwBOSi3mzJ9SE6N5yPjV1VVnhlsbKSm7lIzPzLzjt
         y+gJPWufxdA1y2GFIByhFlekOUwNHfX5+aY9MZF5NP8OyPU0UvTX0Kx1gHtFtgC4Jxir
         AXucDq6Qr8rhCyLiVz+fMJEijKhPzb8SN+1GBU3pM8dYsgarrgPsyfPXRKlB/I/yEwRO
         Ty8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LirzUpUVQ5HMcBNdyEuocXN8AZHSSuk2FUUMcGWSMJ0=;
        fh=1cRaoZL734Ui2ELNeUzkl1ETSVyy2GohURzQ8YXTpMs=;
        b=m5Jhi8mmFnBL0vWqoVVgAXv3gFfWJAm6iAYp6N/3Ixc/PDkpYUesug6tbmkpEoIzZG
         7Nvn7Zi55H0zGBEBib2weYlGBvyqRlr2hTF+qaXmkEkdrBug4iFsOJfgWxoWjDnTqtY3
         4eT6Qa5HN/VXw8YRf6aIshuTwq2tuFxED68hLqkFyMOpbU/9ukjqU96gfq4sLK0Dw8Mg
         5HCwKzUN5apltVFT8jkRS/TY8MSi0nSptwsG5smXTgXKxXld9nbxNUzTv1/b+rSWSCUl
         RcpAzLXvitDxcJCC9FMTlI2kEaY5Fo4oHvLZ76Gh6ljZBcPkjwbYKMt5nK7VNO6A2lPB
         dkKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786208404; x=1786813204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LirzUpUVQ5HMcBNdyEuocXN8AZHSSuk2FUUMcGWSMJ0=;
        b=dHHeEbPv2I4stAwtx+QNQseaDWxb33ddVnCC8rHBVJwFD1enbtVBFCRocPnF3zYd6n
         e4gFrq16D0VGlhbf4Uun2ew5LHSQczQmkEwDj7LnK3ByTrwmJxfWXexqmJzjhis+6N/K
         igwaO2/Hm5Y3CcryylZpjJS2x5qcAikL1ngJ5huZaRIwmAK+Gwfz0I10lI+BEIHQQ0B5
         OwaV6unm6MEUasgqALXG7fjOLUD4aI3cZXzoBMhXZtmggnKGVFHi4LOfojt8yGfJ5cuE
         16y1UuqgT/do3IGSZAY4mB60jfMgzGo0FSBPo75yWmlFc8EowTcu7aUSvjvikJXJaBTv
         yB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786208404; x=1786813204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LirzUpUVQ5HMcBNdyEuocXN8AZHSSuk2FUUMcGWSMJ0=;
        b=r5O6agjIfIMAU9ht2GoPo2XAPDIJR1sTb8uq2ou/xcRHLmGG1kcTLR1/Q95dd0VbDM
         wo4rDqtsq6OYx0K3jEOUOwGtVw8tOA7lOl+wBcz34PYlUujrMhmH8Fiu9mnCRRs3YnRh
         zcy6O5brmhJqOQFUR94UyJDyhxpYQSoNY2YDye1OcQgm71LzXgjQ078PSXREBJDdonq/
         aT9GTdmWV1bZHtD1VrQlfiC+qa/gRrcjpGSwgyFWje80nPhq2/v+3tZyhmlA3uj6VvTG
         5YY3XFufuDG9HG3lArnMW5yS8RQse7x+djeVta1a0/XOPRI+2RxSEbaHmovray/dmJx8
         ofbg==
X-Gm-Message-State: AOJu0Yy4dZ69AeV21bzvVRobA6Gp+VxK8u5rBF6Osx3wlpMmwvLnze8h
	0ZxUFIPXr+EamMrP9OKvHaaqSSxa2mHEwoWCEeXwOBjTDesIa1l+t9FnidkrKOG6IzS1086YfEt
	dbyH696SJbXxhQxF/sYCpTPFXNJKP4kM=
X-Gm-Gg: AR+sD11MoHuwMr/KqKrhtwJ7bT9ZxPiXuyc6ynHUx6EI2Qat6n5vZGVQrq3VpsyiUDL
	xJBTGsJCmnsLXUEcmePzlnRD5GKGbBkU89XcK0RGDZacyLIcrRATPzrdeysnPAoSwe+Fuj/4pM5
	TT19NXcH43EBGThLro6uwevIurE9BRz0xw1dNfbrZkTqcphKEB9/Qej0Mq4Jc9ic6KDQwtxlapP
	aXJsBDgWtjYlLv55YeZ8YJz4SY/8W9+pNYBhhd/o4vNCzOkhO57gUh1eboKMJO3FD6nA7NFgRP5
	R3KLwTMRPy+HmWjsNnNtI9MrpgiNPJfkhxq/YzD+GhrlyG5uPsFM8HTVDGHwkpGNpF1Ybk0dxn9
	dx/QJbmlJQBKJdx82rqCJ6ou1ooDhLqiZ9cTzaLpeyIdD4YQ1GFwJ5SLL
X-Received: by 2002:a05:622a:141:b0:52c:dde9:5cc9 with SMTP id
 d75a77b69052e-52d0b1931e4mr197618221cf.22.1786208403612; Sat, 08 Aug 2026
 10:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630150403.46327-1-nikhilgurudasani314@gmail.com>
 <CAKD_UFRKWzAahEpxhjEQiwzgrwmqhAd_y0AQzwo3gtz_j4K_mA@mail.gmail.com> <CA+RexfEHzCTwAmkaR7r5pbwy8aUUW0W-Ce0=XnnbYT5xY_HL+A@mail.gmail.com>
In-Reply-To: <CA+RexfEHzCTwAmkaR7r5pbwy8aUUW0W-Ce0=XnnbYT5xY_HL+A@mail.gmail.com>
From: Chuck Ritola <cjritola@gmail.com>
Date: Sat, 8 Aug 2026 12:59:25 -0400
X-Gm-Features: AUfX_myFjb_AisYyKWqtOUZUG3fZrxNlm1NMTxW2eIs3RbDsEwcOuP6n71zOUnA
Message-ID: <CA+RexfFOV43sMv7uu7r6YEzHVx5DB1DZTdneJmD_5Rha_ZMBTA@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-frontends: a8293: propagate set_voltage errors
To: Nikhil <nikhilgurudasani314@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To reformat what I said before, this is more faithful to the original
implied return specification in revision
6266daa65234be4bd9389bad13cdb2f64bc0a2ec, and could prevent a
potential regression.

I like this change.
Reviewed-by: Chuck Ritola <cjritola@gmail.com>


On Sun, Jul 19, 2026 at 11:56=E2=80=AFPM Chuck Ritola <cjritola@gmail.com> =
wrote:
>
> This is more faithful to the original implied return specification in rev=
ision 6266daa65234be4bd9389bad13cdb2f64bc0a2ec, and could prevent a potenti=
al regression.
>
> I like this change.
>
> On Sun, Jul 19, 2026 at 9:20=E2=80=AFPM Nikhil <nikhilgurudasani314@gmail=
.com> wrote:
>>
>> Hi, a gentle ping on this patch. It has been around three weeks since th=
e submission. Any feedback would be appreciated.
>>
>> Thank you,
>> Nikhil
