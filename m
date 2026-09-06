Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F92DDA9
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679948; cv=pass; b=UheiOIaqgbnotvuHDxTBH7nYb+CqtZKv4+CQUkSqWBTpbpBzTPLfOx7X0tP0dTahzzQXCT+EQr9dv5N0yL10Hdv+zAG+qo6fEHVMI+Fol56AQ1RmEbl3w4iRe03Nxpdawek1HkCBbxgVgx/Fvt8Yd25iWFYvKBa2STSakl/Hinc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679948; c=relaxed/simple;
	bh=38xxFyuvZIF+Mcb0oDEHyyIdM03D64/gUGg0xDZ+DkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgJurYVsuseGMVWjNdRAYqfIhpaVHcd0mPRqEImqEVloEDB4dsA97PdQQ4FcPaOMkcO5HcOB64wydktR2gpQIkxZJnYzzmVaakPownuiMLkHwgZ56j/j5Nrlh85P//poBdDom4IY3UWpILT3dIqtfx7dwJIfp/+ndxHKa9XWTdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZorRkd5m; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZorRkd5m"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250f28f1cdso381553366b.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 00:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788679945; cv=none;
        d=google.com; s=arc-20260327;
        b=EqbTob86/L9jNNb5FZ3JTfFW8p2rcj+Xuch8kdySsWxlZVzF6ZoQ3yZDiFpuSp6b0F
         XBvnMnnXzrAJR+ukBGMiBt9sZFlcX7Vhf46j9JJv2zfZb0jchXKqlpPDF6+bXLfyXyHd
         7E823/8Y58CiY7o37Ui75hJVEhXl+3cRqdnzpfcXdqLUA9q/mrA0bRV6VsVjCTRJmipU
         WzWeXf0VQLl4vqHemjoHmO9rRT86zGPBD4T0iYqfCsNeH7+WdVR/rgigIhtyfQtxhUEx
         zNejanq+lIklEa44s3wxekmrzs63FmKVoN6hMpI3QrVY6n61UMGTgAMnYselbHyEnvqn
         fuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        fh=iCLtoVFvlK5jiAVXgBezbag95/NvQEIuM3UG73xHwys=;
        b=lmFi4bo/zb7+KF2sWZBkPxfKI+UZB9VsljmBNLJXpL5s0iQnOGPTVrnpNqygTI1Lb8
         NmYODtyQPLvvjPFZtiWZgGVQX8aGw4JMfZI/rF14RKXdxRY3pkYmaFFx9oNCQCBAUUpX
         48qqGV40tVXoBwflVbiKFxfhZxqLAnDRv2EoKeHRi8Zcyku5UEpAQ0gVGmL1iZOoLr8b
         6K28u8WEkFEsr3le4hs1vaCtP+gTEp+3GHnwfgTC62MDFGNkrtZDeyBqA+hyEgSaG1lt
         LO4BEa0J2Kxfd9icrYU3lj+NIpSNm97567dDyYwL+HJELpgAYq/Sqa6eCvEFjWR63re/
         9+4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788679945; x=1789284745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=ZorRkd5mEmFhkouKQ7TPbC/pdIw+Sxqwd5l1lXfuRXFbipBs7HUYAMo+kWYda/lBvg
         Y0zZkuweKaYWjna36kiQ8DLVgL7VEeyGkmt/Z6E0Wapj5lPD3M4ZPVSrFOS7oTVGwZyi
         zPN4oHaKSVXuE5rftUCYDEzBwhxPKj5qOGfn/G9qs9kO9CGESU1AmcKxVvEhpvfF/uIQ
         avMpFEaQx/ILUTnhYFd233/fTWh7s8kMuPlovKlfGpitOfUkG3ZIyUKOnOLoM62oB4Ta
         kfxfMqjJtYAl0L2MN4nUMO1KMtJRPs2dLk1I4OMIUSfJVdU7d4igmtR6j012FOQWbfe3
         GZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788679945; x=1789284745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=M89CL2yNxRpQ+PPnnQ0X1Cmbn4/5pL16Yc+hwqZgu0jmk29eNWMHNPCCsaGj/FtHP+
         /NaAjiS2OJ33mEpMUCnCodX8DWhiNj8hg20MCimLgS5GNn6koD5mEWPvLWZiuiUV7VRc
         Csx+vd62/2KJIlu0SaSEP/udg9w6kEmJ7alvqc+NUx2Bb9lovowhjdyPPc3XkAuZPSpP
         nkveyZ5KcTLR7hFyhueSup12SgbWsaWpepYbOSdnzFlvv4EPVQuXisD0fksTK90hSbhH
         ZRRgvVExVZIK5DNfsZvjjFP9FJZJYCrnj31NK2Kdw2EUDcXe2LN5gUN33PHgh61smlIz
         Pp2g==
