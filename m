Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC04322FC
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228293; cv=pass; b=Ai6aoVLF1jYiX8SWK3Q1JqbzwhAGyVLZf9MSHoOMdnGvwq44qrhpJ1e9rxTBWBE+0aOUfZqf5yf5h9nNQRPobMIhYP77+xosPOBNM++il4PR5aaDHJfzbrG53RhpGCGquBoF91BsLOysmUO8R+2V+1MXYXpRKBnOPexkGRTJOK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228293; c=relaxed/simple;
	bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5PLCz+XjybGu7IK5SSuF8fUDeXk5PbIJxqFZf4Wgevytme831dkq/fImqb3wYpe+eOFW8pSwX7BHgQS1/9mWzZLuspsm5yHjgzY4/IOX8eeOv1hDh5bgfFV5psgQT+AjH7V2+Dg/IAL833jxmoDVTlaUPKXbBmvHkN3u2sqoYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flUFPye+; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flUFPye+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so1580496a12.3
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 08:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789228290; cv=none;
        d=google.com; s=arc-20260327;
        b=iogWz5zzxm9zd8TOCb3TK3nOalB2omR44LHqXeG/j97KuaZG5v5sAM3vO6lfq4QMjp
         jLdLUjTw3vCwioo9FENo4+KccTSe/VClQKrn1rvIHuDmNwVMSC9TZ2w83wNIv859Wfg5
         BmqXSMwNDJ9suoPDLrqZLwxXsgrnfqxXgIut7Dv3zJDqF4q3dKWCTYWHcERwuAGTkFP4
         cy16yEzw0Yqj3Xf0gxCAmp+3j3G8Ga29xYGnccSWIXZAwJziAhIYPr69zSPni23FdUG5
         mRxvnXUz5arP5y6Vl9JOklKQZfDslBE5W7/REhdS+sp/9vO8vQqBjaW0+q9v5zF2sQwZ
         H7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        fh=BCOUbyKxVmf59cyM4KfKPOqgLAKZX0NsUP6/XlWtGDA=;
        b=T+oyJUCkUE3QbI/RaiQI4LpD8ao7VkDH+H6N2kac/x9LCJfudtOGJno0pA2ygWjfO4
         b99Jg4g2OFZ2HYNH88Br3OiWxpQJ5HnkxHxkAfllosmWcMLTRwZOlvNDnqxo8oQ5kFni
         FVwtaF7Y6vWFHQEvbSs5Inqn/a8cYNxnlJczd2CS+CjssKwmswaboFUFI8oWapE7/S1o
         AKiDiBzv1HCJiE1+qc2TevxVS3G16Y3Wa9OOM9sHrb8tbeoE/G6feiuf8+Q3RVibpJRJ
         dXn5jNXz+hGTCz9Tt7ulR55vxdJykQiVWIUxzowt5LM0INOuVkFETaZnxDdVnoQP5YYJ
         8EJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789228290; x=1789833090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=flUFPye+q7pYckVgvjo7uiwouUrncBWQjyNXVq5DBiaIN6TvGVBtC6iVa+HfhRmjAF
         0P+NsqPPed4JOMYh0GbYnkumfZdz5dKVBms+0kFJrPzOzP9CCzjl7Lrcl/zWs/+EPwOA
         d8kAMgvwkxF+kIyAgObxACRMhZxY9lxCysgIxeg5sxsmXYcgPjInHsg5vlDqsLNCQRp8
         A58meTMhJzKHCHWgZgXD68Wz97X9vo4A2P/e5nzKqyAkEJdSW2qNyDQWRd1jAhPdt6Y3
         rNz6mgs1XoRpG9vimVD/rhjQZqIcy9divmMMjwSp2weWIA0iHRCidIPzoG3gJfLY1F1g
         VnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228290; x=1789833090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPedAVqPeiUb8NjiNxJnvdJv3qfQNNhKzjipm/j87EY=;
        b=YkdaPDD2pv8KH10uCtb5DEo2ujscgdKwZuyxyHK1TLuKVJdPnNRuQ6nQv+rVVzh6DR
         0gbVw3MJA/KxQHuCnIstpLy/P1hmmud2HgmrXfj1DcvtucR9wWYnmFCa0hTcuFMO3XEV
         4HYxKGk2m+xYUBHL/lcx5zuSWOhHFN0zHd1BoAxm58D9RYsOomL+Cn48EQXeKdXze/++
         C0ehTG2cfXAIYLsy3NybX4IAlYx6td+VzBUY0zz7FH3NW6hTe2qvn1sIw/nwpqUmZbr3
         Bji2uTf0dhMK9B//gmFgs1vSiUTLm4gDEsuC85YPvWDIDmTB6pUMMNQbJ/n4LZktTAhB
         D7jA==
