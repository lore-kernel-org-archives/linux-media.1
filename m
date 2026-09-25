Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6A30CD81
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790298458; cv=none; b=bm8/3JpmFxc3Hjo9WyQRw/1mzsBgHQWMCx3N4fRDQZfDqzR5G4+ZWSNG4X5WMvAde0xbiz6LBhcGbxUPGVVK2hZ1pP41DrnXBLPmxaoHmfGO546gQm47CcvNXKf9NnWvd1/Dn7CZoqwY5hGQ4H3o0WyU1fQD9GOspHKTR0vqR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790298458; c=relaxed/simple;
	bh=JIwdeMpMCwvovsCH3fXlKqHUZkIvLyR993CMQw3C1sk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=q7aJOsgkNo2gSjbTcWoHeKna0kFy2lkWgv4rcr9ureyBsBBT7YlyaL/L5YnZr6z0Sv/ByrA/zIjHyqaSRFhdxM2h+osuwJtTU9HtHbWsuvwAzwsZsJWRz/fQvJRUSIPeAIaxT/i1nW4phAvwXBYbMSY3sOwMh175CmidXLuioto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I732Gea0; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I732Gea0"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so213098b3a.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790298457; x=1790903257; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7tV3eZL9fiGKnU0k30bM1I0LnKjdpqO+bOlebOYHtE=;
        b=I732Gea0dtmXKd1SyvRIcjnaKAOZW4CrQ54NDPQnhJeVMiBpdZZLkf/enBrsJDDTeg
         WvqMZXDsZ8m1BFreu8P1sLGnZeOUOOD31gN2D3dWUeSceLAziC7z+JDITxi39rP72uqo
         OiCsS/tNPz+M00qjbx4IZeZDH8fj7Z1uM6E3HCZIL6b0db4qw95MWUqOokpTwFBFNeNc
         HPjBp89Ig/HTLmKPLU6Fi/BjOXzGU1BjD3nY8xVVdZgFKcCj9QlPkrG7BYzSZv/Mdusz
         PB+E3RxVyKOeQd2G+rP/LZcypFwrufzG25VuKuhbgZ6kGaMef/9IEv2WcChpZHVuzF2w
         6XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298457; x=1790903257;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7tV3eZL9fiGKnU0k30bM1I0LnKjdpqO+bOlebOYHtE=;
        b=kFaLE3B17goU7ZmvoqnShaXkwSm7KrfELOrd8Eq7fnJOFGucOlyV1YpbPDn+0sR2ST
         j5a4vyGc/0td3F4gHWtKY8i5td0I+ij3z3kCAoIagMJnjCqDX3S5CynfAP7lNlZ+WXY0
         HXLDetNOMWfwUAEwki9VTYpL/N6UcorlTVe/ux3nCfxn05YPetS97C8dqgUuMOx4XwmN
         bxkL9XNgvV5J/GM442drTZ3fky5T/zWdQopELkWDhlvrsZfwBAg3BgRU2I3wrjVUxfC+
         i5uAOAKp27T2acc+nZymthdQjlGedyRQblSYHMIqSvjEtAtrLUxpCc/aikyNyfxGxYzP
         Juug==
X-Forwarded-Encrypted: i=1; AKwUvBwbzlWDYuuxInd73Fl3IX03Y4SLCQL7GyrBpF+DbHWOLj/z5wsT9L2g4ybCN0+LCkey4hl1xdESiVif0w==@vger.kernel.org
X-Gm-Message-State: AFuF++mtZIQwfnmGodwj5c2o6+VAeMLZbCZzH7dY6yjZYaCpPr4tiT5B
	IOh0TQZisGgwB/z1jmRUH7zp+77ddWbre3pIKaiurCTu7RwSuYPZpSE757tK6g==
X-Gm-Gg: AYBFou3FJU9yPSgi3ujF3h6/O8A4hulnhHmo+4ouN2fAVsvGrHTkI2ametp9qWyYrz4
	e5lQha0zLwR0rhAWRMnZFFg5pP5YKPYFyxGoU81LsB7IupvpYpdM5twhFoajHz7frp5LawU3tHs
	sZsNug09q2YW3fWIeX92e/NT3PrEglSMn70VovEK6osz2peDr4vb2dsWO2D4Ubx0ieb9KCD6AlF
	HU1xRir8CIcHxaq8aJC5T3qISNg0U1YnWSxlrEeT4DyzeZtVbEfFOpuNwVnQWdF7akM/LYYjKuq
	7fLGXGgF4fUPQX9ErU5xJQGUA5DFECOWd/JVcoqH3apvGbwNQ0SKw4sH4jtOsI7t1J6g3grYPw5
	PJZZzVX2umll6op1zCW5bz/opCB7nt/6KBLMm+IckS3CgFNLcB1uwwp32Sjny7TjGrMpjNeF/Pu
	CrQZGaH9JfH4TOxrGSGL/KeGpYhMdzaggyCh3kSjuo6mauUfMiEYOF6yjnUcnEJ+RrC6AjaH2n
X-Received: by 2002:a05:6a00:4519:b0:871:41fa:d1c6 with SMTP id d2e1a72fcca58-87e98998abdmr3377299b3a.3.1790298456401;
        Thu, 24 Sep 2026 18:07:36 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fead95ebesm313239b3a.34.2026.09.24.18.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 18:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 10:07:33 +0900
Message-Id: <DLNZU3AQ6BPI.3HCOHX5HXVIAN@gmail.com>
To: "Nick Rogers" <nick@getfieldwork.ai>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@xs4all.nl>, "Brian Daniels" <briandaniels@google.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
From: "Alexandre Courbot" <gnurou@gmail.com>
References: <20260923160936.33445-1-nick@getfieldwork.ai>
In-Reply-To: <20260923160936.33445-1-nick@getfieldwork.ai>

On Thu Sep 24, 2026 at 1:09 AM JST, Nick Rogers wrote:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
>
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
>
> Zero-initialize both structures.
>
> Assisted-by: Claude:claude-opus-5-5

nit: per the kernel guidelines [1], this should be

  Assisted-by: LLM

[1] https://docs.kernel.org/process/coding-assistants.html#attribution