X-Forwarded-Encrypted: i=1; AKwUvBxpM8l9y/yHKaHjmyfZsUCn5r7y0djV4hhrO+Sswx2aYS5b1b6S+1bktrULyQ+HkzWUkXi8m4v5dlFyNA==@vger.kernel.org
X-Gm-Message-State: AFuF++kERJ0yLkA9+m55oLXSoxy4lkMUftzrKCYfPlhiPPZRF7bfdu+E
	sOFbNgNdGnXHIPmeM5k2BsvvGmF4sUZkt3D7HZFHHwpgy3QOYHHkBneRyroMy3uP6zHX4fPFaym
	Y9Hh+IyMEGwGWd61kQ+P3x7QyrLpJU2M=
X-Gm-Gg: AYBFou3nq3v8iXehuzO0qC0nWLCkzRUZmREiSNVyO/7x9r+49kHV7mjkktXGk70v73F
	swXPxSs6JJni5uEF8HZg1T7hHu59gJQImxVJuW3djwE+O/AXJYw5YbmiZpRwhODz4F2sHENcAlW
	KzxgNPRfs3QtKe79Nj+xPHJsROKiPW3nqxsWk0oFom1b12143tXD0lVOK4y5IpvdkJbX5LmrtiZ
	dkbPJnsUC3HrVmVg6tUf16NXPYDVHaXS1rZwfhmnf3nUOr9SjHfVOXFH0/B6upuxSmZ522A/SM3
	oKek7ef3zi6YD2kyQTkDAMxOXS+EQXyFpH/x0vIi04nUEufF3MW7T0nxgGKyZQ/j8W77QAn6yUL
	/plPXLJ+pOIoBuR/nhTgSB1LImFTaUkrn6KPEqt615FbQffKTe4zmMgS1wpAJpc9cZ2iIJZwrc+
	wBT57duaeMbXY4tGQBCXhRQiJqrkQhxw==
X-Received: by 2002:a17:907:c28:b0:c26:19de:9acf with SMTP id
 a640c23a62f3a-c2619dea6efmr444606966b.39.1788679945279; Sun, 06 Sep 2026
 00:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906004958.26041-1-lalitshankarch@gmail.com>
In-Reply-To: <20260906004958.26041-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 6 Sep 2026 10:31:48 +0300
X-Gm-Features: AcwNN1WzAwLmobc8VQofp4aTL04X2XACY-eMvYBwNFs_k975zra_jqGeD3A71Bk
Message-ID: <CAHp75VcRYL4idPvU3tC1nPO+HbRAoO63SXh_oqATShLZsommiA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:53=E2=80=AFAM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

...

>  static const struct acpi_device_id gc2235_acpi_match[] =3D {
> -       { "INT33F8" },
> -       {},
> +       { .id =3D "INT33F8" },
> +       { },

Follow the agreed style for the terminator entry. See Uwe's patches as
an example.

>  };

...

>  static const struct acpi_device_id ov2722_acpi_match[] =3D {
> -       { "INT33FB" },
> -       {},
> +       { .id =3D "INT33FB" },
> +       { },

Ditto.

>  };

--=20
With Best Regards,
Andy Shevchenko
