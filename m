Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1764033C518
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526819; cv=pass; b=VXUbV3SpwA/AM8FqfC/3FKIizPIj7WeJAFlfZfFTipx/839kLi8XFaSgMldnBCQa4YFvxAJu/kC3K1WXHQBQJDglph6KB/k5YKi0pP4HW0W3rcLXVqYmZf9qlVZ5E1WXmXnfiaS+v++LI6Bu9yzE/QcWc7KS2EfusTVW+UU5RjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526819; c=relaxed/simple;
	bh=/n57laegPuf+pyKQLmo7vlmjIHv3USyKheecsvrc0eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZ9o8YBQ2zS7fzNtd0lpepkhzPXAXXFMa2MZn5ln3c3kZ/AawOYEFcgS3wfydOm8KgQPYmYcGVP7Z5t74x0LoUm8XGhvhNy3F08xUd7o3zyXvaujKj+CprHNRcddFDXnQBFyaVsZBpZDTzqMR3NsS7iZm5eV084/tDa75NWmQH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y3RRNi2f; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y3RRNi2f"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso2344468a12.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785526816; cv=none;
        d=google.com; s=arc-20260327;
        b=MKddapxaXhWHVkIcPoDZEfrvtMXPUBc+V8SOqCj563rS+i3ZepPj/6rdEUkmJgZ0kS
         IrEKaRlr6HQlxbcjuTi1NMoSRrMbLm9NH6VdHjCbpZdELexwv5SgftiEJfvvt5zB5eyg
         UFztWPyNmz1aICafKA/758D+Y53EnFWjcxsP17CAKO8LDTOOdn1wexxsMAm7j+rhocFI
         zbYeWldut1VGBMMrwKwK+815105iZi6C8LX3SQ938LHwHbPq1pvbWGsf9jWsgFkwxUry
         7Tcq4+/CpWDb8K2UEbj86gJn+av74+k0k3lX/ZJsA00b9JiDgdOT1/w7dDWmIeXMS1Wp
         Fetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkJjkCQSyqivCcminYOaaWWM3IpBWlOV2cq92pBOV3A=;
        fh=BNO3l2zsNN6T5TPDg4FPYQmohMjkSoBEhzvfXPofbD8=;
        b=aH8LJeRGKMhP8qRwN2FlmcDBVGSJcN2UWRsOkTKGs/NUdBiapviEEL/nw64ASnaC6N
         cKXd12ugARDrlTn/W0G+yRCxgT9myX/qVBZVdCrEXYy3pA6yGS1XZReiscRo246jrc7l
         KU1qMJysv6GMmPTUt8fYfdzpUqwOVZKLsIde7C4OqMgv8TzDfjXkEQrT7wFvUU0oxuha
         kjjeHjAJaAaRT77UZnAI5I2EVZcXDVgJ5guLZFiTMT2bV+8JI484yCTcrf00Xf/uP+of
         wqZ6e94LYkNFxTyiZ/wzZdeB0I2a8sesI4ywYYIdbGzgBIuiW+xkkywO3Cb26W11YxQz
         xtXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785526816; x=1786131616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkJjkCQSyqivCcminYOaaWWM3IpBWlOV2cq92pBOV3A=;
        b=Y3RRNi2fevAlRveQjMy4McAQYjHXlLdhcBsCBfJuJQF495PJhFz6WpFtoyfbalF1pQ
         myAOQdaSeMI18whjasJbj52OpfKYcAozwoMrqmV05Jqj44NlOhtbKbVQffD7GQLU1fY+
         xtMKe+TIBo5A6FUyVLfUUr4lwX43tSY4CbYS3Ywd1n/7AU70RymOUUtSkWrY6T8UyHKs
         xdS9FrGotmeleKMyzvGTsSFkdL/In83TItEsSUlFBkFXCbapFuFzBd1VljVmMDhj1nui
         SCeh9DQwgle/5WM1Bm0pwZVSarHdsoFkJM91hy+BAg7lkU4O8v4p7KIAVKsVR+kk8UXo
         K6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526816; x=1786131616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkJjkCQSyqivCcminYOaaWWM3IpBWlOV2cq92pBOV3A=;
        b=BABNRAR/YUbg063TBShJZYGcjtWvgR+1fAysDvp4+JFIzQB9KnS6J07F+1OL/8hMsX
         +fon4t5oPFQ9AtmJtUppuztCXWEstv3BI3ej6pko7ki3nh04kdXiN3CBTG182dlCadsZ
         o4jRVvA31xZeMO/PGAIETHNWRhLlwnRWjkxwq8mZMJ/fzQVx/AfCw4YCLrGb9xhMpBmF
         2PbgQVxlbN4zS6Wzk+BcgybMQyWetfmEugq+RzXmwRBYmdc4wl5bA5PQ0Hhn+ztSXYzy
         sCxH6FMmY+VA6AkWD0wBXDiIqEniWj9zRQMoIANn7mCsDGtJ3U8clhrj21S+czPHaESw
         u/gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjH4av8ivPNue5vyuUTeesC6/Ah0W1QOD6DzUUzwu8q3XNuYzBWW2yqu7G9UaR9nisthnw/b+jh1iaYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbP3qNVj+oXKXzcnp8srYwtKW7YEZslmEmGfT3QLGILxrt8hU
	RC2eDalFu/no7ogPAND7VtsMGPyITM3qyQUm8mZfPizMXxaHaV0k3Rt2LWGAedG1CbEhSSjt64g
	ztFunIZfGH2RKr4AjsEOExpyf2cg+79ahEZ9bULZ7TBJo/AI15b06VAo87Oo=
