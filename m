Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997E52121E
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803754; cv=pass; b=kC/Os+9PCWLUX48j0MfRMtxvQaNOwgvmtzdOU23m9xYBCs8MjqWlxQRB9uoq+c1bnrWhsuDrDG5KXMBuEkqsJtAaThwyKLfddrvjriHrmoZqCiexjGINEgngv8ZTxHsD8rbj6qnAfvauBFVLQnc+mOwj1D1+UtTZ8RZDJ2ksIEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803754; c=relaxed/simple;
	bh=VTn5xM0BByZGDzeaW7HKnMpQYAJ2GObAR+ycPlMJjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgNBTfVbIzbPjvQ/NbieXjHEbJW1RklKsIMR4iYVxc65jwmKjl4BYq5ZkkpSBhlCdRsRrkXArbU4CMDkWF0QnF6RHQBvjqNFJGNtGMWButLEIUqSyxA68liYV2yEVOpHf9xd1rdTMKhhoTCBj/+4E8D7MB9eSOAweVGlNpL1MB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC1ZcTx7; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC1ZcTx7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c262bc686d9so366627366b.2
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788803751; cv=none;
        d=google.com; s=arc-20260327;
        b=Xtf2EmibBoYCAC4iS1tVf/ZVwOOIxFbft8fJThak7Y+bb5JSzBVrn6LI28OfziSm4B
         ZcF1/HCi1YgUCpLk7vwxdPbFI5PYAjEmEpdAS7OI9KyvghjdEpvLOVyFpOEQRlJgj5OA
         hOjqYGnR2dP23Wftg4Z0IxWdO3bp4M7ydd3ijvZAdb6amSLVmfKGWhBox07i3WMyq6Mg
         lBht3m8gbpQkiF5t7vDblQrvCanrsBzypZo8LulnGUOAYASoBWNmGxCCFCR7dtkgE+Tt
         x7bB0uF9/lvGIx3t1QUTJ4e8LqELSJvJ5PMSpFR6iIyoH7g1qAVZiHk4g6diR95nofY9
         h0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        fh=xoubpm1yjUHjrKpL7YWvwjN9p9GhBwDgcGXhEC00oLA=;
        b=ZeMYHNjKJYf3ui7OV/53aSIHQhb717vrPPg5XDq5o5AVL8oql8zQMW9i7QeIa9TVGf
         uTQaHrFP7jYXtOykTRlOHyMEY1FxDYtsJH9vGG83tkXAiuQlvcrdVVIYtLEXGh4cYoD2
         1lIGIoMPAr2IpEEZME7nDZD8S2KO4o+T20zX9wNpyTEL7vS5wqrgaF4NCuFJmkjFvWC8
         aGIev1Y7cTYBFyPl6HDTNAmzBN8D5sEiW1QpMo4ia0V++rsMb8M4atWQd47c2P3cFLAY
         Fr/raSfbggvzSesNhwjK5DY8PN0Ltf/XSTHoshcfanEam0KQys4xgTYwHr5L+gRWkox3
         klzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803751; x=1789408551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=mC1ZcTx7ZNrghiB4QCLccW2esf1Z0vIYX64L6sL4eiPFJ8dtoYmtO6/R1us9T0tpHa
         1xwxW8bBZwgZ+73+A0lNfwQ/+scn3PyLiO/vEHyDkNjtMF4ldxNFmOxcVIdfy/scxMOI
         263sfmIy+9vl3F3c1VQCJMNr45jQgRXT6MXRV/eNcbRf6pYTKa3BINowhS3HKFzh+dgC
         g27fvMfsP8eA3SQxzD6KWd0sm+Shpy8ymppN+jc++rHnTzuqxcUPQJFtTLAZlCmvA1dn
         /V+gt0jBnu68Xs2QsJRj/ihWV1eZ3Zl7qUKoWNUarPSgAJY2jH7bBoY/92QTksoxYMNg
         L6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803751; x=1789408551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=AuhHixqnRIXZrd9wD4E2vvNDDes771uzXMZgf1/ULjOO9PsWo/t+aKRllbPXT6BsYz
         wxE8C9IaKVKUnXNNI/LcoysUOaHXAZ4V/2eZzTjJGEqLoq3jfRKinnzq68btDfZ14Zs6
         hvKBc7A6vOc8f0fe33+Y4GVsztvpAdddGgIqUGqkyQFO+IhvKXwPLXIB8FWk3Tl/dkJ/
         ly1H4OqUwDoiGCqYgFjbzmCaWTjtu3aQXn8lcAECVH0c7TKKmAzCW2qhLxwckOvEh4Tb
         mbR1Q48RPS+YCm/AtXvGVYtC20SkFVRi2rvF7ROjgtS1VV71YRd57fNpJQR/V5Kgbd0V
         MqZA==
X-Forwarded-Encrypted: i=1; AKwUvBybmSG70xZ3BC58i4mC1b0e+T7YoT1NDJDpxNWBWC/XdiWRnf0QnWi9MKD7APs1OOnWSIpDJVZB0v73cA==@vger.kernel.org
X-Gm-Message-State: AFuF++lfAh3fUZP6gZUdUcxy+cVkeq0JHBZp3uVH/qp0RWjMYhsDwsFj
	9FUYT2GrepPNpVRnNuNUUi1CIt31fCfwJWx0OyXBJUaKO0pE/QBD6DSXtXl098aE2EHsBrzdUzZ
	RHpNZeEoaWCkmQD6m99XWk3cEGgc1ZFfrrHnDQiFIYQ==
X-Gm-Gg: AYBFou1pm3MZ7mdezJaJiJb2lzpcEh8iuLktDx5kphU9pQLmJWrzxvJefk4kMnqPeii
	Qtz5s0A4zj2b7m60+xaatBWFpcsvdTHe0w098lbAudbIAYWarzEvJ61gM0AL0fAdLLhZ4E2qcpx
	wA7F1OcXUftsIqzQvKJuUWidGUrNH5jxSgOn0l8AexANjbtBSrl3EBUaePagUaHGFvwwHPKwrsD
	u5bxFRlohafgPLQzoC3RGTAH+Y66tlBwn+WyfIHS0iLWoGpYFd2IeiBRHPL0qN5M+kokRpH4OnB
	r7842nzew1tI6ygKyRdJ/P792JQ9s/DbWFomdrG5FnNRcGM1HchacFKLwVLG5mopkjbXZo8No9d
	oX6vB3rpp5YysyC4+A+uxjhAEwv1T3Cj5M5W1hSomuuv6DysolTjzSf9DM3IsbTSrqHLkaQyCSi
	ojj3gHazPCgCzvUvEScn0oRu4eDfvDEw==
X-Received: by 2002:a17:906:7956:b0:c1f:c061:569a with SMTP id
 a640c23a62f3a-c260c7ad26cmr891917366b.7.1788803750800; Mon, 07 Sep 2026
 10:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907165033.8460-1-lalitshankarch@gmail.com>
In-Reply-To: <20260907165033.8460-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 20:55:14 +0300
X-Gm-Features: AcwNN1X4dW08JTgOmtGLWwxfBMjDqVtnJdTI6vze5rZDBBq6vA-ax46gyB9xRcc
Message-ID: <CAHp75VdsCtQ5aSLB58fXcJTpQDRkgXOFyhTjtvOMCfSyAp3TvQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:50=E2=80=AFPM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--

These drivers should be gone in the future (and the regular ones from
v4l2 should be in use),  but so far if somebody is happy to take this
patch,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
