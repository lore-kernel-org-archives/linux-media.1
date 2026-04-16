Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FB3ED5DC
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370007; cv=pass; b=E9BdhnFcdSUUTd0UHybk5NliXM3v7Cg7nVh8fKuZWj+UlzZ8nDhgi13fULW9kfOxkTQSwkT/tTBL3pXwxPs61Doa6EMSTr/C+QYtjmmyQ+drO+H78EzbUvkoPbG+NHYky3P2gEF42ZmtLPm/NI5Vt2LTZkXwAGK9Uk3WtgR0VMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370007; c=relaxed/simple;
	bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7dB23FwODtr4kcK9Ode51Kq5+YrJeHqlAQy156v/wzduLH3G+MJWWmjksxNAltwJC7KCFWSt0gbzRgSbpGMs1gzdiyKi7H9Mu+ryvgWJ4BlYCJon5C+/8Rh8HggYVwqbWESb0+J5KYekT/zofQyahYybCyPzKmPeFDenkd1h6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd+CIbeu; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd+CIbeu"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6720c7968e4so2331917a12.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776370000; cv=none;
        d=google.com; s=arc-20240605;
        b=ODWuNhq/6uJywYFqzegrEgRmrs2TVY+h6G6DAeBGMt8H9O8iTm3w3JwBQVFp6/Xcd7
         8etMRSZr/hJloSxx7MGKffZ1GhuTZVBXT+K5Jzqt7ukNydf6odHVoSq/uevAOvKjbWdx
         1VOHwbgF39sLGanuC0VjE9WmnaK9mbQpzgu8j3gKUkREwD0f3htb3NvlstNMnuVd5oJm
         W+/vmh3Uuxu7K/CiidR5QTse0I5AzjeT6ezZJYAE6duOWrnJwHBUCvp7r2dz3EsUGSuf
         dP95QdlXm60JTQ88EWzn1h/6VP7+A09DOM/1j2LbyexpJAn1EOXSxRE62W3uHqkU7IzW
         Zlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        fh=4IUt8CRwE29+D4enDyCzL6jxphn6sgV77FCWISdEJfE=;
        b=d6qZRXQdSmkpVAQVOPseVyzaforIwzd0142yX3pxqlJoU6oDToMawOykn+f1Uqx6LP
         f0ESrizG8bQJYQkeySjHogBt3jwwHYr/w+wiaCh4VI5/Cd2E4mlPdM9mZJ4NJf66Tx8t
         9wUdS6vwVwJIWhM+mqpsKBo47mvUnDRNev0cQ910puxt6+py9P2bC9UTklzNCCgaKD3Y
         A+9QhpuhNES++Wq9F2+aXxeLOCmLoO4mq8bsCJRvv947CKk6VgDRCOTWKZ482J8XSuJ+
         Eoe+zL1E6MjYNsBJ6OBTFl5fvIPA3K/mME6KMSt7jH88fB4MBLA0MtyQvR0eLULyr5ev
         MvXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370000; x=1776974800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        b=Zd+CIbeu4/WjhO14yihtoH2ozkWNKtdsRFjtrkof5hQbkyrJde/2mT15ekMmKPPier
         GxDsd8LrfNs0oxq23h4PhGGmQwXjQWmG1qwvPY4ZERO+e9Stg24GzSzhfRglJkRflktU
         cQ+647ZjplA1OeE3/7E9d+dZtWxBGtRbDNecq8RRMYSTJ5FJM76OHuZQu+Aw4ln9hx1Z
         qH/ORGx0o1JH0V//Plo0NKbECoWpM6g0rjCRUB4Z3VkdjodRTIRsjh/J0ZJ1hPSmpBjH
         Hbj1f0LQjNcXUfudYQoUvCZrHTyo0bnBiZIUlAuZe58+NXwKHyerZlXlP3bwz/9CIMVS
         vsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370000; x=1776974800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        b=Han9EmkRFcad3gy+t+f0FJnTPuRyDuylSGNIBWw9Qv29Iw5ViSBAD8g0NmlO+2935Y
         1GcfdAReR1mKUCcVIzBOMfyTooniTzbbDgkVD9hVOuITo8tP1FZwrIydqE5RxVEOub/E
         IoytXlogRkn1upNv37u6F+dTlFFy0SWv5xfEs90FsOFwCVDx8zPORJG0SiuyNUC3X80K
         9fgkxXgw1CbM62QGxh/xOyOcyhfE7g+e/GbTQZgVBdZmoHDIFtMaEhg3S0gHy0f6b1Qa
         yUhTezxG7kMOi4+lrWM1cm323CXcGKk8ZQd2MUB4qVG1wtW3zOhjcgGyJMy2b7rpRkpf
         En6w==
X-Forwarded-Encrypted: i=1; AFNElJ9in8/s145aVQml/jOaBsQW/u19C+T5tj0cvccUyoXn0+ALoeb7y9YkXbWOWpVf9DWwpmpSnp5WysqTXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbwafg+fggUA4FD1lz5Q/zGT2GYnbWB5Wcy0APvIm6lWVn9MaQ
	C4/suZMDljPCOqae/NMawBxptS+ebbFpuF6i1+NIWt71ZBUmzFDBVmc1nuuxJy7U8mKyhnIxY/w
	eANV4OcIzOzRTjsy69e83W+namvdW8Og=
X-Gm-Gg: AeBDietkOSSLb6lbY36Sw1OXNUAeiV5fGkmwNGEkcl5aNVhj1qz5irBitwtRoOYiAaY
	e6MMXfED/9QDOzU38eEM8wWezU5UC3Yyla+UZt/mwx+wwM+P/c83toUhS74MdBAciWj22tANCzn
	W6hwgyFs58QDXwrHRE1R842O6OzYgdgow/FB/jH0s2/3nSACMuM0skdH3aWMjyXfoye2PY0Y4gR
	i7gILv5mlfCZlPOtl9n4ZBSw6SJOlHE2rZDXqAS5dRHf/UJytPiXm0hDOfoWM/rLtMoQQEqZ6rN
	utqTykjhF6FaDQDLg5nodipyHtgAsWNkR5gax9phVea4B7Bfeg==
X-Received: by 2002:a05:6402:22d2:b0:670:7006:6053 with SMTP id
 4fb4d7f45d1cf-672bd030266mr234125a12.11.1776370000247; Thu, 16 Apr 2026
 13:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com> <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
In-Reply-To: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
From: Pedro Pontes <pontescpedro@gmail.com>
Date: Thu, 16 Apr 2026 17:06:04 -0300
X-Gm-Features: AQROBzC-EX1p-Maoxgj9JeHTXDGaZI_Q5teK_YMXo8FiyszicjSakN0eu5QKZWk
Message-ID: <CAG1t-2LVK=QjcZ3pmikjt8k-x9-kqXvrDrbutXHp79Xmkv78Lw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> There is already a patch doing it in a slightly better way. Have you
> followed the mailing list?

I searched lore and patchwork but couldn=E2=80=99t find the patch you=E2=80=
=99re referring to.
Could you please point me to it?

Are you referring to the patch I linked in my submission, or a different on=
e?

> Please, better to help with this driver is to subscribe to the mailing
> list and review already
> submitted ones.

Understood, I=E2=80=99ll follow the list more closely and review related pa=
tches.
Thanks.
