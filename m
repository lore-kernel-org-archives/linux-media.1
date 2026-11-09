Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208632;
	b=gsqphySg29AX/O7BwgK0GMVdIueXCFwOOqkYsQjbP26S6ypCdK57Y/9uzTpUi90cMAfq
	 zJZma2WJIgGQ7+jbh2l3PYaHXdrjZ43CyeYRNRToK9e166sZ7ggT7BuBFIQcV/KQdTJ2g
	 fWoxFQZsoCcYWvbxdNKfLwAKOd/sdm99lmOpFhPg4K+0hDB3cAdnY9Vmc5r05B85V1lKp
	 WEbkOMcbYxAKM1y5lDwK4fitaC4tKKY6qUQNUkLXBSF+I0sZCW7fFc7NUSm3UypjzCzIb
	 GfIDKT/t1JYw5CcoErmftlmfw2/pTuVbF6QzxWMEmZ6y0IqTxp+oOYo7ohftBtnUxaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
	b=pmPMhR09m9aFEdEj/eQRJZipTHHu05lf4OW1E/j/ZIvIU14dO+RLKU9NKWh/6Gs8DXFm
	 aFv4vzLJI4Qzl6ZpuYUQaiUU/QVtm9e8ANNYE29BX50JwoCUOiWZ6pULCV2RciDU5x08F
	 cLJf12D7DcyGVcQRMk4COWkUbb7sQYbLBMBNNwB9K62uFz5xVbZxG5MD+pJDumdMv+Ra0
	 QDxq38asew2wUYkF45DkbO7123dG5hCzXWIrV4euyNhNl1eMNg5fJo0tc8L2sMqX9NKzd
	 ImQF32NcI5uX9BRheDC8PZKxdMZmKOdILnJlLFbHhhNQWH+jrGF9jI7UXoWTlAcMuvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak04tw2M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825B606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 07:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7825B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak04tw2M
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0cf2c0785so4288637b3.3
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 23:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208631; cv=none;
        d=google.com; s=arc-20260327;
        b=Gy7EmSKTYYluq0LlVZ6MtiBDlw+ZjlPogCqlHlbJFUDTk3nKaQFSMwyVGgo50iBSR3
         gaykC1EukEVT5ikL9Z+Kg5NPmMSvhEZtCtsBn7THSAzGNYGWaO4lq/gCoxt1PRNl+uXJ
         K4ohnsNVP6yz6cqoXRnCfM6lAQ5U8JIw0RprChoI5SMd0U86lkRbK9+z3g/85Zyp77HD
         wo9qcbF+C9cW6Q/vIaFRf+3l1E/hziFvc2QJ213shLXyMXyNVVQlAoTvLpnVg+uzGhro
         OEkl+6UdSoHxddm7Hn7v9gCMZfr5Sq3ynQ46SZj5hsx/Sz1mUFOxF5ImHkYzPBEZdmaW
         Gyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        fh=MOH8f3JrCMxAA8/hhCfvSzN5H39zZnuwHM1mZ9Zq4LM=;
        b=dohmITQDFWXIkOxCMK4JZZwAvjxU/U/MEh78dsaaJ1/4hCRy0a3i7MJZTg76anTmFT
         YYNbbbExFMwoiLh53R1POdQy0DjtptFYGIr0FN9zVHMjaigK5OoRbGhxNFt59v7WbLMM
         WRkBhWTMEZ93qgj4Ev6X/WIlzsRbP4SL6tGLDFPMZJR1k/VCXQPygdLaf1KPIyvcGUrT
         TZHdw+SkevZmZX2X/yl+dpU0lD7/2N+n+R4n7VPUHk8HYq9jZ5fP/50igSzqhc+TKQyE
         HsUgMZj6D9jwjH4c48AN0FKXyXGS2WIFL7Zz07b+Gcf/oYDFwj6Raya67EcvUzsyukt2
         Mw3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208631; x=1794813431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=ak04tw2Mn++2xHlOwLTyQhYjWitumxxJdeSqLBSApNcn4ohDtl9yCVGfcBJIlXg5rV
         kcLmqfpcRcTUw+2KK1gK+9uE1BtIWgFgZXoqIrN6BT4K7YoFKNWC2dowPoGLMgZtXJK0
         lo8xpwGvvNoii1Jw8TIEvUe/eD0zBgE5pamTrf4WxPLA7HucCrTcYuoIWzsMVeCgXAhF
         IDZFuK8QDBX4I5Lj5DMmrbLiDSIcam1qDNWsZCAzMShGO8eytXbSxwcQNSVONbiyMJs0
         Mib6evM/SIxgnFJw+Ge+d+9I0vuZEo+1wHnmxPOSf84w6sPP4sJmonUYiZF/ISf38+lZ
         krpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208631; x=1794813431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkfjb1KMUhCuFS4hDPHj1OK/zxxuMuMzrtCl6Oxe2aM=;
        b=uvWqCfDsq6CyXkCDwbKFf2z3biyX9r3RffWpG5AI7MyYy5+dr25YTIgWzcesZhG7o4
         Xh2iDCVIyessZ0LUGl6LXKVQs8BKwKCpKr1HpSMDVhWdIY5dadD7PNYwDwbIvsfB5Qup
         rLv1HkMs6UhpO4e9CC/oXOTf7g87wASUb+Pd1ZRkXWC3FByBOmrAsUkU3k5xk9zvfaNq
         p4y28LIt+8uF9l2GvYmLXjAwNZqAIPXGnuFIFEacg6gCMm5lh9w5HEcSn6ltD47baIy7
         tI1lzlxaeNBQ8QaiBKfAeeWlkE7yYzzj67TV0DQjkfQp3Y77jK0NytNIO70jC0bHY9n4
         yHfg==
