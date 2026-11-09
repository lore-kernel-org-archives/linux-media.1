Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794207816;
	b=ebKlYaWJONoJ6UfUVndvnN9RWmgOQd0q0vIDg/sUviWL2MiGxN8ivNCoD9tfi/WgCFTS
	 zaDGp6WRX5/zrtnJlwSKU56F8qWsTFm15YbUhkFJAzBpPkPtHDEwpeleeVEKQZ1WEUnej
	 g3d9MehED/ayCFvkvo3MELHUsolAgeJYbu4mmInZR24b5BT3Dq4ynwAlxpNfz0y19O6Tk
	 6S2AzE16WXOwzoY9QV3KWn4ZZzo6OAsQiwIOvHBnuXKhF/3Hp2/dwzCdFXXo7rkach9nf
	 KUUnbM8F0uDpba6Jwln9rAv2vitdRJbD94DnHS32AeqIeTJurlxWXP9Bv6rmVnXGEZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
	b=KM5aDpTnXM1zdXeHZT0s6SfYtyO+w8iU+Oe8VTpTwQ99IMU1h3SPS6+hgvENAoyDMzzb
	 CjqRFk6BOFZyYlldu9kr0a/zp9KxH8a5f0/77qazUKsKeqk8QF1fZPrXGR5Pc6Xem9xHM
	 cDGlTEsZa7QczczIxPNYtxt6OQp2tJZLdMQ+1RomWrJDrl2sAAlGcfQtXgDeyFomuBALp
	 MhxAgZ3Ra3WSDtNcUdHFWshfnKIIvDWJBYY401mnXzpLRDER/xjDm4exDjyixMet8R7aX
	 Dx4jN1b31eAe2Y0xUri0Ikb0oqj2+DPp/vk+AHd8hcwPHfBAurKwe22gfnOBS97Oo6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu5dqDuO;
	arc=fail smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10D606A323
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD10D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu5dqDuO
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10d24345dso4123977b3.3
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 23:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794207815; cv=none;
        d=google.com; s=arc-20260327;
        b=SwcTCbVO4kpYMbv2dbs0/XQfUxRzyEGzkmCoH6N6RKUYUBNuY8bM1fw/nB5+YJnS1H
         6Zsw98ZeaAeZ9yFa2DZPJguy2f/Mvw1Z2PNC7yfXgmWePeuyg3ZQEDeGDnVPbbs2IyTu
         FZb9C58eXMAAJEB288Gajac9L/q+6fEFH+8HnvNrQ6P17xUZQP/U9v9bcwqbiRHWfktJ
         3V3KbPagKy+2wc7pd0LOYFK4p/5eVMpjvfCnA/EyMzkzhy3YFeUVqFNxGZ/a0nol3sLU
         9reAe11GjImKzgas+0XjnthSxBLnY4OXLSdTftJg/HvZkBmPolJtbaW92ox7jzMmMBW2
         pN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        fh=GAcJQrRPIcg38CHaPXrr56+YOS8Dy04zzy8kS1DbG7g=;
        b=BGdng58tPySIHe9CBoAV898FyMUOq63sDfS9gAqjPResjuezY5wQFy5QGgdbFwzfix
         LCeVrcqYWn4odehGVacRN002KMpdPmaABTA+zka1TjgWN/0b/aO/XeuRvzu+atI4jlH7
         DQez6b8Pn2BwRKDB8tjt+GD4IUKsaQgaRVJEuZ3yYSOX9Olm2vc5Mcwg2Pm2pLY+QPp9
         F8r7PnAZUx0HzZxgAVQo7lrC0M9MXZgcqdL8JxwlM65tZxqRbcHOK49LlHfVEf5uOyix
         EODlfoEHWVNHK/22hxLyFagPU+e9EKkDhVaPdOS6EIYcvPc9xvhdVAlEEooS7xM48V+q
         pZDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207815; x=1794812615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=tu5dqDuOEbrBz14lFIEeiwU6TsjPrUS44yqFCMW3UfvV+yAOy6HbEEaLkZldFTuD52
         IpKZfC8ZFSn4yzvqA5M9caLL6SmVxQym6tOS9/v84WKHTlkIOoQjHU6upPAsojv7amvB
         k9TLUZqKl7thhrsZzhWGIn+19SS7yTXLweZrSXfZ829xA7dLIlbpT2F57GmNUpBogAh+
         LTFLfelaBL+Ihc8DwQK7Elf+GpUFssuxsRtYEOpOZTAxNCNUyKmHWBzSAM53UDeeUQ+J
         IkmSyhmr4abYaKrZCAEX/0IIihZIU0/us/1NGAYQk7cdViCf7M7cAU8GNv/LTCbVS6Km
         U9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207815; x=1794812615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHkCRfwYbfVaOSn1Fu1U3NToRAfPEzPZvJ+JjBhFGsE=;
        b=m3WxKpMdycRt4zfoSBcddQZBJzSLWm5gRz6Hlpjpcady/gvQYn+9ltPXdXS68LOhFT
         AdGAqpOwV0+kmqQe5+vck7XBO58dwJdSQ1LhAspbFnF1BXoSpw88QnmR095oCzab3vvt
         5M09LoumO92sERWkwwJ8q8wNzh1587e/Ecmbd/7qGsh0vLSQBKm6MlAWP6um8BdX5x6Y
         nbipnRVt2BBIIQVbdzQmQKJrDbEv72ZUU87665vUDehe5jsQjXjq3uUVMaIQZA8FNQJI
         tSeu9vQ5mVxrV1Iph2uWL8N9O0Cp25sT/D24ZMtNqjmGOPkiQvb6TY2lF9masEjO+ka4
         TWgw==