X-Forwarded-Encrypted: i=1; AKwUvBzKcLS1Pe36rQ2MCp4ScC1inrqP61AtaKUonSosM+XRWNuE7ebmwr+pNLzJrlho1so5v3f6PI+xkdyxHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mlwnqVMhmFDsPVYkE3L8tIyfWdaKnL1yd0N57esM8xmlwCATCm
	ihpnvgek/dIpgJXDSsthH8HqEEwl5HJRkRmq5d1QPa5hGlFeksLOgWHEtw9oB4kYJSOgT7V2QWy
	3HqgxSt5Le7fcc2HoOfQhQKyeYIp10s0=
X-Gm-Gg: AYBFou19riF+Z1sNGhSH8xzDHzAMDxySCe0cTgiDXsuMJPwWrYNS327v6AA6Su6Xx39
	LZSUTGS+b3P7gK/xH+wYEhFSTNdQ7F5limOXNuyPDuoYer88ULjIC+ss2BjCYa0cC8h5n5mfsts
	qwBBnWWcRcmfwVzdEZXUSzqoMATZut7xD/sUkQvXWXJwtiZ76S0gLwZzHdGgg7oFw6vuSldGL+j
	SYyIpGKYYhBX0r4Q9pGUfSIqlSPieAkZoUkt7Fjy2Xb4nFOm7Dh/Dbs5csXpYDzwhxKcYZS1x9D
	iJWBB483leKHL4ZfyVsyxeHA0EyfP5IgiQd1rwun48Ah7pql9l6Qr/UAZcCVphRRyxwYgvRy9Cf
	+th/MigM4lfQqi7o9uKfqGLiieKF9HaShcQaocvdoY2YTZpWoikcyd082sIjTPiMjbdmh9nBcEL
	69vVgDKsQgPuHOakkO72bNUcqKoHEixeLQk/sFfw6/gIDg3OrPJ0U=
X-Received: by 2002:a17:906:f585:b0:c26:1648:a075 with SMTP id
 a640c23a62f3a-c29667067c8mr442873366b.48.1789228290103; Sat, 12 Sep 2026
 08:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
 <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com> <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
In-Reply-To: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 18:50:51 +0300
X-Gm-Features: AcwNN1X5L6R8VeJmkjFevWlO1Zk9f-pg5FslM8lqB45lWu3P0SnHxHdoYHbt7ts
Message-ID: <CAHp75VdKEzXDyUZbDwS-dGECjDXsosQ-62yVK9PasmjBBTEPoQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: ricardo barbosa <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 6:44=E2=80=AFPM ricardo barbosa
<ricardobarbosamscg@gmail.com> wrote:

Please, do not top-post!

> Thanks for the feedback, Andy.
>
> As a beginner taking the LFD103 course, my main goal with this
> submission was simply to validate the workflow and git send-email
> toolchain with a zero-risk change.

Unfortunately this driver is not the best choice for a newbie. We
prefer to see real work (likely by a contributor who has a hardware to
test) on it first.

> I'll look into more meaningful tasks for my next patch.

Yes, it's still possible to submit some cleaning stuff, but do not
expect it will be accepted or even reviewed, we lack the resources to
handle that driver ourselves with all contributions it gets lately.
Thanks for understanding.

> On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> > <ricardobarbosamscg@gmail.com> wrote:
> > >
> > > Remove an unnecessary extra blank line to clean up code style
> > > and fix checkpatch CHECK warning.
> >
> > This is the lowest possible priority patch, if even considered. If you
> > want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
