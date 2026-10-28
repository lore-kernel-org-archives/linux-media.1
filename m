Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176700;
	b=Cui3MEIebu5qSqR+fDUmyQ9kotGwfwdGYQQPMYVF5SuAf172NyKr925Fvw+OwBgL7j/f
	 SoXQn1DT4RCQi11vabUZWYsC7j++lGr3HFzPWAHF3CzPNGfnCiPajeDD8cUCY9HKXk9lm
	 0TfCs8iufy60tJDrytDgEvOdonservILwknIIkWmgaI18uwtuYVf7heu3vC6cfXtFk/CC
	 IRMf4HIzm3TAIfkrlvIGafW/Fz8ZP4Q7rd52IkHiiawe+HEM02fcSFL61RH3zONP0Qrpc
	 kcQso+88EXzdAN8veCduS+3oqK9gxR9lewZyytdFOHEgnivof85acEsFsuX1JDbFiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176700;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	b=KT6OX+yfchK878sQtpJV+LRET3BQ8YIGAwHN6XeN42enwoH14qNxUXp1yBbnqwujSpS2
	 ILcjg5bCwrveRw7KE8GerrKfWyMsh97MTU/K9mBxYmCFf6lKTQni7+phv98MGoD7Nr3x0
	 vELVaZH5X5dwGso/q/9wYntkGZKAwpELDAah2p5vZU4SOjC+QFEFv06s7eJletEauo3qX
	 19gerWJb7fH/yfO8AIg/8WKotWSAt9UQJ2Dw1qwGIzs+h9NWdipqgFBVqWeIDbmFtoUmi
	 DV+bH91JLR82Ngg+vYk2UqMzcF3fYUppKNBmzFE6ACwQfzdni9jtXK3LLSqnmvwyJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266E606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9D71F031E3
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176700;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nJ+wUHpRA6Ee42y3iixK1FzjdZKkGKKIESyVw/P6gWDeP+G8JYuhEUAYec3mE3iiz
	 6SCNV3vLTuf/1oH8aQICVLNXfsoHyxUqdsVUaHgmGUsyD1BJXq3fRc4/Wf0r6FcSA9
	 /EehI6ZXuQGbvcVXVlpKQdgp+QF792SnKTVdV48vXzhOZs8bNZhsdK5FBox78it5Pm
	 WW6da7J1iLgxY0X7PwNzPNsRcnnmm6a4SIL3m5LCNt2l5HCzj+epga4RtniD302Mbi
	 5EQ7OIh3K1iPeQ8zHK4AxCF291jwA0CQtlkMdFRh80qHBU8lYvej1mvc2I00goFzII
	 fviKaakmES56w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso570679e87.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 01:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqynKVCl1UaLGVOAUIySzZm7FzUNwyyEUarChyNFXH1AeD6p9xTM24HkFp1MitHT4NjqNVmLl4PUhpow==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5JyJ5NGN3FmLowAzaVKxU8jtNqk9PFPa1jc3OzcnlAOyHPxUq
	Yt8GtKSDwCYpdqWOs55OIZ+W2XQMGPesMVYz9oGxzWXY22VKUBXpkiIm05MP8tvLat5mwh8b9JC
	JsaRCnN76mHqtm/h48FB/7/kVBEhP/zk=
X-Received: by 2002:a05:6512:b91:b0:5bf:b5bf:e92f with SMTP id
 2adb3069b0e04-5bfcad7b397mr666353e87.20.1793176699104; Wed, 28 Oct 2026
 01:38:19 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
In-Reply-To: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 09:38:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
X-Gm-Features: AclHuK8tJBeR9yJrkj0y_HKO23Ga5j5ClBJ0KNeeuFyuuCRknUQ0tBWZXJ_fohw
Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> The driver uses Runtime PM, but I see no calls to
> pm_runtime_resume_and_get()?

It gets grabbed in *params.c and *stats.c:

linux/drivers/media/platform/arm/mali-c55$ git grep pm_runtime*
mali-c55-capture.c:#include <linux/pm_runtime.h>
mali-c55-capture.c:     ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-core.c:#include <linux/pm_runtime.h>
mali-c55-core.c:        SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
mali-c55-core.c:                                pm_runtime_force_resume)
mali-c55-core.c:        pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
mali-c55-core.c:        pm_runtime_use_autosuspend(&pdev->dev);
mali-c55-core.c:        pm_runtime_set_active(&pdev->dev);
mali-c55-core.c:        pm_runtime_enable(&pdev->dev);
mali-c55-core.c:                goto err_pm_runtime_disable;
mali-c55-core.c:        pm_runtime_idle(&pdev->dev);
mali-c55-core.c:err_pm_runtime_disable:
mali-c55-core.c:        pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-core.c:        if (!pm_runtime_suspended(&pdev->dev)) {
mali-c55-core.c:                pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-params.c:#include <linux/pm_runtime.h>
mali-c55-params.c:      ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(params->mali_c55->dev);
mali-c55-stats.c:#include <linux/pm_runtime.h>
mali-c55-stats.c:       ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(stats->mali_c55->dev);
mali-c55-tpg.c:#include <linux/pm_runtime.h>
mali-c55-tpg.c: if (!pm_runtime_get_if_in_use(mali_c55->dev))
mali-c55-tpg.c: pm_runtime_put_autosuspend(mali_c55->dev);

So are you saying these runpaths are not necessarily getting exercised,
so the reference doesn't go up on normal use cases?

Yours,
Linus Walleij
