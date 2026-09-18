Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFC42DA53
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766600; cv=pass; b=W73WLG9/h2wX8K+ldcJxLppxma1JMjCXULesR68VZdtnDWzHeB+3ofvOLHTYf0CgyVPJoMUYWXYbhu7dgbt1Dca2DZftqWd9MUay0GozO6xwJ9Vx+j8BAOF2BZBQgoQLTfsyVMphtxNjHIWm9spU/96qdyqrXY047K6J2m++8vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766600; c=relaxed/simple;
	bh=1YGNr9g/BFJtvxMbyKM+Wp26VZkmOBeBi9Y30NUsztE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2Mac2iqI3XCDJwcC82svJ2Vh3YFBjEi+PmnUn1KQn1pV2kIR0vfc1/yLJ3JN09Uf5kLjNI49DogxJdcr7KQbjpjwi+W/vYwicRO8WnDdjDO/oGp/oFNJ57n4JOgT3kG79DlwX+38nwWIAD4iDJCnaAkByJ9b8q827mXVe7P62k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oO699ECa; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oO699ECa"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso10107216d6.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 14:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789766598; cv=none;
        d=google.com; s=arc-20260327;
        b=aplOlQmtxHopfjnDXYwLvGP7il/lLW92V9JepJby2jpdzhdpEyNYl7z8/TIIb0/QUn
         uZJ4PXgnxjrR+ysURLPtet7Jl5yuthzdarEov5yhW64x64P+a4mFxSX/9mMZY5FSNX8Z
         FBBqJPZmnYEeKEHqB/nYac0I3eXHMilHgWCU+bwquiXsjmPyO/9UBtHv4e3/FD7TjN3K
         vaaZywBgP45n1+Ls/tn8vyBqoIyLb87mvvAkDM48HTEzMDin8yV7XmamlMJA53okodnd
         KcaSHo9qv8lIn00gyRa8vSo7onLWR0Ridkd9lQD8riSd2L9nHvkq47ED2dDUJRSRLpco
         h9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        fh=0N8Gqwzg0r9kgy/2xDZWJT8nOK4E+MkeGys7+eGwuQc=;
        b=NoR/bBnwYu0FQPvPP7CLohMw9KOSfINQGP4zbPL2E5ceveckWxMDeSU3n+47fxb8HS
         GWzZbn7L71T0FYkM185xu9jaq4fTFUpGPsvpIqrn2vhf3YeXdQcM325YK291XlxTdB/4
         Dd2lTEW/Gg6MQpA0nKE6gxp6g29wXJijXreIRznKu2XbP2xMyCfLjGDC+E0aNsvmCagG
         JokMvSRzbfpZBw8Rx0e3+8o5XdM5JagLtFmrgmX9plkVuBUlfWZrtlzFjMj8S55ZVyqh
         o99eTVXA9ER950Fy/9zqCsRI3/C80tYDYkwGbqmqcVojqLJUZsiaMtHRgVdcJ7pgQoZN
         U7gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789766598; x=1790371398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        b=oO699ECaU2AxraTVCpGJuRgNdllaXsMJdWxgOBCtPulEioNKl2htbJNTKFJ6Q9/052
         6qzxchZcJFXHV9RCH6erfo1waUSZeBZTFs+zVGLmUH95RnHVt4pc3FBIml2A2uYYS/5G
         v6UPKYYTGj2IC7+HzKooUx4zVFRW8d6RommgTNfRsT/ymoJxd0IDYYbNYdmE19adKuZ8
         h3ygprplJPsUSZ9ZZPk8T3SNMguDmwuASOUaDMT+j5c4pBKVxhHuY+/wCv4cHrU3Dxnx
         6KFntUzhWiHIYEHnTC05/QHlttMJ5efaMILeHr7lhExKFjdZgTPxcxwFlcm386XcZDNP
         TRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766598; x=1790371398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eXnGz0srvrxX++zhKhQ4P/04p9aKnhwE4Xq1r2tq1s=;
        b=q+8EVmoTDkYzFj6A6h61OewEKGHjRIkb1+Vjl2siIp12VZOvzIxy7H8qGcARHdVkjw
         naI3opyYK6RvuLXOJWchn97fCc+bFzhhSjY22yhsSFTzhv9y81dEhPEbsWxMJLvNWtYA
         a8gVCTJHx9LNBcS42m9nvlnrnuipYl5nMlLcd7pEZjCeuGlsWGVQZ/w65DjlVy771FVN
         0QTpNIv9FuFkqEpZqDaMWkoLZlYPFb6R07Zj9D9VE5hDHm9Lde+chSlRjAcYx0fQjrYE
         ohyhYy7jq1h7qM04rNhLZbmA5YbDhcDVw1j/sMFp7tfWJbvVChrN16V04xfNkXoNy4IC
         S5Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwmFRON7r4LGk5Bvq/a9GN+f2f4sT6qY87xjKvS9yninQAuC4WzQ9lqk5AbDyJ1zv8Cfck4esJDFYwA3w==@vger.kernel.org