X-Forwarded-Encrypted: i=1; AL+hErHcMUnG7yjoEGHzWqe2NbsCocAb7SuQV2AU6flVJ6miW3xV+3fd/r9H0obWmGezjejqHgVSzaSU9TS3VA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+H/tMNnRMLlIf09Pb4Zk2iHGKjDVrc3uPvhNCAxtv2IhKPZG4l
	+rIr9wxdsjkWbh8ZD0EcJec36C7amvjaLqELNa5NUDFRnwsiCdQxTNE9JcQ1qgSFHe3a56roNCA
	/lSI5LE+sUOXEYtPn6dhkEot6tNpc5ko=
X-Gm-Gg: AYBFou1SbEb6aWQ/cNt4mcn8CoT/TgsabdfiLb1NjWnFLDWMtLjQZlarHW8hcNMzQxQ
	epD57926p3A24KHlzR7YoT1Ug7CvSelWj9NIz0PSYeaW73mE7xsp8qCKfQLPw1kKeVAg6PfvAj3
	KmWQ8SrGlrI/a9gofg+AxlQJ1KLRmGRpJYpe/X/QeJR1zx8B1lRht/AiKoAM7Re7FfHJ9HOPSo4
	oVKaNwodys9Y66aUc2bOpgxWmoWlVwHtrdY7Ec077g1qDhxvB5/jxKT8g+xNbqEolgYNfKZHUrY
	9PAaSiNzLD5Uunc2KbJbESMlZY4sfc1Ir+8vf9WREB4KHfQWSvxWMl5YUDBPHSgWK9G+FaDjgmb
	YdMvpv0wk3sEwe2GIRvHAsPv4xBrWqOWJ5VZZL1a8DdSCq6UJjlk7TabDjEUFGzHeLXvKukNyfX
	7vDC2HlhJxIvRRGDwQCoTgsSBguNmNmRtnXvG6tQTnRLGhDRPxawNBSV5JxQ9imZqnSYkK8H5/9
	Dbu6zDJ54RbqsGe6HKjO1yhDy2CPboC5SD3S+2CUoAIrYTx6BLEwFeXDNkoZA==
X-Received: by 2002:a05:690c:e1c2:10b0:8b3:5b88:a200 with SMTP id
 00721157ae682-8b36cc11208mr12210177b3.109.1794208631674; Sun, 08 Nov 2026
 23:17:11 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108122840.85622-1-lamemorupisi12@gmail.com> <20261109061223.17144-1-lamemorupisi12@gmail.com>
In-Reply-To: <20261109061223.17144-1-lamemorupisi12@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:16:35 +0200
X-Gm-Features: AclHuK-khSe0RY2oOjw5lfhiP__nKv0BAQPXQtNw1CLUbmOomaA01kYuN2YE9Zs
Message-ID: <CAHp75VdiqcjyDaF89s1MSs_Wrs0QomWdsm1fTcLmhEJWspoH9Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
To: Lame Morupisi <lamemorupisi12@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:12=E2=80=AFAM Lame Morupisi <lamemorupisi12@gmail.=
com> wrote:
>
> Clarify the description of the MIPI frame memory layout by
> explaining the meaning of optional fields and payload words.
>
> Leave the frame layout diagram unchanged to preserve its
> existing representation.

...

> -       /*  a frame represented in memory:  ()- optional; data - payload =
words.
> +       /* Frame representation in memory: () denotes optional fields;
> +        * data denotes payload words.

This uses the wrong multi-line comment style.

...

And as Dan said, you missed changelog to explain. (But in any case
neither v1 nor v2 is good to go.)

--=20
With Best Regards,
Andy Shevchenko
