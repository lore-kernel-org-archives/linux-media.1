Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64003D3339
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923518; cv=pass; b=VBAyJbsyfifqxvL8YQOH2hONCvn70qducI6HZh/jmvDU/uGfBt2NE+vOqVUtNn1cxFKKLf7vpGrEC8w88HSwtaGf2hzCWGXsdADay0Ov2z54LgIDie7DogkLv5zAJUCKvxe3h/nkvf9sPyXst+9CGk+26EpCNHpevBKzAvMUHZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923518; c=relaxed/simple;
	bh=jQCuxAKLPuTjC4o1Qbb81zb0BP3Q1HL9exaqQR2Uj0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xj65qQWqCfAfoNrQXAEXWOD0CI1nxXxu5kEWJRXTuM8ieZwFNTqkH+jm4jOD7A89KRqEqoqO4I2I/1rKnsCj/lrezLb7H09wANwEFYzhMjMUemKsEdgk49qQl34F9gYTGghcf5zR339zlFcXL4rNita11AkgJVlXJb5oGaZWNuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRo1nLs8; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRo1nLs8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c160420289bso142474066b.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 06:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923515; cv=none;
        d=google.com; s=arc-20260327;
        b=JfeUL007DlUFIuT57SWNA8XKFq/4yeSOX39MhjcxQMVkx2gcaELlEYlPKSAbmN0QAR
         F2IiZs0yWC3hkV6ugdntT0BM5gkCJcYxJtALwYm6AjmWV3j3oK7o1WjM4d2tvH+knu4t
         gbH7ZDB4RILN+0IGYv0DxxT9b+I0RNBk5cIzaGZyVvRZ1HSzquSDgnPyjdhsSY/DxqTh
         mP75OFs9AikBwRnIPMqxxoMh1qW/mcg9EPdGy9FrfS4NZdXPYAODESlbIsrKxBjsqE4w
         zH5cDcSOXjvYW36/eXmCZOh8QM0VSfgwTU8+F8g6EzIs8roug5HT8sq0WUexfgiP+7lK
         fCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        fh=UQ5A3owsFgmH7ik08omU0LRwGZilu9Yz2y3cPKDv8Ec=;
        b=rzpIrqcA4h9p5lAR13K6I5iPHAUN4rTPn3Wm1dmYAp2yz6ppUKVaVgUJuDvbspZV9K
         tKhXb3T9FUgh4ePBfzGa+AQ/HYsTLTVRSQwQmC4v7GFkwXlk0FeMG35S7qpRgflEImKp
         rT2nUn8x+wkPcOl6sxONYTrbusjWHbb3Xw3h0cswYcyvuqjTM7WPoiRMOwcDU6mKZc0i
         Wld25mNKcA4bZsrDzvzmhHpqOFy7Rtyk5jBGONHFGeOnnrumjiEhPXqhWaEakJ2omO86
         sPq5xgfXm3O5qfZ/BvSES+RYUrsmFQcDt+/rthMnFgPR1zI4E2krczAOy1AlTlnNjKD7
         27Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923515; x=1788528315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=WRo1nLs8LzVuvvB2vaKCWd/tJcM5pvkaO8tPZkJILHDJovxnOsqenZVMbZDFYmsbCq
         8otLz3qQkZu2DnE8UT1knjq7DmM6wo585l2kaH3qQw1yIfDX61UiGH664jw9ksHhWpLz
         K5O7msdiMFNjObW7K9TM0eBPPfhgcOzjQVDuhroPesadrjBqbCscsJNlTQEY/oz6SW/r
         95rTx94ZDCvcJbZDXYfdasAnr32B1TsYQGf8PrF7dBhOoY25uvIsV+X1bJW9qKChZbOk
         PucKX0/SCf6ESLWu4xmIfIZ2dBpr9VWXm21j07fLnkrdA2yRmguLdQXltBSfpCapmYD1
         ErkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923515; x=1788528315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=NiSsL+a873UwAxAugdFlHDwrh7c/Ku1Q8Rm6T9ulV1r2qf2XI6wNyPhe5UGYvpmwL4
         n1PzQ2FMVI3Y6ZqZshPAyyl9QEH3FyZ73hIyAokIVqgNFU+D8VrcFfLxbpICXepl6pPg
         0/dKjABEeS5aP1mEwKCOuQXBPvbSRrsbctQImXOeh4SgsApcvvjSfbehlrnUIawnbX26
         n7+puFksBngz/cjizQWKrn3cG+u+pBwmPPN6uF4mlPbgh+eQtXe9alp8OkEnkVBesux7
         6c/v0OLz0gsJfrKg0585aCW/w+vMcoouAGcQdzEMkABXsumohkOUMKd6ybApiQFsd/6M
         LDCA==
X-Forwarded-Encrypted: i=1; AHgh+RpZ9A0lvlxO9rJv0PPCnaUFPAU0JZSEkMGDz/sK4i1ITO8P1+zSTjp0qWIN2oLRWiLqIc+bWxCf1SDyNg==@vger.kernel.org
X-Gm-Message-State: AFuF++kgNrg6OqjpenSEFna8ZGqpA1ylrQ/8iAEsNS71sRl4IzZ03OtW
	V2FV3Q7G2wrS/prCkvcRNymb6P3sbADVYhBkVQH810xpqdtPC8102vtdiBINn2AuL4Dt/hdpGZv
	i8wjzD31mq6NTq4ah20/6Obi4KeG386s=
X-Gm-Gg: AR+sD126mkLue//d/lWruzsOzljwpdPMfEyzRASTNpO2muRCzmhaWZMGgHFzIocDC2E
	dxKFWTwjIdIHV5EMiGYijmgDuvNpEyB4NchrXrWGKDXCQ/Stoyrhzq/hSH0qgEpz9DuaOxCSdN4
	7E1vnpiZn/ZnPAzcJkxL9zKcUwzhRvNuuGDlAouo/w9RkF4wT40rb0ofqE/Lb/sG0XZxBkqyxuP
	LfhEXri0I0PN+yiG6307h865D5VaLL082yH+Yx7S38LG8gn2xgKuROBfhdfGhugdN8IyroOTY+Y
	XDHdjkcJu1XOuvC0OZSV1x+Gjhb9csNOUCcnPk9Oft9pOkpSSBeN6hZDwicrdpQX2/qwzpvus26
	TiW7Bz1m4PZJMOA56RTeVYN1YAmnE4H1sw4jDmNfo6L5UHRzbr5tHOkpERsihRwhs63SAh68Prw
	01TIQwlqSIKV0hm/Ss2TAZIn+hzBrY3+X/CFKd7WXzvA==
X-Received: by 2002:a17:906:1004:10b0:c25:5faf:b22c with SMTP id
 a640c23a62f3a-c255fafc38bmr250324266b.21.1787923514497; Fri, 28 Aug 2026
 06:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
 <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
In-Reply-To: <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2026 16:24:38 +0300
X-Gm-Features: AcwNN1WSOvUbreDrgg0-EtCl4ZwrYgBo4_tspVEmoj38PFDJAeL2DKx2J3CIroo
Message-ID: <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jose Maria Martin <jmmartinf@hotmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:21=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:

> > +             .acpi_match_table =3D ov8858_acpi_match,
>
> Please use ACPI_PTR() for this one. (Also see
> <URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.a=
ilus@linux.intel.com/T/#t>;
> this won't produce a compiler warning then.)

Why?! What's the point in having this?

--=20
With Best Regards,
Andy Shevchenko
