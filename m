Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26C29BD8C
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314788; cv=pass; b=rJYP0KDs5TE+EfB4yuhzllAPxffT3RHXSMDjxqtNAwH1FCjqNe9s5TxG4KoyboX5eadbrUN3A96XfJSpF21WL4rXldJZPjG7iOAGdxtD40CLUzZNPdZktJMg037Mc3QIc0zuTPfS1W2l25EQHqdPxzebdxAI4mJ/qgHC4KhDvCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314788; c=relaxed/simple;
	bh=9VuH4IlPrcpfj5N+d0Erhi6riPlnm9rpbHmuksayxe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqwLPfdjFiSb2Jl83PtdVb4BBzIaWoMaFUf7fzp4mc4dlOIMmZGz+5PAy4Wks+lTUGC5bz+y6qDpd3GIFHvfiEpYsWIOIYSpkwARhNBnRql+CO+3imLCocOWaw46PeBEXpZ+Mc65trAYC1vTvqGWxtSNfvWqHDLgBmOJrdVGi6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgKTWrfy; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgKTWrfy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so4769699a12.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 22:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783314785; cv=none;
        d=google.com; s=arc-20260327;
        b=FNdpI3ifFAhAs1FgxByVrzPYmjPgXrJ6hepvfrO/MF7yClWBUiNtNJ6K9NpHPXmoRf
         DpJHSbabvwi5H1HwfUnvcL5hxM8rt9pYJAu2whtPjAt+sYe2qVgiqWzDnGNmNHlizSRh
         yyRknrhswREJYuN3zHiNEgi1QotF24h4CryJfI1yyuLyztTfnU08TeFwy/67JNCRpQJI
         2pQUmIba8mSBlh5qrHo4Eky6ADVHW+voHsKgTD3WmvPiUpJ9YdWb2j+VfIy5u0DRu5AU
         kalEeG30vUvoxZ1nMw+a8XTMqZTwqMy4kC/LnRc6bPtdcX7kflqwuuF+4zE3wPoGKdfu
         HTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        fh=iVWSDzzaG901GYcq/5Yg1dIho3LNVHs1t2HCYHF+ETw=;
        b=kvaufivtdK3NLxCQkR9gSlJUifzzRjZefhyeMfXQa5K9e+xUAjO+v+Ztd7OA7p+qbN
         XwVg5MSGOH+KJA85T4NTcNopewH0gav8Bv2LitkKsb05ATwKd30qpeK8IM1vjfS/uGTC
         L9eMG3KDWYeF88lkJfxRQ4xPB9+eP4cz3l8ILksF0EUt6f+eBBrjEmZhIkiQc02lni05
         mJhcRqWCfKz/X7206vo6VI7TcR/QtomZqlj8TKCHXkfdYwZhhsURQnKXz4jP2KWliMV7
         wBcdilxVVoXXk5HM+dZaGuFUn+5fQz5YNUwUElICUx9vdu3vj7mknNTKq8HEijtVcpG5
         2l9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783314785; x=1783919585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        b=dgKTWrfyOUV2wI5tAJJoIOxJ5jYQFqfVuefgkH17K4WSG9Y//JkxG12Xl4O5zplUds
         tK3BHttSUu8VO+usQ99P66p2JoiKBOZYaRSl5wGxwP0xyhU+ld+5lC20ZJsztpUasnzV
         3V6X61HKW6tXYaxEPA/w0BKpolw6+AFnEE17wv5YgR6+eQynIw0DA089n4MdS6///d7M
         VEm+jv0Yzf4gRCKpu/7HbwLHgxirZ/b0LsFhuTFBt8/LHUY6s5uFAQTP48HTanpLTQp3
         WoNVffdTAH+3YtsSSSCLOeLLAPS3Bgc4Wra4JGrYcD9OtpnTNuaR0lVCg2GklsVY4BVG
         N5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783314785; x=1783919585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GHjgpUGtEcjXf9aGWrsM99t0nVPI0q6PW63zrEE95wY=;
        b=tNNHMXgOU8ECHrK76eK+Seq0fHFOXZ6epgnNoMG7SHSBKeTXgFuj2ugf5/DglM6Hgt
         hM5Iv6PF+l801+/BQW5ps9lkuiB8pn3QNKkQOP5wu8ji0Oo0gk03M3uPIrXe8HTgkHyk
         vXD6Y3xcon5IjacgAkVCb+wTwmrgCoksvyihcvsMu+mVFbOVWOJZ3/QgAenjxlXZiQeR
         JY9SMXVH9N6FafOA3d+7PTBxIjE8Wy7svgYccGqPY9NW+nsM7/fDyrs+jj8Uk/hS0KCo
         N/HGrRd++RNNErGrTFwIPReav2FOIaCsXrxeExByFvTTPXXiMftVxFqQrHMNjb1Wzek0
         SmpA==
