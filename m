Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9324657CD
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930420; cv=pass; b=QzrbpU4Fk3NXdWc2jLXOtRXGsXGylzBvMz3WBfeOEC6QvMJ/lmFc/EEc+U8zYYcHUVM2Q/BTUL+kYxMVTHiegMkBOY4gd8yTdpaxA4OtOkyAXamk3wkR8VZAMvehR8tP0OsgnM5sWRM3QWnl6M9SaX9uwwuh24yAILiP8MBxTck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930420; c=relaxed/simple;
	bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vrp7tROmT2efzKmnG/JshtZ82BFK9NyeU3AnsaeeRiMRmeci3adXYR2r5D0IyLsm2fs+/f/WWCv786Hnt4VLEWgH4dTY5Z1rIeTmTELiZUO0X789OFzTzgYu5SJn2dIdurnb5liUYdrjGeLwtMPZbOFTsVX64gBWd+Zd2guZPbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKm4vTVP; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKm4vTVP"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82328163e12so123791a34.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930415; cv=none;
        d=google.com; s=arc-20260327;
        b=Ud+CpEL7FOJE48VI6NIasuNSE9UVzMJ1ZF4eO8SnZ60u/cVox1rPao3XP9Eh87h+7Z
         4L7SenscUVD9D8k7eMpBernQVP1GzuHOD82ts/qZoZNnybntsNl/mqTeU8TJ3r+5S6HY
         nDATgylWqWtYfzFmvRTMMpTL5m1+Hr//EwNNxVYNdlxlIaCLHc2d+em2vOUY24RXoag9
         mw2TWPyzxirIomJP3TOOiECMDW7aQwpicECZW9xmoch92hKCC5jxkYYccUH8bXReFQth
         L6zzSUQhvKei+dA5/dntPBmn/cZCfVDXvbPYt47W726CnXdpUSDhlou+7ESooFT9sGai
         Bdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        fh=FCW37D4E3QFV6+mtuBTX6EOjj7BVWCHEvhnqwxvbzvI=;
        b=ax8t8Ul/opZ4D4npRGHCWdFX+vPqh2+hHE1eJksT6HKmCO9U+D60z7wHe/rv9rhvQ2
         /Ja7okOoMGBEEJhhLMFiHG0kCp3t7mE4J6gjqKauf8lcCpe225udJZjZ6er5yF0OIDwx
         R36IbjyAGd/JIImi5hvYUTCmz4tJtwTNNjmXX1UEw6VuOcZ4WRGia26/c+cMHhqlSMdu
         9JgEAKGenPZ+Cq4sI1OeFol0rZu/++xI5fJoBuYj3SOelBWgEtz6PwIiVExbNf5bcD8s
         WphoXMBsshO6Uo1DFxAOccYOQL2fGD0oINjC18Qp0WIJEo6NA9MTERjtxXck72eEYJ33
         sL+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930415; x=1791535215; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=PKm4vTVPKnAuGzBx/+vHBPEpI9VUtVBh7M1EpIHVVFK5aJw0IoOfi7CCNoQ0Yzl/Iz
         RB1gvgbMjHyvULQNWpk5S0yxp2SQkyCO51+UCISwJZbGVg+R3qoCEfvMODwqXyI7NY1g
         bxqJVckDwSrf0D0kYRhlAOVXpXu8LEexJ0I8gGXoH0/zgncHDqbotBBjPuB+e4u8z5ti
         6LwdV/q1AAoUpUnlAcDTpQopTS5eoXZVbx5qYqO8JYJJbMYwNoDKOAw6mTX+bPSbuTYg
         AdwLCKQ6/lfDKnD3kL/PKrMAvEeawK1Y5eOaIex8JYVJHf4yc6RqslfNJ1dw3BDYA+SH
         tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930415; x=1791535215;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=aiBZRJs8EcCyPvhzDmxhKD0cqFF5wEU7Zy9MeI1QAnmFVchGUho1CTBbG9jWkYny8B
         kZKkQ6ewamRTybSh3g9t8JqCgwl22bDUJU2JaaF1hm/QX4u+ehqSMt8j9FDV44GLiw+t
         dE366L0FTvbGd71LA2R9iC0ZRfPsbJjEL3A/stK+PeTDukHVJPXpQ6wieWvIgLZlS0ai
         DrF77h9/7c7P/IBSXt1P9dVmCEqV/WPQ9P8v5t0guBIWNv+CelfUCzQBVatQPSORbuoG
         WrYS8hTj+6Ww8iAQFFVIq0Lm7ZTQCrTJ4kmRFwKkTJXdd8XjZvsmEk6y+jM5YhumELaI
         Jsgg==
X-Forwarded-Encrypted: i=1; AKwUvBx0v0ytuKQH7qNxq1A+khCf0i4fwEpV2UUuqXeJlaEL/tKRYE5YUKs7DI8H642J+r07u/XzYx/M7r86fw==@vger.kernel.org
X-Gm-Message-State: AFuF++nKgG3H2OY+uzObtpd+5nDu4m4Dw3tV4wj08HNYvvZ943RR4AMg
	Sv7ZN2og3DwzOg3p7QCIxFC6bnMt4lou8Pg3PnyU4l/dVt7qR5tbHPWQarQoOdIQH9mZadInDkG
	NOHK7EEzs1tQyxmkJTr9ukqWEQvdqoWs=
X-Gm-Gg: AYBFou1KFhAivruEwBEdLwZQnE6TJzXIvYZJNHuEGkx1WUIxqZImHUNJeCA1hKjFIYS
	hmo/izuvXvSIQ+AEomJDlbQCcEa4dT7moxNv/C1/JbL+Ci2eSVcnNkhZbgJoegjzIZ/ke6UNOZs
	waGUZbsU/5ld5SPJJGEXxLgvvF1CSSOxXXjpwkqI2mS0PBQ2Ti4UVS9uf1+r0PnDMHlpJzAYqQv
	hQvw7sfuH/OhouQqvu/mGihNUq3Umjx9wZjRG2TKzkZ046IIahsmpa2UIEjUhM9xoy0ju30UHma
	Y1NKB/v1VTF2y5uuOSeU6bqUmfkazVsw29H6VA/QnjSMW0dzTNfR8plYDqRghBE20HHJNv11LCl
	5ztS+7DT0F+cbcGq+xWBQ0iEn/Ym/rRJaXcA=
X-Received: by 2002:a05:6820:c3c5:10b0:6dd:4a4b:1843 with SMTP id
 006d021491bc7-6df32aa7697mr1233994eaf.14.1790930415068; Fri, 02 Oct 2026
 01:40:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:13 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:39:53 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:40:13 -0700
X-Gm-Features: AclHuK_f_8PDilm3AcjpkkUSo4CYULlSQZBGWXCxVQAmtvjbpYa5nVZnpOcKW7M
Message-ID: <CAO7O_xiT9L4M2NXz0gRtX-6toT7q6Ec_ZnyEj3i0RGc0q8jdxg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

> Your series is mangled (has a garbage), please, *always* read and test
> what you are sending before actually click the "send" button!

You are right. I checked the public-inbox copy and the Media CI result.
Gmail reflowed the patch bodies; Media CI reports patch 1 as corrupt at
line 10.

I stopped the attempted v9 after its cover and patch 1 when the public
archive showed the same corruption. I will not send the remaining
patches through Gmail. I am switching to a byte-safe submission path and
will verify the public archive with b4 before resending the complete
series.

With Best Regards,
Maurizio Casciano
