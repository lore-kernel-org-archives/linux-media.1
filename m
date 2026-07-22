Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6073E6DC8
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696321; cv=pass; b=WGC3pvPnTZNF33lo481Cxao8f/lSbpz7xDaoH/mtz6ZnnlkqnetCLxlvd2Kpu3uIkDa+WqW0GeT4H1Co0F8gSS7uenNsh2hrezIeGKBktdL+WmNOKmXxtzWpR3ioezhysk3LdpLM4A88UrovonvV+ftYZ0ABPgCoJ+iHv5rwSQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696321; c=relaxed/simple;
	bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjSVCVm0I1ALBWexY1KYrvaQ2kYhEzFrX92lTIYXIKWIn9S2pmxuOdEhCFkpL36Z2+q1ICe4MPGTHNWJoW6CcbSuRbUeNHUOYzu5fPKDYqrY4U3xNBalQUdsuSMcQv5C8tUdMkIQSu1A6rgzR11Snj1S5NqbLBd+L+7+B9DHyRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq/j9vkl; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq/j9vkl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1c26d7e951so214599266b.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784696319; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLJxxqUVLRrhDajeSKBaOIJ9P6Xv9kvbhD9WYL9JZxrZ3GU30Z4iE8OUDhk+6X8Q4U
         0Hdloa37Cn3fA1sUe3lSGCsVL2DvXiPJna2LU5sIdCVgJuSphpxSDr/12+PD7fk+SIQ2
         BMImcHH0xIUZnIozqDy8ns2yu+VI7re+dp3Z6X1mlIcHDwC4lvR4Ni5lAVpqDkHMj7EA
         XRMEXonuEPQz4vbKt01ZV4r3Uf5PQM6sQbXqbZ6KgTHXZvj41m2Aum7zE1+OhxqaLhN6
         oRxhieek1gDiop7trQCzwpGRBKNJWUFwXDXFjoVgCHTKls5GhpToaMHJL0P2+BDbkafS
         3sCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        fh=R75tyB/rhZnACTSaMoLXwv6X1qUtQRPpxLH03SdANZM=;
        b=jAdqHv/46rfSlfzuATo3aaP7219Iin7j/32edRRl/NLwU8onzqdiUzODoZWu5eaZ/x
         eywM0UQbTFMGMGXBYiIobR6zmWhsJW5xq6x/l3BYEtOUMrK7Cp+6odCNLpwFrPwK/IVJ
         0CZFyMKdBbdu/YNxPkK+6JlX0Kw05GHCpI+Bar/2odyoPRoLcU/tnnpCpTsIdrQMNkKu
         /dfDNCK8sCF4UmtFfEDAC+tpVbybB8S6kijv/pPG/ctRetR7Ne4RnS2BHOC0tBSyWgSM
         h2itGTEg7mHZp4KJ7VFWFcBSXGgA88XSz0Bb8uDP6bkv4nPo/mQOjh0BcpiIlAREGcTU
         TTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784696319; x=1785301119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        b=Rq/j9vklo/S9uQU0MMd9z6A3ulh2o03rI1GdOm7FonMVcjYeNWrYg2lDrD07+5pu04
         nzopOzghDbSIQmQ+6FKnXPVfs+1XPrGwq+DTmWOquNeyonKyQ8JJzy8UBFnvlTXhQ862
         AFHFoI4lSoife5rEkiipLre37R/yt/2Uh200xXjAdtcPE3jdyv65/sSy4iLGzi6OtArB
         OQwWa56hJVdZs/qQuchnqx85kOrigQxdh0hVEqm85fNI4Q6k9yZT8tN9YZu47/77e9BL
         2x+avSjZ20jh+gr/h7KyNTGbDq7aZW+/hcnRQrUKPgg8CqJxTBBpSYm25hqzk5QqO0L0
         1JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784696319; x=1785301119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GSR0gsWpfn47zXsK2cT+SXQaixu4TtHz878rL5by6c=;
        b=Te3x8ONQ597oBuAjLISVNglBuCdVV7C4nelpdxJbe/T7sPMB8PCb7v8MnIcZzct6FI
         Whux1MiyfSVPFQt+dis8yPvmXLAK2zh+i44CR8DpFUKmp7pnTSaZ8qR0JMEfibEzVzls
         yo8MqOxkuB7gdxcyITum/mAX0H79DNtEmkEx4wpQXmpHpPH7+sglywyJmbFLkpHaOiFN
         8yaym8z+JsDJ5LulDzhqP6ybJVlVXwU9TUCuPMZDgydKFF3MD/IclxTR6jd4uaaB/1zC
         5ugFD59XnKvj36Ek3puQQZNG11q0x9QmSlKtxRNt6P+mu10U7byDcPWlDQcAiT8uWL1F
         cvOA==
X-Forwarded-Encrypted: i=1; AHgh+RpMrOGY1yEy77a1H96/8+PLot/Ewr3OBQyeJNoWUfv/yCtwOrG/aEJYG8pONJYqkv5sTmaT3tufcOtScg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyKLCjnguHsUpuGDd/5Rz15pZYYBuiXaYDIDHyr743e9aVtmf
	f1wOLeJvzwu9xz4oH65uhtSmM5QoYxgV+4v6Jiy/ZYbbJpcnMkkxYK1Sb6Q1fibHlzY6RJZ4pHs
	rPr2CQF4/mCRGCzxfKigQKR0elqIy7R4=
X-Gm-Gg: AR+sD13IT8rFJ1y+csky662XSsu6Gk5IHZrQz+kSaUhuQWCmFjXof8dOiIwcL+fhBBb
	J9sUBtC9BG1U4WwyxEK2mGQ++C4r/ME8OkXXT2leKUPkKxGyALhFbFL0KGN+1jdOYFd7Y9mQDlz
	0ocqeRQvjK7aROkPajgI+NGHexk6gbh6kjPClIX1Eutpl3g7ZDRVG0xhKo3f5mxrGVmuQ+rkqK2
	nkZgzdcDwNzedZe6Hn8i2NM7/0M8C5+SrmBxxkBOzq+L8HD7yXwJoN+0K8QL7lHzTUmTUo4pz/u
	czghHilNtogvQgcGMBBFjH95Rpaodi5oulTOmSp8Y0qZMStlViSnAaLxneYN0dg2Uxed/NBpWfV
	3RHC1s/r6wFWDQtuz+Ssli8DXSVCqXylay3Elswy6gtIZRGTcS8jp9uLbMdo=
X-Received: by 2002:a17:907:8dc3:b0:c1c:2c92:fd60 with SMTP id
 a640c23a62f3a-c1c2c93cdb8mr154769766b.13.1784696318562; Tue, 21 Jul 2026
 21:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721214238.840406-1-nikolayof23@gmail.com>
In-Reply-To: <20260721214238.840406-1-nikolayof23@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jul 2026 07:58:01 +0300
X-Gm-Features: AUfX_mzCi86JGgiYv2ZdDa9mOYUwwlZcSdNTj_cSAxQsSOFdMkR8VtM0KfpQJx4
Message-ID: <CAHp75VdoH_WCR+erV6rm-LohUYacJN91XsmbNN1JmJDCxi-xtQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: atomisp: remove unused functions
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 12:42=E2=80=AFAM Nikolay Kulikov <nikolayof23@gmail=
.com> wrote:
>
> This series removes functions in pci/hmm/ that are declared and defined
> but never called.

Don't do it per file, squash these changes as it seems not so many of
them (I assume you checked the entire driver, right?).

--=20
With Best Regards,
Andy Shevchenko