X-Gm-Message-State: AFuF++kQPvw+abnmAJOfyvJTVdr8PlkO9woe5Y/gku4eugFcuRaJN97F
	/WjGIkOlTL5QiPRYX38YNZqynzd+eVt9XMPnLHEviJFU2Tc67jNYyBbUuQR+8z+JzMfekOegFfF
	FHCk4WETwUCT+mhwM9Cg9vM5oAZbVf1M=
X-Gm-Gg: AYBFou2e9RXcW4UC+TjBHbRHluTj/VSzQHe546yI8sICDqoVZMNdI3i7+gcNdXaPG8X
	ZzZq3cNMwcJjAyhzalaBr6ExDBwvSTDXIcvQALVSlYX5KEUpeTZwnnj95SK9w7Gslr0fp2BbZeW
	+E6bd/wtofaZnTSl11S8ex3T6SUyihgEccgKFtK424OFRAKxeZMIFxGfsJcWbNMvxqQdJO5BXAt
	4R4234jdy+Kr6/dRzotYKqlPvZtWxr8kYitypIcRam/JCrQwzpZo2EqDMyfSxtHr3QDLVz32Ew1
	0lYghWlml9C5wj7hcHVE+AHxzBW22VQclh3E+4EKCmB5K3wl9hLcgY0IuABpYv1I0NVnRjMLObq
	6Xvvsr4KtE39Q
X-Received: by 2002:a05:6214:2dc3:b0:910:6f61:f912 with SMTP id
 6a1803df08f44-91254c9b0e0mr63870416d6.33.1789766597608; Fri, 18 Sep 2026
 14:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
 <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com> <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
In-Reply-To: <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
From: Claire DuSoleil <claire.m.dusoleil@gmail.com>
Date: Fri, 18 Sep 2026 14:23:05 -0700
X-Gm-Features: AcwNN1X5eSKW7ajEZ6zTzJv5nQKV6x4J3x4seSYzTJNYYKKJqhIyS9cqM98ziC4
Message-ID: <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had Claude Code generate this patch so I could run Omarchy in a
VMWare virtual machine.  Without the fix, all I see is black screen.
It is currently working but I have to re-apply the patch after every
Omarchy system update.

Claude originally identified the issue as a Hyprland bug but after
further digging, it's really in vmwgfx.  However Mesa has coded around
it and I also had a Hyprland fix that worked as well.  It seemed the
best place to fix it was vmwgfx.

Claire

On Fri, Sep 18, 2026 at 2:17=E2=80=AFPM Claire DuSoleil
<claire.m.dusoleil@gmail.com> wrote:
>
> I had Claude Code generate this patch so I could run Omarchy in a VMWare =
virtual machine.  Without the fix, all I see is black screen.  It is curren=
tly working but I have to re-apply the patch after every Omarchy system upd=
ate.
>
> Claude originally identified the issue as a Hyprland bug but after furthe=
r digging, it's really in vmwgfx.  However Mesa has coded around it and I a=
lso had a Hyprland fix that worked as well.  It seemed the best place to fi=
x it was vmwgfx.
>
> I thought the patch had already been rejected so I do not understand why =
anyone is still looking at it, especially since this has been a known probl=
em for many years.
>
> Claire
>
> On Fri, Sep 18, 2026 at 1:56=E2=80=AFPM Maaz Mombasawala <maaz.mombasawal=
a@broadcom.com> wrote:
>>
>> Hi,
>> This looks llm generated, can you disclose the llm that you have used?
>>
>> As for the patch itself, it is too overly verbose for human review.
>> Could you just describe the issue you were facing and what is the fix yo=
u have done?
>> Describing the current behaviour and the overly narrative style is not n=
ecessary.
>>
>> --
>> Maaz Mombasawala <maaz.mombasawala@broadcom.com>
