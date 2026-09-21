Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964B2E7378
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987967; cv=none; b=sMGkc/eqOEvfVoLKHmmbubt4NV0UglOVwWedmugXiqmd0LM3tKe8RhOirnwyYEb7smkfS+KfZRjcru5hILzprva8oxEgWn5oH1gCgxTPBmHazwFuwwO8JX95ka2juuR5RkuEdE2kzSGeG1wFLbfjO/CEgL4OV8aWv30qSNT2KEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987967; c=relaxed/simple;
	bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPQpQdQ8q62cwGxIqHUoUm6u37GgV58l4rxuyPZgMlj8QX5+3UzwMwtMnKksMjWs7DRXsbadF1eR9WbWFCcEKcKu8A+XeAMR9XSZLt3k6Vehpf6uWVmn712zITGpBWxvZS/OQMNuPKsxv1kaa/03mjSMeuZHOYfUbdBVHs1zO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFMutsMg; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFMutsMg"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b355ffso1650680b3a.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 03:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789987965; x=1790592765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
        b=RFMutsMg74wvmacskFeKYPWaXp41QWi5NmKvl78XAVopYsgrH+A78qMPBrRKQo+VnP
         5zTceVG36RyKuAN1GBjDZqQ0kqNxoqBhkc8TbfnLKPxN7ydUDDERAmh3lkoxcPAfmAfx
         yZ0+A6o7+0z3C/oV7eR4gS7VNbuNJU6TSdu4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987965; x=1790592765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
        b=jx/Pe6a7JIAmBcrVSpDrxu2KroVg4C1Ca5Q2l+ai2Hgk8/idE/DNyy8B51qevXM+Qf
         uoYvp2jlTKy/0TSjD14aNX8tuxDRFdaD4FDlIMG5mYF/UTGI57qJjt88oMEikQgMmMkC
         0zJpQ+EHx3lVjvr+sxG0is8omAFenT8p2h6/sn3rGylukavyDkm3MWIj5fLOSsTYKEuw
         WlfT3qdJAYSQmMCYG/NoqCdn4z6OrS6hvEa96xTL/5ZSU0RXP7hdNsOrKU2KZ85kOyos
         mXqBE7nWVqJfkZStE8lBD7bOtN6VOZtWJz3Vxw4qppHAJ4VXOYGzdiEU1BUqD5e7Kno3
         BUoA==
X-Forwarded-Encrypted: i=1; AKwUvBxtkqG0orNeZesAoHmBb7L34GgxnZOLd7JKDOVMidDSX98EC0ClhCr/D0y0xL2xDXDiKD0m+DIenx13BA==@vger.kernel.org
X-Gm-Message-State: AFuF++lJLjZ2KrK0Qa2R17dLmqnX5JaDkS7wt83brftIo+C1Pglzch7k
	3rnfhojdMk4M+/k7hnsKXsrKVgFSbL73ajYpGvgo4YC4PiNlz9ymVJjCLNFWvRtXMXpNlcymLqs
	Knhk=
X-Gm-Gg: AYBFou0FV2tpGUcLlKZKm6TSru6ZKVt/NpRYoC0UeKXkrqsLf5cc5n1d/oLIpU4VTS4
	H2aqSpFrkBwMSYhbOnLnnpRM43Dq7wBRH93BTpGFR8uyWNbmhHxo9csOr01AUuFGLVzXMkzglgz
	Eqcw4FfA9bWNoMITjWozolXhoNTyiZE/6R7D8xtD9KcUw6JQ4V/kMreUTe8HuxikJGDJbl8RTMd
	1v0Hcy618mCQ+erCz3v6jwNu64uSQgrtBlJVL8iXkK/JgyI0U85hLWCWI1l59T4s/2sa0vexCaH
	RcOu6WJ1nWsP/8MumMV/ZQJpgBJDd7EIf4qUAyKS64/UOZzeTP24ul6DqtIR2fQi9hTKBhfDiFU
	bEJyJCQKPfM1lKVW8jKadxJ6G2Jz1+JCpQ7Jurerbc+QX9SphFcMLSIGWZ+tAmTawO/kdmIFoaB
	0NGZoYFBQI8irsZ0gBHiADvVAH1kzSfpjQU32wUeysUPAL/W/3nbwRIrsOX9mWxT19acJuFXzuh
	UUtOqX0YI3g4+lsikdGhlwfTiMFNQsFjuLECQ==
X-Received: by 2002:a05:6a20:b78a:b0:3dd:a195:dd53 with SMTP id adf61e73a8af0-3dda195e4efmr10216391637.53.1789987965472;
        Mon, 21 Sep 2026 03:52:45 -0700 (PDT)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com. [74.125.227.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee03efsm3259840a12.24.2026.09.21.03.52.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:52:44 -0700 (PDT)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1994967a91.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 03:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpdsL2la84vTarAQ3wU6oLaggC7V4M4jHvH83qhu0zMsA/Y/WnpPynhq4pC+7LAM4CnSVnrNEihc8M1w==@vger.kernel.org
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id
 98e67ed59e1d1-39e54d37ad0mr14497597a91.2.1789987963836; Mon, 21 Sep 2026
 03:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917212951.558283-1-henry.paradiz@gmail.com>
 <CANiDSCsoLGGewmpV6cL=wgkMh3qx=5dU_mVWUi_NaBdfZp+hPQ@mail.gmail.com> <CAMfFSnDa-nGr-mxzuK9FibOCJGFFCBjB_HiLBwGJ3btuFR=WVw@mail.gmail.com>
In-Reply-To: <CAMfFSnDa-nGr-mxzuK9FibOCJGFFCBjB_HiLBwGJ3btuFR=WVw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 21 Sep 2026 12:52:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
X-Gm-Features: AcwNN1UxJhqCvpukKhOiZnjWcRIkoMQomDv89By3KXFXhyvcJ1jkAhkv8gCkMx8
Message-ID: <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: add capture quirks for 1e4e:7102
To: Henry Paradiz <henry.paradiz@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

Thanks for the extra info. I still do not get why the device keeps
suspending if you have the UVC_QUIRK_DISABLE_AUTOSUSPEND. Are you sure
that you do not have some kind of daemon in the system doing any kind
of aggressive powersaving?

If setting power/control=on fixes your issue... maybe you could
configure udev to set it for you ?

Regards!
