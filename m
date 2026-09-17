Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152F48B38F
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683340; cv=none; b=cN/bBOMJlhfz8+j5YHnGkncmyaIAWs+fs5pX87VZkF41Yp5EKxiNl/yyw+xrVWM+1+/AY/1Ac+rWJFmKTrSmqlB3x3ff4rPh/FLS3zBHB3a2XHDu80vEMzHpL1YrHDQ/UqKfJw8Hya8b/5qOzf5fgUJhNIEhG5N8bKuvNBsYq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683340; c=relaxed/simple;
	bh=ta4aAoi5dEfg1w+OPOGTfS4pjEBTVnLa1gxenoHRsWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCwM4lgoUC+j+IdAU9lYW2yFhkszc3o69v62HlGKTZFpaYDBAGC1EoQcyOqNvJWya5HHGoY5xgYJgoBeoX1QW0SwxPhX3M4ZIP/iJkPNqDMWr4DFDwfRcLxnROsyhwiSI+2ayyYt3qQwG2dsj5vvJL6K7hkg6ZMBNIlvvLtMp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/O1MspR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/O1MspR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F73F1F00899
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683338;
	bh=ta4aAoi5dEfg1w+OPOGTfS4pjEBTVnLa1gxenoHRsWA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W/O1MspR0qjle+STYrrlgyve2UoIpF4HQ+QcDdULOvIv/iKoJkvaZ/8f0RALMXxde
	 w+PUceGyVHR70cU7QUYI9z5rATHZu8GqYg0jwKuAedZPEOi5voEuLheib3S0u0YZjM
	 M0l9m5w8inuM9QmXiEIeBKWXWR1HJCM8+1zRgtNDCAdYwhA/tGcy7Wp2DAhM2iuTw3
	 ubl2kR3ZrjIzGfFVNvng2fAfhfaVoFohrAIaXVcB902Roirs8rZbz/7Eo9WUresbvh
	 tl5LVqn4dWbcJU4ULXkpEmQ2owCZSKRoblXuA7ySI4ExIGNKdUNq9nbVu6ot/F8DWT
	 yl3mYjsg7KqIQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so95572e87.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByY4W0SxHFQRjHIQ2dFrKQVPc8+n6mtB4PfdHUA2MhLIokPemqUyB85dQ89kKAL5kieQePeLHamHVZVlg==@vger.kernel.org
X-Gm-Message-State: AFuF++kp7DGszr1IEaXAlpR3HOGgcngbWuQX/BNjoXRMfaKV8xh3RLOW
	wR4PbFcRJIYfB9p47lxhE5BTBN1s+iit7t39pyp+8s/ij8wtfdwVnSCiSexotuH1bJ90DpmV5GW
	tUkfAj7sFVAi3xFnLTpb7uNsnOjAyoFA=
X-Received: by 2002:a05:6512:31c2:b0:5b8:bc5e:b56d with SMTP id
 2adb3069b0e04-5b8c184573fmr88005e87.37.1789683337327; Thu, 17 Sep 2026
 15:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915202458.3673504-1-arnd@kernel.org>
In-Reply-To: <20260915202458.3673504-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:15:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4hHrNSerRyb-AP=rDG35v-uStzZDF1RSbT3cAzJggSg@mail.gmail.com>
X-Gm-Features: AcwNN1V3-WRjT-ZOHKy6lvryPUAK48B1hnC-GNQc8T5JUw8Tr_-zPtxQmewuuyg
Message-ID: <CAD++jLn4hHrNSerRyb-AP=rDG35v-uStzZDF1RSbT3cAzJggSg@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm structure
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added structure has extra padding on the on
> some architectures, which triggers a pedantic uapi check:
>
> ./usr/include/linux/media/arm/mali-c55-config.h:807:1: error: padding str=
uct size to alignment boundary with 2 bytes [-Werror=3Dpadded]
>
> Add explicit padding here to avoid risking information leaks
> and incompatibilities between architectures.
>
> Fixes: bb401df68c06 ("media: mali-c55: Add support for CCM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