X-Forwarded-Encrypted: i=1; AHgh+RpOjegymTXo5Azueni/WBpZImAKjnYwQj14yZdxNUTsct42ec4a82unYGHaV26XiZ+H2wy+keUY1h817w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCxVGP/K5miLANyPcPrYrQmGG8UOeALO0AMMlj8L7jeR4qBko
	qmhDkGfXrWyyAiHdjw6h0LBFb5xluyc48Df0gEYb39FWbIgKr22tGApYPd+Cz1IV8uPKAHWDaSB
	INWuz6SJRmIL46zvzfskZNwN+3X2JtCU=
X-Gm-Gg: AfdE7cns+5cyRdTXrHjoeXOlme5MoQZZjRbxEeJ8O8vy3A2y86XZLbM3+UKWEwQEuOb
	9h6/aJ3PKERH8A92cQZVRSxyMR4+918qdR6quw3JFyi8Va4wr6LuzZ0jBzGQgL4VeE0Qs7/T4y0
	b3oL6up5BnXDJy0p19+XNdKnmbf3Qy9ekFZ6BXll98S0rH7fFy28yhq2HikejP9MLArtqMTPacY
	PlzhuZnFgL2WfTd2bfr8dkpjbCEY5DnwgOWHWduOje4Rqw+jhWC1N4im5rOqqMo4wTR4xXn4Syy
	STrHByP+8itPIBhHQIF6XQkZPXdEF0Z5z51VbX2uPGJBCVGU5y4Zhqdcn0fp
X-Received: by 2002:a05:6402:274a:b0:699:2448:be63 with SMTP id
 4fb4d7f45d1cf-69a1a273625mr2803690a12.16.1783314785281; Sun, 05 Jul 2026
 22:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com> <akkOdQ1oT0hIc0tz@ashevche-desk.local>
In-Reply-To: <akkOdQ1oT0hIc0tz@ashevche-desk.local>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 10:50:54 +0530
X-Gm-Features: AVVi8CfTSX8foY15AMPLK4JpN0Y9K_M83Pp0PFoesjcSyeBMF5QXOkSbVzihyDA
Message-ID: <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 7:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Is this the only place (of a such kind) that can be amended
> in the entire driver?

Hi Andy,

No. There are other places too. I performed a quick check:

$ for f in $(find drivers/staging/media/atomisp -type f -name "*.[ch]"); do
    ./scripts/checkpatch.pl --file --terse "$f" | grep -i "else is not
generally useful"
done
drivers/staging/media/atomisp/pci/sh_css_params.c:2337: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_params.c:3198: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_params.c:4112: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:4=
13:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
176:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
221:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1=
278:
WARNING: else is not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:128: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:168: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_fops.c:209: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:471: WARNING: else is
not generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css.c:7722: WARNING: else is not
generally useful after a break or return
drivers/staging/media/atomisp/pci/sh_css_firmware.c:249: WARNING: else
is not generally useful after a break or return
drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host=
.c:32:
WARNING: else is not generally useful after a break or return

In my patch, I am trying to address the warning only from a single
file. If you want, I could try to send a patch addressing all the
above warnings.

--
Best Regards,
Dileep Sankhla
