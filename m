Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2247CA71
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216571; cv=pass; b=VAFcS0czZKbwtC/K6cVybk1MkgQHK8CfS9fp53KYSrU+S2N1FH1MSicuBglpEGY+ZajwahABiQ6vOQABKdHBVUA1ACurKBMjj4K7DlMZxG3C2w7f4pTiNCAUBWeu1gSbsxHGM5IRp+8Ac9ZyNPzS4VDugrilOB3LvrLRkjeqE9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216571; c=relaxed/simple;
	bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1zpPShlwx1rxgbPy51f85RLYPsSBe14cRRbd6OT2s5kPGCKHNERTU0XXEnzq2He7zevENKlliXFhr8P6pilZbAvhm3TKrhLhi/YfnKSbD0FRfk5deKfLfvE13Ulg0p7wn7f0M9qLNxStuvUabjR6GlEZA9MiFsvUXXu6Vu8cAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4NATHYS; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4NATHYS"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso69674166b.2
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 05:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789216564; cv=none;
        d=google.com; s=arc-20260327;
        b=KACyP4Y5gMLQO4gRkhYBiXJJZ7Zd5KRwgv9rMWe/EM5M30z6zwpSBoUflqKDFVGvlM
         1r0llE3TbcK3EwBKNklOYLLwdTZ0DOmG1N0y0K6U55yBb3xaHtPik2mIGDm5CWhsmLz1
         vxcRnYQemWVUA6y4JFrS1OZoMaiV0LqOdGZo4FTu3QvlTGTdKU3NqS5r9SYRrVwkCdi7
         Zf/YupEbsMY3QV3M7OtXGNjnpcWGMBhrrzef0gyxpLCNE1llL2C976MbZy9Lg0whChMs
         qFfuy4apH96cKm+dC9Peky/McTUlu7X66JZpg5iLqiZB/9tiZTZvfXnm8N1RdQcGqTbP
         sp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        fh=cmoEzhULAPwLQW1qC+0kRgWaWPgIdb6jRxEMKSXninI=;
        b=kAa1UD3mFq52zeVCWVKNEYAyv8L3FC0xJVvPdQ+Rbg9a7jNRW4XANf2FkbwToo6Vl6
         YuPGiu403zH1s3/iXlGjG5RUqGZYOwCV03arLNywkQDEPY7GJ+G+PAOXnBdK6L4kCTz+
         NOpj0g0yB9BY/DQvrJHohMsaNq8eFtBBAJ6C/bekRSoj2ed1hJyaVhQnof95w8O4zjfa
         qqIxKmOfs3u4p2UACk763iEYtEwAYX/taqPl0HW/KPB/bNi5JDXue8jWU/XDitgH0sxe
         GoxEMGKgOA0+1CFN0wJe4Kipd4mCz/ni7m2yckggT3ePFNpxP+4BUzbqj2KrSotwSBzC
         mvPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216564; x=1789821364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=a4NATHYSu//gdtNfe8FJbiv4fpczmOX44N1TyS4O9HqKmJ4yPpfJwQ84ysnciiYHQa
         b+rqtlFe6za6BkBOjPwqDvvO7tnu3J8TbIupWyp2+uUtE6hqfiu755THqyVzUQDC79jU
         eYdXJuoglYZ7uY9KgxwvtU5WpUeCrUZWBfLpp5jjyppJO6ohRBP6wdeum74lggsKnC8z
         OvCxrVsQovikCteZtzVWnvsQ+JnkqWjTve8jeCYU0BT/ivbI4S/0b3dNNiUtfd0+7EnT
         ExpGwleMu+vltTOpj5UasIJWE+hcgFpzN96unOpI2+GFKHxfZJ7M+QZCYARFgRcGUtIP
         mJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216564; x=1789821364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=P2QcbHpYt+aUCmEtrehg/buOrRlPMHH4JWLDs6BZzxbecVCxfEABBIhj1cbwvT3XSN
         nkK/xRIObW4qEce8OxtCSuuZHr238l3hu6lb4LTfwiPMadXbHHwg5W9rPGA9Er+ez9L6
         sQBiGvfQnQJAmgs2/ZvPj76/omVeiDDnHSful0rQOw+CejFrzI7pe2PJAE6MDLix6/s4
         wDUvENpdkjM0ZE/1ybI3XX9Nzqmm/Tr+cRfEpgZZpgpRcm0Zw1AVOVnAIOmG/VD0whWn
         tZEx9vZ8C/V6dU4sOYBWmJfhrtbPmjOVIyQe8U1HfMp+T7u72mZ7zfu/C7Ncy97TjhJJ
         YIHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBtGVKhUJvLN2kARi+K6rBsnDWflSOl4wUUBG+e9XEiuG6OhL8vJjz58J4wWxCXib3x/ySVBC9JYI/lw==@vger.kernel.org
X-Gm-Message-State: AFuF++mt4wFZx7XdYS/hcGqJsaN+j3oXbK9PymTCJv/dHg7odBWPYDJP
	o5qk11KBig0K61bJjPIqkknaEp9RpZEZHff7lPbLxaGPGm4bhErLF8qOspoHBX3yv7aaoWUKElm
	bj0IubN5Tuv7sUkl6IdtDfaUs2TtImvbjkYZGNUs=
X-Gm-Gg: AYBFou39Z1T4JDRJV7N6zLOjdXkLeAqesRKp7mLjrq+2RNr51gIk+GKnROXCeFbBE8d
	x2Fw1ykFIqqnTpzwQyU7kSlAqoYzsHRuC5EgmeltFne+6VMBS39JbzcOugd7VoJ2EghBLYcGrQF
	MqRAASLh9qbHogfNyQ9P/ndG4RhI1COiIVvcOrXYtXGZZcn4iRsIThWxKfFueBQ9pYibDcE7xQo
	fI5ICWa4TwGnF3zm9RgolFl2XdhFw/K+qykNQdxcsb+Utyt7ng9xF/fu3PXyfBwzIefn7GBmgzH
	fcPvhjWpR9syJSVnDbeVx6BARMn5S8BA5pxERmXHPKJlZ8BqFiNSlsc+66Ea+VWVsiSrFbO85Z/
	Ej+JBvUBH/nbNnYUHh2/Oldj/WH0bVH16jFIdqTSH/xK+1WQab0w7TL1zatIxyT8qjPgaksiFQB
	E6jfXZL+9Pokoa7ylqvRzIqEF4VUHQsBggU3gKb9zu
X-Received: by 2002:a17:907:1c0f:b0:c29:367b:b7ba with SMTP id
 a640c23a62f3a-c29858bb1cbmr152369766b.34.1789216563540; Sat, 12 Sep 2026
 05:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
In-Reply-To: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:35:26 +0300
X-Gm-Features: AcwNN1UYah4FBpIaWcKb4z1tHoJBx3miuF5_P4HDrhgh_59ZX4pBct8dP13O8rk
Message-ID: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
<ricardobarbosamscg@gmail.com> wrote:
>
> Remove an unnecessary extra blank line to clean up code style
> and fix checkpatch CHECK warning.

This is the lowest possible priority patch, if even considered. If you
want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