X-Gm-Gg: AR+sD10u/DNrWUAl+m68tdNbawP5btXnh4U6ur0qxC6KOJfAZ/LqK95MVKnvTO7Xguo
	iESosIyeEiQjl2IWcdG22pb/35WqzAwnlrWf/Ty9S5flize2+3XC0ydnKvyCFs+XbgdyfY2F1JA
	CdYsD16GOdCPeZA0QMKU3GIwD659p81OZF/PJHGGFOvcWgc5HW1c+WHvbZRQ2PhUuZmBs4WwMTA
	RK9YAulc22Qh84s3jhYmGspqQC46/zOVb5jTe6SwnO//bkKfDc0ygmPLgOhU/b5uU8zLQRnfORg
	TkcVNRY+V4YaPI9ifQ7Iqowq2PoSsPSOdqJafQMsyHD6jpu0D26Qmp34n7nrBeKx8nLhW64e2vR
	aUf/YUKj/RxWx1+slhjRl43vBt/lDbdtdrP0FjirEUFaBzCU2gkjy8KoeNlw=
X-Received: by 2002:a17:906:3e56:b0:c16:61d9:1679 with SMTP id
 a640c23a62f3a-c1fe82a5a65mr41337566b.52.1785526815640; Fri, 31 Jul 2026
 12:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-libcpp_transitive-v2-1-87a2d11905b6@google.com>
In-Reply-To: <20260724-libcpp_transitive-v2-1-87a2d11905b6@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 12:40:03 -0700
X-Gm-Features: AUfX_mwW5Pc8aImYjprJ2I5qnbYHqAozGW-tepfhosbSLXYNC7laK1WUu6mWkUU
Message-ID: <CAKwvOd=t6Hi5gdFPjoXBkC1c9DWFzDR3qp+Nw1xFmg8=G+5W0g@mail.gmail.com>
Subject: Re: [PATCH v4l-utils v2] v4l-utils: include cstdlib for std::exit
To: hverkuil+cisco@kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Yi Kong <yikong@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans and Mauro, can one of you pick this up, please? I probably
should have cc'ed you explicitly.  First time sending a patch to
linux-media; don't recall now if `b4 prep --auto-to-cc` worked or not
when I sent this.

https://patchwork.linuxtv.org/project/linux-media/patch/20260724-libcpp_tra=
nsitive-v2-1-87a2d11905b6@google.com/

On Fri, Jul 24, 2026 at 3:35=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> libc++ recently trimmed their list of transitive includes. Include
> <cstdlib> for the declaration of std::exit to avoid compile time errors
> against newer versions of libc++.
>
> Fixes:
>
>     v4l-utils/utils/v4l2-compliance/v4l2-test-input-output.cpp:53:11:
>     error: no member named 'exit' in namespace 'std'; did you mean simply
>     'exit'?
>        53 |                         return fail("couldn't get freq band\n=
");
>           |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>     v4l-utils/utils/v4l2-compliance/v4l2-compliance.h:286:3: note:
>     expanded from macro 'fail'
>       286 |                 std::exit(EXIT_FAILURE);
>           |                 ^    ~~~~
>     bionic/libc/include/stdlib.h:55:17: note: 'exit' declared here
>        55 | __noreturn void exit(int __status);
>           |                 ^
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes in v2:
> - Also fixup v4l2-ctl.h; many .cpp files including it refer to
>   std::exit, not exit.
> - Link to v1: https://lore.kernel.org/r/20260717-libcpp_transitive-v1-1-3=
af91860affe@google.com
> ---
>  utils/v4l2-compliance/v4l2-compliance.h | 1 +
>  utils/v4l2-ctl/v4l2-ctl.h               | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-complia=
nce/v4l2-compliance.h
> index b43c5817..7ca4744e 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -25,6 +25,7 @@
>  #include <set>
>  #include <string>
>  #include <cstdint>
> +#include <cstdlib>
>
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index ae6f43f3..483b2c36 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -2,9 +2,9 @@
>  #define _V4L2_CTL_H
>
>  #include <cstdint>
> +#include <cstdlib>
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
> -#include <stdlib.h>
>  #include <v4l-getsubopt.h>
>
>  #include <v4l2-info.h>
>
> ---
> base-commit: b32589c514810daacc05a2015d205b997cd11970
> change-id: 20260717-libcpp_transitive-0c6a9e39e5f9
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
