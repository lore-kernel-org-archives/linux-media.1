Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDAC3ED3CE
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929495; cv=pass; b=DtrVAqkzFtl5WPC9xtORhfVpqMdHd7ob6x+O22bmy2+oRlLoQMROfdj8jL5VMUFt4hXZWRI/PLVt+71a0dwp20gNl77PZgXuDL0T7WBnhOxCbpWT9U76hhmFCkWpYdTmQ92m/KZ2AKytFksbbvUkhdNULuwuYP39xGe7/bZ1Q30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929495; c=relaxed/simple;
	bh=KlIxB3DMOBjHkj3qfvKkhWtQBR4BYmDHWWCcFBUyWG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehFWiH9Pn7mwCans4+DNT64MdPQ6pDNg32FtfWWbNQRk5on64gfFl+ZhDOGbP+QjcrkvmUMHFHbCTNRaILkg1bGUEorXXNd/NZAknUzw5l6JTdBqNtZzsem/O0TrBuik0ZBXte3EGjzlfP/VcBR/E4tX3morc2KT+ITwFCnLPCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMb9qYZS; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMb9qYZS"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e30a06b59so349615066b.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929492; cv=none;
        d=google.com; s=arc-20260327;
        b=ILKHYI3UeIMoA0w6i1qUV32+14Ly9ZCmRcb+OzBz36kWVy+82SajvK3zwWpZPfajXA
         tBr2kAKubrWZKksXZBlRW0fujzvTDoSfFPd1r0DJs8781LzJocyjtLAl/H3T/irjAdbo
         cvyLesxWvw2T4mR16gEONZvVH6KlcvGz16fX4QkdaAxfPtfLUJRMr3mqYFoUyYlcZLQD
         rp2Pk+qL2vy1nTKiNWSZm53aw7Q7z+km9uYVTJkyc8e7e+vGQooXQFQERUz1icMyrBTa
         ox021cwaJ/CEjT5cWbcmOBHWjjfs39OxlLhg1Q0365maE8O1EUO7H25mZmtWVtHAuhIr
         C0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        fh=Z1or64utxwlzSq0hcqXgsiEmblgS4xWWMC9eyHqe+aU=;
        b=E+mUV912TDsOXaDFMvaNKgUbliTuZociILu3dAbH5higk0U69kTpRpzW+p5brUQp9I
         ZK5xOtnOJWw5MKczAucoJF/fGsH5O1oLh2bYHNH4ksdkODApNsjZbnZKan4DXJ5U3evT
         4fevYsn/iDR63mwyKtvvBsoNmR38SFP4NLh786UhLnPe5eyx8r6c8I2OuLLWqQC1iWrW
         9W0WWaUj3z2FryGAQQKPL2Qd/cyHVMtDUIQBnOPA7AbV3v18br8rMqTrF8HKVGJptQtL
         nqcRI0cANgy1P1Xx1RX7/nQlBRwUf3RMleGg2My52OLAYOpxXDS07QvtbN5lt869RDjQ
         oYCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929492; x=1791534292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=qMb9qYZSGZD3eCVgCuGtNJ9jw9MZIG+tXv6pf0sgyxpk9BN6cpoOm1ZyovaxPXsyk8
         FHaUa0/wcqBJHbIj/XmwSUMdUj7FujAnFc70FSfRKvjDl6hFwRiEgEJCJT01M7zfJ6r6
         LnEJcHRGrr7Cz6zw1yMMXAwFhkgTtXTRbml/rRcdGrBGRBUqfnnCcR8VWfKBLgLSvLCJ
         +ATr0vHCQ36BIWph/SNmqwlOBG8/11GJVbuxBcMadqa1SY5nbCbUb6Hty+hbytDw7SDK
         b6kVskrXHQYGxZ4XirnDkKcsiQkshUanQTCbA6hntjfErJOx8FJxe9DkRpuI2IhKU1ij
         m59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929492; x=1791534292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=uUcAFdKhzv9Q476LtsGx6GWghJ5hr6YvJmZ9Pmwww3IpcsMwhM6TPtw7WL/dburJky
         T0LpabrUR0ITNcWZgFsJhflcvTZ6y43l2e0tXs8+BDPiYJJ/Cb1AcmCzdXTe7JP4Nmkl
         hybTfcGVZnJdfaC0QYZboLSFrqHZz0QbE/Aw2Qo8l0ZzYTkulD4lsfAX+azaiv1fBeGx
         uSzRoWbcYw3ktrMn9nu4/EG+hro1JS83+XNCU7wVNZzKOwZq+VunCV2WmaBIRoExJzyu
         9I9Of8kPL/TNPRv4BbNWumthljM/Z1/+h3gNuWnj4ABUibvHBpbDV+GPh7C6SiWeV0+y
         wgwA==
X-Forwarded-Encrypted: i=1; AKwUvBwSpu8jljHdBzNlLpXkZjVOsA4uhp7lC1liOy+JUVOFi0TggS6y0zgL+AyWeXQrXcc7fvWPVw0+hjkRlg==@vger.kernel.org
X-Gm-Message-State: AFuF++mibiizQSGZWsqbXq2LP+XTUl9KZ7xW4DLSL541XI38C9+S88m4
	lANeYqFvO7wTGbf0MFHdf0ZzExvzMqKa6iUs+vI6u8yZuTrNW4RVCln5CRGrJn6uXBuHupJch31
	4mivi4sBTGZWsl/DTz86pSJu8SdE5D5U=
X-Gm-Gg: AYBFou0CnzNK8y8lL6K8+amLiU6JjPu8+CbDzWs76LKXak+h6SOklGB9j61aqoEYsCJ
	WbMVRvWgZb266BmzlPRRk5uUlWKlIjQhr/Q2UWfiJ4nnx1hiaodtliBO3jRbZJ2JifptOAg3f5C
	TdCREaJzdnN8F8ox2loaC+5EKPM6zk2W7AxMX3ej2DKvb0jm7QNIeAJU+Cp+iXC1XOfItou0vXE
	8mJhMz2Wb9X8ukmq60OwMe9W2gN70foowQDE2zg6b13f567xnkq2wxAog83PQheFhaXc3wSqriD
	dtny0n82NaQ9QMoQPAhFt8OERrHRnqtZcxjpOsxkSnwCRf+F7CWYLLVRQ3cEbXKVwz8SOosvX0j
	132Hi7NkGPdrNTm2iSk7h0ojw0GdKEfDyHhfbAoyBO/eVZlb4Rv2QZI36JE/2Cez/S5d3oLk3N2
	Z1QdnhJg3/Fq1v51X0W8CoFh05VIwtul8IccIUNB1A
X-Received: by 2002:a17:907:1c98:b0:c2e:3152:6a78 with SMTP id
 a640c23a62f3a-c2e4ad7918emr175853666b.15.1790929491855; Fri, 02 Oct 2026
 01:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:24:14 +0300
X-Gm-Features: AclHuK-EFQV5WhAXMWIxmr7qjCCaiLixTX8idKJX50cwoXk48nStXfS5xiZzZ-Q
Message-ID: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:16=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase change=
s
> only three source line wraps needed by the media 80-column check:
>
> - W=3D1 builds and sparse builds of all eight affected objects passed bot=
h
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:

You haven't even read what you sent, right?
Your series is mangled (has a garbage), please, *always* read and test
what you are sending before actually click the "send" button!

--=20
With Best Regards,
Andy Shevchenko