X-Forwarded-Encrypted: i=1; AL+hErHRpiFQEODvUP47GXjJMlSyVtfMSUnHlLC56Gd9f6f7BUa+AFG3G3TSbTJuMaWIgdQCYQzm5Q6qGgG1mQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LFKoQhX7Eg1JMf1FIXOOaiFoLIGjNxINm3HwFU5PziRCDBmVA
	q798pNwWnzWTgpG7NHPHGMl+YLKOyGQpZUo8IEdGe8romg8NR78COGxNeX3bMh87SA4M4Pfb0Ws
	38KOtTbw6hKptkw792f7nIkUBPrQmMjKoyA==
X-Gm-Gg: AYBFou34aT6XxEhq05oDaVsyS0KdwWXXJApr5csED/kInQx1XofjY/sa1QURmVh7B7Y
	QUBQfc1uajrcXctIENv1XKWEXz4hFI1CFfkNChUw8vEvlCPKD0WMNkMXnYr2pBzrKJBSZoScHRa
	3Z2n/fCfVn39KuowLTZPJabL43XVvMTtqVUqH2vBsj/m9w0UjfCLMLXY+hihwjGUQLayKM58zDN
	IJPvTRyg7tTHiu23UhHXivIniYRUDFw8f55b34EzPt+UFTrjaH4s787lkDOwQmZziJ2mWNTm5rd
	l9WAw2twLGDv2FgdtiFj5OPsnE2EvJoLduDO2uO+w55X+Ziy+A3Crg1c47nCtyMvB4KwRdCCsgE
	kre+f4G5nSYTvkmlzmdpMoawuwmSPeAO5YMp++VakuBWVoCABrX2w4SqeVDBl6VKxotv9EkKH1b
	8DYAA8RE4o1Cy7Ya94Q3Fio8r5Gow0KaJ5L9pVFnKpD7rnjHjb4gflM6+SkwT1+gpa6bbckt1TV
	7Pc9nYaMu0jOOXG6wjMLsroYCKDpFi/S7X9eC0NdHYVjPhhXIin7Eo+CJbIDw==
X-Received: by 2002:a05:690c:660c:b0:8ae:87e7:9ab8 with SMTP id
 00721157ae682-8b36cc76c39mr19329247b3.67.1794207814910; Sun, 08 Nov 2026
 23:03:34 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:02:58 +0200
X-Gm-Features: AclHuK8X-gGg83Rocy9patxQxAua7aQBhheDPf_NlOZbCapPhnChNHY7jAPPHQE
Message-ID: <CAHp75Vf4FFLvGCZ8PxwLXDuv9GNAC3Pw0ud=KCdgdsQnbs6AKw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix block comment formatting
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:29=E2=80=AFPM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Align the multiline comment describing the MIPI frame memory
> layout with the kernel coding style.
>
> Move the opening comment delimiter to its own line and align
> the subsequent lines consistently. This is a formatting-only
> change and does not affect driver functionality.

It's most likely one of the very first patches to LKML by you. See my
comments below.

...

> +       /*
> +        * a frame represented in memory: () - optional; data - payload w=
ords.

While at it, make it consistent with the requirement for multi-line
comments, id est start the sentence with a capital letter.

> +        * addr         0       1       2       3       4       5       6=
       7:
> +        * first        SOF     (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * second       (EOL)   (SOL)   PACK_H  data    data    data    d=
ata    data
> +        *              data    data    data    data    data    data    d=
ata    data
> +        *              ...
> +        *              data    data    0       0       0       0       0=
       0
> +        * ...
> +        * last         (EOL)   EOF     0       0       0       0       0=
       0
> +        *
> +        * Embedded lines are regular lines stored before the first and a=
fter
> +        * payload lines.
>         */


--=20
With Best Regards,
Andy Shevchenko
